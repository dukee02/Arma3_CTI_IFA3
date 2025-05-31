_side = _this;
_sid = "";
_tag = "";
_ntag = "_G_";

if(_side == west) then {
	_tag = "WEST_";_ntag = "_B_";
} 
else {
	if(_side == east) then {
		_tag = "EAST_";_ntag = "_O_";
	} 
	else {
		_tag = "GUER_";
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles
if(CTI_IFA_ADDON >= 1 && CTI_SPE_DLC <= 1) then {
	missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
	missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
	missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];

	missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
	missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
	missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag]];
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

INFANTRY pushBack [format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Crawler_LIB_GER", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Crawler_LIB_SOV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Crawler_LIB_US", _sid, _ntag],1];

INFANTRY pushBack [format["%1Zombie%2Shambler_LIB_CIV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Shambler_LIB_GER", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Shambler_LIB_SOV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Shambler_LIB_US", _sid, _ntag],1];

INFANTRY pushBack [format["%1Zombie%2Walker_LIB_CIV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Walker_LIB_GER", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Walker_LIB_SOV", _sid, _ntag],1];
INFANTRY pushBack [format["%1Zombie%2Walker_LIB_US", _sid, _ntag],1];

INFANTRY_MG pushBack [format["%1Zombie%2RA_LIB_CIV", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RA_LIB_GER", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RA_LIB_SOV", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RA_LIB_US", _sid, _ntag],1];

INFANTRY_MG pushBack [format["%1Zombie%2RC_LIB_CIV", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RC_LIB_GER", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RC_LIB_SOV", _sid, _ntag],1];
INFANTRY_MG pushBack [format["%1Zombie%2RC_LIB_US", _sid, _ntag],1];

switch (_side) do {
	case west: {
		INFANTRY_AT pushBack [format["%1WBK_SpecialZombie_Corrupted_2", _sid],1];
	};
	case east: {
		INFANTRY_AT pushBack [format["%1WBK_SpecialZombie_Corrupted_3", _sid],1];
	};
	default {
		INFANTRY_AT pushBack [format["%1WBK_SpecialZombie_Corrupted_1", _sid],1];
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

switch (_side) do {
	case west: {
		WHEELED_LIGHT pushBack [format["%1Zombie_Special_BLUFOR_Leaper_1", _sid],1];
		WHEELED_HEAVY pushBack [format["%1Zombie_Special_BLUFOR_Leaper_2", _sid],1];
	};
	case east: {
		WHEELED_LIGHT pushBack [format["%1Zombie_Special_OPFOR_Leaper_1", _sid],1];
		WHEELED_HEAVY pushBack [format["%1Zombie_Special_OPFOR_Leaper_2", _sid],1];
	};
	default {
		WHEELED_LIGHT pushBack [format["%1Zombie_Special_GREENFOR_Leaper_1", _sid],1];
		WHEELED_HEAVY pushBack [format["%1Zombie_Special_GREENFOR_Leaper_2", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

TRACKED_LIGHT = INFANTRY_AT;
switch (_side) do {
	case west: {
		TRACKED_MEDIUM pushBack [format["%1Zombie_Special_BLUFOR_Boomer", _sid],1];
		TRACKED_HEAVY pushBack [format["%1Zombie_Special_BLUFOR_Screamer", _sid],1];
	};
	case east: {
		TRACKED_MEDIUM pushBack [format["%1Zombie_Special_OPFOR_Boomer", _sid],1];
		TRACKED_HEAVY pushBack [format["%1Zombie_Special_OPFOR_Screamer", _sid],1];
	};
	default {
		TRACKED_MEDIUM pushBack [format["%1Zombie_Special_GREENFOR_Boomer", _sid],1];
		TRACKED_HEAVY pushBack [format["%1Zombie_Special_GREENFOR_Screamer", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (_side) do {
	case west: {
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_2", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_2", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_2", _sid],1];

		AIR_BOMBER pushBack [format["%1WBK_SpecialZombie_Smasher_Hellbeast_2", _sid],1];
		AIR_BOMBER pushBack [format["%1WBK_Goliaph_1", _sid],1];
	};
	case east: {
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_3", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_3", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_3", _sid],1];

		AIR_BOMBER pushBack [format["%1WBK_SpecialZombie_Smasher_Hellbeast_3", _sid],1];
		AIR_BOMBER pushBack [format["%1WBK_Goliaph_3", _sid],1];
	};
	default {
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_1", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_1", _sid],1];
		AIR_FIGHTER pushBack [format["%1WBK_SpecialZombie_Smasher_Acid_1", _sid],1];

		AIR_BOMBER pushBack [format["%1WBK_SpecialZombie_Smasher_Hellbeast_1", _sid],1];
		AIR_BOMBER pushBack [format["%1WBK_Goliaph_2", _sid],1];
	};
};

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

ANTI_AIR = INFANTRY_AT;
if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FFI.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
