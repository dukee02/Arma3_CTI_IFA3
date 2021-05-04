_side = _this;
_sid = "";

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "LIB_US_GMC_Tent"];
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "LIB_US_GMC_Tent"];
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "LIB_Zis6_Parm"];
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "LIB_OpelBlitz_Parm"];
};

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: Common\Config\Base\Base.sqf", format ["Set HQ Vehicle [%1] for side [%2]", missionNamespace getVariable format["CTI_%1_HQ", _side], _side]] call CTI_CO_FNC_Log };

missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 180, [-23,33]],
	[CTI_LIGHT, 180, [23,33]],
	[CTI_CONTROLCENTER, 0, [30,-40]],
	[CTI_HEAVY, 0, [-30,-40]],
	[CTI_AIR, 180, [-60,37]],
	[CTI_REPAIR, 180, [60,37]],
	[CTI_AMMO, 180, [80,37]]
]];

//--- Commander course of action ["Action", Parameter(s), Condition]
if(CTI_TOWNS_STARTING_MODE>0) then {
	missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
		["build-structures", CTI_CONTROLCENTER, {true}],
		["build-structures", CTI_BARRACKS, {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
		["build-structures", CTI_LIGHT, {true}],
		["build-structures", CTI_REPAIR, {true}],
		["build-structures", CTI_AMMO, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 1], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
		["build-structures", CTI_HEAVY, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 2], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 2], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 2], {true}],
		["build-structures", CTI_AIR, {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 4], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 3], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 2], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 4], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 5], {true}]
	]];
}else {
	missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
		["build-structures", CTI_BARRACKS, {true}],
		["build-structures", CTI_REPAIR, {true}],
		["build-structures", CTI_AMMO, {true}],
		["build-structures", CTI_CONTROLCENTER, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 1], {true}],
		["build-structures", CTI_LIGHT, {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
		["build-structures", CTI_HEAVY, {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 2], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 2], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 1], {true}],
		["build-structures", CTI_AIR, {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 4], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 3], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 2], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 4], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 5], {true}]
	]];
};

//--- Structures
_headers = [];
_classes = [];
_prices = [];
_times = [];
_placements = [];
_helper = [];
_specials = [];

/*
	Specials:
		- DMG_Alternative: Need to be used in case of bisterious buildings usage 
				If a building is damaged, all the EH it had will bisteriously vanish... This "feature" will probably never get fixed so once again, we fix it ourself!
		- DMG_Reduce: Reduce the incoming damage on a building making it stronger if above 1.
*/

/*_headers = _headers 		+ [[CTI_HQ_DEPLOYED, "HQ", "HQdeployed"]];
//_classes = _classes 		+ [["Land_Bunker_01_HQ_F", "Land_Bunker_01_HQ_F"]];
//_classes = _classes 		+ [["LIB_Static_zis6_radar", "LIB_zis5v_Wreck"]];
_classes = _classes 		+ [["LIB_Static_opelblitz_radio", "LIB_OpelBlitz_2_Wreck"]];
_prices = _prices 			+ [CTI_BASE_HQ_DEPLOY_COST];
_times = _times 			+ [1];
_placements = _placements 	+ [[0, 25]];
_specials = _specials		+ [[["DMG_Reduce", 5]]];*/

_headers pushBack 		[CTI_HQ_DEPLOYED, "HQ", "HQdeployed"];
if (!isClass(configFile >> "CfgVehicles" >> "LIB_Static_opelblitz_radio")) then {
	_classes pushBack		["Land_Research_house_V1_F", "Land_Research_house_V1_ruins_F"];								//Altis Military Buildings
} else {
	switch (true) do {
		case (CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) : {
			_classes pushBack		["LIB_Static_opelblitz_radio", "LIB_OpelBlitz_2_Wreck"];
		};
		case (CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) : {
			_classes pushBack		["LIB_Static_zis6_radar", "LIB_zis5v_Wreck"];
		};
		case (CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) : {
			_classes pushBack		["LIB_Static_zis6_radar", "LIB_us6_Wreck"];
		};
		case (CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) : {
			_classes pushBack		["LIB_Static_zis6_radar", "LIB_us6_Wreck"];
		};
	};
};
_prices pushBack 		CTI_BASE_HQ_DEPLOY_COST;
_times pushBack			1;
_placements pushBack 	[0, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", 4]];

_headers pushBack		[CTI_BARRACKS, "Barracks", "Barracks"];
if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBBarracks")) then {
	_classes pushBack		["CDF_WarfareBBarracks", "Land_Scaffolding_New_F"];
} else {
	switch (CTI_BUILDING_FALLBACK) do {
		case 1;
		case 2: {_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];};					//Altis Military Buildings
		default {_classes pushBack		["Land_i_House_Small_03_V1_F", "Land_House_Small_03_V1_ruins_F"];};		//Altis Housing
	};
};
_prices pushBack		2000;
_times pushBack			60;
_placements pushBack 	[270, 35];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", 1]];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_headers pushBack		[CTI_LIGHT, "Light Vehicle Factory", "Light"];
	if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBLightFactory")) then {
		_classes pushBack		["CDF_WarfareBLightFactory", "Land_Scaffolding_New_F"];
	} else {
		switch (CTI_BUILDING_FALLBACK) do {
			case 1;
			case 2: {_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];};				//Altis Military Buildings
			default {_classes pushBack		["Land_i_Garage_V1_F", "Land_Garage_V1_ruins_F"];};					//Altis Housing
		};
	};
	_prices pushBack 		4000;
	_times pushBack 		80;
	_placements pushBack 	[180, 30];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", 1]];
};

_headers pushBack 		[CTI_CONTROLCENTER, "Control Center", "CC"];
if (isClass(configFile >> "CfgVehicles" >> "GUE_WarfareBUAVterminal")) then {
	_classes pushBack 		["GUE_WarfareBUAVterminal", "Land_PowGen_Big_ruins"];
} else {
	switch (CTI_BUILDING_FALLBACK) do {
		case 1: {_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F"];};					//Altis Military Buildings
		case 2: {_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F"];};					//Best mixed Buildings
		default {_classes pushBack 		["Land_Radar_Small_F", "Land_Radar_Small_ruins_F"];};					//Altis Housing
	};
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", 1]];


if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_headers pushBack 		[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBHeavyFactory")) then {
		_classes pushBack 		["RU_WarfareBHeavyFactory", "Land_Scaffolding_New_F"];
	} else {
		switch (CTI_BUILDING_FALLBACK) do {
			case 1;
			case 2: {_classes pushBack 		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"];};				//Altis Military Buildings
			default {_classes pushBack 		["Land_CarService_F", "Land_House_Small_03_V1_ruins_F"];};			//Altis Housing
		};
	};
	_prices pushBack 		6000;
	_times pushBack 		120;
	_placements pushBack 	[90, 25];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", 1]];
};

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_headers pushBack 		[CTI_AIR, "Aircraft Factory", "Air"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBAircraftFactory")) then {
		_classes pushBack 		["RU_WarfareBAircraftFactory", "Land_Scaffolding_New_F"];
	} else {
		switch (CTI_BUILDING_FALLBACK) do {
			case 1: {_classes pushBack 		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];};			//Altis Military Buildings
			default {_classes pushBack 		["Land_Airport_Tower_F", "Land_Airport_Tower_ruins_F"];};			//Altis Housing
		};
	};
	_prices pushBack 		8000;
	_times pushBack 		140;
	_placements pushBack 	[180, 40];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", 1]]; 
};

_headers pushBack 		[CTI_AMMO, "Ammo Depot", "Ammo"];
if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBVehicleServicePoint")) then {
	_classes pushBack 		["RU_WarfareBVehicleServicePoint", "Land_PowGen_Big_ruins"];
} else {
	switch (CTI_BUILDING_FALLBACK) do {
		case 1: {_classes pushBack		["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"];};				//Altis Military Buildings
		default {_classes pushBack 		["B_Slingload_01_Ammo_F", "Land_Cargo20_military_ruins_F"];};			//Altis Housing
	};
};
_prices pushBack 		2000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", 1]];

_headers pushBack 		[CTI_REPAIR, "Repair Depot", "Repair"];
if (isClass(configFile >> "CfgVehicles" >> "TK_GUE_WarfareBContructionSite_Base_EP1")) then {
	_classes pushBack 		["TK_GUE_WarfareBContructionSite_Base_EP1", "Land_PowGen_Big_ruins"];
} else {
	switch (CTI_BUILDING_FALLBACK) do {
		case 1: {_classes pushBack 		["Land_Cargo_House_V3_F", "Land_Cargo_House_V3_ruins_F"];};				//Altis Military Buildings
		default {_classes pushBack 		["Land_FuelStation_Build_F", "Land_FuelStation_Build_ruins_F"];};		//Altis Housing
	};
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", 1]];

if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_headers pushBack 		[CTI_NAVAL, "Naval Yard", "Naval"];
	if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBBarracks")) then {
		_classes pushBack 		["Land_Lighthouse_small_F", "Land_Lighthouse_small_ruins_F"];
	} else {
		switch (CTI_BUILDING_FALLBACK) do {
			case 1: {_classes pushBack 		["Land_Cargo_House_V2_F", "Land_Cargo_House_V2_ruins_F"];};			//Altis Military Buildings
			default {_classes pushBack 		["Land_Lighthouse_small_F", "Land_Lighthouse_small_ruins_F"];};		//Altis Housing
		};
	};
	_prices pushBack 		3000;
	_times pushBack 		80;
	_placements pushBack 	[180, 60];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", 1]];
};

[_side, _headers, _classes, _prices, _times, _placements, _helper, _specials] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Structures.sqf";

//--- Defenses
_headers = [];
_classes = [];
_prices = [];
_placements = [];  
_categories = [];

if(CTI_FOB_BUILD_EVERYONE == 0) then {
	_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
} else {
	_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB == 0))}]]];
	//_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX)}]]];
};
if (isClass(configFile >> "CfgVehicles" >> "INS_WarfareBFieldhHospital")) then {
	_classes pushBack 			"INS_WarfareBFieldhHospital";
} else {
	_classes pushBack 			"Land_Medevac_house_V1_F";										//Altis Military Buildings
};
_prices pushBack 			5000;
_placements pushBack 		[180, 15];
_categories pushBack 		"Fortification";

//Defense Guns
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"SearchLight";
	_classes pushBack 		format["%1LIB_GER_SearchLight", _sid];
	_prices pushBack 		200;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
		
	_headers pushBack 		"MG34";
	_classes pushBack 		format["%1LIB_MG34_Lafette_Deployed", _sid];
	_prices pushBack 		500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
		
	_headers pushBack 		"MG34 low";
	_classes pushBack 		format["%1LIB_MG34_Lafette_low_Deployed", _sid];
	_prices pushBack 		500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
		
	_headers pushBack 		"GrWr34";
	_classes pushBack 		format["%1LIB_GrWr34", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
		
	_headers pushBack 		"GrWr34";
	_classes pushBack 		format["%1LIB_GrWr34_g", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	//class 	csa38_GrW34;
	//class 	CSA38_MG34t;
	//class 	CSA38_MG34t4;
	//class 	CSA38_MG34t3;
	//class 	CSA38_MG34t2;
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	if(CTI_IFA3_NEW == 1) then {
		_headers pushBack 		"Maxim M30 low";
		_classes pushBack 		format["%1LIB_Maxim_M30_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Maxim M30 low";
		_classes pushBack 		format["%1LIB_Maxim_M30_Trench_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	} else {
		_headers pushBack 		"Maxim base";
		_classes pushBack 		format["%1LIB_Maxim_M30_base", _sid];
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Maxim Trench";
		_classes pushBack 		format["%1LIB_Maxim_M30_Trench", _sid];
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	
	_headers pushBack 		"SearchLight";
	_classes pushBack 		format["%1LIB_SU_SearchLight", _sid];
	_prices pushBack 		200;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"BM37";
	_classes pushBack 		format["%1LIB_BM37", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	_headers pushBack 		"M1919 M2 MG";
	_classes pushBack 		format["%1LIB_M1919_M2", _sid];
	_prices pushBack 		500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"M2 60 (Mortar)";
	_classes pushBack 		format["%1LIB_M2_60", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	if(CTI_IFA3_NEW > 0) then {
		_headers pushBack 		"Vickers MMG";
		_classes pushBack 		format["%1LIB_Vickers_MMG", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	
	_headers pushBack 		"M2 60 (Mortar)";
	_classes pushBack 		format["%1LIB_M2_60", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};

//******************************BASE GUN DEFENSE 1******************************
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_headers pushBack 		"FlaK 30 (winter)";
		_classes pushBack 		format["%1LIB_FlaK_30_w", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		//class 	csa38_pak35_W;
	};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//class 	csa38_pak35_DE;
	//};
	_headers pushBack 		"FlaK 30";
	_classes pushBack 		format["%1LIB_FlaK_30", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"leFH18";
	_classes pushBack 		format["%1LIB_leFH18", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"leFH18 AT";
	_classes pushBack 		format["%1LIB_leFH18_AT", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {	
	_headers pushBack 		"61k (AA)";
	_classes pushBack 		format["%1LIB_61k", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	if(CTI_IFA3_NEW == 0) then {
		_headers pushBack 		"61k (AA)";
		_classes pushBack 		format["%1LIB_61k", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	if(CTI_IFA3_NEW == 0) then {
		_headers pushBack 		"61k (AA)";
		_classes pushBack 		format["%1LIB_61k", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};

//******************************BASE GUN DEFENSE 2******************************
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_headers pushBack 		"FlaK 36 (winter)";
		_classes pushBack 		format["%1LIB_FlaK_36_w", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"FlaK 36 AA (winter)";
		_classes pushBack 		format["%1LIB_FlaK_36_AA_w", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"FlaK 36 ARTY (winter)";
		_classes pushBack 		format["%1LIB_FlaK_36_ARTY_w", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"FlaK 38 (winter)";
		_classes pushBack 		format["%1LIB_FlaK_38_w", _sid];
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_headers pushBack 		"FlaK 36 (Desert)";
		_classes pushBack 		format["%1LIB_DAK_FlaK_36", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"FlaK 36 AA (Desert)";
		_classes pushBack 		format["%1LIB_DAK_FlaK_36_AA", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"FlaK 36 ARTY (Desert)";
		_classes pushBack 		format["%1LIB_DAK_FlaK_36_ARTY", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	_headers pushBack 		"MG42";
	_classes pushBack 		format["%1LIB_MG42_Lafette_Deployed", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"MG42 low";
	_classes pushBack 		format["%1LIB_MG42_Lafette_low_Deployed", _sid];
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"FlaK 36";
	_classes pushBack 		format["%1LIB_FlaK_36", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"FlaK 36 AA";
	_classes pushBack 		format["%1LIB_FlaK_36_AA", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"FlaK 36 ARTY";
	_classes pushBack 		format["%1LIB_FlaK_36_ARTY", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"FlaK 38";
	_classes pushBack 		format["%1LIB_FlaK_38", _sid];
	_prices pushBack 		3000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW == 1) then {
		_headers pushBack 		"57 mm Gun M1";
		_classes pushBack 		format["%1LIB_57mm_M1", _sid];
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";	
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW == 1) then {
		_headers pushBack 		"6 Pounder";
		_classes pushBack 		format["%1LIB_QF6_pdr", _sid];
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};


//******************************BASE GUN DEFENSE 3******************************
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_headers pushBack 		"Flak 38 Vierling (Winter)";
		_classes pushBack 		format["%1LIB_Flakvierling_38_w", _sid];
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Pak 40 (Winter)";
		_classes pushBack 		format["%1LIB_Pak40_w", _sid];
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_headers pushBack 		"Pak 40 (Desert)";
		_classes pushBack 		format["%1LIB_DAK_Pak40", _sid];
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	_headers pushBack 		"Nebelwerfer 41";
	_classes pushBack 		format["%1LIB_Nebelwerfer41", _sid];
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
		
	_headers pushBack 		"Nebelwerfer 41 Camo";
	_classes pushBack 		format["%1LIB_Nebelwerfer41_Camo", _sid];
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Nebelwerfer 41 bg";
	_classes pushBack 		format["%1LIB_Nebelwerfer41_Gelbbraun", _sid];
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Flak 38 Vierling";
	_classes pushBack 		format["%1LIB_Flakvierling_38", _sid];
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Pak 40";
	_classes pushBack 		format["%1LIB_Pak40", _sid];
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_headers pushBack 		"Zis3 (Winter)";
		_classes pushBack 		format["%1LIB_Zis3_w", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	_headers pushBack 		"Zis3";
	_classes pushBack 		format["%1LIB_Zis3", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"Zis3";
	_classes pushBack 		format["%1LIB_Zis3", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	if(CTI_IFA3_NEW > 0) then {
		_headers pushBack 		"M45 Quadmount";
		_classes pushBack 		format["%1LIB_M45_Quadmount", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"Zis3";
	_classes pushBack 		format["%1LIB_Zis3", _sid];
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	if(CTI_IFA3_NEW > 0) then {
		_headers pushBack 		"M45 Quadmount";
		_classes pushBack 		format["%1LIB_M45_Quadmount_UK", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};

//******************************Ammoboxes*******************************************************************************************************
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"81mm Ammo HE";
	_classes pushBack 		"LIB_Box_81mm_Mo_HE";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"81mm Ammo Smoke";
	_classes pushBack 		"LIB_1rnd_81mmHE_GRWR34";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Small Ammo Box 1";
	_classes pushBack 		"LIB_AmmoCrate_Mortar_GER";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Small Ammo Box 2";
	_classes pushBack 		"LIB_AmmoCrate_Arty_GER";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"AT Box";
	_classes pushBack 		"LIB_4Rnd_RPzB";
	_prices pushBack 		500;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Mines";
	_classes pushBack 		"LIB_Mine_Ammo_Box_Ger";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Weapons 1";
	_classes pushBack 		"LIB_BasicWeaponsBox_GER";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Weapons 2";
	_classes pushBack 		"LIB_WeaponsBox_Big_GER";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Large Ammo";
	_classes pushBack 		"LIB_BasicAmmunitionBox_GER";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"82mm Smoke";
	_classes pushBack 		"LIB_Box_82mm_Mo_Smoke";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Small Ammo";
	_classes pushBack 		"LIB_AmmoCrate_Mortar_SU";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Small Ammo 2";
	_classes pushBack 		"LIB_AmmoCrate_Arty_SU";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Basic Ammo Box";
	_classes pushBack 		"LIB_BasicAmmunitionBox_SU";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Mines";
	_classes pushBack 		"LIB_Mine_Ammo_Box_Su";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Ammo Box 1";
	_classes pushBack 		"LIB_BasicWeaponsBox_SU";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Ammo Box 2";
	_classes pushBack 		"LIB_WeaponsBox_Big_SU";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Ammo Box 3";
	_classes pushBack 		"LIB_Lone_Big_Box";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"60mm Ammo HE";
	_classes pushBack 		"LIB_Box_60mm_Mo_HE";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"60mm Ammo Smoke";
	_classes pushBack 		"LIB_Box_60mm_Mo_Smoke";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Mines";
	_classes pushBack 		"LIB_Mine_AmmoBox_US";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Weapons";
	_classes pushBack 		"LIB_BasicAmmunitionBox_US";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";

	_headers pushBack 		"Large Ammo";
	_classes pushBack 		"LIB_BasicWeaponsBox_US";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
//if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
//};

//******************************BASE DEFENSE 0*******************************************************************************************************
_headers pushBack 		"Warning Sign- Mines";
_classes pushBack 		"Land_Sign_Mines_F";
_prices pushBack 		1;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Barbedwire 1";
_classes pushBack 		"Land_I44_Buildings_Barbedwire";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Barbedwire 2";
_classes pushBack 		"Land_I44_Buildings_Barbedwire2";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Bwire 1";
_classes pushBack 		"WW2_BET_Bwire_2";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Bwire 2";
_classes pushBack 		"WW2_BET_Bwire_4";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Razorwire";
_classes pushBack 		"Land_Razorwire_F";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Wire_Bruno";
_classes pushBack 		"Land_WW2_Wire_Bruno";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";

_headers pushBack 		"Wire";
_classes pushBack 		"Land_WW2_Wire_2";
_prices pushBack 		200;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";


_headers pushBack 		"Bagfence Bunker";
_classes pushBack 		"Land_Fort_Bagfence_Bunker";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"BagFence Corner";
_classes pushBack 		"Land_BagFence_Corner_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"BagFence End";
_classes pushBack 		"Land_BagFence_End_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"BagFence Long";
_classes pushBack 		"Land_BagFence_Long_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"BagFence Round";
_classes pushBack 		"Land_BagFence_Round_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"BagFence Short";
_classes pushBack 		"Land_BagFence_Short_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"bagfence round";
_classes pushBack 		"Land_WW2_BET_Sandsack_Kreis";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"bagfence long";
_classes pushBack 		"Land_WW2_BET_Sandsack_Lang";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"bagfence long 2";
_classes pushBack 		"Land_fort_bagfence_long";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"bagfence corner";
_classes pushBack 		"Land_fort_bagfence_corner";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"bagfence round 2";
_classes pushBack 		"Land_fort_bagfence_round";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";

_headers pushBack 		"Strelecky post";
_classes pushBack 		"Land_strelecky_post_new";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";


//******************************BASE DEFENSE 1******************************

_headers pushBack 		"Dirthump 1";
_classes pushBack 		"Land_Dirthump01";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirthump 2";
_classes pushBack 		"Land_Dirthump01_EP1";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirthump 3";
_classes pushBack 		"Land_Dirthump02_EP1";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirthump 4";
_classes pushBack 		"Land_Dirthump02";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirthump 5";
_classes pushBack 		"Land_Dirthump03";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirthump 6";
_classes pushBack 		"Land_Dirthump03_EP1";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Dirtmount";
_classes pushBack 		"Dirtmount_EP1";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Envelope Big";
_classes pushBack 		"Fort_EnvelopeBig";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Envelope Small";
_classes pushBack 		"Fort_EnvelopeSmall";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Artillery Nest";
_classes pushBack 		"Land_fort_artillery_nest";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

_headers pushBack 		"Fort Rampart";
_classes pushBack 		"Land_fort_rampart";
_prices pushBack 		1000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	_headers pushBack 		"Fort Rampart (Winter)";
	_classes pushBack 		"WW2_JNS_Fort_Rampart_EP1";
	_prices pushBack 		1000;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Dirt";
};

_headers pushBack 		"Setka Car";
_classes pushBack 		"Land_Setka_Car";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"Setka Dor";
_classes pushBack 		"Land_WW2_Setka_Dor";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"Setka Vert";
_classes pushBack 		"Land_WW2_Setka_Vert";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet Tank";
_classes pushBack 		"Land_WW2_CamoNet_Tank";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet WW2";
_classes pushBack 		"Land_WW2_CamoNet_NATO_Var1";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet 1";
_classes pushBack 		"Land_CamoNet_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet 2";
_classes pushBack 		"Land_CamoNet_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet Var 1";
_classes pushBack 		"Land_CamoNetVar_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNet Var 2";
_classes pushBack 		"Land_CamoNetVar_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNetB 1";
_classes pushBack 		"Land_CamoNetB_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"CamoNetB 2";
_classes pushBack 		"Land_CamoNetB_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"Jump Target";
_classes pushBack 		"Land_JumpTarget_F";
_prices pushBack 		100;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";

_headers pushBack 		"Posed";
_classes pushBack 		"Land_Posed";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";

_headers pushBack 		"Posed (Winter)";
_classes pushBack 		"Land_WW2_Posed_w";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";

_headers pushBack 		"Guard Tower";
_classes pushBack 		"Land_GuardTower_01_F";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";

_headers pushBack 		"Wooden Ramp";
_classes pushBack 		"Land_WoodenRamp";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";

//******************************BASE DEFENSE 2******************************

_headers pushBack 		"NetFence 8m";
_classes pushBack 		"Land_Net_Fence_8m_F";
_prices pushBack 		800;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"NetFence 4m";
_classes pushBack 		"Land_Net_Fence_4m_F";
_prices pushBack 		400;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"NetFence Gate";
_classes pushBack 		"Land_Net_Fence_Gate_F";
_prices pushBack 		1000;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"NetFence 3m";
_classes pushBack 		"Land_NetFence_03_m_3m_F";
_prices pushBack 		300;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"NetFence 9m";
_classes pushBack 		"Land_NetFence_03_m_9m_F";
_prices pushBack 		900;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"WiredFence 5m";
_classes pushBack 		"Land_New_WiredFence_5m_F";
_prices pushBack 		500;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

_headers pushBack 		"WiredFence 10m";
_classes pushBack 		"Land_New_WiredFence_10m_F";
_prices pushBack 		1000;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";

//******************************BASE DEFENSE 3******************************

_headers pushBack 		"Small Infantry Trench";
_classes pushBack 		"Land_WW2_Small_Infantry_Trench1";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Foxhole";
_classes pushBack 		"Land_WW2_Foxhole";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Single";
_classes pushBack 		"Land_WW2_Trench_Single";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench76";
_classes pushBack 		"Land_WW2_Trench76";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"MG Low";
_classes pushBack 		"Land_WW2_Trench_MG_Low";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"MG";
_classes pushBack 		"Land_WW2_TrenchMG";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Mortar";
_classes pushBack 		"Land_WW2_Trench_Mortar";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Big Infantry Trench";
_classes pushBack 		"Land_WW2_Big_Infantry_Trench";
_prices pushBack 		20000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"TrenchTank";
_classes pushBack 		"Land_WW2_TrenchTank";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench1";
_classes pushBack 		"Land_I44_Buildings_Trench1";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench2";
_classes pushBack 		"Land_I44_Buildings_Trench2";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Tob";
_classes pushBack 		"Land_I44_Tob";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Pontoon Apparel1";
_classes pushBack 		"Land_WW2_Ponton_Apparel1";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Pontoon Bridge";
_classes pushBack 		"Land_WW2_Ponton_Bridge";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bag Trench";
_classes pushBack 		"Land_WW2_SWU_Bag_Trench";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bag Trench Block";
_classes pushBack 		"Land_WW2_SWU_Bag_Trench_Block";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"GB corner_inward";
_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_corner_inward";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"GB corner outward";
_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_corner_outward";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"GB floor";
_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_floor";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"GB long";
_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_long";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"GB short";
_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_short";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bunker FFP";
_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bunker FFP Doors";
_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_Doors";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Corner 90";
_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_90";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Corner X1";
_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X1";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Corner X2";
_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X2";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bunker Big";
_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Bunker Big Doors";
_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_Doors";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench Long X3";
_classes pushBack 		"Land_WW2_Fortification_Trench_Long_X3";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench Wall";
_classes pushBack 		"Land_WW2_Fortification_Trench_Wall";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

_headers pushBack 		"Trench Wide";
_classes pushBack 		"Land_WW2_Fortification_Trench_Wide";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Trenches";

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_headers pushBack 		"Small Infantry Trench";
	_classes pushBack 		"Land_WW2_Small_Infantry_Trench1_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench76";
	_classes pushBack 		"Land_WW2_Trench76_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"MG Low";
	_classes pushBack 		"Land_WW2_Trench_MG_Low_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"MG";
	_classes pushBack 		"Land_WW2_TrenchMG_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Mortar";
	_classes pushBack 		"Land_WW2_Trench_Mortar_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Big Infantry Trench";
	_classes pushBack 		"Land_WW2_Big_Infantry_Trench_w";
	_prices pushBack 		20000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"TrenchTank";
	_classes pushBack 		"Land_WW2_TrenchTank_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Bunker FFP";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Bunker FFP Doors";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_Doors_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Corner 90";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_90_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Corner X1";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X1_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Corner X2";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X2_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Bunker Big";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Bunker Big Doors";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_Doors_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench Long X3";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Long_X3_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench Wall";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Wall_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench Wide";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Wide_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench Bridge";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bridge_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench1";
	_classes pushBack 		"Land_I44_Buildings_Trench1_W";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Trench2";
	_classes pushBack 		"Land_I44_Buildings_Trench2_W";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Ponton Apparel1";
	_classes pushBack 		"Land_WW2_Ponton_Apparel1_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"Ponton Bridge";
	_classes pushBack 		"Land_WW2_Ponton_Bridge_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Winter)";
	
	_headers pushBack 		"snowman";
	_classes pushBack 		"snowman";
	_prices pushBack 		20;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
};

if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_headers pushBack 		"Trench Corner";
	_classes pushBack 		"Land_WW2_SWU_Trench_Corner_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench End";
	_classes pushBack 		"Land_WW2_SWU_Trench_End_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench Long";
	_classes pushBack 		"Land_WW2_SWU_Trench_Long_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench Short";
	_classes pushBack 		"Land_WW2_SWU_Trench_Short_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench TJunction";
	_classes pushBack 		"Land_WW2_SWU_Trench_TJunction_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Corrugated Roof";
	_classes pushBack 		"Land_WW2_SWU_Corrugated_Roof_Desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Mound Large";
	_classes pushBack 		"Land_WW2_SWU_Desert_Mound_Large";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Bag Trench2";
	_classes pushBack 		"Land_WW2_SWU_Bag_Trench2";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench corner";
	_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_corner";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench exit";
	_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_exit";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench gunposition";
	_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_gunposition";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench straight";
	_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_straight";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trench junction";
	_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_junction";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trenches Straight";
	_classes pushBack 		"Land_I44_Buildings_CT_Straight";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trenches Straight Side";
	_classes pushBack 		"Land_I44_Buildings_CT_Straight_Side";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
	
	_headers pushBack 		"Trenches Straight Wire";
	_classes pushBack 		"Land_I44_Buildings_CT_Straight_Wire";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches (Desert)";
};

//******************************BASE DEFENSE 4******************************

_headers pushBack 		"Concretewall 1";
_classes pushBack 		"zed";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";

_headers pushBack 		"Concretewall 2";
_classes pushBack 		"zed2";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";

_headers pushBack 		"Concretewall 3";
_classes pushBack 		"zed3";
_prices pushBack 		4000;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_headers pushBack 		"Concretewall (Winter)";
	_classes pushBack 		"Land_WW2_Zed_Civil_w";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Concretewall";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_headers pushBack 		"Concretewall (desert)";
	_classes pushBack 		"zed_desert";
	_prices pushBack 		4000;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Concretewall";
};

//------------------------------------mines---------------------------------------------

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"AP Mine Shumine";
	_classes pushBack 		"LIB_shumine_42_MINE";
	_prices pushBack 		round 150*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AP Mine SMI 35";
	_classes pushBack 		"LIB_SMI_35_MINE";
	_prices pushBack 		round 50*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AP Mine SMI 35 1";
	_classes pushBack 		"LIB_SMI_35_1_MINE";
	_prices pushBack 		round 50*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AP Mine STMI";
	_classes pushBack 		"LIB_STMI_MINE";
	_prices pushBack 		round 50*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AT Mine TMI 42";
	_classes pushBack 		"LIB_TMI_42_MINE";
	_prices pushBack 		round 500*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AT Mine TM44";
	_classes pushBack 		"LIB_TM44_MINE";
	_prices pushBack 		round 500*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
} else {
	_headers pushBack 		"AP Mine PMD6";
	_classes pushBack 		"LIB_PMD6_MINE";
	_prices pushBack 		round 150*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AP Mine M3";
	_classes pushBack 		"LIB_M3_MINE";
	_prices pushBack 		round 50*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AP Mine US M3";
	_classes pushBack 		"LIB_US_M3_MINE";
	_prices pushBack 		round 50*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
	
	_headers pushBack 		"AT Mine US M1A1";
	_classes pushBack 		"LIB_US_M1A1_ATMINE";
	_prices pushBack 		round 500*((CTI_ECONOMY_PRIZE_WEAPONS*CTI_ECONOMY_LEVEL_MULTI)/10000);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Mines";
};


[_side, _headers, _classes, _prices, _placements, _categories] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";