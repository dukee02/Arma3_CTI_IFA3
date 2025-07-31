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
if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

_nation = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
switch (_nation select 0) do {
	case CTI_GER_ID: {
		switch (_nation select 1) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_OpelBlitz_Parm_w", _sid]];};		//Winter camo
					case 2: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_DAK_OpelBlitz_Parm", _sid]];};		//Desert camo
					default {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_OpelBlitz_Parm", _sid]];};		//default/woodland camo
				};
			};
			case CTI_SPE_ID: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1SPE_OpelBlitz_Repair", _sid]]};
			default { };
		};
	};
	case CTI_SOV_ID: {
		switch (_nation select 1) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_Zis6_parm_w", _sid]];};		//Winter camo
					default {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_Zis6_Parm", _sid]];};		//default/woodland camo
				};
			};
			//case CTI_SPE_ID: {};
			default { };
		};
	};
	case CTI_UK_ID: {
		switch (_nation select 1) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_US_GMC_Parm_w", _sid]];};		//Winter camo
					default {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_US_GMC_Tent", _sid]];};		//default/woodland camo
				};
			};
			//case CTI_SPE_ID: {};
			default { };
		};
	};
	case CTI_US_ID: {
		switch (_nation select 1) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_US_GMC_Parm_w", _sid]];};		//Winter camo
					default {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1LIB_US_GMC_Tent", _sid]];};		//default/woodland camo
				};
			};
			case CTI_SPE_ID: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1SPE_US_M3_Halftrack_Repair", _sid]]};
			default { };
		};
	};
	case CTI_FR_ID: {
		switch (_nation select 1) do {
			case CTI_SPE_ID: {missionNamespace setVariable [format["CTI_%1_HQ", _side], format["%1SPE_FR_M3_Halftrack_Repair", _sid]]};
			default { };
		};
	};
	default { };
};

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: Common\Config\Base\Base.sqf", format ["Set HQ Vehicle [%1] for side [%2]", missionNamespace getVariable format["CTI_%1_HQ", _side], _side]] call CTI_CO_FNC_Log };

missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 0, [-23,33]],
	[CTI_LIGHT, 0, [23,33]],
	[CTI_CONTROLCENTER, 180, [30,-40]],
	[CTI_HEAVY, 180, [-30,-40]],
	[CTI_AIR, 0, [-60,37]],
	[CTI_REPAIR, 0, [60,37]],
	[CTI_AMMO, 0, [80,37]]
]];

missionNamespace setVariable [format["CTI_%1_Defense_Template", _side], [
	[CTI_HEAVY, "AA", 270, 20],
	[CTI_AMMO, "AA", 90, 30],
	[CTI_AIR, "AA", 90, 30],
	[CTI_LIGHT, "AT", 90, 20],
	[CTI_BARRACKS, "Defense", 90, 20],
	[CTI_CONTROLCENTER, "Defense", 270, 20],
	[CTI_REPAIR, "Defense", 90, 20]
]];

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
_specials = _specials		+ [[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]]];*/

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
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack		[CTI_BARRACKS, "Barracks", "Barracks"];
if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBBarracks")) then {
	_classes pushBack		["CDF_WarfareBBarracks", "Land_Scaffolding_New_F"];
} else {
	_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];					//Altis Military Buildings
};
_prices pushBack		2000;
_times pushBack			60;
_placements pushBack 	[90, 35];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_headers pushBack		[CTI_LIGHT, "Light Vehicle Factory", "Light"];
	if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBLightFactory")) then {
		_classes pushBack		["CDF_WarfareBLightFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];				//Altis Military Buildings
	};
	_prices pushBack 		4000;
	_times pushBack 		80;
	_placements pushBack 	[90, 30];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

_headers pushBack 		[CTI_CONTROLCENTER, "Control Center", "CC"];
if (isClass(configFile >> "CfgVehicles" >> "GUE_WarfareBUAVterminal")) then {
	_classes pushBack 		["GUE_WarfareBUAVterminal", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F"];					//Altis Military Buildings
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];


if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_headers pushBack 		[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBHeavyFactory")) then {
		_classes pushBack 		["RU_WarfareBHeavyFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"];				//Altis Military Buildings
	};
	_prices pushBack 		6000;
	_times pushBack 		120;
	_placements pushBack 	[90, 25];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_headers pushBack 		[CTI_AIR, "Aircraft Factory", "Air"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBAircraftFactory")) then {
		_classes pushBack 		["RU_WarfareBAircraftFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];			//Altis Military Buildings
	};
	_prices pushBack 		8000;
	_times pushBack 		140;
	_placements pushBack 	[90, 40];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]]; 
};

_headers pushBack 		[CTI_AMMO, "Ammo Depot", "Ammo"];
if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBVehicleServicePoint")) then {
	_classes pushBack 		["RU_WarfareBVehicleServicePoint", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack		["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"];				//Altis Military Buildings
};
_prices pushBack 		2000;
_times pushBack 		90;
_placements pushBack 	[0, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack 		[CTI_REPAIR, "Repair Depot", "Repair"];
if (isClass(configFile >> "CfgVehicles" >> "TK_GUE_WarfareBContructionSite_Base_EP1")) then {
	_classes pushBack 		["TK_GUE_WarfareBContructionSite_Base_EP1", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack 		["Land_Cargo_House_V3_F", "Land_Cargo_House_V3_ruins_F"];				//Altis Military Buildings
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[0, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_headers pushBack 		[CTI_NAVAL, "Naval Yard", "Naval"];
	_classes pushBack 		["Land_Cargo_House_V2_F", "Land_Cargo_House_V2_ruins_F"];			//Altis Military Buildings
	_prices pushBack 		3000;
	_times pushBack 		80;
	_placements pushBack 	[0, 60];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

[_side, _headers, _classes, _prices, _times, _placements, _helper, _specials] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Structures.sqf";

//--- Defenses
_headers = [];
_classes = [];
_prices = [];
_placements = [];  
_categories = [];
_tiers = [];

//FOB
_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
if (isClass(configFile >> "CfgVehicles" >> "INS_WarfareBFieldhHospital")) then {
	_classes pushBack 			"INS_WarfareBFieldhHospital";
} else {
	_classes pushBack 			"Land_Medevac_house_V1_F";										//Altis Military Buildings
};
_prices pushBack 			([CTI_ECONOMY_PRIZE_WHEELED,1,true,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_placements pushBack 		[0, 15];
_categories pushBack 		"All";
_tiers pushBack 			1;

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels_east") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

// ****************************** BASE GUN DEFENSE 0 ******************************
_tech_level = 0;

_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;

//Defense Guns
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {	
		if !(("SPE_GER_SearchLight") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] SearchLight";
		_classes pushBack 		format["%1SPE_GER_SearchLight", _sid];
		_prices pushBack 		200;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] MG34";
		_classes pushBack 		format["%1SPE_MG34_Lafette_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] MG34 low";
		_classes pushBack 		format["%1SPE_MG34_Lafette_low_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] MG34 Bipod";
		_classes pushBack 		format["%1SPE_MG34_Bipod", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
				
		_headers pushBack 		"[SPE] MG34 Trench";
		_classes pushBack 		format["%1SPE_MG34_Lafette_Trench_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] GrWr34";
		_classes pushBack format["%1SPE_GrW278_1", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] GrWr34 grau";
		_classes pushBack 		format["%1LIB_GrWr34_g", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};

	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_GER_SearchLight") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] SearchLight";
		_classes pushBack format["%1LIB_GER_SearchLight", _sid];
		_prices pushBack 		200;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] MG34";
		_classes pushBack format["%1LIB_MG34_Lafette_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] MG34 low";
		_classes pushBack format["%1LIB_MG34_Lafette_low_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] GrWr34";
		_classes pushBack format["%1LIB_GrWr34", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_Maxim_M30_base") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] Maxim base";
		_classes pushBack 		format["%1LIB_Maxim_M30_base", _sid];
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] Maxim Trench";
		_classes pushBack 		format["%1LIB_Maxim_M30_Trench", _sid];
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] SearchLight";
		_classes pushBack 		format["%1LIB_SU_SearchLight", _sid];
		_prices pushBack 		200;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] BM37";
		_classes pushBack 		format["%1LIB_BM37", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};

if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_M1919_M2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M1919 M2 MG";
		_classes pushBack 		format["%1SPE_M1919_M2", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] M1 81 (Mortar)";
		_classes pushBack 		format["%1SPE_M1_81", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] M1919 M2 MG Trench";
		_classes pushBack 		format["%1SPE_M1919_M2_Trench_Deployed", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] M1919A6 MG";
		_classes pushBack 		format["%1SPE_M1919A6_Bipod", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_M1919_M2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] M1919 M2 MG";
		_classes pushBack 		format["%1LIB_M1919_M2", _sid];
		_prices pushBack 		500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] M2 60 (Mortar)";
		_classes pushBack 		format["%1LIB_M2_60", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};	
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID && CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_M2_60") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] M2 60 (Mortar)";
		_classes pushBack 		format["%1LIB_M2_60", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_FR_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_FR_M1919_M2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M1919 M2 MG";
		_classes pushBack 		format["%1SPE_FR_M1919_M2", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] M1919 M2 MG Trench";
		_classes pushBack 		format["%1SPE_FR_M1919_M2_Trench_Deployed", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] M1919A6 MG";
		_classes pushBack 		format["%1SPE_FR_M1919A6_Bipod", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] MLE 27 31 (Mortar)";
		_classes pushBack 		format["%SPE_MLE_27_31", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};
//******************************BASE GUN DEFENSE 1******************************
_tech_level = 1;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_FM24_M24_Bipod") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] FM24 MG";
		_classes pushBack 		format["%1SPE_FM24_M24_Bipod", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] leFH18";
		_classes pushBack 		format["%1SPE_leFH18", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] leFH18 AT";
		_classes pushBack 		format["%1SPE_leFH18_AT", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] FlaK 30";
		_classes pushBack 		format["%1SPE_FlaK_30", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};

	if(CTI_IFA_ADDON >= 1) then {
	if !(("LIB_FlaK_30") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_headers pushBack 		"[IFA] FlaK 30 (winter)";
			_classes pushBack 		format["%1LIB_FlaK_30_w", _sid];
			_prices pushBack 		2000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
		
		_headers pushBack 		"[IFA] FlaK 30";
		_classes pushBack 		format["%1LIB_FlaK_30", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[IFA] leFH18";
		_classes pushBack 		format["%1LIB_leFH18", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] leFH18 AT";
		_classes pushBack 		format["%1LIB_leFH18_AT", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_M2_M3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M2 M3 MG";
		_classes pushBack 		format["%1SPE_M2_M3", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] M2 M3 MG (Trench)";
		_classes pushBack 		format["%1SPE_M2_M3_Trench", _sid];
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] AT 57mm M1";
		_classes pushBack 		format["%1SPE_57mm_M1", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_FR_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_FR_57mm_M1") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] AT 57mm M1";
		_classes pushBack 		format["%1SPE_FR_57mm_M1", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
//ballance copat for missing AA and Arty in ths Tier (only RUS/GER has AA and only GER has Arty)
if(CTI_GER_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	if !(("LIB_61k") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
	if(CTI_IFA_ADDON > 0) then {
		_headers pushBack 		"[IFA] 61k (AA)";
		_classes pushBack 		format["%1LIB_61k", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
		//for balance the statics
		_headers pushBack 		"[IFA] leFH18 (captured)";
		_classes pushBack 		format["%1LIB_leFH18", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] leFH18 AT (captured)";
		_classes pushBack 		format["%1LIB_leFH18_AT", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_FM24_M24_Bipod") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] leFH18";
		_classes pushBack 		format["%1SPE_leFH18", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] FlaK 30";
		_classes pushBack 		format["%1SPE_FlaK_30", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};
//******************************BASE GUN DEFENSE 2******************************
_tech_level = 2;
_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;


if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_FlaK_36") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_headers pushBack 		"[IFA] FlaK 36 (winter)";
			_classes pushBack 		format["%1LIB_FlaK_36_w", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] FlaK 36 AA (winter)";
			_classes pushBack 		format["%1LIB_FlaK_36_AA_w", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] FlaK 36 ARTY (winter)";
			_classes pushBack 		format["%1LIB_FlaK_36_ARTY_w", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] FlaK 38 (winter)";
			_classes pushBack 		format["%1LIB_FlaK_38_w", _sid];
			_prices pushBack 		3000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] Nebelwerfer 41";
			_classes pushBack 		format["%1LIB_Nebelwerfer41", _sid];
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_headers pushBack 		"[IFA] FlaK 36 (Desert)";
			_classes pushBack 		format["%1LIB_DAK_FlaK_36", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] FlaK 36 AA (Desert)";
			_classes pushBack 		format["%1LIB_DAK_FlaK_36_AA", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[IFA] FlaK 36 ARTY (Desert)";
			_classes pushBack 		format["%1LIB_DAK_FlaK_36_ARTY", _sid];
			_prices pushBack 		4000;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[IFA] Nebelwerfer 41 bg";
			_classes pushBack 		format["%1LIB_Nebelwerfer41_Gelbbraun", _sid];
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
		};

		_headers pushBack 		"[IFA] FlaK 36 ARTY";
		_classes pushBack 		format["%1LIB_FlaK_36_ARTY", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] FlaK 36";
		_classes pushBack 		format["%1LIB_FlaK_36", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] FlaK 36 AA";
		_classes pushBack 		format["%1LIB_FlaK_36_AA", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[IFA] MG42";
		_classes pushBack 		format["%1LIB_MG42_Lafette_Deployed", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] MG42 low";
		_classes pushBack 		format["%1LIB_MG42_Lafette_low_Deployed", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[IFA] FlaK 38";
		_classes pushBack 		format["%1LIB_FlaK_38", _sid];
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[IFA] Nebelwerfer 41 Camo";
		_classes pushBack 		format["%1LIB_Nebelwerfer41_Camo", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};

	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_FlaK_36") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] FlaK 36";
		_classes pushBack 		format["%1SPE_FlaK_36", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] FlaK 36 AA";
		_classes pushBack 		format["%1SPE_FlaK_36_AA", _sid];
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] MG42";
		_classes pushBack 		format["%1SPE_MG42_Lafette_Deployed", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] MG42 low";
		_classes pushBack 		format["%1SPE_MG42_Lafette_low_Deployed", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SPE] FlaK 38";
		_classes pushBack 		format["%1SPE_FlaK_38", _sid];
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SPE] MG42 low";
		_classes pushBack 		format["%SPE_MG42_Bipod", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SPE] MG42 low";
		_classes pushBack 		format["%SPE_MG42_Lafette_trench_Deployed", _sid];
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_SPE_DLC >= 1) then {
	if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		if !(("SPE_105mm_M3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] 105mm M3 (AT)";
		_classes pushBack 		format["%1SPE_105mm_M3_Direct", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SPE] 105mm M3 (Arty)";
		_classes pushBack 		format["%1SPE_105mm_M3", _sid];
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};
//******************************BASE GUN DEFENSE 3******************************
_tech_level = 3;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		if !(("LIB_Pak40") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_headers pushBack 		"[IFA] Pak 40 (Winter)";
			_classes pushBack 		format["%1LIB_Pak40_w", _sid];
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[IFA] Flak 38 Vierling (Winter)";
			_classes pushBack 		format["%1LIB_Flakvierling_38_w", _sid];
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_headers pushBack 		"[IFA] Pak 40 (Desert)";
			_classes pushBack 		format["%1LIB_DAK_Pak40", _sid];
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
		};

		_headers pushBack 		"[IFA] Pak 40";
		_classes pushBack 		format["%1LIB_Pak40", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[IFA] Flak 38 Vierling";
		_classes pushBack 		format["%1LIB_Flakvierling_38", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_Pak40") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] Pak 40";
		_classes pushBack 		format["%1SPE_Pak40", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_M45_Quadmount") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M45 Quadmount (AA)";
		_classes pushBack 		format["%1SPE_M45_Quadmount", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON > 0) then {
		if !(("LIB_Zis3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_headers pushBack 		"[IFA] Zis3 (Winter)";
			_classes pushBack 		format["%1LIB_Zis3_w", _sid];
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
		};
		_headers pushBack 		"[IFA] Zis3";
		_classes pushBack 		format["%1LIB_Zis3", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
if(CTI_FR_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		if !(("SPE_M45_Quadmount") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M45 Quadmount (AA)";
		_classes pushBack 		format["%1SPE_FR_M45_Quadmount", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
};
//Heavy AT compat, GER has PAK 40 and SOV has Zis3 others hasn't anyting
if(CTI_GER_SIDE != (_side) call CTI_CO_FNC_GetSideID || CTI_SOV_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON > 0) then {
		if !(("LIB_Zis3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] Zis3";
		_classes pushBack 		format["%1LIB_Zis3", _sid];
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
};
//Heavy AA compat, GER has Flak 38 Vierling and in SPE we have the M45 Quadmount for US and FR
if(CTI_GER_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1 && CTI_FR_SIDE != (_side) call CTI_CO_FNC_GetSideID && CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
		if !(("SPE_M45_Quadmount") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[SPE] M45 Quadmount (AA)";
		_classes pushBack 		format["%1SPE_M45_Quadmount", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_IFA_ADDON > 0 && CTI_SPE_DLC < 1) then {
		if !(("LIB_Flakvierling_38") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";} else {_sid = _sid_base;};
		_headers pushBack 		"[IFA] Flak 38 Vierling (captured)";
		_classes pushBack 		format["%1LIB_Flakvierling_38", _sid];
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};

//******************************Ammoboxes*******************************************************************************************************
_tech_level = 0;

_priceCrateS = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,1] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceCrateM = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceCrateL = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,6] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceCrateMine = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;

if(CTI_IFA_ADDON >= 1 && CTI_IFA_NEW <= 1) then {
	if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_headers pushBack 		"81mm Ammo HE";
		_classes pushBack 		"LIB_Box_81mm_Mo_HE";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"81mm Ammo Smoke";
		_classes pushBack 		"LIB_1rnd_81mmHE_GRWR34";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Small Ammo Box 1";
		_classes pushBack 		"LIB_AmmoCrate_Mortar_GER";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Small Ammo Box 2";
		_classes pushBack 		"LIB_AmmoCrate_Arty_GER";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"AT Box";
		_classes pushBack 		"LIB_4Rnd_RPzB";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Mines";
		_classes pushBack 		"LIB_Mine_Ammo_Box_Ger";
		_prices pushBack 		_priceCrateMine;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Weapons 1";
		_classes pushBack 		"LIB_BasicWeaponsBox_GER";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Weapons 2";
		_classes pushBack 		"LIB_WeaponsBox_Big_GER";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Large Ammo";
		_classes pushBack 		"LIB_BasicAmmunitionBox_GER";
		_prices pushBack 		_priceCrateL;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_headers pushBack 		"82mm Smoke";
		_classes pushBack 		"LIB_Box_82mm_Mo_Smoke";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Small Ammo";
		_classes pushBack 		"LIB_AmmoCrate_Mortar_SU";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Small Ammo 2";
		_classes pushBack 		"LIB_AmmoCrate_Arty_SU";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Basic Ammo Box";
		_classes pushBack 		"LIB_BasicAmmunitionBox_SU";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Mines";
		_classes pushBack 		"LIB_Mine_Ammo_Box_Su";
		_prices pushBack 		_priceCrateMine;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Ammo Box 1";
		_classes pushBack 		"LIB_BasicWeaponsBox_SU";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Ammo Box 2";
		_classes pushBack 		"LIB_WeaponsBox_Big_SU";
		_prices pushBack 		_priceCrateL;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Ammo Box 3";
		_classes pushBack 		"LIB_Lone_Big_Box";
		_prices pushBack 		_priceCrateL;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_headers pushBack 		"60mm Ammo HE";
		_classes pushBack 		"LIB_Box_60mm_Mo_HE";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"60mm Ammo Smoke";
		_classes pushBack 		"LIB_Box_60mm_Mo_Smoke";
		_prices pushBack 		_priceCrateS;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Mines";
		_classes pushBack 		"LIB_Mine_AmmoBox_US";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Weapons";
		_classes pushBack 		"LIB_BasicAmmunitionBox_US";
		_prices pushBack 		_priceCrateM;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"Large Ammo";
		_classes pushBack 		"LIB_BasicWeaponsBox_US";
		_prices pushBack 		_priceCrateL;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Ammo";
		_tiers pushBack 		_tech_level;
	};
	//if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//};
};

//******************************BASE DEFENSE 0*******************************************************************************************************
_tech_level = 0;

_priceBagFence = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;

_headers pushBack 		"Bagfence Bunker";
_classes pushBack 		"Land_Fort_Bagfence_Bunker";
_prices pushBack 		_priceBagFence*2;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"BagFence Corner";
_classes pushBack 		"Land_BagFence_Corner_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"BagFence End";
_classes pushBack 		"Land_BagFence_End_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"BagFence Long";
_classes pushBack 		"Land_BagFence_Long_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"BagFence Round";
_classes pushBack 		"Land_BagFence_Round_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"BagFence Short";
_classes pushBack 		"Land_BagFence_Short_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Bagfence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Razorwire";
_classes pushBack 		"Land_Razorwire_F";
_prices pushBack 		_priceBagFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"Barbwire";
_tiers pushBack 		_tech_level;

if(CTI_IFA_ADDON >= 1 && CTI_IFA_NEW <= 1) then {
	_headers pushBack 		"Warning Sign- Mines";
	_classes pushBack 		"Land_Sign_Mines_F";
	_prices pushBack 		round(_priceBagFence*0.2);
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Barbedwire 1";
	_classes pushBack 		"Land_I44_Buildings_Barbedwire";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Barbedwire 2";
	_classes pushBack 		"Land_I44_Buildings_Barbedwire2";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bwire 1";
	_classes pushBack 		"WW2_BET_Bwire_2";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bwire 2";
	_classes pushBack 		"WW2_BET_Bwire_4";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Wire_Bruno";
	_classes pushBack 		"Land_WW2_Wire_Bruno";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Wire";
	_classes pushBack 		"Land_WW2_Wire_2";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Barbwire";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"bagfence round";
	_classes pushBack 		"Land_WW2_BET_Sandsack_Kreis";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"bagfence long";
	_classes pushBack 		"Land_WW2_BET_Sandsack_Lang";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"bagfence long 2";
	_classes pushBack 		"Land_fort_bagfence_long";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"bagfence corner";
	_classes pushBack 		"Land_fort_bagfence_corner";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"bagfence round 2";
	_classes pushBack 		"Land_fort_bagfence_round";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Strelecky post";
	_classes pushBack 		"Land_strelecky_post_new";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
};
if(CTI_SPE_DLC >= 1) then {
	_headers pushBack 		"Sandbag Curve";
	_classes pushBack 		"Land_SPE_Sandbag_Curve";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Gun Hole";
	_classes pushBack 		"Land_SPE_Sandbag_Gun_Hole";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Long";
	_classes pushBack 		"Land_SPE_Sandbag_Long";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Long Line";
	_classes pushBack 		"Land_SPE_Sandbag_Long_Line";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Long Thick";
	_classes pushBack 		"Land_SPE_Sandbag_Long_Thick";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Nest";
	_classes pushBack 		"Land_SPE_Sandbag_Nest";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Short";
	_classes pushBack 		"Land_SPE_Sandbag_Short";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Short Low";
	_classes pushBack 		"Land_SPE_Sandbag_Short_Low";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Sandbag Single";
	_classes pushBack 		"Land_SPE_Sandbag_Single";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		"TrenchLogWall 01 4m v3";
	_classes pushBack 		"Land_SPE_Wood_TrenchLogWall_01_4m_v3";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Wood";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"TrenchLogWall 01 4m v2";
	_classes pushBack 		"Land_SPE_Wood_TrenchLogWall_01_4m_v2";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Wood";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"TrenchLogWall 01 4m v1";
	_classes pushBack 		"Land_SPE_Wood_TrenchLogWall_01_4m_v1";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Wood";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		"BarbedWire 01";
	_classes pushBack 		"Land_SPE_BarbedWire_01";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"BarbedWire 02";
	_classes pushBack 		"Land_SPE_BarbedWire_02";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"BarbedWire 03";
	_classes pushBack 		"Land_SPE_BarbedWire_03";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"BarbedWire 04";
	_classes pushBack 		"Land_SPE_BarbedWire_04";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"BarbedWire Posts";
	_classes pushBack 		"Land_SPE_BarbedWire_Posts";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"BarbedWire End";
	_classes pushBack 		"Land_SPE_BarbedWire_End";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"BarbedWire";
	_tiers pushBack 		_tech_level;
};

//******************************BASE DEFENSE 1******************************
_tech_level = 1;

_priceMisc = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceDirt = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceFortification = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,2] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_pricebunkers  = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;

_headers pushBack 		"Dirthump 1";
_classes pushBack 		"Land_Dirthump01";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirthump 2";
_classes pushBack 		"Land_Dirthump01_EP1";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirthump 3";
_classes pushBack 		"Land_Dirthump02_EP1";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirthump 4";
_classes pushBack 		"Land_Dirthump02";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirthump 5";
_classes pushBack 		"Land_Dirthump03";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirthump 6";
_classes pushBack 		"Land_Dirthump03_EP1";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Dirtmount";
_classes pushBack 		"Dirtmount_EP1";
_prices pushBack 		_priceDirt;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Envelope Big";
_classes pushBack 		"Fort_EnvelopeBig";
_prices pushBack 		_priceFortification;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Envelope Small";
_classes pushBack 		"Fort_EnvelopeSmall";
_prices pushBack 		_priceFortification;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Artillery Nest";
_classes pushBack 		"Land_fort_artillery_nest";
_prices pushBack 		_priceFortification;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Fort Rampart";
_classes pushBack 		"Land_fort_rampart";
_prices pushBack 		_priceFortification;
_placements pushBack 	[0, 15];
_categories pushBack 	"Dirt";
_tiers pushBack 		_tech_level;

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	_headers pushBack 		"Fort Rampart (Winter)";
	_classes pushBack 		"WW2_JNS_Fort_Rampart_EP1";
	_prices pushBack 		_priceFortification;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Dirt";
	_tiers pushBack 		_tech_level;
};
/*
_headers pushBack 		"Setka Car";
_classes pushBack 		"Land_Setka_Car";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Setka Dor";
_classes pushBack 		"Land_WW2_Setka_Dor";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Setka Vert";
_classes pushBack 		"Land_WW2_Setka_Vert";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet Tank";
_classes pushBack 		"Land_WW2_CamoNet_Tank";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet WW2";
_classes pushBack 		"Land_WW2_CamoNet_NATO_Var1";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet 1";
_classes pushBack 		"Land_CamoNet_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet 2";
_classes pushBack 		"Land_CamoNet_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet Var 1";
_classes pushBack 		"Land_CamoNetVar_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNet Var 2";
_classes pushBack 		"Land_CamoNetVar_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNetB 1";
_classes pushBack 		"Land_CamoNetB_EAST";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"CamoNetB 2";
_classes pushBack 		"Land_CamoNetB_NATO";
_prices pushBack 		300;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;
*/

_headers pushBack 		"Jump Target";
_classes pushBack 		"Land_JumpTarget_F";
_prices pushBack 		_priceMisc;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Posed";
_classes pushBack 		"Land_Posed";
_prices pushBack 		_priceMisc;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Posed (Winter)";
_classes pushBack 		"Land_WW2_Posed_w";
_prices pushBack 		_priceMisc;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Guard Tower";
_classes pushBack 		"Land_GuardTower_01_F";
_prices pushBack 		_priceFortification;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Wooden Ramp";
_classes pushBack 		"Land_WoodenRamp";
_prices pushBack 		_priceMisc;
_placements pushBack 	[0, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

if(CTI_SPE_DLC >= 1) then {
	
	_headers pushBack 		"Netting 02";
	_classes pushBack 		"Land_SPE_Netting_02";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Netting";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Netting 01";
	_classes pushBack 		"Land_SPE_Netting_01";
	_prices pushBack 		_priceBagFence;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Netting";
	_tiers pushBack 		_tech_level;
	
	
	_headers pushBack 		"Dugout 3m";
	_classes pushBack 		"Land_SPE_Dugout_3m";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 3m sandbags";
	_classes pushBack 		"Land_SPE_Dugout_3m_sandbags";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m";
	_classes pushBack 		"Land_SPE_Dugout_6m";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m315";
	_classes pushBack 		"Land_SPE_Dugout_6m315";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m315 sandbags";
	_classes pushBack 		"Land_SPE_Dugout_6m315_sandbags";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m45";
	_classes pushBack 		"Land_SPE_Dugout_6m45";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m45 sandbags";
	_classes pushBack 		"Land_SPE_Dugout_6m45_sandbags";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout 6m sandbags";
	_classes pushBack 		"Land_SPE_Dugout_6m_sandbags";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout Cover";
	_classes pushBack 		"Land_SPE_Dugout_Cover";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout Pile 01";
	_classes pushBack 		"Land_SPE_Dugout_Pile_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Dugout Pile 02";
	_classes pushBack 		"Land_SPE_Dugout_Pile_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Dugout";
	_tiers pushBack 		_tech_level;
};

//******************************BASE DEFENSE 2******************************
_tech_level = 2;

_priceFence = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize;

_headers pushBack 		"NetFence 8m";
_classes pushBack 		"Land_Net_Fence_8m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"NetFence 4m";
_classes pushBack 		"Land_Net_Fence_4m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"NetFence Gate";
_classes pushBack 		"Land_Net_Fence_Gate_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"NetFence 3m";
_classes pushBack 		"Land_NetFence_03_m_3m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"NetFence 9m";
_classes pushBack 		"Land_NetFence_03_m_9m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"WiredFence 5m";
_classes pushBack 		"Land_New_WiredFence_5m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

_headers pushBack 		"WiredFence 10m";
_classes pushBack 		"Land_New_WiredFence_10m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[90, 7];
_categories pushBack 	"NetFence";
_tiers pushBack 		_tech_level;

//******************************BASE DEFENSE 3******************************
_tech_level = 3;

_priceMisc = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceTrenche = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,2] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceTrencheL = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;
//_priceGun = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
//_priceAA = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,8] call CTI_CO_FNC_GetCalculatedUnitsPrize;

if(CTI_IFA_ADDON >= 1) then {
	_headers pushBack 		"Small Infantry Trench";
	_classes pushBack 		"Land_WW2_Small_Infantry_Trench1";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Foxhole";
	_classes pushBack 		"Land_WW2_Foxhole";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Single";
	_classes pushBack 		"Land_WW2_Trench_Single";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench76";
	_classes pushBack 		"Land_WW2_Trench76";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"MG Low";
	_classes pushBack 		"Land_WW2_Trench_MG_Low";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"MG";
	_classes pushBack 		"Land_WW2_TrenchMG";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Mortar";
	_classes pushBack 		"Land_WW2_Trench_Mortar";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Big Infantry Trench";
	_classes pushBack 		"Land_WW2_Big_Infantry_Trench";
	_prices pushBack 		_priceTrencheL;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Large Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"TrenchTank";
	_classes pushBack 		"Land_WW2_TrenchTank";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench1";
	_classes pushBack 		"Land_I44_Buildings_Trench1";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench2";
	_classes pushBack 		"Land_I44_Buildings_Trench2";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Tob";
	_classes pushBack 		"Land_I44_Tob";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Pontoon Apparel1";
	_classes pushBack 		"Land_WW2_Ponton_Apparel1";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Pontoon Bridge";
	_classes pushBack 		"Land_WW2_Ponton_Bridge";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bag Trench";
	_classes pushBack 		"Land_WW2_SWU_Bag_Trench";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bag Trench Block";
	_classes pushBack 		"Land_WW2_SWU_Bag_Trench_Block";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"GB corner_inward";
	_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_corner_inward";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"GB corner outward";
	_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_corner_outward";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"GB floor";
	_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_floor";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"GB long";
	_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_long";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"GB short";
	_classes pushBack 		"Land_WW2_LAWZ_Gold_Beach_trench_short";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bunker FFP";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bunker FFP Doors";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_Doors";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Corner 90";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_90";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Corner X1";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X1";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Corner X2";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X2";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bunker Big";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Bunker Big Doors";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_Doors";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench Long X3";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Long_X3";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench Wall";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Wall";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Trench Wide";
	_classes pushBack 		"Land_WW2_Fortification_Trench_Wide";
	_prices pushBack 		_priceTrenche;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Trenches";
	_tiers pushBack 		_tech_level;

	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		_headers pushBack 		"Small Infantry Trench";
		_classes pushBack 		"Land_WW2_Small_Infantry_Trench1_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench76";
		_classes pushBack 		"Land_WW2_Trench76_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"MG Low";
		_classes pushBack 		"Land_WW2_Trench_MG_Low_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"MG";
		_classes pushBack 		"Land_WW2_TrenchMG_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Mortar";
		_classes pushBack 		"Land_WW2_Trench_Mortar_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Big Infantry Trench (Winter)";
		_classes pushBack 		"Land_WW2_Big_Infantry_Trench_w";
		_prices pushBack 		_priceTrencheL;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Large Trenches";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"TrenchTank";
		_classes pushBack 		"Land_WW2_TrenchTank_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Bunker FFP";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Bunker FFP Doors";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_FFP_Doors_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Corner 90";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_90_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Corner X1";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X1_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Corner X2";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Corner_X2_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Bunker Big";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Bunker Big Doors";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Bunker_Big_Doors_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Long X3";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Long_X3_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Wall";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Wall_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Wide";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Wide_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Bridge";
		_classes pushBack 		"Land_WW2_Fortification_Trench_Bridge_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench1";
		_classes pushBack 		"Land_I44_Buildings_Trench1_W";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench2";
		_classes pushBack 		"Land_I44_Buildings_Trench2_W";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Ponton Apparel1";
		_classes pushBack 		"Land_WW2_Ponton_Apparel1_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Ponton Bridge";
		_classes pushBack 		"Land_WW2_Ponton_Bridge_w";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Winter)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"snowman";
		_classes pushBack 		"snowman";
		_prices pushBack 		_priceMisc;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Misc";
		_tiers pushBack 		_tech_level;
	};

	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		_headers pushBack 		"Trench Corner";
		_classes pushBack 		"Land_WW2_SWU_Trench_Corner_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench End";
		_classes pushBack 		"Land_WW2_SWU_Trench_End_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Long";
		_classes pushBack 		"Land_WW2_SWU_Trench_Long_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench Short";
		_classes pushBack 		"Land_WW2_SWU_Trench_Short_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench TJunction";
		_classes pushBack 		"Land_WW2_SWU_Trench_TJunction_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Corrugated Roof";
		_classes pushBack 		"Land_WW2_SWU_Corrugated_Roof_Desert";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Mound Large";
		_classes pushBack 		"Land_WW2_SWU_Desert_Mound_Large";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Bag Trench2";
		_classes pushBack 		"Land_WW2_SWU_Bag_Trench2";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench corner";
		_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_corner";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench exit";
		_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_exit";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench gunposition";
		_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_gunposition";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench straight";
		_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_straight";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trench junction";
		_classes pushBack 		"Land_WW2_LAWZ_Tobruk_Trench_junction";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trenches Straight";
		_classes pushBack 		"Land_I44_Buildings_CT_Straight";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trenches Straight Side";
		_classes pushBack 		"Land_I44_Buildings_CT_Straight_Side";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Trenches Straight Wire";
		_classes pushBack 		"Land_I44_Buildings_CT_Straight_Wire";
		_prices pushBack 		_priceTrenche;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Trenches (Desert)";
		_tiers pushBack 		_tech_level;
	};
};

//******************************BASE DEFENSE 4******************************
_tech_level = 4;

_priceMisc = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceConcrete = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceBunkers = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,2] call CTI_CO_FNC_GetCalculatedUnitsPrize;

_headers pushBack 		"Concretewall 1";
_classes pushBack 		"zed";
_prices pushBack 		_priceConcrete;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Concretewall 2";
_classes pushBack 		"zed2";
_prices pushBack 		_priceConcrete;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Concretewall 3";
_classes pushBack 		"zed3";
_prices pushBack 		_priceConcrete;
_placements pushBack 	[90, 7];
_categories pushBack 	"Concretewall";
_tiers pushBack 		_tech_level;

if(CTI_CAMO_ACTIVATION == 1 && CTI_IFA_ADDON >= 1 && CTI_IFA_NEW <= 1) then {		//Winter camo active
	_headers pushBack 		"Concretewall (Winter)";
	_classes pushBack 		"Land_WW2_Zed_Civil_w";
	_prices pushBack 		_priceConcrete;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Concretewall";
	_tiers pushBack 		_tech_level;
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_headers pushBack 		"Concretewall (desert)";
	_classes pushBack 		"zed_desert";
	_prices pushBack 		_priceConcrete;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Concretewall";
	_tiers pushBack 		_tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};

//------------------------------------mines---------------------------------------------
_tech_level = 0;

_priceAP = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize;
_priceAT = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize;
_priceTNT = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize;

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SPE_DLC >= 1) then {
		_headers pushBack 		"AP Mine Shumine";
		_classes pushBack 		"SPE_shumine_42_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine SMI 35";
		_classes pushBack 		"SPE_SMI_35_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine SMI 35 1";
		_classes pushBack 		"SPE_SMI_35_1_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine SMI 35 Pressure";
		_classes pushBack 		"SPE_SMI_35_Pressure_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine STMI";
		_classes pushBack 		"SPE_STMI_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine Shg24x7 Improvised";
		_classes pushBack 		"SPE_Shg24x7_Improvised_Mine_MINE";
		_prices pushBack 		(_priceAT*0.5);
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine TMI 42";
		_classes pushBack 		"SPE_TMI_42_MINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine TM44";
		_classes pushBack 		"LIB_TM44_MINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;

		
		_headers pushBack 		"TNT Ladung Small";
		_classes pushBack 		"SPE_Ladung_Small_MINE";
		_prices pushBack 		(_priceTNT*0.5);
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"TNT Ladung Big";
		_classes pushBack 		"SPE_Ladung_Big_MINE";
		_prices pushBack 		_priceTNT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_IFA_ADDON >= 1) then {
		_headers pushBack 		"AP Mine Shumine";
		_classes pushBack 		"LIB_shumine_42_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine SMI 35";
		_classes pushBack 		"LIB_SMI_35_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine SMI 35 1";
		_classes pushBack 		"LIB_SMI_35_1_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine STMI";
		_classes pushBack 		"LIB_STMI_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine TMI 42";
		_classes pushBack 		"LIB_TMI_42_MINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine TM44";
		_classes pushBack 		"LIB_TM44_MINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
	};
} else {
	if(CTI_SPE_DLC >= 1) then {	
		_headers pushBack 		"AP Mine M3 Pressure";
		_classes pushBack 		"SPE_US_M3_Pressure_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine M3";
		_classes pushBack 		"SPE_US_M3_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine US M1A1";
		_classes pushBack 		"SPE_US_M1A1_ATMINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"TNT Bangalore";
		_classes pushBack 		"SPE_US_Bangalore";
		_prices pushBack 		(_priceTNT*0.5);
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"TNT half pound";
		_classes pushBack 		"SPE_US_TNT_half_pound";
		_prices pushBack 		(_priceTNT*0.5);
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"TNT 4pound";
		_classes pushBack 		"SPE_US_TNT_4pound";
		_prices pushBack 		_priceTNT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_IFA_ADDON >= 1) then {
		_headers pushBack 		"AP Mine PMD6";
		_classes pushBack 		"LIB_PMD6_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine M3";
		_classes pushBack 		"LIB_M3_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AP Mine US M3";
		_classes pushBack 		"LIB_US_M3_MINE";
		_prices pushBack 		_priceAP;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"AT Mine US M1A1";
		_classes pushBack 		"LIB_US_M1A1_ATMINE";
		_prices pushBack 		_priceAT;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Mine";
		_tiers pushBack 		_tech_level;
	};
};

[_side, _headers, _classes, _prices, _placements, _categories, _tiers] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Base\Base.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
