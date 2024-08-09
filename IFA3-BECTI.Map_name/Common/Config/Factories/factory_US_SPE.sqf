private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_US_ID || CTI_WEST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_US_ID || CTI_EAST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("SPE_US_Rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_SPE_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_SPE.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_US_Rangers_rifleman", _sid];
		_c pushBack format["%1SPE_US_Rangers_radioman", _sid];
		_c pushBack format["%1SPE_US_Rangers_medic", _sid];
		_c pushBack format["%1SPE_US_Rangers_grenadier", _sid];
		_c pushBack format["%1SPE_US_Rangers_engineer", _sid];
		_c pushBack format["%1SPE_US_Rangers_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_US_Rangers_Rifleman_AmmoBearer", _sid];
		_c pushBack format["%1SPE_US_Rangers_engineer_bangalore", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_US_Rifleman", _sid];
		_c pushBack format["%1SPE_US_Radioman", _sid];
		_c pushBack format["%1SPE_US_Medic", _sid];
		_c pushBack format["%1SPE_US_Driver", _sid];
		_c pushBack format["%1SPE_US_Engineer", _sid];
		_c pushBack format["%1SPE_US_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_US_Grenadier", _sid];
		_c pushBack format["%1SPE_US_Rifleman_AmmoBearer", _sid];
		_c pushBack format["%1SPE_US_Mortar_AGunner", _sid];
		_c pushBack format["%1SPE_US_Mortar_Gunner", _sid];
		_c pushBack format["%1SPE_US_Mortar_AmmoBearer", _sid];
		_c pushBack format["%1SPE_US_Sentry", _sid];
		_c pushBack format["%1SPE_US_Sentry_Carbine", _sid];
	};
	_c pushBack format["%1SPE_US_Tank_Crew", _sid];
	_c pushBack format["%1SPE_US_Guncrew", _sid];
	_c pushBack format["%1SPE_US_Tank_Coverall", _sid];
	_c pushBack format["%1SPE_US_Tank_HBT_Late", _sid];
	_c pushBack format["%1SPE_US_Tank_Late", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_US_Rangers_Autorifleman", _sid];
		_c pushBack format["%1SPE_US_Rangers_Assist_Autorifleman", _sid];
		_c pushBack format["%1SPE_US_Rangers_AT_soldier", _sid];
		_c pushBack format["%1SPE_US_Rangers_SquadLead", _sid];
		_c pushBack format["%1SPE_US_Rangers_Assist_SquadLead", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_US_Assist_Autorifleman", _sid];
		_c pushBack format["%1SPE_US_Autorifleman", _sid];
		_c pushBack format["%1SPE_US_AT_Soldier", _sid];
		_c pushBack format["%1SPE_US_SquadLead", _sid];
		_c pushBack format["%1SPE_US_Assist_SquadLead", _sid];
		_c pushBack format["%1SPE_US_Tank_Sergeant", _sid];
		_c pushBack format["%1SPE_US_Guncrew_Sergeant", _sid];
	};
	_c pushBack format["%1SPE_US_Pilot_Unequipped", _sid];
	_c pushBack format["%1SPE_US_Pilot", _sid];
	_c pushBack format["%1SPE_US_Pilot_2", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_US_Rangers_sniper", _sid];
		_c pushBack format["%1SPE_US_Rangers_AHMGunner", _sid];
		_c pushBack format["%1SPE_US_Rangers_HMGunner", _sid];
		_c pushBack format["%1SPE_US_Rangers_second_lieutenant", _sid];
		_c pushBack format["%1SPE_US_Rangers_first_lieutenant", _sid];
		_c pushBack format["%1SPE_US_Rangers_captain", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_US_AHMGunner", _sid];
		_c pushBack format["%1SPE_US_HMGunner", _sid];
		_c pushBack format["%1SPE_US_HMG_AmmoBearer", _sid];
		_c pushBack format["%1SPE_US_Sniper", _sid];
		_c pushBack format["%1SPE_US_Second_Lieutenant", _sid];
		_c pushBack format["%1SPE_US_First_Lieutenant", _sid];
		_c pushBack format["%1SPE_US_Captain", _sid];
	};
	_c pushBack format["%1SPE_US_Tank_Second_Lieutenant", _sid];
	_c pushBack format["%1SPE_US_Tank_Second_Lieutenant_late", _sid];
	
	_c pushBack format["%1SPE_US_HBT44_Rifleman", _sid];
	_c pushBack format["%1SPE_US_HBT44_AHMGunner", _sid];
	_c pushBack format["%1SPE_US_HBT44_AT_Soldier", _sid];
	_c pushBack format["%1SPE_US_HBT44_Autorifleman", _sid];
	_c pushBack format["%1SPE_US_HBT44_HalfTrack_Driver", _sid];
	_c pushBack format["%1SPE_US_HBT44_Engineer", _sid];
	_c pushBack format["%1SPE_US_HBT44_Flamethrower_Operator", _sid];
	_c pushBack format["%1SPE_US_HBT44_Grenadier", _sid];
	_c pushBack format["%1SPE_US_HBT44_HMGunner", _sid];
	_c pushBack format["%1SPE_US_HBT44_Medic", _sid];
	_c pushBack format["%1SPE_US_HBT44_Radioman", _sid];
	_c pushBack format["%1SPE_US_HBT44_Sniper", _sid];
	_c pushBack format["%1SPE_US_HBT44_Assist_SquadLead", _sid];
	_c pushBack format["%1SPE_US_HBT44_SquadLead", _sid];
	_c pushBack format["%1SPE_US_HBT44_Second_Lieutenant", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_US_G503_MB", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M1919", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M1919_PATROL", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M2", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M2_PATROL", _sid];

	//_c pushBack format["%1SPE_CCKW_353", _sid];
	_c pushBack format["%1SPE_CCKW_353_Open", _sid];
	_c pushBack format["%1SPE_CCKW_353_M2", _sid];
	_c pushBack format["%1SPE_CCKW_353_Ambulance", _sid];
	//_c pushBack format["%1SPE_CCKW_353_Repair", _sid];
	//_c pushBack format["%1SPE_CCKW_353_Fuel", _sid];
	//_c pushBack format["%1SPE_CCKW_353_Ammo", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_US_G503_MB_Armoured", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M1919_Armoured", _sid];
	_c pushBack format["%1SPE_US_G503_MB_M2_Armoured", _sid];

	_c pushBack format["%1SPE_US_M3_Halftrack_Unarmed_Open", _sid];	
	_c pushBack format["%1SPE_US_M3_Halftrack_Unarmed", _sid];	
	_c pushBack format["%1SPE_US_M3_Halftrack", _sid];
	//_c pushBack format["%1SPE_US_M3_Halftrack_Ammo", _sid];	
	//_c pushBack format["%1SPE_US_M3_Halftrack_Fuel", _sid];	
	//_c pushBack format["%1SPE_US_M3_Halftrack_Repair", _sid];	
	_c pushBack format["%1SPE_US_M3_Halftrack_Ambulance", _sid];
	_c pushBack format["%1SPE_US_G503_MB_Ambulance", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_US_M16_Halftrack", _sid];
	_c pushBack format["%1SPE_M20_AUC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1SPE_M8_LAC_ringMount", _sid];
	_c pushBack format["%1SPE_M8_LAC", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_M4A0_75_Early", _sid];
	_c pushBack format["%1SPE_M4A0_75", _sid];
	_c pushBack format["%1SPE_M4A0_composite", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_M10", _sid];
	_c pushBack format["%1SPE_M4A1_75", _sid];
	_c pushBack format["%1SPE_M4A1_75_erla", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_M4A1_T34_Calliope_Direct", _sid];
	_c pushBack format["%1SPE_M4A1_T34_Calliope", _sid];
	_c pushBack format["%1SPE_M4A0_105", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_M18_Hellcat", _sid];
	_c pushBack format["%1SPE_M4A1_76", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1SPE_M4A3_75", _sid];
	_c pushBack format["%1SPE_M4A3_105", _sid];
	_c pushBack format["%1SPE_M4A3_76", _sid];
	_c pushBack format["%1SPE_M4A3_T34_Calliope", _sid];
	_c pushBack format["%1SPE_M4A3_T34_Calliope_Direct", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1SPE_P47", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Reapir Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1SPE_CCKW_353_Repair", _sid];						//repairtruck
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1SPE_US_M3_Halftrack_Repair", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1SPE_CCKW_353_Ammo", _sid];						//ammotruck
	_c pushBack format["%1SPE_CCKW_353_Fuel", _sid];						//fueltruck
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1SPE_US_M3_Halftrack_Ammo", _sid];						//ammotruck
	_c pushBack format["%1SPE_US_M3_Halftrack_Fuel", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
			_c pushBack format["%1SPE_US_Rangers_rifleman", _sid];
			_c pushBack format["%1SPE_US_Rangers_medic", _sid];
		};
		if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
			_c pushBack format["%1SPE_US_Rifleman", _sid];
			_c pushBack format["%1SPE_US_Medic", _sid];
		};
		_c pushBack format["%1SPE_US_Tank_Crew", _sid];
	};
};
//if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
//};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1SPE_US_M3_Halftrack_Ammo", _sid];							//ammotruck
		_c pushBack format["%1SPE_US_M3_Halftrack_Fuel", _sid];							//fueltruck
		_c pushBack format["%1SPE_US_M3_Halftrack_Repair", _sid];						//repairtruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SPE.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
