_side = _this;
_sid = "";
_tag = "";

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
if !(("SPE_FFI_Fighter") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles
if(CTI_SPE_DLC >= 1) then {
	missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1SPE_FFI_TeamLeader", _sid]];
	missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1SPE_FFI_Fighter", _sid]];
	missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1SPE_FFI_Militia", _sid]];
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1SPE_FFI_Fighter", _sid]];

	missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1SPE_FFI_TeamLeader", _sid]];
	missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1SPE_FFI_Militia", _sid]];
	missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1SPE_FFI_Fighter", _sid]];
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		INFANTRY = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Militia_Shotgun", _sid],1],[format["%1SPE_FFI_Militia", _sid],1],[format["%1SPE_FFI_Saboteur", _sid],1],[format["%1SPE_FFI_Fighter_Garand", _sid],1]];
		INFANTRY_MG = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Fighter_MP40", _sid],1],[format["%1SPE_FFI_Fighter_Sten", _sid],1],[format["%1SPE_FFI_Sapper_Mle208", _sid],1],[format["%1SPE_FFI_Fighter_M3", _sid],1]];
		INFANTRY_AT = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Saboteur_M3A1", _sid],1],[format["%1SPE_FFI_Saboteur_M3A1", _sid],1]];
	};
	case 2: {
		INFANTRY = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Militia_Shotgun", _sid],1],[format["%1SPE_FFI_Militia", _sid],1],[format["%1SPE_FFI_Sniper", _sid],1],[format["%1SPE_FFI_Fighter_Garand", _sid],1]];
		INFANTRY_MG = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Fighter_MP40", _sid],1],[format["%1SPE_FFI_Autorifleman", _sid],1],[format["%1SPE_FFI_MGunner", _sid],1],[format["%1SPE_FFI_Fighter_M3", _sid],1]];
		INFANTRY_AT = [[format["%1SPE_FFI_TeamLeader", _sid],1],[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Tankhunter", _sid],1],[format["%1SPE_FFI_Tankhunter", _sid],1],[format["%1SPE_FFI_Saboteur_M3A1", _sid],1]];
	};
	default {
		INFANTRY = [[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1],[format["%1SPE_FFI_Militia_Shotgun", _sid],1],[format["%1SPE_FFI_Militia", _sid],1],[format["%1SPE_FFI_Saboteur", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1]];
		INFANTRY_MG = [[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Sapper", _sid],1],[format["%1SPE_FFI_Sapper_Mle208", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1]];
		INFANTRY_AT = [[format["%1SPE_FFI_Doctor", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Grenadier", _sid],1],[format["%1SPE_FFI_Fighter", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1SPE_FFI_OpelBlitz", _sid],1]];
		WHEELED_HEAVY = [[format["%1SPE_FFI_OpelBlitz_Ambulance", _sid],1]];
	};
	default {
		WHEELED_LIGHT = [[format["%1SPE_FFI_OpelBlitz_Ambulance", _sid],1]];
		WHEELED_HEAVY = [[format["%1SPE_FFI_SdKfz250_1", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

//TRACKED_LIGHT = INFANTRY_AT;
//TRACKED_MEDIUM = WHEELED_HEAVY;
//TRACKED_HEAVY = WHEELED_HEAVY;

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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

//AIR_FIGHTER = INFANTRY_MG;
//AIR_BOMBER = INFANTRY;

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];

//ANTI_AIR = INFANTRY_MG;

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI_SPE.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
