private ["_faction", "_i", "_p", "_side", "_u"];

_side = _this;
_faction = "East";

_i = [];
_u = [];
_p = [];

//--- Magazines
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

_i = _i		+ ["LIB_US_Mk_2"]; //Us
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["lib_m392"]; //RU
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["lib_m3975"]; //RU
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["lib_m3910"]; //RU
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["LIB_M39"]; //RU
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_F1"]; //US
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_pomzec_MINE_mag"]; //RU
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["LIB_US_M1A1_ATMINE_mag"]; //US
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_Ladung_Big_MINE_mag"]; //All
_u = _u		+ [1];
_p = _p		+ [100];

_i = _i		+ ["LIB_Ladung_Small_MINE_mag"]; //All
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["ClaymoreDirectionalMine_Remote_Mag"]; //All
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_M3_MINE_mag"];	//RU US
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_US_M3_MINE_mag"]; //US
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_PMD6_MINE_mag"]; //RU
_u = _u		+ [0];
_p = _p		+ [30];

_i = _i		+ ["LIB_5Rnd_762x54"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_5Rnd_762x54_t46"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_5Rnd_762x54_t30"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_5Rnd_762x54_D"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_5Rnd_762x54_b30"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_1Rnd_145x114"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_1Rnd_145x114_T"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_7Rnd_762x38"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_8Rnd_9x19_P08"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_8Rnd_762x25"];
_u = _u		+ [0];
_p = _p		+ [5];

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

_i = _i		+ ["lib_47Rnd_762x54"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_10Rnd_762x54"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_35Rnd_762x25"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_35Rnd_762x25_t"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_35Rnd_762x25_t2"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_35Rnd_762x25_ap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_71Rnd_762x25"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_71Rnd_762x25_t"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_71Rnd_762x25_t2"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_71Rnd_762x25_ap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["LIB_1Rnd_RPzB"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["lib_f1"];
_u = _u		+ [0];
_p = _p		+ [5];

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


//--- Weapons (Nested array elements are defined but skiped in the gear menu)
_i = _i		+ ["LIB_M9130PU"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_M9130"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_M38"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_M44"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_PTRD"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["lib_dp28"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["lib_PTRD_optic"];
_u = _u		+ [1];
_p = _p		+ [200];

_i = _i		+ ["LIB_SVT_40"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_M1895"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_TT33"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_M1908"];
_u = _u		+ [0];
_p = _p		+ [100];

_i = _i		+ ["LIB_PPSh41_d"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_PPSh41_m"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_RPzB"];
_u = _u		+ [2];
_p = _p		+ [400];

_i = _i		+ ["LIB_FLARE_PISTOL"];
_u = _u		+ [0];
_p = _p		+ [50];

//--- Uniforms
_i = _i		+ ["U_LIB_SOV_Tank_Kapitan"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Leutenant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Starshina"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Stsergeant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Artleutenant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Strelokart"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Razvedchik_am"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Razvedchik_autumn"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Razvedchik_lis"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Razvedchik_mix"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Leutenant_inset_poket"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Sergeant_inset_poket"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Snpier"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Snpier_autumn"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Snpier_spring"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Efreitor"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Kapitan"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Strelok"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Efreitor_summer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Kapitan_summer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Strelok_summer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Sergeant_summer"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Tank_ryadovoi"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Tank_Leutenant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Tank_Sergeant"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Tank_private_field"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Pilot"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["U_LIB_SOV_Stleutenant"];
_u = _u		+ [0];
_p = _p		+ [10];


//--- Vests
_i = _i		+ ["V_LIB_SOV_RA_OfficerVest"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RAZV_OfficerVest"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_IShBrVestPPShDisc"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_IShBrVestPPShMAg"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_IShBrVestMG"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RA_MosinBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RA_TankOfficerSet"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RA_MGBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RAZV_MGBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RA_PPShBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RAZV_PPShBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_SniperVest"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RA_SVTBelt"];
_u = _u		+ [0];
_p = _p		+ [25];

_i = _i		+ ["V_LIB_SOV_RAZV_SVTBelt"];
_u = _u		+ [0];
_p = _p		+ [25];


//--- Backpacks
_i = _i		+ ["B_LIB_SOV_RA_Rucksack"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Rucksack_green"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Rucksack2"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Rucksack2_green"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_MGAmmoBag_Empty"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_GasBag"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_MedicalBag_Empty"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_Parachute"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_Maxim_Bag"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_Maxim_Bar"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Radio"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Shinel"];
_u = _u		+ [0];
_p = _p		+ [15];

_i = _i		+ ["B_LIB_SOV_RA_Paradrop"];
_u = _u		+ [0];
_p = _p		+ [15];


//--- Glasses
_i = _i		+ ["G_Shades_Black"];
_u = _u		+ [0];
_p = _p		+ [2];

_i = _i		+ ["G_Tactical_Clear"];
_u = _u		+ [1];
_p = _p		+ [4];

_i = _i		+ ["G_Sport_Blackred"];
_u = _u		+ [0];
_p = _p		+ [2];

//---Attachments
_i = _i		+ ["optic_PU"];
_u = _u		+ [0];
_p = _p		+ [50];

_i = _i		+ ["BraMit"];
_u = _u		+ [0];
_p = _p		+ [20];

_i = _i		+ ["LIB_ACC_M1891_Bayo"];
_u = _u		+ [0];
_p = _p		+ [10];

_i = _i		+ ["LIB_ACC_GL_DYAKONOV_Empty"];
_u = _u		+ [0];
_p = _p		+ [20];


//--- Helms
_i = _i		+ ["H_LIB_SOV_RA_Helmet"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_SOV_RA_PrivateCap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_SOV_RA_TankHelmet"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_SOV_RA_OfficerCap"];
_u = _u		+ [0];
_p = _p		+ [5];

_i = _i		+ ["H_LIB_SOV_RA_PilotHelmet"];
_u = _u		+ [0];
_p = _p		+ [5];

//--- Items
/*_i = _i		+ ["Binocular"];
_u = _u		+ [0];
_p = _p		+ [5];*/

_i = _i		+ ["LIB_Binocular_SU"];
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
_t = _t 	+ [[[["LIB_M9130",["","",""],["LIB_5Rnd_762x54"]],["",[],[]],["LIB_TT33",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_SOV_Leutenant",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_OfficerVest",["LIB_M39","LIB_M39","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],["H_LIB_SOV_RA_Helmet",""],[["", "LIB_Binocular_SU"],["itemmap","itemradio","","itemcompass","itemwatch"]]]];
_t = _t 	+ [[[["LIB_PPSh41_d",["","",""],["LIB_35Rnd_762x25"]],["",[],[]],["LIB_TT33",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_SOV_Leutenant",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_OfficerVest",["LIB_M39","LIB_M39","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_SOV_RA_Rucksack",["LIB_35Rnd_762x25","LIB_35Rnd_762x25","LIB_35Rnd_762x25","LIB_35Rnd_762x25","LIB_35Rnd_762x25","LIB_35Rnd_762x25"]]],["H_LIB_SOV_RA_Helmet",""],[["", "LIB_Binocular_SU"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
_t = _t 	+ [[[["LIB_M9130PU",["","",""],["LIB_5Rnd_762x54"]],["",[],[]],["LIB_TT33",["","",""],["LIB_8Rnd_9x19_P08"]]],[["U_LIB_SOV_Leutenant",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_OfficerVest",["LIB_M39","LIB_M39","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],["H_LIB_SOV_RA_Helmet",""],[["", "LIB_Binocular_SU"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];

/*
_t = _t 	+ [[
[["LIB_M9130",["","",""],["LIB_5Rnd_762x54"]],
["",[],[]],
["LIB_TT33",["","",""],["LIB_8Rnd_9x19_P08"]]],
[["U_LIB_SOV_Leutenant",["firstaidkit","firstaidkit"]],
["V_LIB_SOV_RA_OfficerVest",["LIB_M39","LIB_M39","LIB_8Rnd_9x19_P08","LIB_8Rnd_9x19_P08"]],
["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],
["H_LIB_SOV_RA_Helmet",""],
[["", "LIB_Binocular_SU"],["itemmap","","itemradio","itemcompass","itemwatch"]]
]];
*/




[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 