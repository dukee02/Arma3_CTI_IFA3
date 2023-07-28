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
if !(("LIB_WP_Sierzant") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles
missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_WP_Starszy_strzelec", _sid]];
missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_WP_Strzelec", _sid]];
missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_WP_Strzelec", _sid]];

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		if(CTI_VIO_ADDON > 0) then {
			INFANTRY = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Saper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1WP_AT_soldier", _sid],1],[format["%1WP_HAT_soldier", _sid],1],[format["%1WP_HAT_soldier", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Saper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1]];
		};
	};
	case 2: {
		if(CTI_VIO_ADDON > 0) then {
			INFANTRY = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Sniper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Stggunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1WP_AT_soldier", _sid],1],[format["%1WP_HAT_soldier", _sid],1],[format["%1WP_HAT_soldier2", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Sniper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Mgunner", _sid],1],[format["%1LIB_WP_Stggunner", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Sierzant", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1]];
		};
	};
	default {
		if(CTI_VIO_ADDON > 0) then {
			INFANTRY = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Saper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1WP_AT_soldier", _sid],1],[format["%1WP_AT_soldier", _sid],1],[format["%1WP_AT_soldier", _sid],1]];
		} else {
			INFANTRY = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Saper", _sid],1],[format["%1LIB_WP_Saper", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1],[format["%1LIB_WP_Starszy_saper", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_WP_Starszy_strzelec", _sid],1],[format["%1LIB_WP_Medic", _sid],1],[format["%1LIB_WP_AT_grenadier", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1],[format["%1LIB_WP_LAT_Strzelec", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

/*switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 0;
	case 1;
	case 2;
	case 3;
	case 4;
	case 5: {
		WHEELED_LIGHT = [[format["%1LIB_GazM1_FFI", _sid],1],[format["%1LIB_GazM1_FFI", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_GazM1_FFI_camo", _sid],1],[format["%1LIB_GazM1_FFI_camo", _sid],1]];
	};
	default {
	};
};*/

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
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
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY]] call CTI_CO_FNC_Log;
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
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER]] call CTI_CO_FNC_Log;
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
	["VIOC_DEBUG", "FILE: common\config\Towns_POL.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], ANTI_AIR]] call CTI_CO_FNC_Log;
};