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
if !(("LIB_US_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles if nation on IND side
if(_tag == "GUER_") then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_Rifleman_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_Driver_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_US_Pilot", _sid]];
		};
		case 2: {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_NAC_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_NAC_driver", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_US_Pilot", _sid]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_driver", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_US_Pilot", _sid]];
		};
	};
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {		//Winter camo active
			INFANTRY = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Radioman_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Engineer_w", _sid],1],[format["%1LIB_US_Grenadier_w", _sid],1],[format["%1LIB_US_Grenadier_w", _sid],1],[format["%1LIB_US_Grenadier_w", _sid],1]];
		};
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_radioman", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_engineer", _sid],1],[format["%1LIB_US_NAC_grenadier", _sid],1],[format["%1LIB_US_NAC_grenadier", _sid],1],[format["%1LIB_US_NAC_grenadier", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_radioman", _sid],1],[format["%1LIB_US_smgunner", _sid],1],[format["%1LIB_US_smgunner", _sid],1],[format["%1LIB_US_smgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_engineer", _sid],1],[format["%1LIB_US_grenadier", _sid],1],[format["%1LIB_US_grenadier", _sid],1],[format["%1LIB_US_grenadier", _sid],1]];
		};
	};
};
_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {		//Winter camo active
			INFANTRY = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Radioman_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1],[format["%1LIB_US_Mgunner_w", _sid],1],[format["%1LIB_US_Mgunner_w", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Engineer_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1]];
		};
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_radioman", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1],[format["%1LIB_US_NAC_mgunner", _sid],1],[format["%1LIB_US_NAC_mgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_engineer", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_radioman", _sid],1],[format["%1LIB_US_smgunner", _sid],1],[format["%1LIB_US_mgunner", _sid],1],[format["%1LIB_US_mgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_engineer", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_Hood_w", _sid],1],[format["%1LIB_US_Willys_MB_Hood_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_Hood_w", _sid],1],[format["%1LIB_US_Willys_MB_Hood_w", _sid],1]];
		};
		case 2: {
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_Hood", _sid],1],[format["%1LIB_US_NAC_Willys_MB_Hood", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_Hood", _sid],1],[format["%1LIB_US_NAC_Willys_MB_Hood", _sid],1]];
		};
		default {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_Hood", _sid],1],[format["%1LIB_US_Willys_MB_Hood", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_Hood", _sid],1],[format["%1LIB_US_Willys_MB_Hood", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919_w", _sid],1],[format["%1LIB_US_Willys_MB_M1919_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919_w", _sid],1],[format["%1LIB_US_Willys_MB_M1919_w", _sid],1]];
		};
		case 2: {
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1],[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1],[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1]];
		};
		default {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919_w", _sid],1],[format["%1LIB_US_Willys_MB_M1919_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_Scout_m3_w", _sid],1],[format["%1LIB_US_Scout_m3_w", _sid],1]];
		};
		case 2: {
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1],[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Scout_M3", _sid],1],[format["%1LIB_US_NAC_Scout_M3", _sid],1]];
		};
		default {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_Scout_M3", _sid],1],[format["%1LIB_US_Scout_M3", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919_w", _sid],1],[format["%1LIB_US_Scout_m3_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_M3_Halftrack_w", _sid],1],[format["%1LIB_US_M3_Halftrack_w", _sid],1]];
		};
		case 2: {
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Willys_MB_M1919", _sid],1],[format["%1LIB_US_NAC_Scout_M3", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_M3_Halftrack", _sid],1],[format["%1LIB_US_NAC_M3_Halftrack", _sid],1]];
		};
		default {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Scout_M3", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_M3_Halftrack", _sid],1],[format["%1LIB_US_M3_Halftrack", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_US_Scout_m3_w", _sid],1],[format["%1LIB_US_M3_Halftrack_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_M8_Greyhound", _sid],1],[format["%1LIB_M8_Greyhound", _sid],1]];
		};
		case 2: {//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_US_NAC_Scout_M3", _sid],1],[format["%1LIB_US_NAC_M3_Halftrack", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_M8_Greyhound", _sid],1],[format["%1LIB_M8_Greyhound", _sid],1]];
		};
		default {
			WHEELED_LIGHT = [[format["%1LIB_US_Scout_M3", _sid],1],[format["%1LIB_US_M3_Halftrack", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_M8_Greyhound", _sid],1],[format["%1LIB_M8_Greyhound", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	TRACKED_HEAVY = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
};

_matrix_cnt = [_matrix_cnt+ 1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
	TRACKED_HEAVY = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
};

_matrix_cnt = [_matrix_cnt+ 1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
	TRACKED_HEAVY = [[format["%1LIB_M4A3_75", _sid],1],[format["%1LIB_M4A3_75", _sid],1]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		TRACKED_HEAVY = [[format["%1LIB_M4A3_75_w", _sid],1],[format["%1LIB_M4A3_75_w", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		TRACKED_HEAVY = [[format["%1LIB_US_NAC_M4A3_75", _sid],1],[format["%1LIB_US_NAC_M4A3_75", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt+ 1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
	TRACKED_HEAVY = [[format["%1LIB_M4A3_76", _sid],1],[format["%1LIB_M4A3_76_HVSS", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
	AIR_BOMBER = [[format["%1LIB_US_P39_2", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
	AIR_BOMBER = [[format["%1LIB_P47", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};