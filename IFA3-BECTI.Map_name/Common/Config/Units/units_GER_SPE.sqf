private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_faction = "";
_sid = "";
_building_time = 10;

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
if !(("SPE_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_rifleman_lite", _sid];
		_c pushBack format["%1SPE_GER_rifleman", _sid];
		_c pushBack format["%1SPE_GER_rifleman_2", _sid];
		_c pushBack format["%1SPE_GER_radioman", _sid];
		_c pushBack format["%1SPE_GER_sapper", _sid];
		_c pushBack format["%1SPE_GER_sapper_gefr", _sid];
		_c pushBack format["%1SPE_GER_medic", _sid];
		_c pushBack format["%1SPE_GER_ober_rifleman", _sid];
		_c pushBack format["%1SPE_GER_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_GER_ober_grenadier", _sid];
		_c pushBack format["%1SPE_GER_Mortar_Gunner", _sid];
		_c pushBack format["%1SPE_GER_Mortar_AGunner", _sid];
		_c pushBack format["%1SPE_GER_Mortar_AmmoBearer", _sid];
		_c pushBack format["%1SPE_GER_AT_grenadier", _sid];
		_c pushBack format["%1SPE_GER_LAT_Klein_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_gun_crew", _sid];
		_c pushBack format["%1SPE_GER_spg_crew", _sid];
		_c pushBack format["%1SPE_GER_tank_crew", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier_Assistant", _sid];
		_c pushBack format["%1SPE_GER_AT_Soldier_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_Sentry_MP40", _sid];
		_c pushBack format["%1SPE_GER_Sentry_K98k", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_rifleman_lite", _sid];
		_c pushBack format["%1SPE_sturmtrooper_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ober_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_radioman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_medic", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sapper", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sapper_gefr", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Flamethrower_Operator", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_AmmoBearer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_AGunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Mortar_Gunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_AT_grenadier", _sid];
		_c pushBack format["%1SPE_sturmtrooper_LAT_Klein_Rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ober_grenadier", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_crew", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier_Assistant", _sid];
		_c pushBack format["%1SPE_ST_AT_Soldier_SquadLead", _sid];
		_c pushBack format["%1SPE_ST_Sentry_MP35", _sid];
		_c pushBack format["%1SPE_ST_Sentry_MP40", _sid];
		_c pushBack format["%1SPE_ST_Sentry_K98k", _sid];
	};
	_c pushBack format["%1SPE_GER_flak_gun_crew", _sid];
	_c pushBack format["%1SPE_GER_flak_gun_SquadLead", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_LAT_30m_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_LAT_Rifleman", _sid];
		_c pushBack format["%1SPE_GER_amgunner", _sid];
		_c pushBack format["%1SPE_GER_mgunner2", _sid];
		_c pushBack format["%1SPE_GER_mgunner", _sid];
		_c pushBack format["%1SPE_GER_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_Assist_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_gun_SquadLead", _sid];
		_c pushBack format["%1SPE_GER_spg_unterofficer", _sid];
		_c pushBack format["%1SPE_GER_tank_unterofficer", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_LAT_30m_Rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_LAT_rifleman", _sid];
		_c pushBack format["%1SPE_sturmtrooper_amgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_mgunner2", _sid];
		_c pushBack format["%1SPE_sturmtrooper_mgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_SquadLead", _sid];
		_c pushBack format["%1SPE_sturmtrooper_Assist_SquadLead", _sid];
		_c pushBack format["%1SPE_sturmtrooper_standartenfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_unterofficer", _sid];
	};
	_c pushBack format["%1SPE_GER_pilot", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1SPE_GER_hmgunner", _sid];
		_c pushBack format["%1SPE_GER_hmgunner2", _sid];
		_c pushBack format["%1SPE_GER_HMG_AmmoBearer", _sid];
		_c pushBack format["%1SPE_GER_ahmgunner", _sid];
		_c pushBack format["%1SPE_GER_stggunner", _sid];
		_c pushBack format["%1SPE_GER_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_hauptmann", _sid];
		_c pushBack format["%1SPE_GER_oberst", _sid];
		_c pushBack format["%1SPE_GER_ober_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_gun_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_spg_lieutenant", _sid];
		_c pushBack format["%1SPE_GER_tank_lieutenant", _sid];
	};
	if(CTI_CAMO_ACTIVATION <= 4 || CTI_CAMO_ACTIVATION >= 3) then {		//other/all camo active
		_c pushBack format["%1SPE_sturmtrooper_hmgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_hmgunner2", _sid];
		_c pushBack format["%1SPE_sturmtrooper_HMG_AmmoBearer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_ahmgunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_stggunner", _sid];
		_c pushBack format["%1SPE_sturmtrooper_sniper", _sid];
		_c pushBack format["%1SPE_sturmtrooper_obersturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_untersturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_hauptsturmfuhrer", _sid];
		_c pushBack format["%1SPE_sturmtrooper_tank_lieutenant", _sid];
	};
	_c pushBack format["%1SPE_GER_scout_amgunner", _sid];
	_c pushBack format["%1SPE_GER_scout_mgunner2", _sid];
	_c pushBack format["%1SPE_GER_scout_mgunner", _sid];
	_c pushBack format["%1SPE_GER_scout_rifleman", _sid];
	_c pushBack format["%1SPE_GER_scout_ober_rifleman", _sid];
	_c pushBack format["%1SPE_GER_scout_lieutenant", _sid];
	_c pushBack format["%1SPE_GER_scout_sniper", _sid];
	_c pushBack format["%1SPE_GER_scout_SquadLead", _sid];
	_c pushBack format["%1SPE_GER_scout_ober_grenadier", _sid];
	_c pushBack format["%1SPE_GER_scout_Assist_SquadLead", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1SPE_GER_R200_Unarmed", _sid];
	_c pushBack format["%1SPE_GER_R200_Hood", _sid];
	//_c pushBack format["%1SPE_ST_R200_Unarmed", _sid];
	//_c pushBack format["%1SPE_ST_R200_Hood", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};
	
	_c pushBack format["%1SPE_GER_R200_MG34", _sid];
	//_c pushBack format["%1SPE_ST_R200_MG34", _sid];
	_c pushBack format["%1SPE_OpelBlitz_Open", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};

	_c pushBack format["%1SPE_OpelBlitz_Ambulance", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'OpelBlitz Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_SdKfz250_1", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_OpelBlitz_Flak38", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
//Level 0
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1SPE_StuG_III_G_Early", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;
	
	_c pushBack format["%1SPE_PzKpfwIII_J", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_L", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_StuH_42", _sid];
	_c pushBack format["%1SPE_StuG_III_G_late", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	
	_c pushBack format["%1SPE_PzKpfwIII_M", _sid];
	_c pushBack format["%1SPE_PzKpfwIII_N", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_StuG_III_G_SKB", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;

	_c pushBack format["%1SPE_PzKpfwIV_G", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_Nashorn", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};

	_c pushBack format["%1SPE_PzKpfwVI_H1", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
};


_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_Jagdpanther_G1", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};

	_c pushBack format["%1SPE_PzKpfwV_G", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 1
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1SPE_FW190F8", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
_c pushBack format["%1SPE_OpelBlitz_Repair", _sid];						//repairtruck
_p pushBack '';
_n pushBack 'Repair Truck';
_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-repairtruck";
_d pushBack 5;

_c pushBack format["CTI_Salvager_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1SPE_OpelBlitz", _sid],"salvager"];
_d pushBack 5;
		
_c pushBack format["CTI_Salvager_Independent_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1SPE_OpelBlitz", _sid],"salvager-independent"];
_d pushBack 5;

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.

_c pushBack format["%1SPE_OpelBlitz_Ammo", _sid];						//ammotruck
_p pushBack '';
_n pushBack 'Ammo Truck';
_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-ammotruck";
_d pushBack 5;	

_c pushBack format["%1SPE_OpelBlitz_Fuel", _sid];						//fueltruck
_p pushBack '';
_n pushBack 'Fuel Truck';
_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-fueltruck";
_d pushBack 5;

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SPE_ID] call CTI_CO_FNC_GetTechmatrix;

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
