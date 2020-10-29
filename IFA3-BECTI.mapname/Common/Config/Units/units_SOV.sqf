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
if(CTI_VIO_ADDON == 0) then {_sid = "";};

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

private _tech_level_no_upgrade_inv = 1;
private _tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_LC_rifleman_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Rifleman_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Rifleman_ADS_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Sergeant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Staff_sergeant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Unequip_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Sapper_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Assault_smgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_LAT_Soldier_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_AT_grenadier_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_grenadier_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Medic_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Smgunner_w2", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Smgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
	};
		
	_c pushBack format["%1LIB_SOV_unequip", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_crew", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_rifleman", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_sapper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_grenadier", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_assault_smgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_LC_rifleman_summer", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_AT_grenadier", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_LAT_Soldier", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_gun_crew", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_LC_rifleman", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_medic", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_smgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_pilot", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_overall_crew", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
};

//Level 1
_tech_level = _tech_level + 1;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_Assault_sergeant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_AT_M1A1_soldier_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Assault_mgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Mgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_P_officer_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Operator_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
	};

	_c pushBack format["%1LIB_SOV_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_assault_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_staff_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_assault_mgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_smgunner_summer", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_AT_M1A1_soldier", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_mgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_gun_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_operator", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_overall_sergeant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
};
//Level 2
_tech_level = _tech_level + 1;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_Scout_smgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_mgunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_rifleman_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_p_officer_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_sergeant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_lieutenant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Scout_sniper_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_scout_atrifle_assistant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_scout_atrifle_gunner_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_AT_soldier_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Captain_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_First_lieutenant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
		_c pushBack format["%1LIB_SOV_Lieutenant_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	
	};

	_c pushBack format["%1LIB_SOV_p_officer", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_gun_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_captain", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_captain_summer", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_AT_soldier", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_smgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_mgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_rifleman", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_p_officer", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_sniper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_atrifle_assistant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_atrifle_gunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	//possible camo for desert
	_c pushBack format["%1LIB_SOV_scout_sniper_spring", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_sniper_autumn", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_scout_rifleman_autumn", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_first_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_captain", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_overall_lieutenant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_SOV_tank_overall_captain", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
};

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
};
//Level 1
_tech_level = 1;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis5v_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Zis5v_med_w", _sid];					//medic
		_p pushBack '';
		_n pushBack 'Zis5v Mobile Respawn';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 0;
		//_c pushBack format["%1LIB_Zis6_parm_w", _sid];				//repairtruck
		//_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_Zis5v", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Zis5v_61K", _sid];				//Flak
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Zis5v_Med", _sid];				//medic
	_p pushBack '';
	_n pushBack 'Zis5v Mobile Respawn';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 0;
	//_c pushBack format["%1LIB_Zis6_Parm", _sid];				//repairtruck
	//_c pushBack format["%1LIB_Zis5v_Fuel", _sid];				//fueltruck
};
//Level 2
_tech_level = 2;
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SOV_M3_Halftrack_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Scout_M3_FFV_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Scout_m3_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Willys_MB_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Willys_MB_Hood_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_Willys_MB_Ambulance_w", _sid];	//medic
		_p pushBack '';
		_n pushBack 'Willys Mobile Respawn';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_SOV_M3_Halftrack", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Scout_M3", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Scout_M3_FFV", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Willys_MB", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Willys_MB_Hood", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_Willys_MB_Ambulance", _sid];			//medic
	_p pushBack '';
	_n pushBack 'Willys Mobile Respawn';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 0;
};
//Level 3
_tech_level = 3;
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz251_captured_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_SdKfz251_captured_FFV_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_SdKfz251_captured", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_SdKfz251_captured_FFV", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	//_c pushBack format["%1LIB_US6_Tent", _sid];
	//_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open_Cargo", _sid];
	//_c pushBack format["%1LIB_US6_Open", _sid];
	//_c pushBack format["%1LIB_US6_Ammo", _sid];					//ammotruck
};
//Level 4
_tech_level = 4;
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_SOV_M16_Halftrack", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_US6_BM13", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%LIB_UniversalCarrier_SOV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
};
_tech_level = 1;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_T34_76_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		if(CTI_IFA3_NEW > 0) then {
			_c pushBack format["%1LIB_M3A3_Stuart_SOV_w", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
			_t pushBack _building_time;
			_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 0;
		};
	};
	_c pushBack format["%1LIB_T34_76", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 0;
	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_M3A3_Stuart_SOV", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
};
//Level 2
_tech_level = 2;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_M4A2_SOV_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
		_c pushBack format["%1LIB_SU85_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_SU85", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 0;
};
//Level 3
_tech_level = 3;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_T34_85_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_T34_85", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 0;
	_c pushBack format["%1LIB_M4A2_SOV", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 0;
};
//Level 4
_tech_level = 4;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_JS2_43_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_JS2_43", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1LIB_Li2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2;
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	
	_tech_level = _tech_level + 1;
};
//Level 2
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1LIB_Pe2_2_w", _sid];
	//	_c pushBack format["%1LIB_Pe2_w", _sid];
	//};
	_c pushBack format["%1LIB_Pe2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	_tech_level = _tech_level + 1;
};
//Level 3
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_P39_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 0;
	};
	_c pushBack format["%1LIB_P39", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	//_c pushBack format["%1LIB_RA_P39_3", _sid];
	//_c pushBack format["%1LIB_RA_P39_2", _sid];
	
	_tech_level = _tech_level + 1;
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 0;
		
	};
		
	_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_Zis5v", _sid],"salvager"];
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_Zis5v", _sid],"salvager-independent"];
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];					//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 0;	

	};	

	_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 0;	
};
/*_tech_level = 3;
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 0;	

};*/


//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";