private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_SOV_ID || CTI_WEST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_SOV_ID || CTI_EAST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("LIB_SOV_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_IFA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_LC_rifleman_w", _sid];
		_c pushBack format["%1LIB_SOV_Rifleman_w", _sid];
		_c pushBack format["%1LIB_SOV_Rifleman_ADS_w", _sid];
		_c pushBack format["%1LIB_SOV_Sergeant_w", _sid];
		_c pushBack format["%1LIB_SOV_Staff_sergeant_w", _sid];
		_c pushBack format["%1LIB_SOV_Unequip_w", _sid];
		_c pushBack format["%1LIB_SOV_Sapper_w", _sid];
		_c pushBack format["%1LIB_SOV_Assault_smgunner_w", _sid];
		_c pushBack format["%1LIB_SOV_LAT_Soldier_w", _sid];
		_c pushBack format["%1LIB_SOV_AT_grenadier_w", _sid];
		_c pushBack format["%1LIB_SOV_grenadier_w", _sid];
		_c pushBack format["%1LIB_SOV_Medic_w", _sid];
		_c pushBack format["%1LIB_SOV_Smgunner_w2", _sid];
		_c pushBack format["%1LIB_SOV_Smgunner_w", _sid];
	};
		
	_c pushBack format["%1LIB_SOV_unequip", _sid];
	_c pushBack format["%1LIB_SOV_tank_crew", _sid];
	_c pushBack format["%1LIB_SOV_rifleman", _sid];
	_c pushBack format["%1LIB_SOV_sapper", _sid];
	_c pushBack format["%1LIB_SOV_grenadier", _sid];
	_c pushBack format["%1LIB_SOV_assault_smgunner", _sid];
	_c pushBack format["%1LIB_SOV_LC_rifleman_summer", _sid];
	_c pushBack format["%1LIB_SOV_AT_grenadier", _sid];
	_c pushBack format["%1LIB_SOV_LAT_Soldier", _sid];
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_gun_crew", _sid];
	_c pushBack format["%1LIB_SOV_LC_rifleman", _sid];
	_c pushBack format["%1LIB_SOV_medic", _sid];
	_c pushBack format["%1LIB_SOV_smgunner", _sid];
	_c pushBack format["%1LIB_SOV_pilot", _sid];
	_c pushBack format["%1LIB_SOV_tank_overall_crew", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_Assault_sergeant_w", _sid];
		_c pushBack format["%1LIB_SOV_AT_M1A1_soldier_w", _sid];
		_c pushBack format["%1LIB_SOV_Assault_mgunner_w", _sid];
		_c pushBack format["%1LIB_SOV_Mgunner_w", _sid];
		_c pushBack format["%1LIB_SOV_P_officer_w", _sid];
		_c pushBack format["%1LIB_SOV_Operator_w", _sid];
	};

	_c pushBack format["%1LIB_SOV_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_assault_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_tank_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_scout_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_staff_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_assault_mgunner", _sid];
	_c pushBack format["%1LIB_SOV_smgunner_summer", _sid];
	_c pushBack format["%1LIB_SOV_AT_M1A1_soldier", _sid];
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_mgunner", _sid];
	_c pushBack format["%1LIB_SOV_gun_sergeant", _sid];
	_c pushBack format["%1LIB_SOV_operator", _sid];
	_c pushBack format["%1LIB_SOV_tank_overall_sergeant", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_Scout_smgunner_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_mgunner_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_rifleman_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_p_officer_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_sergeant_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_lieutenant_w", _sid];
		_c pushBack format["%1LIB_SOV_Scout_sniper_w", _sid];
		_c pushBack format["%1LIB_SOV_scout_atrifle_assistant_w", _sid];
		_c pushBack format["%1LIB_SOV_scout_atrifle_gunner_w", _sid];
		_c pushBack format["%1LIB_SOV_AT_soldier_w", _sid];
		_c pushBack format["%1LIB_SOV_Captain_w", _sid];
		_c pushBack format["%1LIB_SOV_First_lieutenant_w", _sid];
		_c pushBack format["%1LIB_SOV_Lieutenant_w", _sid];
	};

	_c pushBack format["%1LIB_SOV_p_officer", _sid];
	_c pushBack format["%1LIB_SOV_tank_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_scout_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_gun_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_tank_captain", _sid];
	_c pushBack format["%1LIB_SOV_captain_summer", _sid];
	_c pushBack format["%1LIB_SOV_AT_soldier", _sid];
	_c pushBack format["%1LIB_SOV_scout_smgunner", _sid];
	_c pushBack format["%1LIB_SOV_scout_mgunner", _sid];
	_c pushBack format["%1LIB_SOV_scout_rifleman", _sid];
	_c pushBack format["%1LIB_SOV_scout_p_officer", _sid];
	_c pushBack format["%1LIB_SOV_scout_sniper", _sid];
	_c pushBack format["%1LIB_SOV_scout_atrifle_assistant", _sid];
	_c pushBack format["%1LIB_SOV_scout_atrifle_gunner", _sid];
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_scout_sniper_spring", _sid];
	_c pushBack format["%1LIB_SOV_scout_sniper_autumn", _sid];
	_c pushBack format["%1LIB_SOV_scout_rifleman_autumn", _sid];
	_c pushBack format["%1LIB_SOV_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_first_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_captain", _sid];
	_c pushBack format["%1LIB_SOV_tank_overall_lieutenant", _sid];
	_c pushBack format["%1LIB_SOV_tank_overall_captain", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Willys_MB_w", _sid];
		_c pushBack format["%1LIB_Willys_MB_Hood_w", _sid];
	};
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
	_c pushBack format["%1LIB_Willys_MB", _sid];
	_c pushBack format["%1LIB_Willys_MB_Hood", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis5v_w", _sid];
		_c pushBack format["%1LIB_Zis5v_med_w", _sid];					//medic
		//_c pushBack format["%1LIB_Zis6_parm_w", _sid];				//repairtruck
		//_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_Zis5v", _sid];
	_c pushBack format["%1LIB_Zis5v_61K", _sid];
	_c pushBack format["%1LIB_Zis5v_Med", _sid];				//medic
	//_c pushBack format["%1LIB_Zis6_Parm", _sid];				//repairtruck
	//_c pushBack format["%1LIB_Zis5v_Fuel", _sid];				//fueltruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Scout_M3_FFV_w", _sid];
		_c pushBack format["%1LIB_Scout_m3_w", _sid];
		_c pushBack format["%1LIB_Willys_MB_Ambulance_w", _sid];	//medic
	};
	_c pushBack format["%1LIB_Scout_M3", _sid];
	_c pushBack format["%1LIB_Scout_M3_FFV", _sid];
	_c pushBack format["%1LIB_Willys_MB_Ambulance", _sid];			//medic
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz251_captured_w", _sid];
		_c pushBack format["%1LIB_SdKfz251_captured_FFV_w", _sid];
		_c pushBack format["%1LIB_SOV_M3_Halftrack_w", _sid];
	};
	_c pushBack format["%1LIB_SdKfz251_captured", _sid];
	_c pushBack format["%1LIB_SdKfz251_captured_FFV", _sid];
	_c pushBack format["%1LIB_SOV_M3_Halftrack", _sid];
	//_c pushBack format["%1LIB_US6_Tent", _sid];
	//_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open", _sid];
	//_c pushBack format["%1LIB_US6_Ammo", _sid];					//ammotruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1LIB_US6_BM13", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_cnt = 0;
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_T34_76_w", _sid];
	};
	_c pushBack format["%1LIB_T34_76", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SU85_w", _sid];
		_c pushBack format["%1LIB_M4A2_SOV_w", _sid];
	};
	_c pushBack format["%1LIB_SU85", _sid];
	_c pushBack format["%1LIB_M4A2_SOV", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_T34_85_w", _sid];
	};
	_c pushBack format["%1LIB_T34_85", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_JS2_43_w", _sid];
	};
	_c pushBack format["%1LIB_JS2_43", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_Li2", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1LIB_Pe2_2_w", _sid];
	//	_c pushBack format["%1LIB_Pe2_w", _sid];
	//};
	_c pushBack format["%1LIB_Pe2", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_P39_w", _sid];
	};
	_c pushBack format["%1LIB_P39", _sid];
	//_c pushBack format["%1LIB_RA_P39_3", _sid];
	//_c pushBack format["%1LIB_RA_P39_2", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

//add the paradroping units
_priorUnits = missionNamespace getVariable "CTI_VEHICLES_PARADROPERS";
_priorUnits pushBack format["%1LIB_Li2", _sid];
missionNamespace setVariable ["CTI_VEHICLES_PARADROPERS", _priorUnits];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
	};
	_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
};
//if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	//_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
//};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1LIB_GazM1_SOV", _sid];	
		_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
		};
		_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_SOV_Rifleman_w", _sid];
			_c pushBack format["%1LIB_SOV_Medic_w", _sid];
		};
			
		_c pushBack format["%1LIB_SOV_rifleman", _sid];
		//possible camo for desert
		_c pushBack format["%1LIB_SOV_LC_rifleman", _sid];
		_c pushBack format["%1LIB_SOV_medic", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
