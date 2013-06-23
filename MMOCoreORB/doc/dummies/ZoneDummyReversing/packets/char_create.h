#ifndef CHAR_CREATE_H
#define CHAR_CREATE_H

//INCLUDE ALL CHARACTER CREATION SPECIFIC PACKETS HERE

char character_approve_header[] = {
0x00, 0x09, //op
0x00, 0x00, //seq
0x04, 0x00, 0x68, 0xB8, 0x5F, 0xE8
};

char assign_char_id_pkt[] = {
0x00, 0x09, //op
0x00, 0x00, //seq
0x02, 0x00, 0xCC, 0x75, 0xB5, 0x1D,  //group + group op
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //long, character id.
0x00, 0x00, 0x00
};

char character_statvalid_header[] = {
0x00, 0x09, //op
0x00, 0x00, //seq
0x04, 0x00, 0x68, 0xB8, 0x5F, 0xE8, //group + group op
0x00, 0x00 //iff file size
};

char character_statvalid_namesize[] = {
0x00, 0x00, 0x00, 0x00 //name size
};

char character_statvalid_midfoot[] = {
0x02, 0x00, 0x75, 0x69, //ui length + string
0x00, 0x00, 0x00, 0x00,
0x0D, 0x00 //string size (13) name_approved
};

char namestatus_name_approved[13] = {
0x6e, 0x61, 0x6d, 0x65, 0x5f, 0x61, 0x70, 0x70, 0x72, 0x6f, 0x76, 0x65, 0x64
};

char character_statvalid_foot[2] = {
0xDB, 0xE8
};


#endif

