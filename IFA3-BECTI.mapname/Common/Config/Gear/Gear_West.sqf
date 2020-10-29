private ["_faction", "_i", "_p", "_side", "_u"];

_side = _this;
_faction = "West";

_i = [];
_u = [];
_p = [];

_i = _i		+ ["ifa3_TS_Small"]; //All
_u = _u		+ [2];
_p = _p		+ [50];

_i = _i		+ ["ifa3_TS_BIG"]; //All
_u = _u		+ [1];
_p = _p		+ [150];

_i = _i		+ ["LIB_Rpg6"]; //Ind
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["LIB_Rg42"]; //Ind
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_Pwm"]; //Ind
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["LIB_NB39"]; //Ger
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_Shg24x7"]; //Ger
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["LIB_Shg24"]; //Ger
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_Ladung_Big_MINE_mag"]; //All
_u = _u		+ [1];
_p = _p		+ [100];

_i = _i		+ ["LIB_Ladung_Small_MINE_mag"]; //All
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["ClaymoreDirectionalMine_Remote_Mag"]; //All
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_shumine_42_MINE_mag"]; //Ger
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_SMI_35_MINE_mag"]; //Ger
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_SMI_35_1_MINE_mag"]; //Ger
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_STMI_MINE_mag"]; //Ger
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_TM44_MINE_mag"]; //Ger
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_5Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_t"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_sS"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_SMK"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57_clip"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_t"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_sS"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_SMK"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57_T"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57_T2"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57_sS"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_792x57_SMK"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_t"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_sS"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_5Rnd_792x57_SMK"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_50Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_50Rnd_792x57_SMK"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_50Rnd_792x57_sS"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_32rnd_9x19"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_32rnd_9x19_t"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1Rnd_Faustpatrone"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_8Rnd_81mmHE_GRWR34"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["ARTY_LIB_8Rnd_81mmHE_GRWR34"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1rnd_81mmHE_GRWR34"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_81mm_GRWR34_SmokeShell"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1rnd_81mmHE_GRWR34"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_81mm_GRWR34_SmokeShell"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_100Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1Rnd_PzFaust_30m"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1Rnd_PzFaust_60m"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_1Rnd_RPzB"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_10Rnd_9x19_M1896"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_8Rnd_9x19_P08"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_7Rnd_9x19"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["lib_m39_pist"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_20Rnd_792x57"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["lib_1Rnd_flare_white"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_1Rnd_flare_red"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_1Rnd_flare_green"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_1Rnd_flare_yellow"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_f1"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["SmokeShell"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellRed"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellGreen"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellYellow"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellPurple"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellBlue"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["SmokeShellOrange"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["FlareWhite_F"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["FlareGreen_F"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["FlareRed_F"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["FlareYellow_F"];
_u = _u		+ [0];
_p = _p		+ [2];


//--- Weapons
_i = _i		+ ["LIB_FG42G"];
_u = _u		+ [2];
_p = _p		+ [10];

_i = _i		+ ["LIB_G3340"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_G41"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_G43"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_K98"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_K98_LATE"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_K98_AWAR"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_K98ZF39"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_Mg30"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_MG34"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_MG34_PT"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_MG42"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["lib_Mp18"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["lib_Mp28"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["lib_Mp35"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_MP38"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_MP40"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_MP40_AWAR"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["Lib_Mp41r"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_MP44"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_FAUSTPATRONE"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_GRWR34"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_GrWr34_Barrel"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_GrWr34_Tripod"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_Lafette_Tripod"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_PzFaust_30m"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_PzFaust_60m"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_RPzB"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_RPzB_w"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_M1896"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_P08"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_P38"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_WaltherPPK"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_kampf_PISTOL"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_FLARE_PISTOL"];
_u = _u		+ [0];
_p = _p		+ [50];


//--- Uniforms
_i = _i		+ ["U_LIB_GER_Medic"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_MG_schutze"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Pionier"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Art_schutze"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Oberschutze"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Gefreiter"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Unterofficer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_schutze"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Art_unterofficer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier3"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier2"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Recruit"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Hauptmann"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Oberleutnand"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Oberst"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Leutnant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Scharfschutze"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier_cammo"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier_cammo2"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier_cammo3"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier_cammo4"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Soldier_cammo5"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Officer_camo"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_GER_Funker"];
_u = _u		+ [0];
_p = _p		+ [10];


//--- Vests
_i = _i		+ ["V_LIB_GER_VestKar98"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_VestMP40"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_PioneerVest"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_VestG43"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_VestSTG"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_VestUnterofficer"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_VestMG"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_OfficerVest"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_SniperBelt"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["V_LIB_GER_FieldOfficer"];
_u = _u		+ [0];
_p = _p		+ [5];


//--- Backpacks
_i = _i		+ ["B_LIB_GER_MedicBackpack"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_Panzer"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_SapperBackpack"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_SapperBackpack2"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_A_frame"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_A_frame_AT"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_A_frame_Gef"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_Radio"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_GER_LW_Paradrop"];
_u = _u		+ [0];
_p = _p		+ [15];


//--- Glasses
_i = _i		+ ["G_Combat"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["G_Shades_Black"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["G_Sport_Blackred"];
_u = _u		+ [0];
_p = _p		+ [2];

//--- Attachments
_i = _i		+ ["optic_zf41"];
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["LIB_ACC_K98_Bayo"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_ACC_GW_SB_empty"];
_u = _u		+ [0];
_p = _p		+ [20];

//--- Helms
_i = _i		+ ["H_LIB_GER_Helmet"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_Helmet_ns"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_Cap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_OfficerCap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_HelmetCamo"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_HelmetCamo2"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_GER_HelmetCamo4"];
_u = _u		+ [0];
_p = _p		+ [5];

//--- Items
/*_i = _i		+ ["Binocular"];
_u = _u		+ [0];
_p = _p		+ [5];*/

_i = _i		+ ["LIB_Binocular_GER"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["ItemMap"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["itemradio"];
_u = _u		+ [0];
_p = _p		+ [3];

_i = _i		+ ["itemcompass"];
_u = _u		+ [0];
_p = _p		+ [1];

_i = _i		+ ["itemwatch"];
_u = _u		+ [0];
_p = _p		+ [1];

_i = _i		+ ["Toolkit"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["FirstAidKit"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["Medikit"];
_u = _u		+ [0];
_p = _p		+ [15];

[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];
_t = _t 	+ [[[["LIB_G41",["","",""],["LIB_10Rnd_792x57_clip"]],["",[],[]],["LIB_P08",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_GER_Leutnant",["firstaidkit","firstaidkit"]],["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_GER_A_frame",["LIB_10Rnd_792x57_clip","LIB_10Rnd_792x57_clip","LIB_10Rnd_792x57_clip","LIB_10Rnd_792x57_clip","LIB_10Rnd_792x57_clip","LIB_10Rnd_792x57_clip"]]],["H_LIB_GER_Helmet",""],[["","LIB_Binocular_GER"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
_t = _t 	+ [[[["LIB_MG34",["","",""],["LIB_50Rnd_792x57"]],["",[],[]],["LIB_P08",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_GER_Leutnant",["firstaidkit","firstaidkit"]],["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_GER_A_frame",["LIB_50Rnd_792x57","LIB_50Rnd_792x57","LIB_50Rnd_792x57","LIB_50Rnd_792x57","LIB_50Rnd_792x57","LIB_50Rnd_792x57"]]],["H_LIB_GER_Helmet",""],[["","LIB_Binocular_GER"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
_t = _t 	+ [[[["LIB_K98ZF39",["","",""],["LIB_5Rnd_792x57"]],["",[],[]],["LIB_P08",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_GER_Leutnant",["firstaidkit","firstaidkit"]],["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_GER_A_frame",["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"]]],["H_LIB_GER_Helmet",""],[["","LIB_Binocular_GER"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
/*
_t = _t 	+ [[
[["LIB_K98ZF39",["","",""],["LIB_5Rnd_792x57"]],
["",[],[]],
["LIB_P08",["","",""],["LIB_8Rnd_9x19_P08"]]],
[["U_LIB_GER_Leutnant",["firstaidkit","firstaidkit"]],
["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],
["B_LIB_GER_A_frame",["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"]]],
["H_LIB_GER_Helmet",""],
[["", "LIB_Binocular_GER"],["itemmap","","itemradio","itemcompass","itemwatch"]]
]];
*/
[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf";