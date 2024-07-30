private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

//if(CTI_IFA_ADDON > 0) then {
if (isClass(configFile >> "CfgVehicles" >> "LIB_UK_LCA")) then {
	_side = _this;
	_faction = "";
	_sid = "";
	_building_time = 10;
	_tech_level = 0;

	if(_side == west) then {
		_sid = "VIOC_B_";
		_faction = "West";
	} else {
		if(_side == east) then {
			_sid = "VIOC_O_";
			_faction = "East";
		} else {
			_sid = "VIOC_I_";
			_faction = "Resistance";
		};
	};
	if !(("LIB_LCA") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

	//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
	_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
	if (isNil "_upgrade_levels") then { 
		_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
	};

	_c = []; //--- Classname
	_p = []; //--- Picture. 				'' = auto generated.
	_n = []; //--- Name. 					'' = auto generated.
	_o = []; //--- Price.
	_t = []; //--- Build time.
	_u = []; //--- Upgrade level needed.    0 1 2 3...
	_f = []; //--- Built from Factory.
	_s = []; //--- Script
	_d = []; //--- Extra Distance (From Factory)

	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_IFA_Naval.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

	//***************************************************************************************************************************************
	//														Naval Factory																	*
	//***************************************************************************************************************************************
	//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
	//We can balance the water units only if we activate them for both sides
	_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_NAVAL, 0, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

	if(_side == west) then {
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
			
			_c pushBack format["%1LIB_UK_LCA", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1LIB_LCVP", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
			
			_c pushBack format["%1LIB_UK_LCI", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1LIB_LCM3_Armed", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
	};
	if(_side == east) then {
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
			
			_c pushBack format["%1LIB_LCA", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1LIB_LCVP", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
			
			_c pushBack format["%1LIB_LCI", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1LIB_LCM3_Armed", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
	};

	//Update the calculatetd max upgrade level
	if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
		_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
	};

	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_IFA_Naval.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

	[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

	//all units are declared, we update the possible upgrades
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_IFA_Naval.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
