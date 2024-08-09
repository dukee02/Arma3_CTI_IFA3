_side = _this;
_sid = "";
_level = -1;

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
if !(("SPE_US_Rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

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
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["Armored", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//***************************************************************************************************************************************
//														Infantry Troops																	*
//***************************************************************************************************************************************
//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];
infantry_auto = [];
kind_infantry = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1SPE_US_Rangers_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1SPE_US_Rangers_medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1SPE_US_Rangers_radioman", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_grenadier", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_Flamethrower_Operator", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_Rifleman_AmmoBearer", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_engineer_bangalore", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		inf_to_add = [[format["%1SPE_US_Rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1SPE_US_Medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1SPE_US_Radioman", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Driver", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Flamethrower_Operator", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Grenadier", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rifleman_AmmoBearer", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Sentry", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Sentry_Carbine", _sid], 1, 20];
	};

	units_infantry append inf_to_add;
	infantry_auto append inf_to_add;
};

_v pushBack "InfantryT0";
_t pushBack "Infantry T0";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT0";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1SPE_US_Rangers_Autorifleman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1SPE_US_Rangers_Assist_Autorifleman", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_AT_soldier", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		inf_to_add = [[format["%1SPE_US_Autorifleman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1SPE_US_Assist_Autorifleman", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_AT_Soldier", _sid], 1, 20];
	};

	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {infantry_auto append inf_to_add;};
};

_v pushBack "InfantryT1";
_t pushBack "Infantry T1";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT1";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1SPE_US_Rangers_sniper", _sid], 1, 20]];
		inf_to_add pushBack [format["%1SPE_US_Rangers_AHMGunner", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Rangers_HMGunner", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		inf_to_add = [[format["%1SPE_US_AHMGunner", _sid], 1, 20]];
		inf_to_add pushBack [format["%1SPE_US_HMGunner", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_HMG_AmmoBearer", _sid], 1, 20];
		inf_to_add pushBack [format["%1SPE_US_Sniper", _sid], 1, 20];
	};

	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {infantry_auto append inf_to_add;};
};

_v pushBack "InfantryT2";
_t pushBack "Infantry T2";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT2";

_v pushBack "Infantry";
_t pushBack "Infantry (Auto)";
_p pushBack infantry_auto;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "Infantry";

_v pushBack "InfantryAll";
_t pushBack "Infantry T0-Max";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryAll";

//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];
wheeled_auto = [];
kind_wheeled = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1SPE_US_G503_MB_M1919", _sid], 1, 10]];
	mot_to_add pushBack [format["%1SPE_US_G503_MB_M2", _sid], 1, 20];
	
	units_wheeled = mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack "MotorizedT0";
_t pushBack "G503";
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedT0";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1SPE_US_M3_Halftrack", _sid], 1, 60]];	
	mot_to_add pushBack [format["%1SPE_US_M3_Halftrack_Ambulance", _sid], 1, 20];
	mot_to_add pushBack [format["%1SPE_US_G503_MB_M1919_Armoured", _sid], 1, 20];
	mot_to_add pushBack [format["%1SPE_US_G503_MB_M2_Armoured", _sid], 1, 20];
	units_wheeled = [];
	wheeled_auto = [];
	units_wheeled append mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack "MotorizedT1";
_t pushBack "M3 Halftrack";
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedT1";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1SPE_M20_AUC", _sid], 1, 60]];
	units_wheeled = [];
	wheeled_auto = [];
	units_wheeled append mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack "MotorizedT1";
_t pushBack "M20";
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedT1";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1SPE_M8_LAC", _sid], 1, 60]];	
	mot_to_add pushBack [format["%1SPE_M8_LAC_ringMount", _sid], 1, 20];
	units_wheeled = [];
	wheeled_auto = [];
	units_wheeled append mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack "MotorizedT1";
_t pushBack "M8";
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedT1";

_v pushBack "Motorized";
_t pushBack "Motorized (Auto)";
_p pushBack wheeled_auto;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "Motorized";

_v pushBack "MotorizedAll";
_t pushBack "Motorized T0-Max";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedAll";


//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
tracked_auto = [];
kind_tracked = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1SPE_M4A0_75_Early", _sid], 1, 20]];
	arm_to_add pushBack [format["%1SPE_M4A0_75", _sid], 1, 30];
	arm_to_add pushBack [format["%1SPE_M4A0_composite", _sid], 1, 30];
	units_tracked = arm_to_add;
	tracked_auto append arm_to_add;
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "M4A0";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1SPE_M10", _sid], 1, 20]];
	arm_to_add pushBack [format["%1SPE_M4A1_75", _sid], 1, 30];
	arm_to_add pushBack [format["%1SPE_M4A1_75_erla", _sid], 1, 30];

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "M10 | M4A1 75";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1SPE_M4A1_T34_Calliope", _sid], 1, 10]];
	arm_to_add pushBack [format["%1SPE_M4A0_105", _sid], 1, 30];

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "Calliope + M4A0 105";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1SPE_M18_Hellcat", _sid], 1, 20]];
	arm_to_add pushBack [format["%1SPE_M4A1_76", _sid], 1, 30];

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "Hellcat | M4A1";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1SPE_M4A3_75", _sid], 1, 20]];
	arm_to_add pushBack [format["%1SPE_M4A3_105", _sid], 1, 30];
	arm_to_add pushBack [format["%1SPE_M4A3_76", _sid], 1, 30];
	arm_to_add pushBack [format["%1SPE_M4A3_T34_Calliope_Direct", _sid], 1, 30];

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "M4A3";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_v pushBack "Armored";
_t pushBack "Tanks (Auto)";
_p pushBack tracked_auto;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "Armored";

_v pushBack "ArmoredAll";
_t pushBack "Tanks T0-Max";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "ArmoredAll";

//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
units_antiair = [];
antiair_to_add = [];
antiair_auto = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	antiair_to_add = [[format["%1SPE_US_M16_Halftrack", _sid], 1]];

	units_antiair append antiair_to_add;
	antiair_auto append antiair_to_add;
};

_v pushBack format["AntiAirT%1", _level];
_t pushBack "Willys M1919";
_p pushBack antiair_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack format["AntiAirT%1", _level];

_v pushBack "AntiAir";
_t pushBack "AntiAir (Auto)";
_p pushBack antiair_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAir";

_v pushBack "AntiAirAll";
_t pushBack "AntiAir T0-Max";
_p pushBack units_antiair;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAirAll";

//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	air_to_add = [[format["%1SPE_P47", _sid], 1, 50]];
	
	units_air append air_to_add;
	air_auto append air_to_add;
};

_v pushBack format["AirT%1", _level];
_t pushBack "P39";
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];

_v pushBack "Air";
_t pushBack "Air (Auto)";
_p pushBack air_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "Air";

_v pushBack "AirAll";
_t pushBack "Air  T0-Max";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "AirAll";

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_US.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

//--- Those are used by the commander to determine the kind of unit an AI team has
if(count kind_infantry > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	} else {
		{
			kind_infantry pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	};
};
if(count kind_wheeled > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	} else {
		{
			kind_wheeled pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	};
};
if(count kind_tracked > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	} else {
		{
			kind_tracked pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	};
};
if(count kind_air > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	} else {
		{
			kind_air pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	};
};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
