private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];

//if(CTI_IFA_ADDON > 0) then {
if (isClass(configFile >> "CfgVehicles" >> "LIB_UK_LCA")) then {
	_side = _this;
	_sid = "";
	_tag = "GUER_";
	_setupBaseUnits = false;

	switch (_side) do {
		case west: {
			_sid = "VIOC_B_";_tag = "WEST_";
		};
		case east: {
			_sid = "VIOC_O_";_tag = "EAST_";
		};
		case resistance: {
			_sid = "VIOC_I_";_tag = "GUER_";
		};
		default {_sid = "";};
	};
	if !(("LIB_LCA") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

	//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

	if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_IFA_Naval.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

	//***************************************************************************************************************************************
	//														Naval Factory																	*
	//***************************************************************************************************************************************
	//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
	//We can balance the water units only if we activate them for both sides
	_c = [];
	_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_NAVAL, 0, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

	if(_side == west) then {
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1LIB_LCA", _sid];
			_c pushBack format["%1LIB_LCVP", _sid];
		};
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1LIB_LCI", _sid];
			_c pushBack format["%1LIB_LCM3_Armed", _sid];
		};
	};

	if(_side == east) then {
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1LIB_UK_LCA", _sid];
			_c pushBack format["%1LIB_LCVP", _sid];
		};
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1LIB_UK_LCI", _sid];
			_c pushBack format["%1LIB_LCM3_Armed", _sid];
		};
	};

	_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
	if (isNil "_priorUnits") then { 
		_priorUnits = []; 
	} else {
		_c append _priorUnits; 
	};

	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_IFA_Naval.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
	missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
};
