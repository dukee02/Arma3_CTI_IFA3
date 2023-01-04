private ["_c", "_d", "_m", "_u", "_upgrade_levels_east", "_upgrade_levels_west", "_cntstart", "_cntend"];

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels_east = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", east];
if (isNil "_upgrade_levels_east") then { 
	_upgrade_levels_east = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};
_upgrade_levels_west = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", west];
if (isNil "_upgrade_levels_west") then { 
	_upgrade_levels_west = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

_c = []; //--- Classname
_d = []; //--- Cathegory
_m = []; //--- Max amount per vehicle.
_u = []; //--- Upgrade level needed.    0 1 2 3...

//*********************************************************************************************************************************************
//														air-to-air missile																	  *
//*********************************************************************************************************************************************
_tech_level = 0;

//*****************************************************LEVEL*1****************************************************************************
/*_tech_level = 1;

//_c pushBack "PylonMissile_1Rnd_AAA_missiles";			//ASRAAM 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-air";
	_m pushBack 100;
	_u pushBack _tech_level;
};*/

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};

//*********************************************************************************************************************************************
//														air-to-surface missile																  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
/*_tech_level = 1;

//_c pushBack "PylonRack_12Rnd_PG_missiles";				//DAGR 				<Short-range, laser/infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};*/

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};

//*********************************************************************************************************************************************
//														Unguided rockets																	  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
/*_tech_level = 1;

//_c pushBack "PylonRack_12Rnd_missiles";					//DAR 				<Unguided rockets with high-explosive warhead>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};*/

//*********************************************************************************************************************************************
//														bomb																				  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
_tech_level = 1;

_c pushBack "LIB_1Rnd_SC50";							//SC-50

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*2****************************************************************************
_tech_level = 2;

_c pushBack "LIB_1Rnd_FAB250";							//FAB-250 bomb
_c pushBack "LIB_1Rnd_SC250";							//SC-250

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*3****************************************************************************
_tech_level = 3;

_c pushBack "LIB_1Rnd_US_500lb";						//500 lb Bomb
_c pushBack "LIB_1Rnd_SC500";							//SC-500

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};

//*********************************************************************************************************************************************
//														weapon pod																		  *
//*********************************************************************************************************************************************

//_c pushBack "PylonWeapon_300Rnd_20mm_shells";		//Twin Cannon 20mm <20mm twin-cannon weapon pod>

// set all other vars in a slope
/*_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "weapon pod";
	_m pushBack 100;
	_u pushBack _tech_level;
};*/

//*********************************************************************************************************************************************
//														special-purpose																		  *
//*********************************************************************************************************************************************
/*
_c pushBack "Pylon_1Rnd_Leaflets_West_F";		//Leaflets (NATO) <Paper leaflets with important information printed on them>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "special-purpose";
	_m pushBack 100;
	_u pushBack _tech_level;
};
*/
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["pylons declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_c, _d, _m, _u] call compile preprocessFileLineNumbers "Common\Config\pylons\Set_Pylons.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", east], _upgrade_levels_east];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", east, _upgrade_levels_east]] call CTI_CO_FNC_Log};
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", west], _upgrade_levels_west];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", west, _upgrade_levels_west]] call CTI_CO_FNC_Log};
