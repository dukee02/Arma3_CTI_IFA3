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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_POL.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

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
	
	_c pushBack format["%1LIB_WP_Strzelec", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Starszy_strzelec", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Radioman", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Saper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Medic", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	if(CTI_VIO_ADDON > 0) then {
		_c pushBack format["%1WP_AT_soldier", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
};

//Level 1
_tech_level = _tech_level + 1;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
		
	_c pushBack format["%1LIB_WP_Porucznic", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Starszy_saper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Sierzant", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Mgunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	if(CTI_VIO_ADDON == 0) then {
		_c pushBack format["%1WP_HAT_soldier", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
};

//Level 2
_tech_level = _tech_level + 1;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	
	_c pushBack format["%1LIB_WP_Sniper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_WP_Stggunner", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 0;
	
	if(CTI_VIO_ADDON == 0) then {
		_c pushBack format["%1WP_HAT_soldier2", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;
	};
};


//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time}};
		
	_c pushBack format["%1LIB_GazM1_FFI_sand", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1LIB_GazM1_FFI_camo_sand", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_POL.sqf", format["units declared: [%1] | [%2]", count _c, count _n]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";