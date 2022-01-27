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
inf_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1LIB_UK_Rifleman", _sid], 1, 60]];
	inf_to_add pushBack [format["%1LIB_UK_Medic", _sid], 1, 20];
	inf_to_add pushBack [format["%1LIB_UK_Engineer", _sid], 1, 30];
	inf_to_add pushBack [format["%1LIB_UK_Grenadier", _sid], 1, 30];
	inf_to_add pushBack [format["%1LIB_UK_Grenadier_Jerkins", _sid], 1, 20];
	inf_to_add pushBack [format["%1LIB_UK_Rifleman_Jerkins", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [[format["%1LIB_UK_Rifleman_w", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1LIB_UK_Medic_w", _sid], 1, 20];
		inf_to_add pushBack [format["%1LIB_UK_Engineer_w", _sid], 1, 30];
		inf_to_add pushBack [format["%1LIB_UK_Grenadier_w", _sid], 1, 30];
		inf_to_add pushBack [format["%1LIB_UK_Radioman_w", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1LIB_UK_DR_Rifleman", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1LIB_UK_DR_Medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1LIB_UK_DR_Engineer", _sid], 1, 30];
		inf_to_add pushBack [format["%1LIB_UK_DR_Grenadier", _sid], 1, 30];
		inf_to_add pushBack [format["%1LIB_UK_DR_Radioman", _sid], 1, 10];
	};
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1LIB_UK_LanceCorporal", _sid], 1, 30]];
	inf_to_add pushBack [format["%1LIB_UK_Corporal", _sid], 1, 20];
	inf_to_add pushBack [format["%1LIB_UK_AT_Soldier", _sid], 1, 40];
	inf_to_add pushBack [format["%1LIB_UK_Sergeant", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [[format["%1LIB_UK_LanceCorporal_w", _sid], 1, 30]];	
		inf_to_add pushBack [format["%1LIB_UK_Corporal_w", _sid], 1, 20];
		inf_to_add pushBack [format["%1LIB_UK_AT_Soldier_w", _sid], 1, 40];
		inf_to_add pushBack [format["%1LIB_UK_Sergeant_w", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1LIB_UK_DR_LanceCorporal", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1LIB_UK_DR_Corporal", _sid], 1, 20];
		inf_to_add pushBack [format["%1LIB_UK_DR_AT_Soldier", _sid], 1, 40];
		inf_to_add pushBack [format["%1LIB_UK_DR_Sergeant", _sid], 1, 10];
	};
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1LIB_UK_Sniper", _sid], 1, 10]];
	inf_to_add pushBack [format["%1LIB_UK_Officer", _sid], 1, 5];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [[format["%1LIB_UK_Sniper_w", _sid], 1, 10]];	
		inf_to_add pushBack [format["%1LIB_UK_Officer_w", _sid], 1, 5];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1LIB_UK_DR_Sniper", _sid], 1, 1]];	
		inf_to_add pushBack [format["%1LIB_UK_DR_Officer", _sid], 1, 5];
	};
	units_infantry append inf_to_add;
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
mot_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20]];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20]];		
	};
	units_wheeled = mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 40]];	
	};
	units_wheeled = mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1LIB_UK_M3_Halftrack", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_M3_Halftrack", _sid], 1, 60]];
	};
	units_wheeled append mot_to_add;
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
arm_to_add = [];
if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add = [[format["%1LIB_M3A3_Stuart_UK", _sid], 1, 40]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				arm_to_add = [[format["%1LIB_M3A3_Stuart_UK_W", _sid], 1, 40]];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				arm_to_add = [[format["%1LIB_M3A3_Stuart_DR", _sid], 1, 40]];
			};
		};
		units_tracked append arm_to_add;
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add = [[format["%1LIB_M5A1_Stuart_UK", _sid], 1, 40]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				arm_to_add = [[format["%1LIB_M5A1_Stuart_UK_W", _sid], 1, 40]];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				arm_to_add = [[format["%1LIB_M5A1_Stuart_DR", _sid], 1, 40]];
			};
		};
		units_tracked append arm_to_add;
	};
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1LIB_UniversalCarrier", _sid], 1, 10]];	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1LIB_UniversalCarrier_w", _sid], 1, 10]];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1LIB_UniversalCarrier_desert", _sid], 1, 10]];
	};
	units_tracked = arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1LIB_Churchill_Mk7_AVRE", _sid], 1, 30]];
	arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer", _sid], 1, 30];
	arm_to_add pushBack [format["%1LIB_Churchill_Mk7", _sid], 1, 30];
	arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile", _sid], 1, 30];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1LIB_Churchill_Mk7_AVRE_w", _sid], 1, 30]];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer_w", _sid], 1, 30];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_w", _sid], 1, 30];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile_w", _sid], 1, 30];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1LIB_Churchill_Mk7_AVRE_desert", _sid], 1, 30]];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer_desert", _sid], 1, 30];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_desert", _sid], 1, 30];
		arm_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid], 1, 30];
	};
	units_tracked = arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1LIB_Cromwell_Mk4", _sid], 1, 40]];
	if(CTI_IFA3_NEW > 0) then {
		arm_to_add pushBack [format["%1LIB_Cromwell_Mk6", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1LIB_Cromwell_Mk4_w", _sid], 1, 40]];
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add pushBack [format["%1LIB_Cromwell_Mk6_w", _sid], 1, 40];
		};
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1LIB_Cromwell_Mk4", _sid], 1, 40]];
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add pushBack [format["%1LIB_Cromwell_Mk6", _sid], 1, 40];
		};
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		arm_to_add = [[format["%1LIB_Sherman_I", _sid], 1, 40]];
		arm_to_add pushBack [format["%1LIB_Sherman_IB", _sid], 1, 40];
	} else {
		arm_to_add = [[format["%1LIB_UK_Italy_M4A3_75", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add = [[format["%1LIB_Sherman_I_w", _sid], 1, 40]];
			arm_to_add pushBack [format["%1LIB_Sherman_IB_w", _sid], 1, 40];
		};
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1LIB_UK_DR_M4A3_75", _sid], 1, 40]];
		if(CTI_IFA3_NEW > 0) then {
		};
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		arm_to_add = [[format["%1LIB_IC_Firefly", _sid], 1, 60]];
	} else {
		arm_to_add = [[format["%1LIB_M4A4_FIREFLY", _sid], 1, 60]];
	};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		if(CTI_IFA3_NEW > 0) then {
			arm_to_add = [[format["%1LIB_IC_Firefly_w", _sid], 1, 60]];
		};
	};
	units_tracked append arm_to_add;
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	units_antiair = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 30]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_antiair = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 30]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_antiair = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 30]];
	};
};

if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;
	_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		units_antiair pushBack [format["%1LIB_UK_M16_Halftrack", _sid], 1, 50];
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
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1LIB_RAF_P39", _sid], 1, 60]];
	_level = _level + 1;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_UK.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";