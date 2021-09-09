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

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["ArmoredMBT", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 

//Infantry setup for the AI groups
units_infantry = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	units_to_add = [[format["%1LIB_SOV_rifleman", _sid], 1, 60]];
	units_to_add pushBack [format["%1LIB_SOV_medic", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_SOV_AT_grenadier", _sid], 1, 30];
	units_to_add pushBack [format["%1LIB_SOV_grenadier", _sid], 1, 30];
	units_to_add pushBack [format["%1LIB_SOV_assault_smgunner", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_SOV_sapper", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_SOV_LAT_Soldier", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_SOV_Rifleman_w", _sid], 1, 60]];	
		units_to_add pushBack [format["%1LIB_SOV_Medic_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_SOV_Smgunner_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_SOV_grenadier_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_SOV_AT_grenadier_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_SOV_LAT_Soldier_w", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1LIB_SOV_LC_rifleman", _sid], 1, 60]];	
		units_to_add pushBack [format["%1LIB_SOV_medic", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_SOV_AT_grenadier", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_SOV_grenadier", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_SOV_smgunner", _sid], 1, 10];
		units_to_add pushBack [format["%1LIB_SOV_LAT_Soldier", _sid], 1, 20];
	};
	units_infantry append units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	units_to_add = [[format["%1LIB_SOV_staff_sergeant", _sid], 1, 30]];
	units_to_add pushBack [format["%1LIB_SOV_smgunner_summer", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_SOV_AT_M1A1_soldier", _sid], 1, 40];
	units_to_add pushBack [format["%1LIB_SOV_sergeant", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_SOV_Mgunner_w", _sid], 1, 30]];	
		units_to_add pushBack [format["%1LIB_SOV_Assault_mgunner_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_SOV_AT_M1A1_soldier_w", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_SOV_P_officer_w", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1LIB_SOV_staff_sergeant", _sid], 1, 60]];	
		units_to_add pushBack [format["%1LIB_SOV_mgunner", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_SOV_AT_M1A1_soldier", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_SOV_sergeant", _sid], 1, 10];
	};
	units_infantry append units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	units_to_add = [[format["%1LIB_SOV_scout_sniper", _sid], 1, 10]];
	units_to_add pushBack [format["%1LIB_SOV_p_officer", _sid], 1, 5];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_SOV_Scout_sniper_w", _sid], 1, 10]];	
		units_to_add pushBack [format["%1LIB_SOV_Lieutenant_w", _sid], 1, 5];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1LIB_SOV_scout_sniper_spring", _sid], 1, 1]];	
		units_to_add pushBack [format["%1LIB_SOV_lieutenant", _sid], 1, 5];
	};
	units_infantry append units_to_add;
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];


//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [[format["%1LIB_GazM1_SOV", _sid], 1, 10]];	
	units_wheeled = units_to_add;
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_to_add = [[format["%1LIB_SOV_M3_Halftrack", _sid], 1, 40]];
	units_to_add pushBack [format["%1LIB_Scout_M3", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_SOV_M3_Halftrack_w", _sid], 1, 40]];
		units_to_add pushBack [format["%1LIB_Scout_m3_w", _sid], 1, 40];
	};
	units_wheeled = units_to_add;
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	units_to_add = [[format["%1LIB_SdKfz251_captured_FFV", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_SdKfz251_captured_FFV_w", _sid], 1, 40]];
	};
	units_wheeled append units_to_add;
};
//Level 4
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	units_wheeled pushBack [format["%1LIB_US6_BM13", _sid], 1, 20];
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];


//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	units_tracked = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		units_to_add = [[format["%LIB_UniversalCarrier_SOV", _sid], 1, 10]];
		units_tracked = units_to_add;
	};
	_level = _level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [[format["%1LIB_T34_76", _sid], 1, 40]];
	if(CTI_IFA3_NEW > 0) then {
		units_to_add pushBack [format["%1LIB_M3A3_Stuart_SOV", _sid], 1, 30];
	};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_T34_76_w", _sid], 1, 40]];
		if(CTI_IFA3_NEW > 0) then {
			units_to_add pushBack [format["%1LIB_M3A3_Stuart_SOV_w", _sid], 1, 30];
		};
	};
	units_tracked = units_to_add;
	_level = _level + 1;
};
//Level 2
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [[format["%1LIB_SU85", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_M4A2_SOV_w", _sid], 1, 30]];
		units_to_add pushBack [format["%1LIB_SU85_w", _sid], 1, 40];
	};
	units_tracked append units_to_add;
	_level = _level + 1;
};
//Level 3
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [[format["%1LIB_T34_85", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_T34_85_w", _sid], 1, 40]];
	};
	units_to_add pushBack [format["%1LIB_M4A2_SOV", _sid], 1, 30];
	units_tracked append units_to_add;
	_level = _level + 1;
};
//Level 4
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [[format["%1LIB_JS2_43", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_JS2_43_w", _sid], 1, 60]];
	};
	units_tracked append units_to_add;
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];


//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_antiair = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_antiair = [[format["%1LIB_Zis5v_61K", _sid], 1, 30]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_antiair pushBack [format["%1LIB_SOV_M16_Halftrack", _sid], 1, 40];
	};
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];


//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	units_air = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack [format["%1LIB_Pe2_2_w", _sid], 1, 40];
	//	_c pushBack [format["%1LIB_Pe2_w", _sid], 1, 40];
	//};
	units_air = [[format["%1LIB_Pe2", _sid], 1, 50]];
	_level = _level + 2;
};
//Level 3
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_to_add = [[format["%1LIB_P39", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_P39_w", _sid], 1, 60]];
	};
	units_air append units_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";