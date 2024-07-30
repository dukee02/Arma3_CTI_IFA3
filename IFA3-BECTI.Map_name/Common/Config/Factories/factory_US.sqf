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
if !(("LIB_US_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_IFA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Driver_w", _sid];
		_c pushBack format["%1LIB_US_Engineer_w", _sid];
		_c pushBack format["%1LIB_US_Grenadier_w", _sid];
		_c pushBack format["%1LIB_US_Medic_w", _sid];
		_c pushBack format["%1LIB_US_Radioman_w", _sid];
		_c pushBack format["%1LIB_US_Rifleman_w", _sid];
		_c pushBack format["%1LIB_US_Smgunner_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_driver", _sid];
		_c pushBack format["%1LIB_US_NAC_engineer", _sid];
		_c pushBack format["%1LIB_US_NAC_grenadier", _sid];
		_c pushBack format["%1LIB_US_NAC_medic", _sid];
		_c pushBack format["%1LIB_US_NAC_radioman", _sid];
		_c pushBack format["%1LIB_US_NAC_rifleman", _sid];
		_c pushBack format["%1LIB_US_NAC_smgunner", _sid];
	};
	
	_c pushBack format["%1LIB_US_driver", _sid];
	_c pushBack format["%1LIB_US_rifleman", _sid];
	_c pushBack format["%1LIB_US_engineer", _sid];
	_c pushBack format["%1LIB_US_grenadier", _sid];
	_c pushBack format["%1LIB_US_medic", _sid];
	_c pushBack format["%1LIB_US_radioman", _sid];
	_c pushBack format["%1LIB_US_Bomber_Crew", _sid];
	_c pushBack format["%1LIB_US_Bomber_Pilot", _sid];
	_c pushBack format["%1LIB_US_Pilot", _sid];
	_c pushBack format["%1LIB_US_tank_crew", _sid];
	_c pushBack format["%1LIB_US_smgunner", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_AT_soldier_w", _sid];
		_c pushBack format["%1LIB_US_Corporal_w", _sid];
		_c pushBack format["%1LIB_US_FC_rifleman_w", _sid];
		_c pushBack format["%1LIB_US_Second_lieutenant_w", _sid];
		_c pushBack format["%1LIB_US_Mgunner_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_FC_rifleman", _sid];
		_c pushBack format["%1LIB_US_NAC_corporal", _sid];
		_c pushBack format["%1LIB_US_NAC_AT_soldier", _sid];
		_c pushBack format["%1LIB_US_NAC_mgunner", _sid];
		_c pushBack format["%1LIB_US_NAC_second_lieutenant", _sid];
	};
	
	_c pushBack format["%1LIB_US_mgunner", _sid];
	_c pushBack format["%1LIB_US_FC_rifleman", _sid];
	_c pushBack format["%1LIB_US_tank_sergeant", _sid];
	_c pushBack format["%1LIB_US_AT_soldier", _sid];
	_c pushBack format["%1LIB_US_corporal", _sid];
	_c pushBack format["%1LIB_US_second_lieutenant", _sid];
	_c pushBack format["%1LIB_US_tank_second_lieutenant", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_First_lieutenant_w", _sid];
		_c pushBack format["%1LIB_US_Sniper_w", _sid];
		_c pushBack format["%1LIB_US_Captain_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_first_lieutenant", _sid];
		_c pushBack format["%1LIB_US_NAC_sniper", _sid];
		_c pushBack format["%1LIB_US_NAC_captain", _sid];
	};

	_c pushBack format["%1LIB_US_first_lieutenant", _sid];
	_c pushBack format["%1LIB_US_sniper", _sid];
	_c pushBack format["%1LIB_US_captain", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_Hood_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _sid];	
	};
	_c pushBack format["%1LIB_US_Willys_MB", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_Hood", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_M1919_w", _sid];	
		_c pushBack format["%1LIB_US_GMC_Open_w", _sid];
		_c pushBack format["%1LIB_US_GMC_Tent_w", _sid];
		//_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
		//_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
		//_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB_M1919", _sid];	
		_c pushBack format["%1LIB_US_NAC_GMC_Open", _sid];
		_c pushBack format["%1LIB_US_NAC_GMC_Tent", _sid];
	};
	_c pushBack format["%1LIB_US_Willys_MB_M1919", _sid];	
	_c pushBack format["%1LIB_US_GMC_Open", _sid];
	_c pushBack format["%1LIB_US_GMC_Tent", _sid];
	_c pushBack format["%1LIB_US_GMC_Ambulance", _sid];					//medic
	//_c pushBack format["%1LIB_US_GMC_Fuel", _sid];					//fueltruck
	//_c pushBack format["%1LIB_US_GMC_Parm", _sid];					//repairtruck
	//_c pushBack format["%1LIB_US_GMC_Ammo", _sid];					//ammotruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_Ambulance_w", _sid];		//medic
		_c pushBack format["%1LIB_US_Scout_m3_w", _sid];
		_c pushBack format["%1LIB_US_Scout_M3_FFV_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Ambulance", _sid];	//medic	
		_c pushBack format["%1LIB_US_NAC_Scout_M3", _sid];
		_c pushBack format["%1LIB_US_NAC_Scout_M3_FFV", _sid];
	};
	_c pushBack format["%1LIB_US_Willys_MB_Ambulance", _sid];			//medic	
	_c pushBack format["%1LIB_US_Scout_M3", _sid];
	_c pushBack format["%1LIB_US_Scout_M3_FFV", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_M3_Halftrack_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_US_M3_Halftrack", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1LIB_M8_Greyhound", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1LIB_M3A3_Stuart", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1LIB_M5A1_Stuart", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_M4A3_75_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_M4A3_75", _sid];
	};
	_c pushBack format["%1LIB_M4A3_75", _sid];
	_c pushBack format["%1LIB_M4A3_75_Tubes", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1LIB_M4A3_76", _sid];
	_c pushBack format["%1LIB_M4A3_76_HVSS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_C47_Skytrain", _sid];
	//_c pushBack format["%1LIB_C47_RAF_bob", _sid];
	//_c pushBack format["%1LIB_C47_RAF_snafu", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_P39", _sid];
		//_c pushBack format["%1LIB_US_NAC_P39_2", _sid];
		//_c pushBack format["%1LIB_US_NAC_P39_3", _sid];
	};
	_c pushBack format["%1LIB_US_P39", _sid];
	//_c pushBack format["%1LIB_US_P39_2", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_P47", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

//add the paradroping units
_priorUnits = missionNamespace getVariable "CTI_VEHICLES_PARADROPERS";
_priorUnits pushBack format["%1LIB_C47_Skytrain", _sid];
_priorUnits pushBack format["%1LIB_C47_RAF_bob", _sid];
_priorUnits pushBack format["%1LIB_C47_RAF_snafu", _sid];
missionNamespace setVariable ["CTI_VEHICLES_PARADROPERS", _priorUnits];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Reapir Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	
	_c pushBack format["%1LIB_US_GMC_Parm", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];


//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
	};
	
	_c pushBack format["%1LIB_US_GMC_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_US_GMC_Fuel", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_US_Rifleman_w", _sid];
			_c pushBack format["%1LIB_US_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_US_NAC_rifleman", _sid];
			_c pushBack format["%1LIB_US_NAC_medic", _sid];
		};
		_c pushBack format["%1LIB_US_rifleman", _sid];
		_c pushBack format["%1LIB_US_medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_Hood_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _sid];	
	};
	_c pushBack format["%1LIB_US_Willys_MB", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_Hood", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
			_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
		};
		_c pushBack format["%1LIB_US_GMC_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_US_GMC_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_US_GMC_Parm", _sid];						//repairtruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
//--- For balancing the naval on all maps, wo put them into file factory_IFA_Naval
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
