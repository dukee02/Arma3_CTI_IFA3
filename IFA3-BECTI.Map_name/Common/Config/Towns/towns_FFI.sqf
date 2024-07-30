_side = _this;
_sid = "VIOC_";
_tag = "";

if(_side == west) then {
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_tag = "EAST_";
	} 
	else {
		_tag = "GUER_";
	};
};
if !(("LIB_FFI_Soldier_1") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles
if(CTI_IFA_ADDON >= 1 && CTI_SPE_DLC <= 1) then {
	missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_FFI_Soldier_1", _sid]];
	missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_FFI_Soldier_3", _sid]];
	missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_FFI_Soldier_5", _sid]];
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_FFI_Soldier_1", _sid]];

	missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_FFI_Soldier_3", _sid]];
	missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_FFI_Soldier_5", _sid]];
	missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_FFI_Soldier_1", _sid]];
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		if(("LIB_FFI_Soldier_1") call CTI_CO_FNC_IsSidePatchLoaded) then {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1FFI_MP_soldier", _sid],1],[format["%1FFI_MP_soldier", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1FFI_AT_soldier", _sid],1],[format["%1LIB_FFI_LAT_Soldier", _sid],1],[format["%1LIB_FFI_LAT_Soldier", _sid],1]];
		};
	};
	case 2: {
		if(("LIB_FFI_Soldier_1") call CTI_CO_FNC_IsSidePatchLoaded) then {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1FFI_sniper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1FFI_MP_soldier", _sid],1],[format["%1FFI_MP_soldier", _sid],1],[format["%1FFI_MG_soldier", _sid],1],[format["%1FFI_MG_soldier", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1FFI_AT_soldier", _sid],1],[format["%1LIB_FFI_LAT_Soldier", _sid],1],[format["%1LIB_FFI_LAT_Soldier", _sid],1],[format["%1FFI_HAT_soldier", _sid],1]];
		};
	};
	default {
		if(("LIB_FFI_Soldier_1") call CTI_CO_FNC_IsSidePatchLoaded) then {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_1", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1LIB_FFI_Soldier_4", _sid],1],[format["%1LIB_FFI_Soldier_5", _sid],1],[format["%1LIB_FFI_Soldier_2", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_FFI_Soldier_1", _sid],1],[format["%1FFI_medic", _sid],1],[format["%1LIB_FFI_Soldier_3", _sid],1],[format["%1FFI_AT_soldier", _sid],1],[format["%1FFI_AT_soldier", _sid],1],[format["%1FFI_AT_soldier", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
