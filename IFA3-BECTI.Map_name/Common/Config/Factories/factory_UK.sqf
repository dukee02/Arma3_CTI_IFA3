private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_UK_ID || CTI_WEST_TOWNS == CTI_UK_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_UK_ID || CTI_EAST_TOWNS == CTI_UK_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("LIB_UK_Rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};


//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_UK_ID && (_isThisMain select 1) == CTI_IFA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_UK.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Radioman_w", _sid];
		_c pushBack format["%1LIB_UK_Rifleman_w", _sid];
		_c pushBack format["%1LIB_UK_Medic_w", _sid];
		_c pushBack format["%1LIB_UK_Grenadier_w", _sid];
		_c pushBack format["%1LIB_UK_Engineer_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Engineer", _sid];
		_c pushBack format["%1LIB_UK_DR_Grenadier", _sid];
		_c pushBack format["%1LIB_UK_DR_Medic", _sid];
		_c pushBack format["%1LIB_UK_DR_Radioman", _sid];
		_c pushBack format["%1LIB_UK_DR_Rifleman", _sid];
		_c pushBack format["%1LIB_UK_DR_Tank_Crew", _sid];
	};
	
	_c pushBack format["%1LIB_UK_Engineer", _sid];
	_c pushBack format["%1LIB_UK_Grenadier", _sid];
	_c pushBack format["%1LIB_UK_Grenadier_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Medic", _sid];
	_c pushBack format["%1LIB_UK_Rifleman", _sid];
	_c pushBack format["%1LIB_UK_Rifleman_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Tank_Crew", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_AT_Soldier_w", _sid];
		_c pushBack format["%1LIB_UK_Corporal_w", _sid];
		_c pushBack format["%1LIB_UK_LanceCorporal_w", _sid];
		_c pushBack format["%1LIB_UK_Sergeant_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_AT_Soldier", _sid];
		_c pushBack format["%1LIB_UK_DR_LanceCorporal", _sid];
		_c pushBack format["%1LIB_UK_DR_Corporal", _sid];
		_c pushBack format["%1LIB_UK_DR_Sergeant", _sid];
	};
	
	_c pushBack format["%1LIB_UK_AT_Soldier", _sid];
	_c pushBack format["%1LIB_UK_Corporal", _sid];
	_c pushBack format["%1LIB_UK_Corporal_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_LanceCorporal", _sid];
	_c pushBack format["%1LIB_UK_LanceCorporal_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Sergeant", _sid];
	_c pushBack format["%1LIB_UK_Sergeant_Jerkins", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Officer_w", _sid];
		_c pushBack format["%1LIB_UK_Sniper_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Tank_Commander", _sid];
		_c pushBack format["%1LIB_UK_DR_Sniper", _sid];
		_c pushBack format["%1LIB_UK_DR_Officer", _sid];
	};

	_c pushBack format["%1LIB_UK_Sniper", _sid];
	_c pushBack format["%1LIB_UK_Officer", _sid];
	_c pushBack format["%1LIB_UK_Tank_Commander", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Willys_MB_w", _sid];
		_c pushBack format["%1LIB_UK_Willys_MB_Hood_w", _sid];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Willys_MB", _sid];
		_c pushBack format["%1LIB_UK_DR_Willys_MB_Hood", _sid];		
	};
	_c pushBack format["%1LIB_UK_Willys_MB", _sid];
	_c pushBack format["%1LIB_UK_Willys_MB_Hood", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Willys_MB_M1919_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Willys_MB_M1919", _sid];	
	};
	_c pushBack format["%1LIB_UK_Willys_MB_M1919", _sid];
	_c pushBack format["%1LIB_US6_Open_Cargo", _sid];
	_c pushBack format["%1LIB_US6_Open", _sid];
	//_c pushBack format["%1LIB_US6_Tent", _sid];
	//_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
	//_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Willys_MB_Ambulance_w", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Willys_MB_Ambulance", _sid];		//medic		
	};
	_c pushBack format["%1LIB_UK_Willys_MB_Ambulance", _sid];				//medic	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_UK_M3_Halftrack", _sid];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UniversalCarrier_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UniversalCarrier_desert", _sid];
	};
	_c pushBack format["%1LIB_UniversalCarrier", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Churchill_Mk7_AVRE_w", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Howitzer_w", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_w", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Crocodile_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_Churchill_Mk7_AVRE_desert", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Howitzer_desert", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_desert", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid];
	};
	_c pushBack format["%1LIB_Churchill_Mk7_AVRE", _sid];
	_c pushBack format["%1LIB_Churchill_Mk7_Howitzer", _sid];
	_c pushBack format["%1LIB_Churchill_Mk7", _sid];
	_c pushBack format["%1LIB_Churchill_Mk7_Crocodile", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_M4A3_75", _sid];
	};
	_c pushBack format["%1LIB_UK_Italy_M4A3_75", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Cromwell_Mk4_w", _sid];
	};
	_c pushBack format["%1LIB_Cromwell_Mk4", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1LIB_M4A4_FIREFLY", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_HORSA_RAF", _sid];
	_c pushBack format["%1LIB_C47_RAF", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_RAF_P39", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

//add the paradroping units
_priorUnits = missionNamespace getVariable "CTI_VEHICLES_PARADROPERS";
_priorUnits pushBack format["%1LIB_HORSA_RAF", _sid];
_priorUnits pushBack format["%1LIB_C47_RAF", _sid];
missionNamespace setVariable ["CTI_VEHICLES_PARADROPERS", _priorUnits];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if (_setupBaseUnits && CTI_UK_SIDE != CTI_US_SIDE) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//_c pushBack format["%1LIB_AustinK5_DR_Tent", _sid];					//repairtruck
	//};
	//_c pushBack format["%1LIB_AustinK5_Tent", _sid];						//repairtruck
	_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];					//ammotruck
	//};
	//pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_UK_Rifleman_w", _sid];
			_c pushBack format["%1LIB_UK_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_UK_DR_Rifleman", _sid];
			_c pushBack format["%1LIB_UK_DR_Medic", _sid];
		};
		_c pushBack format["%1LIB_UK_Rifleman", _sid];
		_c pushBack format["%1LIB_UK_Medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Willys_MB_w", _sid];
		_c pushBack format["%1LIB_UK_Willys_MB_Hood_w", _sid];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Willys_MB", _sid];
		_c pushBack format["%1LIB_UK_DR_Willys_MB_Hood", _sid];		
	};
	_c pushBack format["%1LIB_UK_Willys_MB", _sid];
	_c pushBack format["%1LIB_UK_Willys_MB_Hood", _sid];
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UniversalCarrier_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UniversalCarrier_desert", _sid];
	};
	_c pushBack format["%1LIB_UniversalCarrier", _sid];	
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];					//ammotruck
		//};
		//_c pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
		_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
