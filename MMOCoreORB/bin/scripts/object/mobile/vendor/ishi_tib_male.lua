--Copyright (C) 2007 <SWGEmu>

--This File is part of Core3.

--This program is free software; you can redistribute
--it and/or modify it under the terms of the GNU Lesser
--General Public License as published by the Free Software
--Foundation; either version 2 of the License,
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules
--is making a combined work based on Engine3.
--Thus, the terms and conditions of the GNU Lesser General Public License
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3
--give you permission to combine Engine3 program with free software
--programs or libraries that are released under the GNU LGPL and with
--code included in the standard release of Core3 under the GNU LGPL
--license (or modified versions of such code, with unchanged license).
--You may copy and distribute such a system following the terms of the
--GNU LGPL for Engine3 and the licenses of the other code concerned,
--provided that you include the source code of that other code when
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated
--to grant this special exception for their modified versions;
--it is their choice whether to do so. The GNU Lesser General Public License
--gives permission to release a modified version without this exception;
--this exception also makes it possible to release a modified version
--which carries forward this exception.


object_mobile_vendor_ishi_tib_male = object_mobile_vendor_shared_ishi_tib_male:new {

	templateType = VENDORCREATURE,
	optionsBitmask = 258,
	pvpStatusBitmask = 0,

	objectMenuComponent = "VendorMenuComponent",
	dataObjectComponent = "VendorDataComponent",	
	containerComponent = "VendorContainerComponent",
	zoneComponent = "VendorZoneComponent",

	noTrade = 1,

	hair = {},


	clothing = {"Humanoid1","Humanoid2","Humanoid3","Humanoid4","Humanoid5","Humanoid6","Humanoid7","Humanoid8","Humanoid9","Humanoid10",
			"Humanoid11","Humanoid12","Humanoid13","Humanoid14","Humanoid15","Humanoid16","Humanoid17","Humanoid18","Humanoid19","Humanoid20",
			"Humanoid21","Humanoid22","Humanoid23","Humanoid24","Humanoid25","Humanoid26","Humanoid27","Humanoid28","Humanoid29","Humanoid30",
			"Humanoid31","Humanoid32","Humanoid33","Humanoid34","Humanoid35","Humanoid36","Humanoid37","Humanoid38","Humanoid39","Humanoid40",
			"Humanoid41","Humanoid42","Humanoid43","Humanoid44","Humanoid45","Humanoid46","Humanoid47","Humanoid48","Humanoid49","Humanoid50",
			"Humanoid51","Humanoid52","Humanoid53","Humanoid54","Humanoid55","Humanoid56","Humanoid57","Humanoid58","Humanoid59","Humanoid60",
			"Humanoid61","Humanoid62","Humanoid63","Humanoid64","Humanoid65","Humanoid66","Humanoid67","Humanoid68","Humanoid69","Humanoid70",
			"Humanoid71","Humanoid72","Humanoid73","Humanoid74","Humanoid75","Humanoid76","Humanoid77","Humanoid78","Humanoid79","Humanoid80",
			"Humanoid81","Humanoid82","Humanoid83","Humanoid84","Humanoid85","Humanoid86","Humanoid87","Humanoid88","Humanoid89","Humanoid90",
			"Humanoid91","Humanoid92","Humanoid93","Humanoid94","Humanoid95","Humanoid96","Humanoid97","Humanoid98","Humanoid99","Humanoid100",
			"Humanoid101","Humanoid102","Humanoid103","Humanoid104","Humanoid105","Humanoid106","Humanoid107","Humanoid108","Humanoid109","Humanoid110",
			"Humanoid111","Humanoid112","Humanoid113","Humanoid114","Humanoid115","Humanoid116","Humanoid117","Humanoid118","Humanoid119","Humanoid120",
			"Humanoid121","Humanoid122","Humanoid123","Humanoid124","Humanoid125","Humanoid126","Humanoid127","Humanoid128","Humanoid129","Humanoid130",
			"Humanoid131","Humanoid132","Humanoid133","Humanoid134","Humanoid135","Humanoid136","Humanoid137","Humanoid138","Humanoid139","Humanoid140",
			"Humanoid141","Humanoid142","Humanoid143","Humanoid144","Humanoid145","Humanoid146","Humanoid147","Humanoid148","Humanoid149","Humanoid150",
			"Humanoid151","Humanoid152","Humanoid153","Humanoid154","Humanoid155","Humanoid156","Humanoid157","Humanoid158","Humanoid159","Humanoid160",
			"Humanoid161","Humanoid162","Humanoid163","Humanoid164","Humanoid165","Humanoid166","Humanoid167","Humanoid168","Humanoid169","Humanoid170",
			"Humanoid171","Humanoid172","Humanoid173","Humanoid174","Humanoid175","Humanoid176","Humanoid177","Humanoid178","Humanoid179","Humanoid180",
			"Humanoid181","Humanoid182","Humanoid183","Humanoid184","Humanoid185","Humanoid186","Humanoid187","Humanoid188","Humanoid189","Humanoid190",
			"Humanoid191","Humanoid192","Humanoid193","Humanoid194","Humanoid195","Humanoid196","Humanoid197","Humanoid198","Humanoid199","Humanoid200",
			"Humanoid201","Humanoid202","Humanoid203","Humanoid204","Humanoid205","Humanoid206","Humanoid207","Humanoid208","Humanoid209","Humanoid210",
			"Humanoid211","Humanoid212","Humanoid213","Humanoid214","Humanoid215","Humanoid216","Humanoid217","Humanoid218","Humanoid219","Humanoid220",
			"Humanoid221","Humanoid222","Humanoid223","Humanoid224","Humanoid225","Humanoid226","Humanoid227","Humanoid228","Humanoid229","Humanoid230",
			"Humanoid231","Humanoid232","Humanoid233","Humanoid234","Humanoid235","Humanoid236","Humanoid237","Humanoid238","Humanoid239","Humanoid240",
			"Humanoid241","Humanoid242","Humanoid243","Humanoid244","Humanoid245","Humanoid246","Humanoid247","Humanoid248","Humanoid249","Humanoid250",
			"Humanoid251","Humanoid252","Humanoid253","Humanoid254","Humanoid255","Humanoid256","Humanoid257","Humanoid258","Humanoid259","Humanoid260",
			"Humanoid261","Humanoid262","Humanoid263","Humanoid264","Humanoid265","Humanoid266","Humanoid267","Humanoid268","Humanoid269","Humanoid270",
			"Humanoid271","Humanoid272","Humanoid273","Humanoid274","Humanoid275","Humanoid276","Humanoid277","Humanoid278","Humanoid279","Humanoid280",
			"Humanoid281","Humanoid282","Humanoid283","Humanoid284","Humanoid285","Humanoid286","Humanoid287","Humanoid288","Humanoid289","Humanoid290",
			"Humanoid291","Humanoid292","Humanoid293","Humanoid294","Humanoid295","Humanoid296","Humanoid297","Humanoid298","Humanoid299","Humanoid300",
			"Humanoid301","Humanoid302","Humanoid303","Humanoid304","Humanoid305","Humanoid306","Humanoid307","Humanoid308","Humanoid309","Humanoid310",
			"Humanoid311","Humanoid312","Humanoid313","Humanoid314","Humanoid315","Humanoid316","Humanoid317","Humanoid318","Humanoid319","Humanoid320",
			"Humanoid321","Humanoid322","Humanoid323","Humanoid324","Humanoid325","Humanoid326","Humanoid327","Humanoid328","Humanoid329","Humanoid330",
			"Humanoid331","Humanoid332","Humanoid333","Humanoid334","Humanoid335","Humanoid336","Humanoid337","Humanoid338","Humanoid339","Humanoid340",
			"Humanoid341","Humanoid342","Humanoid343","Humanoid344","Humanoid345","Humanoid346","Humanoid347","Humanoid348","Humanoid349","Humanoid350",
			"Humanoid351","Humanoid352","Humanoid353","Humanoid354","Humanoid355","Humanoid356","Humanoid357","Humanoid358","Humanoid359","Humanoid360",
			"Humanoid361","Humanoid362","Humanoid363","Humanoid364","Humanoid365","Humanoid366","Humanoid367","Humanoid368","Humanoid369","Humanoid370",
			"Humanoid371","Humanoid372","Humanoid373","Humanoid374","Humanoid375","Humanoid376","Humanoid377","Humanoid378","Humanoid379","Humanoid380",
			"Humanoid381","Humanoid382","Humanoid383","Humanoid384","Humanoid385","Humanoid386","Humanoid387","Humanoid388","Humanoid389","Humanoid390",
			"Humanoid391","Humanoid392","Humanoid393","Humanoid394","Humanoid395","Humanoid396","Humanoid397","Humanoid398","Humanoid399","Humanoid400",
			"Humanoid401","Humanoid402","Humanoid403","Humanoid404","Humanoid405","Humanoid406","Humanoid407","Humanoid408","Humanoid409","Humanoid410",
			"Humanoid411","Humanoid412","Humanoid413","Humanoid414","Humanoid415","Humanoid416","Humanoid417","Humanoid418","Humanoid419","Humanoid420",
			"Humanoid421","Humanoid422","Humanoid423","Humanoid424","Humanoid425","Humanoid426","Humanoid427","Humanoid428","Humanoid429","Humanoid430",
			"Humanoid431","Humanoid432","Humanoid433","Humanoid434","Humanoid435","Humanoid436","Humanoid437","Humanoid438","Humanoid439","Humanoid440",
			"Humanoid441","Humanoid442","Humanoid443","Humanoid444","Humanoid445","Humanoid446","Humanoid447","Humanoid448","Humanoid449","Humanoid450",
			"Humanoid451","Humanoid452","Humanoid453","Humanoid454","Humanoid455","Humanoid456","Humanoid457","Humanoid458","Humanoid459","Humanoid460",
			"Humanoid461","Humanoid462","Humanoid463","Humanoid464","Humanoid465","Humanoid466","Humanoid467","Humanoid468","Humanoid469","Humanoid470",
			"Humanoid471","Humanoid472","Humanoid473","Humanoid474","Humanoid475","Humanoid476","Humanoid477","Humanoid478","Humanoid479","Humanoid480",
			"Humanoid481","Humanoid482","Humanoid483","Humanoid484","Humanoid485","Humanoid486","Humanoid487","Humanoid488","Humanoid489","Humanoid490",
			"Humanoid491","Humanoid492","Humanoid493","Humanoid494","Humanoid495","Humanoid496","Humanoid497","Humanoid498","Humanoid499","Humanoid500",
			"Humanoid501","Humanoid502","Humanoid503","Humanoid504","Humanoid505","Humanoid506","Humanoid507","Humanoid508","Humanoid509","Humanoid510",
			"Humanoid511","Humanoid512","Humanoid513","Humanoid514","Humanoid515","Humanoid516","Humanoid517","Humanoid518","Humanoid519","Humanoid520",
			"Humanoid521","Humanoid522","Humanoid523","Humanoid524","Humanoid525","Humanoid526","Humanoid527","Humanoid528","Humanoid529","Humanoid530",
			"Humanoid531","Humanoid532","Humanoid533","Humanoid534","Humanoid535","Humanoid536","Humanoid537","Humanoid538","Humanoid539","Humanoid540",
			"Humanoid541","Humanoid542","Humanoid543","Humanoid544","Humanoid545","Humanoid546","Humanoid547","Humanoid548","Humanoid549","Humanoid550",
			"Humanoid551","Humanoid552","Humanoid553","Humanoid554","Humanoid555","Humanoid556","Humanoid557","Humanoid558","Humanoid559","Humanoid560",
			"Humanoid561","Humanoid562","Humanoid563","Humanoid564","Humanoid565","Humanoid566","Humanoid567","Humanoid568","Humanoid569","Humanoid570",
			"Humanoid571","Humanoid572","Humanoid573","Humanoid574","Humanoid575","Humanoid576","Humanoid577","Humanoid578","Humanoid579","Humanoid580",
			"Humanoid581","Humanoid582","Humanoid583","Humanoid584","Humanoid585","Humanoid586","Humanoid587","Humanoid588","Humanoid589","Humanoid590",
			"Humanoid591","Humanoid592","Humanoid593","Humanoid594","Humanoid595","Humanoid596","Humanoid597","Humanoid598","Humanoid599","Humanoid600",
			"Humanoid601","Humanoid602","Humanoid603","Humanoid604","Humanoid605","Humanoid606","Humanoid607","Humanoid608","Humanoid609","Humanoid610",
			"Humanoid611","Humanoid612","Humanoid613","Humanoid614","Humanoid615","Humanoid616","Humanoid617","Humanoid618","Humanoid619","Humanoid620",
			"Humanoid621","Humanoid622","Humanoid623","Humanoid624","Humanoid625","Humanoid626","Humanoid627","Humanoid628","Humanoid629","Humanoid630",
			"Humanoid631","Humanoid632","Humanoid633","Humanoid634","Humanoid635","Humanoid636","Humanoid637","Humanoid638","Humanoid639","Humanoid640",
			"Humanoid641","Humanoid642","Humanoid643","Humanoid644","Humanoid645","Humanoid646","Humanoid647","Humanoid648","Humanoid649","Humanoid650",
			"Humanoid651","Humanoid652","Humanoid653","Humanoid654","Humanoid655","Humanoid656","Humanoid657","Humanoid658","Humanoid659","Humanoid660",
			"Humanoid661","Humanoid662","Humanoid663","Humanoid664","Humanoid665","Humanoid666","Humanoid667","Humanoid668","Humanoid669","Humanoid670",
			"Humanoid671","Humanoid672","Humanoid673","Humanoid674","Humanoid675","Humanoid676","Humanoid677","Humanoid678","Humanoid679","Humanoid680",
			"Humanoid681","Humanoid682","Humanoid683","Humanoid684","Humanoid685","Humanoid686","Humanoid687","Humanoid688","Humanoid689","Humanoid690",
			"Humanoid691","Humanoid692","Humanoid693","Humanoid694","Humanoid695","Humanoid696","Humanoid697","Humanoid698","Humanoid699","Humanoid700",
			"Humanoid701","Humanoid702","Humanoid703","Humanoid704","Humanoid705","Humanoid706","Humanoid707","Humanoid708","Humanoid709","Humanoid710",
			"Humanoid711","Humanoid712","Humanoid713","Humanoid714","Humanoid715","Humanoid716","Humanoid717","Humanoid718","Humanoid719","Humanoid720",
			"Humanoid721","Humanoid722","Humanoid723","Humanoid724","Humanoid725","Humanoid726","Humanoid727","Humanoid728","Humanoid729","Humanoid730",
			"Humanoid731","Humanoid732","Humanoid733","Humanoid734","Humanoid735","Humanoid736","Humanoid737","Humanoid738","Humanoid739","Humanoid740",
			"Humanoid741","Humanoid742","Humanoid743","Humanoid744","Humanoid745","Humanoid746","Humanoid747","Humanoid748","Humanoid749","Humanoid750",
			"Humanoid751","Humanoid752","Humanoid753","Humanoid754","Humanoid755","Humanoid756","Humanoid757","Humanoid758","Humanoid759","Humanoid760",
			"Humanoid761","Humanoid762","Humanoid763","Humanoid764","Humanoid765","Humanoid766","Humanoid767","Humanoid768","Humanoid769","Humanoid770",
			"Humanoid771","Humanoid772","Humanoid773","Humanoid774","Humanoid775","Humanoid776","Humanoid777","Humanoid778","Humanoid779","Humanoid780",
			"Humanoid781","Humanoid782","Humanoid783","Humanoid784","Humanoid785","Humanoid786","Humanoid787","Humanoid788","Humanoid789","Humanoid790",
			"Humanoid791","Humanoid792","Humanoid793","Humanoid794","Humanoid795","Humanoid796","Humanoid797","Humanoid798","Humanoid799","Humanoid800",
			"Humanoid801","Humanoid802","Humanoid803","Humanoid804","Humanoid805","Humanoid806","Humanoid807","Humanoid808","Humanoid809","Humanoid810",
			"Humanoid811","Humanoid812","Humanoid813","Humanoid814","Humanoid815","Humanoid816","Humanoid817","Humanoid818","Humanoid819","Humanoid820",
			"Humanoid821","Humanoid822","Humanoid823","Humanoid824","Humanoid825","Humanoid826","Humanoid827","Humanoid828","Humanoid829","Humanoid830",
			"Humanoid831","Humanoid832","Humanoid833","Humanoid834","Humanoid835","Humanoid836","Humanoid837","Humanoid838","Humanoid839","Humanoid840",
			"Humanoid841","Humanoid842","Humanoid843","Humanoid844","Humanoid845","Humanoid846","Humanoid847","Humanoid848","Humanoid849","Humanoid850",
			"Humanoid851","Humanoid852","Humanoid853","Humanoid854","Humanoid855","Humanoid856","Humanoid857","Humanoid858","Humanoid859","Humanoid860",
			"Humanoid861","Humanoid862","Humanoid863","Humanoid864","Humanoid865","Humanoid866","Humanoid867","Humanoid868","Humanoid869","Humanoid870",
			"Humanoid871","Humanoid872","Humanoid873","Humanoid874","Humanoid875","Humanoid876","Humanoid877","Humanoid878","Humanoid879","Humanoid880",
			"Humanoid881","Humanoid882","Humanoid883","Humanoid884","Humanoid885","Humanoid886","Humanoid887","Humanoid888","Humanoid889","Humanoid890",
			"Humanoid891","Humanoid892","Humanoid893","Humanoid894","Humanoid895","Humanoid896","Humanoid897","Humanoid898","Humanoid899","Humanoid900",
			"Humanoid901","Humanoid902","Humanoid903","Humanoid904","Humanoid905","Humanoid906","Humanoid907","Humanoid908","Humanoid909","Humanoid910",
			"Humanoid911","Humanoid912","Humanoid913","Humanoid914","Humanoid915","Humanoid916","Humanoid917","Humanoid918","Humanoid919","Humanoid920",
			"Humanoid921","Humanoid922","Humanoid923","Humanoid924","Humanoid925","Humanoid926","Humanoid927","Humanoid928","Humanoid929","Humanoid930",
			"Humanoid931","Humanoid932","Humanoid933","Humanoid934","Humanoid935","Humanoid936","Humanoid937","Humanoid938","Humanoid939","Humanoid940",
			"Humanoid941","Humanoid942","Humanoid943","Humanoid944","Humanoid945","Humanoid946","Humanoid947","Humanoid948","Humanoid949","Humanoid950",
			"Humanoid951","Humanoid952","Humanoid953","Humanoid954","Humanoid955","Humanoid956","Humanoid957","Humanoid958","Humanoid959","Humanoid960",
			"Humanoid961","Humanoid962","Humanoid963","Humanoid964","Humanoid965","Humanoid966","Humanoid967","Humanoid968","Humanoid969","Humanoid970",
			"Humanoid971","Humanoid972","Humanoid973","Humanoid974","Humanoid975","Humanoid976","Humanoid977","Humanoid978","Humanoid979","Humanoid980",
			"Humanoid981","Humanoid982","Humanoid983","Humanoid984","Humanoid985","Humanoid986","Humanoid987","Humanoid988","Humanoid989","Humanoid990",
			"Humanoid991","Humanoid992","Humanoid993","Humanoid994","Humanoid995","Humanoid996","Humanoid997","Humanoid998","Humanoid999","Humanoid1000",
			"Humanoid1001","Humanoid1002","Humanoid1003","Humanoid1004","Humanoid1005","Humanoid1006","Humanoid1007","Humanoid1008","Humanoid1009","Humanoid1010",
			"Humanoid1011","Humanoid1012","Humanoid1013","Humanoid1014","Humanoid1015","Humanoid1016","Humanoid1017","Humanoid1018","Humanoid1019","Humanoid1020",
			"Humanoid1021","Humanoid1022","Humanoid1023","Humanoid1024","Humanoid1025","Humanoid1026","Humanoid1027","Humanoid1028","Humanoid1029","Humanoid1030",
			"Humanoid1031","Humanoid1032","Humanoid1033","Humanoid1034","Humanoid1035","Humanoid1036","Humanoid1037","Humanoid1038","Humanoid1039","Humanoid1040",
			"Humanoid1041","Humanoid1042","Humanoid1043","Humanoid1044","Humanoid1045","Humanoid1046","Humanoid1047","Humanoid1048","Humanoid1049","Humanoid1050",
			"Humanoid1051","Humanoid1052","Humanoid1053","Humanoid1054","Humanoid1055","Humanoid1056","Humanoid1057","Humanoid1058","Humanoid1059","Humanoid1060",
			"Humanoid1061","Humanoid1062","Humanoid1063","Humanoid1064","Humanoid1065","Humanoid1066","Humanoid1067","Humanoid1068","Humanoid1069","Humanoid1070",
			"Humanoid1071","Humanoid1072","Humanoid1073","Humanoid1074","Humanoid1075","Humanoid1076","Humanoid1077","Humanoid1078","Humanoid1079","Humanoid1080",
			"Humanoid1081","Humanoid1082","Humanoid1083","Humanoid1084","Humanoid1085","Humanoid1086","Humanoid1087","Humanoid1088","Humanoid1089","Humanoid1090",
			"Humanoid1091","Humanoid1092","Humanoid1093","Humanoid1094","Humanoid1095","Humanoid1096","Humanoid1097","Humanoid1098","Humanoid1099","Humanoid1100",
			"Humanoid1101","Humanoid1102","Humanoid1103","Humanoid1104","Humanoid1105","Humanoid1106","Humanoid1107","Humanoid1108","Humanoid1109","Humanoid1110",
			"Humanoid1111","Humanoid1112","Humanoid1113","Humanoid1114","Humanoid1115","Humanoid1116","Humanoid1117","Humanoid1118","Humanoid1119","Humanoid1120",
			"Humanoid1121","Humanoid1122","Humanoid1123","Humanoid1124","Humanoid1125","Humanoid1126","Humanoid1127","Humanoid1128","Humanoid1129","Humanoid1130",
			"Humanoid1131","Humanoid1132","Humanoid1133","Humanoid1134","Humanoid1135","Humanoid1136","Humanoid1137","Humanoid1138","Humanoid1139","Humanoid1140",
			"Humanoid1141","Humanoid1142","Humanoid1143","Humanoid1144","Humanoid1145","Humanoid1146","Humanoid1147","Humanoid1148","Humanoid1149","Humanoid1150",
			"Humanoid1151","Humanoid1152","Humanoid1153","Humanoid1154","Humanoid1155","Humanoid1156","Humanoid1157","Humanoid1158","Humanoid1159","Humanoid1160",
			"Humanoid1161","Humanoid1162","Humanoid1163","Humanoid1164","Humanoid1165","Humanoid1166","Humanoid1167","Humanoid1168","Humanoid1169","Humanoid1170",
			"Humanoid1171","Humanoid1172","Humanoid1173","Humanoid1174","Humanoid1175","Humanoid1176","Humanoid1177","Humanoid1178","Humanoid1179","Humanoid1180",
			"Humanoid1181","Humanoid1182","Humanoid1183","Humanoid1184","Humanoid1185","Humanoid1186","Humanoid1187","Humanoid1188","Humanoid1189","Humanoid1190",
			"Humanoid1191","Humanoid1192","Humanoid1193","Humanoid1194","Humanoid1195","Humanoid1196","Humanoid1197","Humanoid1198","Humanoid1199","Humanoid1200",
			"Humanoid1201","Humanoid1202","Humanoid1203","Humanoid1204","Humanoid1205","Humanoid1206","Humanoid1207","Humanoid1208","Humanoid1209","Humanoid1210",
			"Humanoid1211","Humanoid1212","Humanoid1213","Humanoid1214","Humanoid1215","Humanoid1216","Humanoid1217","Humanoid1218","Humanoid1219","Humanoid1220",
			"Humanoid1221","Humanoid1222","Humanoid1223","Humanoid1224","Humanoid1225","Humanoid1226","Humanoid1227","Humanoid1228","Humanoid1229","Humanoid1230",
			"Humanoid1231","Humanoid1232","Humanoid1233","Humanoid1234","Humanoid1235","Humanoid1236","Humanoid1237","Humanoid1238","Humanoid1239","Humanoid1240",
			"Humanoid1241","Humanoid1242","Humanoid1243","Humanoid1244","Humanoid1245","Humanoid1246","Humanoid1247","Humanoid1248","Humanoid1249","Humanoid1250",
			"Humanoid1251","Humanoid1252","Humanoid1253","Humanoid1254","Humanoid1255","Humanoid1256","Humanoid1257","Humanoid1258","Humanoid1259","Humanoid1260",
			"Humanoid1261","Humanoid1262","Humanoid1263","Humanoid1264","Humanoid1265","Humanoid1266","Humanoid1267","Humanoid1268","Humanoid1269","Humanoid1270",
			"Humanoid1271","Humanoid1272","Humanoid1273","Humanoid1274","Humanoid1275","Humanoid1276","Humanoid1277","Humanoid1278","Humanoid1279","Humanoid1280",
			"Humanoid1281","Humanoid1282","Humanoid1283","Humanoid1284","Humanoid1285","Humanoid1286","Humanoid1287","Humanoid1288","Humanoid1289","Humanoid1290",
			"Humanoid1291","Humanoid1292","Humanoid1293","Humanoid1294","Humanoid1295","Humanoid1296","Humanoid1297","Humanoid1298","Humanoid1299","Humanoid1300",
			"Humanoid1301","Humanoid1302","Humanoid1303","Humanoid1304","Humanoid1305","Humanoid1306","Humanoid1307","Humanoid1308","Humanoid1309","Humanoid1310",
			"Humanoid1311","Humanoid1312","Humanoid1313","Humanoid1314","Humanoid1315","Humanoid1316","Humanoid1317","Humanoid1318","Humanoid1319","Humanoid1320",
			"Humanoid1321","Humanoid1322","Humanoid1323","Humanoid1324","Humanoid1325","Humanoid1326","Humanoid1327","Humanoid1328","Humanoid1329","Humanoid1330",
			"Humanoid1331","Humanoid1332","Humanoid1333","Humanoid1334","Humanoid1335","Humanoid1336","Humanoid1337","Humanoid1338","Humanoid1339","Humanoid1340",
			"Humanoid1341","Humanoid1342","Humanoid1343","Humanoid1344","Humanoid1345","Humanoid1346","Humanoid1347","Humanoid1348","Humanoid1349","Humanoid1350",
			"Humanoid1351","Humanoid1352","Humanoid1353","Humanoid1354","Humanoid1355","Humanoid1356","Humanoid1357","Humanoid1358","Humanoid1359","Humanoid1360",
			"Humanoid1361","Humanoid1362","Humanoid1363","Humanoid1364","Humanoid1365","Humanoid1366","Humanoid1367","Humanoid1368","Humanoid1369","Humanoid1370",
			"Humanoid1371","Humanoid1372","Humanoid1373","Humanoid1374","Humanoid1375","Humanoid1376","Humanoid1377","Humanoid1378","Humanoid1379","Humanoid1380",
			"Humanoid1381","Humanoid1382","Humanoid1383","Humanoid1384","Humanoid1385","Humanoid1386","Humanoid1387","Humanoid1388","Humanoid1389","Humanoid1390",
			"Humanoid1391","Humanoid1392","Humanoid1393","Humanoid1394","Humanoid1395","Humanoid1396","Humanoid1397","Humanoid1398","Humanoid1399","Humanoid1400",
			"Humanoid1401","Humanoid1402","Humanoid1403","Humanoid1404","Humanoid1405","Humanoid1406","Humanoid1407","Humanoid1408","Humanoid1409","Humanoid1410",
			"Humanoid1411","Humanoid1412","Humanoid1413","Humanoid1414","Humanoid1415","Humanoid1416","Humanoid1417","Humanoid1418","Humanoid1419","Humanoid1420",
			"Humanoid1421","Humanoid1422","Humanoid1423","Humanoid1424","Humanoid1425","Humanoid1426","Humanoid1427","Humanoid1428","Humanoid1429","Humanoid1430",
			"Humanoid1431","Humanoid1432","Humanoid1433","Humanoid1434","Humanoid1435","Humanoid1436","Humanoid1437","Humanoid1438","Humanoid1439","Humanoid1440",
			"Humanoid1441","Humanoid1442","Humanoid1443","Humanoid1444","Humanoid1445","Humanoid1446","Humanoid1447","Humanoid1448","Humanoid1449","Humanoid1450",
			"Humanoid1451","Humanoid1452","Humanoid1453","Humanoid1454","Humanoid1455","Humanoid1456","Humanoid1457","Humanoid1458","Humanoid1459","Humanoid1460",
			"Humanoid1461","Humanoid1462","Humanoid1463","Humanoid1464","Humanoid1465","Humanoid1466","Humanoid1467","Humanoid1468","Humanoid1469","Humanoid1470",
			"Humanoid1471","Humanoid1472","Humanoid1473","Humanoid1474","Humanoid1475","Humanoid1476","Humanoid1477","Humanoid1478","Humanoid1479","Humanoid1480",
			"Humanoid1481","Humanoid1482","Humanoid1483","Humanoid1484","Humanoid1485","Humanoid1486","Humanoid1487","Humanoid1488","Humanoid1489","Humanoid1490",
			"Humanoid1491","Humanoid1492","Humanoid1493","Humanoid1494","Humanoid1495","Humanoid1496","Humanoid1497","Humanoid1498","Humanoid1499","Humanoid1500",
			"Humanoid1501","Humanoid1502","Humanoid1503","Humanoid1504","Humanoid1505","Humanoid1506","Humanoid1507","Humanoid1508","Humanoid1509","Humanoid1510",
			"Humanoid1511","Humanoid1512","Humanoid1513","Humanoid1514","Humanoid1515","Humanoid1516","Humanoid1517","Humanoid1518","Humanoid1519","Humanoid1520",
			"Humanoid1521","Humanoid1522","Humanoid1523","Humanoid1524","Humanoid1525","Humanoid1526","Humanoid1527","Humanoid1528","Humanoid1529","Humanoid1530",
			"Humanoid1531","Humanoid1532","Humanoid1533","Humanoid1534","Humanoid1535","Humanoid1536","Humanoid1537","Humanoid1538","Humanoid1539","Humanoid1540",
			"Humanoid1541","Humanoid1542","Humanoid1543","Humanoid1544","Humanoid1545","Humanoid1546","Humanoid1547","Humanoid1548","Humanoid1549","Humanoid1550",
			"Humanoid1551","Humanoid1552","Humanoid1553","Humanoid1554","Humanoid1555","Humanoid1556","Humanoid1557","Humanoid1558","Humanoid1559","Humanoid1560",
			"Humanoid1561","Humanoid1562","Humanoid1563","Humanoid1564","Humanoid1565","Humanoid1566","Humanoid1567","Humanoid1568","Humanoid1569","Humanoid1570",
			"Humanoid1571","Humanoid1572","Humanoid1573","Humanoid1574","Humanoid1575","Humanoid1576","Humanoid1577","Humanoid1578","Humanoid1579","Humanoid1580",
			"Humanoid1581","Humanoid1582","Humanoid1583","Humanoid1584","Humanoid1585","Humanoid1586","Humanoid1587","Humanoid1588","Humanoid1589","Humanoid1590",
			"Humanoid1591","Humanoid1592","Humanoid1593","Humanoid1594","Humanoid1595","Humanoid1596","Humanoid1597","Humanoid1598","Humanoid1599","Humanoid1600",
			"Humanoid1601","Humanoid1602","Humanoid1603","Humanoid1604","Humanoid1605","Humanoid1606","Humanoid1607","Humanoid1608","Humanoid1609","Humanoid1610",
			"Humanoid1611","Humanoid1612","Humanoid1613","Humanoid1614","Humanoid1615","Humanoid1616","Humanoid1617","Humanoid1618","Humanoid1619","Humanoid1620",
			"Humanoid1621","Humanoid1622","Humanoid1623","Humanoid1624","Humanoid1625","Humanoid1626","Humanoid1627","Humanoid1628","Humanoid1629","Humanoid1630",
			"Humanoid1631","Humanoid1632","Humanoid1633","Humanoid1634","Humanoid1635","Humanoid1636","Humanoid1637","Humanoid1638","Humanoid1639","Humanoid1640",
			"Humanoid1641","Humanoid1642","Humanoid1643","Humanoid1644","Humanoid1645","Humanoid1646","Humanoid1647","Humanoid1648","Humanoid1649","Humanoid1650",
			"Humanoid1651","Humanoid1652","Humanoid1653","Humanoid1654","Humanoid1655","Humanoid1656","Humanoid1657","Humanoid1658","Humanoid1659","Humanoid1660",
			"Humanoid1661","Humanoid1662","Humanoid1663","Humanoid1664","Humanoid1665","Humanoid1666","Humanoid1667","Humanoid1668","Humanoid1669","Humanoid1670",
			"Humanoid1671","Humanoid1672","Humanoid1673","Humanoid1674","Humanoid1675","Humanoid1676","Humanoid1677","Humanoid1678","Humanoid1679","Humanoid1680",
			"Humanoid1681","Humanoid1682","Humanoid1683","Humanoid1684","Humanoid1685","Humanoid1686","Humanoid1687","Humanoid1688","Humanoid1689","Humanoid1690",
			"Humanoid1691","Humanoid1692","Humanoid1693","Humanoid1694","Humanoid1695","Humanoid1696","Humanoid1697","Humanoid1698","Humanoid1699","Humanoid1700",
			"Humanoid1701","Humanoid1702","Humanoid1703","Humanoid1704","Humanoid1705","Humanoid1706","Humanoid1707","Humanoid1708","Humanoid1709","Humanoid1710",
			"Humanoid1711","Humanoid1712","Humanoid1713","Humanoid1714","Humanoid1715","Humanoid1716","Humanoid1717","Humanoid1718","Humanoid1719","Humanoid1720",
			"Humanoid1721","Humanoid1722","Humanoid1723","Humanoid1724","Humanoid1725","Humanoid1726","Humanoid1727","Humanoid1728","Humanoid1729","Humanoid1730",
			"Humanoid1731","Humanoid1732","Humanoid1733","Humanoid1734","Humanoid1735","Humanoid1736","Humanoid1737","Humanoid1738","Humanoid1739","Humanoid1740",
			"Humanoid1741","Humanoid1742","Humanoid1743","Humanoid1744","Humanoid1745","Humanoid1746","Humanoid1747","Humanoid1748","Humanoid1749","Humanoid1750",
			"Humanoid1751","Humanoid1752","Humanoid1753","Humanoid1754","Humanoid1755","Humanoid1756","Humanoid1757","Humanoid1758","Humanoid1759","Humanoid1760",
			"Humanoid1761","Humanoid1762","Humanoid1763","Humanoid1764","Humanoid1765","Humanoid1766","Humanoid1767","Humanoid1768","Humanoid1769","Humanoid1770",
			"Humanoid1771","Humanoid1772","Humanoid1773","Humanoid1774","Humanoid1775","Humanoid1776","Humanoid1777","Humanoid1778","Humanoid1779","Humanoid1780",
			"Humanoid1781","Humanoid1782","Humanoid1783","Humanoid1784","Humanoid1785","Humanoid1786","Humanoid1787","Humanoid1788","Humanoid1789","Humanoid1790",
			"Humanoid1791","Humanoid1792","Humanoid1793","Humanoid1794","Humanoid1795","Humanoid1796","Humanoid1797","Humanoid1798","Humanoid1799","Humanoid1800",
			"Humanoid1801","Humanoid1802","Humanoid1803","Humanoid1804","Humanoid1805","Humanoid1806","Humanoid1807","Humanoid1808","Humanoid1809","Humanoid1810",
			"Humanoid1811","Humanoid1812","Humanoid1813","Humanoid1814","Humanoid1815","Humanoid1816","Humanoid1817","Humanoid1818","Humanoid1819","Humanoid1820",
			"Humanoid1821","Humanoid1822","Humanoid1823","Humanoid1824","Humanoid1825","Humanoid1826","Humanoid1827","Humanoid1828","Humanoid1829","Humanoid1830",
			"Humanoid1831","Humanoid1832","Humanoid1833","Humanoid1834","Humanoid1835","Humanoid1836","Humanoid1837","Humanoid1838","Humanoid1839","Humanoid1840",
			"Humanoid1841","Humanoid1842","Humanoid1843","Humanoid1844","Humanoid1845","Humanoid1846","Humanoid1847","Humanoid1848","Humanoid1849","Humanoid1850",
			"Humanoid1851","Humanoid1852","Humanoid1853","Humanoid1854","Humanoid1855","Humanoid1856","Humanoid1857","Humanoid1858","Humanoid1859","Humanoid1860",
			"Humanoid1861","Humanoid1862","Humanoid1863","Humanoid1864","Humanoid1865","Humanoid1866","Humanoid1867","Humanoid1868","Humanoid1869","Humanoid1870",
			"Humanoid1871","Humanoid1872","Humanoid1873","Humanoid1874","Humanoid1875","Humanoid1876","Humanoid1877","Humanoid1878","Humanoid1879","Humanoid1880",
			"Humanoid1881","Humanoid1882","Humanoid1883","Humanoid1884","Humanoid1885","Humanoid1886","Humanoid1887","Humanoid1888","Humanoid1889","Humanoid1890",
			"Humanoid1891","Humanoid1892","Humanoid1893","Humanoid1894","Humanoid1895","Humanoid1896","Humanoid1897","Humanoid1898","Humanoid1899","Humanoid1900",
			"Humanoid1901","Humanoid1902","Humanoid1903","Humanoid1904","Humanoid1905","Humanoid1906","Humanoid1907","Humanoid1908","Humanoid1909","Humanoid1910",
			"Humanoid1911","Humanoid1912","Humanoid1913","Humanoid1914","Humanoid1915","Humanoid1916","Humanoid1917","Humanoid1918","Humanoid1919","Humanoid1920",
			"Humanoid1921","Humanoid1922","Humanoid1923","Humanoid1924","Humanoid1925","Humanoid1926","Humanoid1927","Humanoid1928","Humanoid1929","Humanoid1930",
			"Humanoid1931","Humanoid1932","Humanoid1933","Humanoid1934","Humanoid1935","Humanoid1936","Humanoid1937","Humanoid1938","Humanoid1939","Humanoid1940",
			"Humanoid1941","Humanoid1942","Humanoid1943","Humanoid1944","Humanoid1945","Humanoid1946","Humanoid1947","Humanoid1948","Humanoid1949","Humanoid1950",
			"Humanoid1951","Humanoid1952","Humanoid1953","Humanoid1954","Humanoid1955","Humanoid1956","Humanoid1957","Humanoid1958","Humanoid1959","Humanoid1960",
			"Humanoid1961","Humanoid1962","Humanoid1963","Humanoid1964","Humanoid1965","Humanoid1966","Humanoid1967","Humanoid1968","Humanoid1969","Humanoid1970",
			"Humanoid1971","Humanoid1972","Humanoid1973","Humanoid1974","Humanoid1975","Humanoid1976","Humanoid1977","Humanoid1978","Humanoid1979","Humanoid1980",
			"Humanoid1981","Humanoid1982","Humanoid1983","Humanoid1984","Humanoid1985","Humanoid1986","Humanoid1987","Humanoid1988","Humanoid1989","Humanoid1990",
			"Humanoid1991","Humanoid1992","Humanoid1993","Humanoid1994","Humanoid1995","Humanoid1996","Humanoid1997","Humanoid1998","Humanoid1999","Humanoid2000",
			"Humanoid2001","Humanoid2002","Humanoid2003","Humanoid2004","Humanoid2005","Humanoid2006","Humanoid2007","Humanoid2008","Humanoid2009","Humanoid2010",
			"Humanoid2011","Humanoid2012","Humanoid2013","Humanoid2014","Humanoid2015","Humanoid2016","Humanoid2017","Humanoid2018","Humanoid2019","Humanoid2020",
			"Humanoid2021","Humanoid2022","Humanoid2023","Humanoid2024","Humanoid2025","Humanoid2026","Humanoid2027","Humanoid2028","Humanoid2029","Humanoid2030",
			"Humanoid2031","Humanoid2032","Humanoid2033","Humanoid2034","Humanoid2035","Humanoid2036","Humanoid2037","Humanoid2038","Humanoid2039","Humanoid2040",
			"Humanoid2041","Humanoid2042","Humanoid2043","Humanoid2044","Humanoid2045","Humanoid2046","Humanoid2047","Humanoid2048","Humanoid2049","Humanoid2050",
			"Humanoid2051","Humanoid2052"},

		customizationStringNames = {
			-- Strings containing comma-separated names are mutually exclusive names:  Only one will be set to a non-zero value
			"/shared_owner/blend_fat,/shared_owner/blend_skinny",
			"/shared_owner/blend_muscle",
			"/shared_owner/index_color_skin",
 		},
			
		customizationValues = {
			-- "/shared_owner/blend_fat,/shared_owner/blend_skinny",
			{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255},			
			-- "/shared_owner/blend_muscle",
			{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255},			
			-- "/shared_owner/index_color_skin",28,
			{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27},
		}			

}

ObjectTemplates:addTemplate(object_mobile_vendor_ishi_tib_male, "object/mobile/vendor/ishi_tib_male.iff")
