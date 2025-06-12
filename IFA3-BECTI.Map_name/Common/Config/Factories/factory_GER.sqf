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
if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_GER_ID && (_isThisMain select 1) == CTI_IFA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_GER.sqf";
};
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
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Gun_crew_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman3_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Recruit_w", _sid];
		_c pushBack format["%1LIB_GER_Smgunner_w", _sid];
		_c pushBack format["%1LIB_GER_AT_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_Ober_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Medic_w", _sid];
		_c pushBack format["%1LIB_GER_Radioman_w", _sid];
		_c pushBack format["%1LIB_GER_Unequip_w", _sid];
		_c pushBack format["%1LIB_GER_Sapper_w", _sid];
		_c pushBack format["%1LIB_GER_Sapper_gefr_w", _sid];
		_c pushBack format["%1LIB_GER_LAT_Rifleman_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_AT_grenadier", _sid];
		_c pushBack format["%1LIB_DAK_Soldier_2", _sid];
		_c pushBack format["%1LIB_DAK_grenadier", _sid];
		_c pushBack format["%1LIB_DAK_Soldier_3", _sid];
		_c pushBack format["%1LIB_DAK_medic", _sid];
		_c pushBack format["%1LIB_DAK_radioman", _sid];
		_c pushBack format["%1LIB_DAK_Soldier", _sid];
		_c pushBack format["%1LIB_DAK_sapper", _sid];
		_c pushBack format["%1LIB_DAK_sapper_gefr", _sid];
		_c pushBack format["%1LIB_DAK_spg_crew", _sid];
		_c pushBack format["%1LIB_DAK_Sentry_2", _sid];
		_c pushBack format["%1LIB_DAK_Sentry", _sid];
	};
	
	_c pushBack format["%1LIB_GER_AT_grenadier", _sid];
	_c pushBack format["%1LIB_GER_ober_rifleman", _sid];
	_c pushBack format["%1LIB_GER_tank_crew", _sid];
	_c pushBack format["%1LIB_GER_gun_crew", _sid];
	_c pushBack format["%1LIB_GER_Soldier2", _sid];
	_c pushBack format["%1LIB_GER_unequip", _sid];
	_c pushBack format["%1LIB_GER_Soldier3", _sid];
	_c pushBack format["%1LIB_GER_rifleman", _sid];
	_c pushBack format["%1LIB_GER_sapper", _sid];
	_c pushBack format["%1LIB_GER_sapper_gefr", _sid];
	_c pushBack format["%1LIB_GER_smgunner", _sid];
	_c pushBack format["%1LIB_GER_radioman", _sid];
	_c pushBack format["%1LIB_GER_medic", _sid];
	_c pushBack format["%1LIB_GER_pilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Mgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Ober_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_ober_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_AT_soldier_w", _sid];
		_c pushBack format["%1LIB_GER_Gun_unterofficer_w", _sid];
		_c pushBack format["%1LIB_GER_Gun_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman_ADS_w", _sid];
		_c pushBack format["%1LIB_GER_Lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Unterofficer_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Soldier_4", _sid];
		_c pushBack format["%1LIB_DAK_AT_soldier", _sid];
		_c pushBack format["%1LIB_DAK_Lieutenant", _sid];
		_c pushBack format["%1LIB_DAK_spg_unterofficer", _sid];
		_c pushBack format["%1LIB_DAK_spg_lieutenant", _sid];
	};

	_c pushBack format["%1LIB_GER_AT_soldier", _sid];
	_c pushBack format["%1LIB_GER_mgunner", _sid];
	_c pushBack format["%1LIB_GER_tank_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_tank_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_gun_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_ober_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_stggunner", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Hauptmann_w", _sid];
		_c pushBack format["%1LIB_GER_Oberst_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_smgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_ober_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_mgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_ober_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Soldier_camo_MP40_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_unterofficer_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_sniper_2_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_sniper_w", _sid];
		_c pushBack format["%1LIB_GER_Stggunner_w", _sid];
	};
		
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_NCO_2", _sid];
		_c pushBack format["%1LIB_DAK_NCO", _sid];
		_c pushBack format["%1LIB_DAK_Sniper", _sid];
	};

	_c pushBack format["%1LIB_GER_scout_smgunner", _sid];
	_c pushBack format["%1LIB_GER_scout_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_scout_mgunner", _sid];
	_c pushBack format["%1LIB_GER_scout_ober_rifleman", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo2_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo3_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo4_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo5_base", _sid];
	_c pushBack format["%1LIB_GER_scout_rifleman", _sid];
	_c pushBack format["%1LIB_GER_scout_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_scout_sniper", _sid];
	_c pushBack format["%1LIB_GER_hauptmann", _sid];
	_c pushBack format["%1LIB_GER_oberst", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
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
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Kfz1_w", _sid];
		_c pushBack format["%1LIB_Kfz1_Hood_w", _sid];
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Kfz1", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_hood", _sid];
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					
	};
	_c pushBack format["%1LIB_SdKfz_7", _sid];							
	_c pushBack format["%1LIB_Kfz1", _sid];
	//_c pushBack format["%1LIB_Kfz1_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_sernyt", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood", _sid];
	//_c pushBack format["%1LIB_Kfz1_Hood_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_Hood_sernyt", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _sid];
		_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _sid];
		_c pushBack format["%1LIB_OpelBlitz_Ambulance_w", _sid];			//medic
		_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _sid];
		//_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
		//_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		//_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Tent", _sid];
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ambulance", _sid];		//medic
		_c pushBack format["%1LIB_DAK_OpelBlitz_Open", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_MG42", _sid];
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];			//repairtruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];			//ammotruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];			//fueltruck
	};
	_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid];
	_c pushBack format["%1LIB_OpelBlitz_Ambulance", _sid];				//medic
	_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _sid];
	_c pushBack format["%1LIB_Kfz1_MG42", _sid];
	//_c pushBack format["%1LIB_Kfz1_MG42_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_MG42_sernyt", _sid];	
	//_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];					//repairtruck
	//_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];					//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];					//fueltruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Sdkfz251_w", _sid];
		_c pushBack format["%1LIB_SdKfz251_FFV_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz251", _sid];
		_c pushBack format["%1LIB_DAK_SdKfz251_FFV", _sid];
	};
	_c pushBack format["%1LIB_SdKfz251_FFV", _sid];
	_c pushBack format["%1LIB_SdKfz251", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_DAK_Scout_M3", _sid];
	_c pushBack format["%1LIB_DAK_Scout_M3_FFV", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_AA_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7_AA", _sid];
	};
	_c pushBack format["%1LIB_SdKfz_7_AA", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
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
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_StuG_III_G_w", _sid];
		_c pushBack format["%1LIB_StuG_III_G_WS_w", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
	_c pushBack format["%1LIB_StuG_III_G", _sid];
	_c pushBack format["%1LIB_SdKfz124", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwIV_H_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_PzKpfwIV_H", _sid];
	};
	_c pushBack format["%1LIB_PzKpfwIV_H", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid];
	};
	_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwVI_E_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_PzKpfwVI_E", _sid];
	};
	_c pushBack format["%1LIB_PzKpfwVI_E", _sid];
	//other cammos
	//_c pushBack format["%1LIB_PzKpfwVI_E_2", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn51c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn51d", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn52c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn52d", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwV_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_PzKpfwV", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwVI_B_w", _sid];
		//_c pushBack format["%1LIB_PzKpfwVI_B_camo_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_PzKpfwVI_B", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_B_tarn51c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_B_tarn51d", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
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
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Ju87_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Ju87_2", _sid];
		//_c pushBack format["%1LIB_DAK_Ju87", _sid];
		//_c pushBack format["%1LIB_Ju87_Italy2", _sid];
		//_c pushBack format["%1LIB_Ju87_Italy", _sid];
	};
	_c pushBack format["%1LIB_C47_RAF", _sid];			//for paradropers needed
	_c pushBack format["%1LIB_Ju87", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FW190F8_w", _sid];
		//_c pushBack format["%1LIB_FW190F8_2_w", _sid];
		//_c pushBack format["%1LIB_FW190F8_3_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo activea
		_c pushBack format["%1LIB_DAK_FW190F8", _sid];
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert2", _sid];
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert3", _sid];
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert", _sid];
		//_c pushBack format["%1LIB_FW190F8_Italy", _sid];
	};
	_c pushBack format["%1LIB_FW190F8", _sid];
	//_c pushBack format["%1LIB_FW190F8_4", _sid];
	//_c pushBack format["%1LIB_FW190F8_5", _sid];
	//_c pushBack format["%1LIB_FW190F8_2", _sid];
	//_c pushBack format["%1LIB_FW190F8_3", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

//add the paradroping units
_priorUnits = missionNamespace getVariable "CTI_VEHICLES_PARADROPERS";
_priorUnits pushBack format["%1LIB_C47_RAF", _sid];
missionNamespace setVariable ["CTI_VEHICLES_PARADROPERS", _priorUnits];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
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
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
	};
	_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
		_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Kfz1_w", _sid];
			_c pushBack format["%1LIB_Kfz1_Hood_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_Kfz1", _sid];
			_c pushBack format["%1LIB_DAK_Kfz1_hood", _sid];
		};
		_c pushBack format["%1LIB_Kfz1", _sid];
		_c pushBack format["%1LIB_Kfz1_Hood", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
			_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
			_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
		};
		_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
		_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_GER_Recruit_w", _sid];
			_c pushBack format["%1LIB_GER_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_medic", _sid];
			_c pushBack format["%1LIB_DAK_Sentry", _sid];
		};
		_c pushBack format["%1LIB_GER_rifleman", _sid];
		_c pushBack format["%1LIB_GER_medic", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
