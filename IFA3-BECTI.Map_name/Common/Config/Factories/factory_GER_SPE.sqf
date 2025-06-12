private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_GER_ID || CTI_WEST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_GER_ID || CTI_EAST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("SPE_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_GER_ID && (_isThisMain select 1) == CTI_SPE_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_GER_SPE.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_rifleman_lite", _sid];
		_c pushBack format["%1SPE_GER_rifleman", _sid];
		_c pushBack format["%1SPE_GER_rifleman_2", _sid];
		_c pushBack format["%1SPE_GER_radioman", _sid];
		_c pushBack format["%1SPE_GER_sapper", _sid];
		_c pushBack format["%1SPE_GER_sapper_gefr", _sid];
		_c pushBack format["%1SPE_GER_medic", _sid];
		_c pushBack format["%1SPE_GER_ober_rifleman", _sid];
		_c pushBack format["%1SPE_GER_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_GER_ober_grenadier", _sid];
		_c pushBack format["%1SPE_GER_Mortar_Gunner", _sid];
		_c pushBack format["%1SPE_GER_Mortar_AGunner", _sid];
		_c pushBack format["%1SPE_GER_Mortar_AmmoBearer", _sid];
		_c pushBack format["%1SPE_GER_AT_grenadier", _sid];
		_c pushBack format["%1SPE_GER_LAT_Klein_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_gun_crew", _sid];
		_c pushBack format["%1SPE_GER_spg_crew", _sid];
		_c pushBack format["%1SPE_GER_tank_crew", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier_Assistant", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_Sentry_MP40", _sid];
		_c pushBack format["%1SPE_GER_Sentry_K98k", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_rifleman_lite", _sid];
		_c pushBack format["%1SPE_sturmtrooper_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ober_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_radioman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_medic", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sapper", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sapper_gefr", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_AmmoBearer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_AGunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_Gunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_AT_grenadier", _sid];
		_c pushBack format["%1SPE_sturmtrooper_LAT_Klein_Rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ober_grenadier", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_crew", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier_Assistant", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier_SquadLead", _sid];
		_c pushBack format["%1SPE_ST_Sentry_MP35", _sid];
		_c pushBack format["%1SPE_ST_Sentry_MP40", _sid];
		_c pushBack format["%1SPE_ST_Sentry_K98k", _sid];
	};
	_c pushBack format["%1SPE_GER_flak_gun_crew", _sid];
	_c pushBack format["%1SPE_GER_flak_gun_SquadLead", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_LAT_30m_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_LAT_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_amgunner", _sid];
		_c pushBack format["%1SPE_GER_mgunner2", _sid];
		_c pushBack format["%1SPE_GER_mgunner", _sid];
		_c pushBack format["%1SPE_GER_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_Assist_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_gun_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_spg_unterofficer", _sid];
		_c pushBack format["%1SPE_GER_tank_unterofficer", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_LAT_30m_Rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_LAT_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_amgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_mgunner2", _sid];
		_c pushBack format["%1SPE_sturmtrooper_mgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_SquadLead", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Assist_SquadLead", _sid];
		_c pushBack format["%1SPE_sturmtrooper_standartenfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_unterofficer", _sid];
	};
	_c pushBack format["%1SPE_GER_pilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_hmgunner", _sid];
		_c pushBack format["%1SPE_GER_hmgunner2", _sid];
		_c pushBack format["%1SPE_GER_HMG_AmmoBearer", _sid];
		_c pushBack format["%1SPE_GER_ahmgunner", _sid];
		_c pushBack format["%1SPE_GER_stggunner", _sid];
		_c pushBack format["%1SPE_GER_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_hauptmann", _sid];
		_c pushBack format["%1SPE_GER_oberst", _sid];
		_c pushBack format["%1SPE_GER_ober_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_gun_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_spg_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_tank_lieutenant", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_hmgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_hmgunner2", _sid];
		_c pushBack format["%1SPE_sturmtrooper_HMG_AmmoBearer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ahmgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_stggunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sniper", _sid];
		_c pushBack format["%1SPE_sturmtrooper_obersturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_untersturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_hauptsturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_lieutenant", _sid];
	};
	_c pushBack format["%1SPE_GER_scout_amgunner", _sid];
	_c pushBack format["%1SPE_GER_scout_mgunner2", _sid];
	_c pushBack format["%1SPE_GER_scout_mgunner", _sid];
	_c pushBack format["%1SPE_GER_scout_rifleman", _sid];
	_c pushBack format["%1SPE_GER_scout_ober_rifleman", _sid];
	_c pushBack format["%1SPE_GER_scout_lieutenant", _sid];
	_c pushBack format["%1SPE_GER_scout_sniper", _sid];
	_c pushBack format["%1SPE_GER_scout_SquadLead", _sid];
	_c pushBack format["%1SPE_GER_scout_ober_grenadier", _sid];
	_c pushBack format["%1SPE_GER_scout_Assist_SquadLead", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_GER_R200_Unarmed", _sid];
	_c pushBack format["%1SPE_GER_R200_Hood", _sid];
	_c pushBack format["%1SPE_GER_R200_MG34", _sid];
	//_c pushBack format["%1SPE_ST_R200_Unarmed", _sid];
	//_c pushBack format["%1SPE_ST_R200_Hood", _sid];
	//_c pushBack format["%1SPE_ST_R200_MG34", _sid];

	_c pushBack format["%1SPE_OpelBlitz_Open", _sid];
	_c pushBack format["%1SPE_OpelBlitz_Ambulance", _sid];
	//_c pushBack format["%1SPE_OpelBlitz", _sid];
	//_c pushBack format["%1SPE_OpelBlitz_Ammo", _sid];
	//_c pushBack format["%1SPE_OpelBlitz_Fuel", _sid];
	//_c pushBack format["%1SPE_OpelBlitz_Repair", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_SdKfz250_1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_OpelBlitz_Flak38", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_StuG_III_G_Early", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_J", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_L", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_StuH_42", _sid];
	_c pushBack format["%1SPE_StuG_III_G_late", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_M", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_N", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_StuG_III_G_SKB", _sid];
	_c pushBack format["%1SPE_PzKpfwIV_G", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_PzKpfwVI_H1", _sid];
	_c pushBack format["%1SPE_Nashorn", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_Jagdpanther_G1", _sid];
	//_c pushBack format["%1SPE_ST_Jagdpanther_G1", _sid];
	_c pushBack format["%1SPE_PzKpfwV_G", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1SPE_FW190F8", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	//_c pushBack format["%1SPE_OpelBlitz", _sid];
};

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1SPE_OpelBlitz_Repair", _sid];						//repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1SPE_OpelBlitz_Ammo", _sid];						//ammotruck
	_c pushBack format["%1SPE_OpelBlitz_Fuel", _sid];						//fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1SPE_GER_R200_Unarmed", _sid];
		_c pushBack format["%1SPE_GER_R200_Hood", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1SPE_OpelBlitz_Ammo", _sid];						//ammotruck
		_c pushBack format["%1SPE_OpelBlitz_Fuel", _sid];						//fueltruck
		_c pushBack format["%1SPE_OpelBlitz_Repair", _sid];						//repairtruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
			_c pushBack format["%1SPE_GER_rifleman_lite", _sid];
			_c pushBack format["%1SPE_GER_medic", _sid];
			_c pushBack format["%1SPE_GER_tank_crew", _sid];
		};
		if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
			_c pushBack format["%1SPE_sturmtrooper_rifleman_lite", _sid];
			_c pushBack format["%1SPE_sturmtrooper_medic", _sid];
			_c pushBack format["%1SPE_sturmtrooper_tank_crew", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_SPE.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
