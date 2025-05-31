private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_ntag = "_G_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_tag = "WEST_";_ntag = "_B_";
		if(CTI_WEST_AI == CTI_GER_ID || CTI_WEST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_tag = "EAST_";_ntag = "_O_";
		if(CTI_EAST_AI == CTI_GER_ID || CTI_EAST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
/*_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_GER_ID && (_isThisMain select 1) == CTI_IFA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_GER.sqf";
};*/
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
	
	_c pushBack format["%1Zombie%2Crawler_LIB_CIV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Crawler_LIB_GER", _sid, _ntag];
	_c pushBack format["%1Zombie%2Crawler_LIB_SOV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Crawler_LIB_US", _sid, _ntag];

	_c pushBack format["%1Zombie%2Shambler_LIB_CIV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Shambler_LIB_GER", _sid, _ntag];
	_c pushBack format["%1Zombie%2Shambler_LIB_SOV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Shambler_LIB_US", _sid, _ntag];

	_c pushBack format["%1Zombie%2Walker_LIB_CIV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Walker_LIB_GER", _sid, _ntag];
	_c pushBack format["%1Zombie%2Walker_LIB_SOV", _sid, _ntag];
	_c pushBack format["%1Zombie%2Walker_LIB_US", _sid, _ntag];

	_c pushBack format["%1Zombie%2RA_LIB_CIV", _sid, _ntag];
	_c pushBack format["%1Zombie%2RA_LIB_GER", _sid, _ntag];
	_c pushBack format["%1Zombie%2RA_LIB_SOV", _sid, _ntag];
	_c pushBack format["%1Zombie%2RA_LIB_US", _sid, _ntag];

	_c pushBack format["%1Zombie%2RC_LIB_CIV", _sid, _ntag];
	_c pushBack format["%1Zombie%2RC_LIB_GER", _sid, _ntag];
	_c pushBack format["%1Zombie%2RC_LIB_SOV", _sid, _ntag];
	_c pushBack format["%1Zombie%2RC_LIB_US", _sid, _ntag];
	
	switch (_side) do {
		case west: {
			_c pushBack format["%1WBK_SpecialZombie_Corrupted_2", _sid];
		};
		case east: {
			_c pushBack format["%1WBK_SpecialZombie_Corrupted_3", _sid];
		};
		default {
			_c pushBack format["%1WBK_SpecialZombie_Corrupted_1", _sid];
		};
	};
//};


_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
//};

switch (_side) do {
	case west: {
		_c pushBack format["%1Zombie_Special_BLUFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_BLUFOR_Screamer", _sid];
	};
	case east: {
		_c pushBack format["%1Zombie_Special_OPFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_OPFOR_Screamer", _sid];
	};
	default {
		_c pushBack format["%1Zombie_Special_GREENFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_GREENFOR_Screamer", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

switch (_side) do {
	case west: {
		_c pushBack format["%1Zombie_Special_BLUFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_BLUFOR_Screamer", _sid];
	};
	case east: {
		_c pushBack format["%1Zombie_Special_OPFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_OPFOR_Screamer", _sid];
	};
	default {
		_c pushBack format["%1Zombie_Special_GREENFOR_Boomer", _sid];
		_c pushBack format["%1Zombie_Special_GREENFOR_Screamer", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

switch (_side) do {
	case west: {
		_c pushBack format["%1WBK_SpecialZombie_Smasher_2", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Acid_2", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Hellbeast_2", _sid];
		_c pushBack format["%1WBK_Goliaph_1", _sid];
	};
	case east: {
		_c pushBack format["%1WBK_SpecialZombie_Smasher_3", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Acid_3", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Hellbeast_3", _sid];
		_c pushBack format["%1WBK_Goliaph_3", _sid];
	};
	default {
		_c pushBack format["%1WBK_SpecialZombie_Smasher_1", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Acid_1", _sid];
		_c pushBack format["%1WBK_SpecialZombie_Smasher_Hellbeast_1", _sid];
		_c pushBack format["%1WBK_Goliaph_2", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
/*_c = [];

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];
*/
//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*_c = [];

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];
*/
//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
/*_c = [];

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];
*/
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_WBK_IFA_Zeds.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
