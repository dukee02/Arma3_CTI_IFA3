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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
if (isNil "_priorUnits" || _ai == 3) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_Officer", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_Rifleman_Jerkins", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_Rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_Grenadier", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1LIB_UniversalCarrier", _sid], []], 
		[format["%1LIB_UniversalCarrier", _sid], []]
	]];

	//if a camo is active, we will overwrite it
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_Officer_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_Grenadier_w", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_Grenadier_w", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_w", _sid], []], 
			[format["%1LIB_UniversalCarrier_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_DR_Officer", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_DR_Grenadier", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_DR_Rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_DR_Rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_DR_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_DR_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_DR_Grenadier", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_desert", _sid], []], 
			[format["%1LIB_UniversalCarrier_desert", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

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

if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		_c pushBack format["%1LIB_UK_M16_Halftrack", _sid];
	};
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

if(CTI_IFA3_NEW > 0) then {
	_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_NEW_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_M3A3_Stuart_UK_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_M3A3_Stuart_DR", _sid];
		};
		_c pushBack format["%1LIB_M3A3_Stuart_UK", _sid];
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_M5A1_Stuart_UK_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_M5A1_Stuart_DR", _sid];
		};
		_c pushBack format["%1LIB_M5A1_Stuart_UK", _sid];
	};
	_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Cromwell_Mk4_w", _sid];
		if(CTI_IFA3_NEW > 0) then {
			_c pushBack format["%1LIB_Cromwell_Mk6_w", _sid];
		};
	};
	_c pushBack format["%1LIB_Cromwell_Mk4", _sid];
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_Cromwell_Mk6", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		if(CTI_IFA3_NEW > 0) then {
			_c pushBack format["%1LIB_Sherman_I_w", _sid];
			_c pushBack format["%1LIB_Sherman_IB_w", _sid];
		};
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_M4A3_75", _sid];
	};
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_Sherman_I", _sid];
		_c pushBack format["%1LIB_Sherman_IB", _sid];
	} else {
		_c pushBack format["%1LIB_UK_Italy_M4A3_75", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		if(CTI_IFA3_NEW > 0) then {
			_c pushBack format["%1LIB_IC_Firefly_w", _sid];
		};
	};
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_IC_Firefly", _sid];
	} else {
		_c pushBack format["%1LIB_M4A4_FIREFLY", _sid];
	};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//_c pushBack format["%1LIB_AustinK5_DR_Tent", _sid];					//repairtruck
	//};
	//_c pushBack format["%1LIB_AustinK5_Tent", _sid];						//repairtruck
	_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
};
if(CTI_IFA3_NEW >= 0) then {
	if!(CTI_UK_SIDE == CTI_US_SIDE) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
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
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1LIB_UK_LCA", _sid];
	_c pushBack format["%1LIB_UK_LCI", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
