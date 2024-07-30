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
if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _sid];
		//_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _sid];
		_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _sid];
		//_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
		//_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		//_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Tent", _sid];
		_c pushBack format["%1LIB_DAK_OpelBlitz_Open", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_MG42", _sid];
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];			//repairtruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];			//ammotruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];			//fueltruck
	};
	//_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid];
	_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _sid];
	_c pushBack format["%1LIB_Kfz1_MG42", _sid];
	//_c pushBack format["%1LIB_Kfz1_MG42_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_MG42_sernyt", _sid];	
	//_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];					//repairtruck
	//_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];					//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];					//fueltruck
	
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
	
	//the special units needs a seperated declaration depends on an other prize
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1LIB_OpelBlitz_Ambulance_w", _sid];			//medic
		};
		case 2: {//Summer camo active
			_c pushBack format["%1LIB_DAK_OpelBlitz_Ambulance", _sid];			//medic
		};
		default {
			_c pushBack format["%1LIB_OpelBlitz_Ambulance", _sid];				//medic
		};
	};
	
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_DAK_Scout_M3", _sid];
	_c pushBack format["%1LIB_DAK_Scout_M3_FFV", _sid];
	
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_AA_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7_AA", _sid];
	};
	_c pushBack format["%1LIB_SdKfz_7_AA", _sid];
	
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_StuG_III_G_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
		_c pushBack format["%1LIB_StuG_III_G_WS_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_StuG_III_G", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;
	
	_c pushBack format["%1LIB_SdKfz124", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwIV_H_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_PzKpfwIV_H", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	_c pushBack format["%1LIB_PzKpfwIV_H", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwVI_E_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_PzKpfwVI_E", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	_c pushBack format["%1LIB_PzKpfwVI_E", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;
	//other cammos
	//_c pushBack format["%1LIB_PzKpfwVI_E_2", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn51c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn51d", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn52c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_tarn52d", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_E_1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwV_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_PzKpfwV", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwVI_B_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;
		//_c pushBack format["%1LIB_PzKpfwVI_B_camo_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_PzKpfwVI_B", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 5;
	//_c pushBack format["%1LIB_PzKpfwVI_B_tarn51c", _sid];
	//_c pushBack format["%1LIB_PzKpfwVI_B_tarn51d", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Ju87_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Ju87_2", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
		/*_c pushBack format["%1LIB_DAK_Ju87", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
		_c pushBack format["%1LIB_Ju87_Italy2", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
		_c pushBack format["%1LIB_Ju87_Italy", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;*/
	};
	_c pushBack format["%1LIB_C47_RAF", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
	
	_c pushBack format["%1LIB_Ju87", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FW190F8_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
		//_c pushBack format["%1LIB_FW190F8_2_w", _sid];
		//_c pushBack format["%1LIB_FW190F8_3_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_FW190F8", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 5;
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert2", _sid];
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert3", _sid];
		//_c pushBack format["%1LIB_DAK_FW190F8_Desert", _sid];
		//_c pushBack format["%1LIB_FW190F8_Italy", _sid];
	};
	_c pushBack format["%1LIB_FW190F8", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
	//_c pushBack format["%1LIB_FW190F8_4", _sid];
	//_c pushBack format["%1LIB_FW190F8_5", _sid];
	//_c pushBack format["%1LIB_FW190F8_2", _sid];
	//_c pushBack format["%1LIB_FW190F8_3", _sid];
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

if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active		
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];					//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 5;
		
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active		
		_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 5;
		
	};
		
	_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 5;		
};

_c pushBack format["CTI_Salvager_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid],"salvager"];
_d pushBack 5;
		
_c pushBack format["CTI_Salvager_Independent_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid],"salvager-independent"];
_d pushBack 5;

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];					//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 5;	

		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];					//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 5;	

	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 5;	

		_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 5;	

	};
	_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];							//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;
};

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
//--- For balancing the naval on all maps, wo put them into file units_IFA_Naval
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
