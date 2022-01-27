private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_ai = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
	_ai = CTI_WEST_AI;
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_ai = CTI_EAST_AI;
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
if (isNil "_priorUnits" || _ai == 1) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_SOV_captain_summer", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_SOV_unequip", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_SOV_tank_crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_SOV_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_SOV_tank_crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_SOV_pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_SOV_sapper", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1LIB_GazM1_SOV_camo_sand", _sid], []], 
		[format["%1LIB_GazM1_SOV_camo_sand", _sid], []]
	]];

	//if a camo is active, we will overwrite it
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_SOV_Captain_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_SOV_Unequip_w", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_SOV_Sapper_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_SOV_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_SOV_tank_crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_SOV_pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_SOV_grenadier_w", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_GazM1_SOV", _sid], []], 
			[format["%1LIB_GazM1_SOV", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_SOV_captain", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_SOV_gun_crew", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_SOV_gun_crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_SOV_LC_rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_SOV_tank_crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_SOV_pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_SOV_gun_crew", _sid]];

		//Set starting vehicles
		/*missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_GazM1_SOV_camo_sand", _sid], []], 
			[format["%1LIB_GazM1_SOV_camo_sand", _sid], []]
		]];*/
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

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
		_c pushBack format["%1LIB_SOV_M3_Halftrack_w", _sid];
		_c pushBack format["%1LIB_Scout_M3_FFV_w", _sid];
		_c pushBack format["%1LIB_Scout_m3_w", _sid];
		_c pushBack format["%1LIB_Willys_MB_Ambulance_w", _sid];	//medic
	};
	_c pushBack format["%1LIB_SOV_M3_Halftrack", _sid];
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
	};
	_c pushBack format["%1LIB_SdKfz251_captured", _sid];
	_c pushBack format["%1LIB_SdKfz251_captured_FFV", _sid];
	//_c pushBack format["%1LIB_US6_Tent", _sid];
	//_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open", _sid];
	//_c pushBack format["%1LIB_US6_Ammo", _sid];					//ammotruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_SOV_M16_Halftrack", _sid];
	};
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
if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		_c pushBack format["%1LIB_UniversalCarrier_SOV", _sid];
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_M3A3_Stuart_SOV_w", _sid];
		};
		_c pushBack format["%1LIB_M3A3_Stuart_SOV", _sid];
	};
};
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
	};
	_c pushBack format["%1LIB_SU85", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_M4A2_SOV_w", _sid];
	};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
	};
	_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
};
if(CTI_IFA3_NEW >= 0) then {
	_c pushBack format["CTI_Salvager_%1", _side];
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
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
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
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
		};
		_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
	};
	//if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		//_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
	//};
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
_c = [];
/*
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
*/

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
