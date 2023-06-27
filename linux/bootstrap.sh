#!/bin/bash

TARGET_OS='debian'
TARGET_VERSION='11'

msg() {
    echo "${COLOR_BG_GREEN}${COLOR_FG_BLACK}>> $@${COLOR_RESET}" >&2
}

info() {
    echo "${COLOR_BG_CYAN}${COLOR_FG_BLACK}-- $@${COLOR_RESET}" >&2
}

warning() {
    echo "${COLOR_BG_YELLOW}${COLOR_FG_BLACK}?? WARNING: $@${COLOR_RESET}" >&2
}

error() {
    echo "${COLOR_BG_RED}${COLOR_FG_BLACK}!! ERROR: $1${COLOR_RESET}" >&2
    exit ${2:-126}
}

yorn() {
    if tty -s; then
        echo -n -e "$@ Y\b" > /dev/tty
        read yorn < /dev/tty
        case $yorn in
            [Nn]* ) return 1;;
        esac
    fi
    return 0
}

install_git() {
    if [ -n "$(type -P git)" ]; then
        return
    fi

    apt-get update -qq && apt-get install -y git
}

core3_find_tre_path() {
    local file=""

    if [ -z "$1" ]; then
        # Quick search 
        info "Trying quick search for tre files..."
        local file=$(ls /mnt/?/*/patch_sku1_14_00.tre 2> /dev/null)

        if [ -f "${file}" ]; then
            dirname "${file}"
            return 0
        fi

        # Slower
        info "Trying slower search for tre files..."
        for file in $(ls /mnt/?/*/*/patch_sku1_14_00.tre /mnt/?/*/*/SWGEmu/patch_sku1_14_00.tre 2> /dev/null)
        do
            if [ -f "${file}" ]; then
                dirname "${file}"
                return 0
            fi
        done
    fi

    # Ask the user
    info "Using file dialog to get path..."
    path=$(powershell.exe -NoLogo -NonInteractive -NoProfile -Command - << '    EOF' | tr -d '\r'
        function prompt { }
        Function Get-FileName($initialDirectory)
        {
         [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
         $Form = New-Object System.Windows.Forms.OpenFileDialog
         $Form.initialDirectory = $initialDirectory
         $Form.filter = "SWG TRE File| patch_sku1_14_00.tre"
         $Form.title = "Pick one TRE File to copy all tre files"
         $Form.ShowDialog() | Out-Null
         $Form.filename
        } #end function Get-FileName

        Get-FileName -initialDirectory "c:fso"
    EOF
    )

    if [ -n "${path}" ]; then
        file=$(wslpath -u "${path}" 2> /dev/null)

        if [ -f "${file}" ]; then
            dirname "${file}"
            return 0
        fi
    fi

    return 1
}

core3_copy_tre_files() {
    msg "Searching for your Star Wars Galaxies TRE files."
    info "In order to run the server you must copy required '.tre' files from the windows client."
    info "If you've installed the client on this computer we can copy them for you."

    local path=""
    local prompt=""

    while :
    do
        local path=$(core3_find_tre_path ${prompt})

        if [ ! -z "${path}" ]; then
            local ok=true
            for filename in "${trefiles[@]}"
            do
                local file="${path}/${filename}"
                if [ ! -f "${file}" ]; then
                    warning "Missing TRE file ${file} in ${path}, not using this path."
                    ok=false
                    break
                fi
            done

            if $ok; then
                break
            fi
        fi

        if [ "${prompt}" ]; then
            warning "Failed to find TRE file path, the server will not run until you copy them to /tre/"
            return
        fi

        prompt="--prompt"
    done

    info "Copying tre files from ${path} to /tre"
    mkdir -p /tre
    cp -v "${path}"/*.tre /tre || error "Failed to copy tre files from ${path}" 30
    chown -R ${RUN_USER}:${RUN_USER} "/tre"
    msg "Copied tre files from ${path} to /tre"
}

core3_init_system() {
    local src="${HOME_DIR}/workspace/Core3/docker/Dockerfile"

    if [ ! -f "${src}" ]; then
        warning "Unable to find ${src}, skipping system setup."
        return
    fi

    # use docker/Dockerfile as template to initialize packages and setup
    (
        echo "cd /;set -xe"
        sed -ne '/^RUN/,/^$/p' ${src} | sed -e '/^RUN/d' -e 's/; \\//g' -e '/rm .*apt\//d' -e '/useradd /d'
        echo "exit 0"
    ) > /tmp/init_core3.sh

    msg "Running /tmp/init_core3.sh created from ${src}"
    SECONDS=0
    # Use source to keep passing all our vars, keep in a sub-shell to avoid pollution
    pushd > /dev/null 2>&1
    (source /tmp/init_core3.sh) || error "/tmp/init_core3.sh failed, RET=$?" 21
    popd > /dev/null 2>&1
    msg "/tmp/init_core3.sh completed in ${SECONDS} second(s)."
}

core3_save_env() {
    env |
    egrep -v '^SHELL=|^PWD=|^LOGNAME=|^HOME=|^LANG=|^LS_COLORS=|^TERM=|^USER=|^SHLVL=|^PATH=|^MAIL=|^OLDPWD=|^_=' |
    sort |
    sed -e "s/=\(.*\)$/='\1'/" -e 's/^/export /' > ${HOME_DIR}/.env
    chown ${RUN_USER}:${RUN_USER} ${HOME_DIR}/.env
}

core3_bootstrap() {
    source /etc/os-release

    msg "OS: ${PRETTY_NAME}"

    [ "${ID}" == "${TARGET_OS}" ] || error "Sorry this script is designed for ${TARGET_OS} ${TARGET_VERSION} only." 101

    [ "${VERSION_ID}" == "${TARGET_VERSION}" ] || error "Current support is for ${TARGET_OS} ${TARGET_VERSION} only." 102

    [ "$(id -u)" == 0 ] || error "Must run as root." 103

    export WSL=$(type -P wsl.exe)

    if [ -n "${WSL}" -a -x "${WSL}" ]; then
        info "** Running in Windows Susbsystem for Linux"
        wsl.exe --status
        eval "export RUN_USER=${USERNAME}"
        export ADMIN_PASS=''
        core3_copy_tre_files
	else
		mkdir -vp /tre
		chown ${RUN_USER}:${RUN_USER} /tre
		chmod 775 /tre
		msg "Created /tre directory, you will need to copy client tre files here before you run the server."
    fi

    [ -n "${RUN_USER}" ] || error "Unable to determine runtime user, please set RUN_USER and try again." 104

    eval "export HOME_DIR=~${RUN_USER}"

    [ -n "${HOME_DIR}" ] || error "Unable to find home dir for ${RUN_USER}" 105

    export REPO_PUBLIC_URL=${REPO_PUBLIC_URL:-'https://github.com/swgemu'}
    export REPO_PUBLIC_BRANCH=${REPO_PUBLIC_BRANCH:-'unstable'}

    install_git

    if [ ! -d ${HOME_DIR} ]; then
        info "Creating ${HOME_DIR}"
        mkdir -p "${HOME_DIR}"
        chown -R ${RUN_USER}:${RUN_USER} "${HOME_DIR}"
    fi

    msg "Pulling firstboot from official repo..."

    cd "${HOME_DIR}"

    wget -qO /tmp/firstboot https://raw.githubusercontent.com/swgemu/Core3/unstable/docker/files/firstboot/functions ||
        error "Failed to download firstboot setup. GET HELP." 103

    msg "Loading firstboot functions..."
    source /tmp/firstboot

    (
        git config --global --add safe.directory "${HOME_DIR}/workspace/Core3"
        trap "(set -x;rm -vf $HOME/.gitconfig)" EXIT HUP INT KILL
        core3_clone
    )

    [ -d "${HOME_DIR}/workspace/Core3/.git" ] || error "Core3 clone failed?" 104

    (core3_init_system)

    mkdir -p /firstboot

    mount --bind "${HOME_DIR}/workspace/Core3/docker/files/firstboot" /firstboot ||
        error "Failed to bind mount /firstboot" 104

    trap "(set -x;umount /firstboot;rmdir -v /firstboot)" EXIT HUP INT KILL

    if [ -f "${HOME_DIR}/.my.cnf" ]; then
        ls -l "${HOME_DIR}/.my.cnf"
        for ln in $(<"${HOME_DIR}/.my.cnf")
        do
            info "my.cnf: $ln"
        done
        eval $(set -x;mysql --print-defaults | tail +2l | tr " " "\n" | sed -e '/^$/d' -e 's/--//' -e 's/=/="/' -e 's/$/"/' -e 's/^/local /')
        export DBHOST="${host}"
        export DBPORT="${port}"
        export DBUSER="${user}"
        export DBPASS="${pass}"
        info "Using existing DB settings... mysql://${DBUSER}@${DBHOST}:${DBPORT}/"
    fi

    core3_init_env

    core3_init_home

    core3_mysql_setup

    core3_init_config

    core3_save_env

    chown -R ${RUN_USER}:${RUN_USER} "${HOME_DIR}"

    chown -R mysql:mysql /var/lib/mysql/.

    if [ -n "${ADMIN_PASS}" ]; then
        msg "Password for root and ${RUN_USER} is '${COLOR_BG_YELLOW}${ADMIN_PASS}${COLOR_RESET}'"
    fi

    msg "Database password is ${COLOR_BG_YELLOW}${DBPASS}${COLOR_RESET}"
    msg "Check ${HOME_DIR}/.env for other settings."
    echo "${COLOR_BG_GREEN}${COLOR_FG_BLACK}"
    cat <<"    EOF"

    ######  ####### #     # ####### 
    #     # #     # ##    # #       
    #     # #     # # #   # #       
    #     # #     # #  #  # #####   
    #     # #     # #   # # #       
    #     # #     # #    ## #       
    ######  ####### #     # ####### 
    EOF
    echo "${COLOR_RESET}"
}

ESC=$(printf "\033")
COLOR_FG_BLACK="${ESC}[30m"
COLOR_FG_RED="${ESC}[31m"
COLOR_FG_GREEN="${ESC}[32m"
COLOR_FG_YELLOW="${ESC}[33m"
COLOR_FG_BLUE="${ESC}[34m"
COLOR_FG_PURPLE="${ESC}[35m"
COLOR_FG_CYAN="${ESC}[36m"
COLOR_FG_WHITE="${ESC}[37m"
COLOR_BG_RED="${ESC}[41m"
COLOR_BG_GREEN="${ESC}[42m"
COLOR_BG_YELLOW="${ESC}[43m"
COLOR_BG_BLUE="${ESC}[44m"
COLOR_BG_PURPLE="${ESC}[45m"
COLOR_BG_CYAN="${ESC}[46m"
COLOR_BG_WHITE="${ESC}[47m"
COLOR_RESET="${ESC}[0m"

declare -a trefiles
trefiles=('bottom.tre' 'data_animation_00.tre' 'data_music_00.tre' 'data_other_00.tre' 'data_sample_00.tre' 'data_sample_01.tre' 'data_sample_02.tre' 'data_sample_03.tre' 'data_sample_04.tre' 'data_skeletal_mesh_00.tre' 'data_skeletal_mesh_01.tre' 'data_sku1_00.tre' 'data_sku1_01.tre' 'data_sku1_02.tre' 'data_sku1_03.tre' 'data_sku1_04.tre' 'data_sku1_05.tre' 'data_sku1_06.tre' 'data_sku1_07.tre' 'data_static_mesh_00.tre' 'data_static_mesh_01.tre' 'data_texture_00.tre' 'data_texture_01.tre' 'data_texture_02.tre' 'data_texture_03.tre' 'data_texture_04.tre' 'data_texture_05.tre' 'data_texture_06.tre' 'data_texture_07.tre' 'default_patch.tre' 'patch_00.tre' 'patch_01.tre' 'patch_02.tre' 'patch_03.tre' 'patch_04.tre' 'patch_05.tre' 'patch_06.tre' 'patch_07.tre' 'patch_08.tre' 'patch_09.tre' 'patch_10.tre' 'patch_11_00.tre' 'patch_11_01.tre' 'patch_11_02.tre' 'patch_11_03.tre' 'patch_12_00.tre' 'patch_13_00.tre' 'patch_14_00.tre' 'patch_sku1_12_00.tre' 'patch_sku1_13_00.tre' 'patch_sku1_14_00.tre')

echo "${COLOR_BG_BLUE}${COLOR_FG_BLACK}"
cat <<EOF

######  ####### ####### #######  #####  ####### ######     #    ######  
#     # #     # #     #    #    #     #    #    #     #   # #   #     # 
#     # #     # #     #    #    #          #    #     #  #   #  #     # 
######  #     # #     #    #     #####     #    ######  #     # ######  
#     # #     # #     #    #          #    #    #   #   ####### #       
#     # #     # #     #    #    #     #    #    #    #  #     # #       
######  ####### #######    #     #####     #    #     # #     # #       
                 #####  ####### ######  #######  #####  
                #     # #     # #     # #       #     # 
                #       #     # #     # #             # 
                #       #     # ######  #####    #####  
                #       #     # #   #   #             # 
                #     # #     # #    #  #       #     # 
                 #####  ####### #     # #######  #####  
EOF
echo "${COLOR_RESET}"

core3_bootstrap

exit 0
