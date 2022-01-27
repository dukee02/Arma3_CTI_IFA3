_side = _this;
_sid = "";
_tag = "";
_level = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {		//Winter camo active
			INFANTRY = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Radioman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Engineer_w", _sid],1],[format["%1LIB_UK_Engineer_w", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Radioman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1]];
		};
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Radioman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Engineer", _sid],1],[format["%1LIB_UK_DR_Engineer", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Radioman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Engineer", _sid],1],[format["%1LIB_UK_Engineer", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1]];
		};
	};
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {		//Winter camo active
			INFANTRY = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Corporal_w", _sid],1],[format["%1LIB_UK_Corporal_w", _sid],1],[format["%1LIB_UK_LanceCorporal_w", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1],[format["%1LIB_UK_AT_Soldier_w", _sid],1],[format["%1LIB_UK_AT_Soldier_w", _sid],1],[format["%1LIB_UK_AT_Soldier_w", _sid],1]];
		};
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Corporal", _sid],1],[format["%1LIB_UK_DR_Corporal", _sid],1],[format["%1LIB_UK_DR_LanceCorporal", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1],[format["%1LIB_UK_DR_AT_Soldier", _sid],1],[format["%1LIB_UK_DR_AT_Soldier", _sid],1],[format["%1LIB_UK_DR_AT_Soldier", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Corporal", _sid],1],[format["%1LIB_UK_Corporal", _sid],1],[format["%1LIB_UK_LanceCorporal", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid],1]];
		};
		case 2: {
			WHEELED_LIGHT = [[format["%1LIB_UK_DR_Willys_MB", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_DR_Willys_MB", _sid],1]];
		};
		default {
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_Hood", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_Hood", _sid],1]];
		};
	};
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid],1],[format["%1LIB_UK_Willys_MB_M1919_w", _sid],1]];
		};
		case 2: {
			WHEELED_LIGHT = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid],1],[format["%1LIB_UK_DR_Willys_MB_M1919", _sid],1]];
		};
		default {
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_M1919", _sid],1],[format["%1LIB_UK_Willys_MB_M1919", _sid],1]];
		};
	};
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid],1],[format["%1LIB_UK_Willys_MB_M1919_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_M3_Halftrack", _sid],1],[format["%1LIB_UK_M3_Halftrack", _sid],1]];
		};
		case 2: {
			WHEELED_LIGHT = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid],1],[format["%1LIB_UK_DR_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_DR_M3_Halftrack", _sid],1],[format["%1LIB_UK_DR_M3_Halftrack", _sid],1]];
		};
		default {
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_M1919", _sid],1],[format["%1LIB_UK_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_M3_Halftrack", _sid],1],[format["%1LIB_UK_M3_Halftrack", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {//Winter camo active
			TRACKED_LIGHT = [[format["%1LIB_UniversalCarrier_w", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_UniversalCarrier_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_UniversalCarrier_w", _sid],1]];
		};
		case 2: {
			TRACKED_LIGHT = [[format["%1LIB_UniversalCarrier_desert", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_UniversalCarrier_desert", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_UniversalCarrier_desert", _sid],1]];
		};
		default {
			TRACKED_LIGHT = [[format["%1LIB_UniversalCarrier", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_UniversalCarrier", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_UniversalCarrier", _sid],1]];
		};
	};
};
if(CTI_IFA3_NEW > 0) then {
	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 1: {//Winter camo active
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1]];
			};
			case 2: {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_DR", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M3A3_Stuart_DR", _sid],1]];
			};
			default {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_UK", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M3A3_Stuart_UK", _sid],1]];
			};
		};
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 1: {//Winter camo active
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M5A1_Stuart_UK_W", _sid],1]];
			};
			case 2: {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_DR", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M5A1_Stuart_DR", _sid],1]];
			};
			default {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart_UK", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_M5A1_Stuart_UK", _sid],1]];
			};
		};
	};	
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {//Winter camo active
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1],[format["%1LIB_M5A1_Stuart_UK_W", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_w", _sid],1]];
			};
			TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_w", _sid],1],[format["%1LIB_Churchill_Mk7_Howitzer_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_Churchill_Mk7_w", _sid],1]];
		};
		case 2: {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1],[format["%1LIB_M5A1_Stuart_DR", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid],1]];
			};
			TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_desert", _sid],1],[format["%1LIB_Churchill_Mk7_Howitzer_desert", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_Churchill_Mk7_desert", _sid],1]];
		};
		default {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1],[format["%1LIB_M5A1_Stuart_UK", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile", _sid],1]];
			};
			TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE", _sid],1],[format["%1LIB_Churchill_Mk7_Howitzer", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_Churchill_Mk7", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {//Winter camo active
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1],[format["%1LIB_M5A1_Stuart_UK_W", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk4_w", _sid],1],[format["%1LIB_Cromwell_Mk6_w", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_w", _sid],1],[format["%1LIB_Cromwell_Mk4_w", _sid],1]];
			};
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_Churchill_Mk7_w", _sid],1]];
		};
		case 2: {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1],[format["%1LIB_M5A1_Stuart_DR", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_desert", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
			};
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_Churchill_Mk7_desert", _sid],1]];
		};
		default {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1],[format["%1LIB_M5A1_Stuart_UK", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
			};
			TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_Churchill_Mk7", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {//Winter camo active
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1],[format["%1LIB_M5A1_Stuart_UK_W", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk4_w", _sid],1],[format["%1LIB_Cromwell_Mk6_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_Sherman_I_w", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_w", _sid],1],[format["%1LIB_Cromwell_Mk4_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_UK_Italy_M4A3_75", _sid],1]];
			};
		};
		case 2: {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1],[format["%1LIB_M5A1_Stuart_DR", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_Sherman_I", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_desert", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_UK_DR_M4A3_75", _sid],1]];
			};
		};
		default {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1],[format["%1LIB_M5A1_Stuart_UK", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_Sherman_I", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_UK_Italy_M4A3_75", _sid],1]];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {//Winter camo active
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK_W", _sid],1],[format["%1LIB_M5A1_Stuart_UK_W", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk4_w", _sid],1],[format["%1LIB_Cromwell_Mk6_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_Sherman_I_w", _sid],1],[format["%1LIB_IC_Firefly_w", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_w", _sid],1],[format["%1LIB_Cromwell_Mk4_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_w", _sid],1],[format["%1LIB_UK_Italy_M4A3_75", _sid],1],[format["%1LIB_M4A4_FIREFLY", _sid],1]];
			};
		};
		case 2: {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_DR", _sid],1],[format["%1LIB_M5A1_Stuart_DR", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_Sherman_I", _sid],1],[format["%1LIB_IC_Firefly", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE_desert", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7_desert", _sid],1],[format["%1LIB_UK_DR_M4A3_75", _sid],1],[format["%1LIB_M4A4_FIREFLY", _sid],1]];
			};
		};
		default {
			if(CTI_IFA3_NEW > 0) then {
				TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart_UK", _sid],1],[format["%1LIB_M5A1_Stuart_UK", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Cromwell_Mk6", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_Sherman_I", _sid],1],[format["%1LIB_IC_Firefly", _sid],1]];
			} else {
				TRACKED_LIGHT = [[format["%1LIB_Churchill_Mk7_Crocodile", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_Churchill_Mk7_AVRE", _sid],1],[format["%1LIB_Cromwell_Mk4", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_Churchill_Mk7", _sid],1],[format["%1LIB_UK_Italy_M4A3_75", _sid],1],[format["%1LIB_M4A4_FIREFLY", _sid],1]];
			};
		};
	};
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1LIB_RAF_P39", _sid],1]];
	AIR_BOMBER = [[format["%1LIB_RAF_P39", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 30]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		ANTI_AIR = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 30]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		ANTI_AIR = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 30]];
	};
};

if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		ANTI_AIR pushBack [format["%1LIB_UK_M16_Halftrack", _sid],1];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UK.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};