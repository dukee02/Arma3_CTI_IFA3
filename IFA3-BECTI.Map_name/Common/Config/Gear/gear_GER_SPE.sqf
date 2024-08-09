private ["_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level", "_upgrade_levels"];

_side = _this;
_upgrade_levels = [];
_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
};

_i = [];
_u = [];
_p = [];

//---------------------------Grenades and mines-----------------------------------------
_tech_level = 0;

_i pushBack "SPE_SMI_35_1_MINE_mag";
_i pushBack "SPE_SMI_35_MINE_mag";
_i pushBack "SPE_SMI_35_Pressure_MINE_mag";
_i pushBack "SPE_STMI_MINE_mag";
_i pushBack "SPE_shumine_42_MINE_mag";
_i pushBack "SPE_Ladung_Small_MINE_mag";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_Ladung_Big_MINE_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Shg24x7_Improvised_Mine_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_TMI_42_MINE_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,400] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_Shg24";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Shg24_Frag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Shg24x7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_NB39";
_i pushBack "SPE_NBK39b";
_i pushBack "SPE_Blendkorper_2H";
_i pushBack "SPE_Handrauchzeichen_Red";
_i pushBack "SPE_Handrauchzeichen_Violet";
_i pushBack "SPE_Handrauchzeichen_Yellow";
_i pushBack "SPE_Rauchsichtzeichen_Orange";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_1Rnd_G_SPRGR_30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_G_PZGR_30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_G_PZGR_40";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_G_NBGR_42";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_G_FLGR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "SPE_P08";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_8Rnd_9x19_P08";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_K98";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_K98_Late";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_792x57_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_792x57_sS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_792x57_SMK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_K98_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_GW_SB_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_MP35";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_32Rnd_MP35_9x19";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_32rnd_MP35_9x19_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_24Rnd_MP35_9x19";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,24,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_24rnd_MP35_9x19_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,24,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_Flammenwerfer41";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Flammenwerfer41_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Faustpatrone";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_Faustpatrone";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_PzFaust_30m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_PzFaust_30m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//------------------------------------Uniforms------------------------------------
_i pushBack "U_SPE_GER_Soldier_Gaiters";
_i pushBack "U_SPE_GER_Soldier_Unbloused";
_i pushBack "U_SPE_GER_Soldier_Boots";
_i pushBack "U_SPE_GER_Oberschutze";
_i pushBack "U_SPE_GER_Gefreiter";
_i pushBack "U_SPE_GER_Gefreiter_Gaiters";
_i pushBack "U_SPE_GER_Unterofficer";
_i pushBack "U_SPE_GER_Medic";
_i pushBack "U_SPE_GER_MG_schutze";
_i pushBack "U_SPE_GER_Leutnant";
_i pushBack "U_SPE_GER_Oberleutnant";
_i pushBack "U_SPE_GER_Hauptmann";
_i pushBack "U_SPE_GER_Oberst";

_i pushBack "U_SPE_GER_Art_schutze";
_i pushBack "U_SPE_GER_Art_unterofficer";
_i pushBack "U_SPE_GER_Art_leutnant";
_i pushBack "U_SPE_GER_Schutze_HBT";
_i pushBack "U_SPE_GER_Unterofficer_HBT";
_i pushBack "U_SPE_GER_MG_schutze_HBT";

_i pushBack "U_SPE_GER_Tank_crew_private";
_i pushBack "U_SPE_GER_Tank_crew_unterofficer";
_i pushBack "U_SPE_GER_Tank_crew_leutnant";
_i pushBack "U_SPE_GER_tank_hbt_crew_private";
_i pushBack "U_SPE_GER_tank_hbt_crew_unterofficer";
_i pushBack "U_SPE_GER_tank_hbt_crew_leutnant";
_i pushBack "U_SPE_GER_Spg_crew_private";
_i pushBack "U_SPE_GER_Spg_crew_unterofficer";
_i pushBack "U_SPE_GER_Spg_crew_leutnant";
_i pushBack "U_SPE_GER_Spg_hbt_crew_private";
_i pushBack "U_SPE_GER_Spg_hbt_crew_unterofficer";
_i pushBack "U_SPE_GER_Spg_hbt_crew_leutnant";
_i pushBack "U_SPE_GER_lehr_private";
_i pushBack "U_SPE_GER_lehr_gefreiter";
_i pushBack "U_SPE_GER_lehr_unterofficer";
_i pushBack "U_SPE_GER_lehr_leutnant";
_i pushBack "U_SPE_GER_LW_pilot";
_i pushBack "U_SPE_GER_LW_pilot_alt";
_i pushBack "U_SPE_GER_LW_pilot_weiss";
_i pushBack "U_SPE_GER_LW_pilot_weiss_alt";
_i pushBack "U_SPE_GER_LW_pilot_trop";
_i pushBack "U_SPE_GER_LW_pilot_trop_alt";
//Sturmtruppen
_i pushBack "U_SPE_ST_Soldier_E44";
_i pushBack "U_SPE_ST_MGunner_E44";
_i pushBack "U_SPE_ST_Medic_E44";
_i pushBack "U_SPE_ST_Unterofficier_E44";
_i pushBack "U_SPE_ST_Mix_E44";
_i pushBack "U_SPE_ST_Mix_E44_roll";
_i pushBack "U_SPE_ST_Soldier_E44_Camo";
_i pushBack "U_SPE_ST_Soldier_E44_Camo2";
_i pushBack "U_SPE_ST_Soldier_Camo";
_i pushBack "U_SPE_ST_Soldier_Camo2";
_i pushBack "U_SPE_ST_Sniper";
_i pushBack "U_SPE_ST_Sniper2";
_i pushBack "U_SPE_ST_Tank_crew_spring";
_i pushBack "U_SPE_ST_Tank_crew_autumn";
_i pushBack "U_SPE_ST_Tank_crew_spring_open";
_i pushBack "U_SPE_ST_Tank_crew_autumn_open";
_i pushBack "U_SPE_ST_Untersturmfuhrer";
_i pushBack "U_SPE_ST_Obersturmfuhrer";
_i pushBack "U_SPE_ST_Hauptsturmfuhrer";
_i pushBack "U_SPE_ST_Standartenfuhrer";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------Helms-------------------------------------------
_i pushBack "H_SPE_GER_Fieldcap";
_i pushBack "H_SPE_GER_Fieldcap2";
_i pushBack "H_SPE_GER_ST_Tanker_Cap";
_i pushBack "H_SPE_GER_ST_Tanker_Cap2";
_i pushBack "H_SPE_GER_TankOfficerCap";
_i pushBack "H_SPE_GER_TankOfficerCap2";
_i pushBack "H_SPE_GER_TankPrivateCap";
_i pushBack "H_SPE_GER_TankPrivateCap2";
_i pushBack "H_SPE_GER_TankPrivateCap3";
_i pushBack "H_SPE_GER_TankOffzCap";
_i pushBack "H_SPE_GER_TankOffzCap2";
_i pushBack "H_SPE_GER_TankOffzCap3";
_i pushBack "H_SPE_GER_SPGPrivateCap";
_i pushBack "H_SPE_GER_SPGPrivateCap2";
_i pushBack "H_SPE_GER_OfficerCap";
_i pushBack "H_SPE_GER_ArtOfficerCap";
_i pushBack "H_SPE_GER_PzgrenOfficerCap";
_i pushBack "H_SPE_GER_Cap";
_i pushBack "H_SPE_GER_Cap_Offz";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "H_SPE_GER_Helmet";
_i pushBack "H_SPE_GER_Helmet_net";
_i pushBack "H_SPE_GER_Helmet_ns";
_i pushBack "H_SPE_GER_Helmet_ns_wire";
_i pushBack "H_SPE_GER_Helmet_ns_wire_painted";
_i pushBack "H_SPE_GER_Helmet_os";
_i pushBack "H_SPE_GER_Helmet_Medic";
_i pushBack "H_SPE_GER_Helmet_painted";
_i pushBack "H_SPE_GER_Helmet_net_painted";
_i pushBack "H_SPE_GER_Helmet_ns_painted";
_i pushBack "H_SPE_GER_Helmet_os_painted";
_i pushBack "H_SPE_GER_Helmet_Glasses";
_i pushBack "H_SPE_GER_Helmet_Glasses_painted";
_i pushBack "H_SPE_GER_HelmetUtility";
_i pushBack "H_SPE_GER_HelmetUtility_OS";
_i pushBack "H_SPE_GER_HelmetUtility_Grass";
_i pushBack "H_SPE_GER_HelmetUtility_Grass_OS";
_i pushBack "H_SPE_GER_HelmetUtility_Oak";
_i pushBack "H_SPE_GER_HelmetUtility_Oak_OS";
//camo
_i pushBack "H_SPE_ST_Helmet";
_i pushBack "H_SPE_ST_Helmet2";
_i pushBack "H_SPE_ST_Helmet3";
_i pushBack "H_SPE_ST_Helmet4";
_i pushBack "H_SPE_GER_HelmetCamo";
_i pushBack "H_SPE_GER_HelmetCamo2";
_i pushBack "H_SPE_GER_HelmetCamo3";
_i pushBack "H_SPE_GER_HelmetCamo3_OS";
_i pushBack "H_SPE_GER_HelmetCamo4";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//-----------------------------------------Vests----------------------------------------------------
//load 80
_i pushBack "V_SPE_GER_TankPrivateBelt";
_i pushBack "V_SPE_GER_SniperBelt";
_i pushBack "V_SPE_GER_FieldOfficer";
_i pushBack "V_SPE_GER_PistolBelt";
_i pushBack "V_SPE_GER_LW_Schwimm";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load 100
_i pushBack "V_SPE_GER_VestKar98";
_i pushBack "V_SPE_GER_VestG43";
_i pushBack "V_SPE_GER_VestMG";
_i pushBack "V_SPE_GER_VestUnterofficer";
_i pushBack "V_SPE_DAK_VestKar98";
_i pushBack "V_SPE_DAK_VestG43";
_i pushBack "V_SPE_DAK_VestMG";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load 120
_i pushBack "V_SPE_GER_VestMP40";
_i pushBack "V_SPE_GER_VestSTG";
_i pushBack "V_SPE_DAK_VestMP40";
_i pushBack "V_SPE_DAK_VestSTG";
_i pushBack "V_SPE_DAK_VestUnterofficer";
_i pushBack "V_SPE_DAK_PioneerVest";
_i pushBack "V_SPE_DAK_FWOVest";
_i pushBack "V_SPE_DAK_SaniVest2";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load 120
_i pushBack "V_SPE_GER_PioneerVest";
_i pushBack "V_SPE_GER_FWOVest";
_i pushBack "V_SPE_GER_SaniVest";
_i pushBack "V_SPE_GER_SaniVest2";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//-------------------------------------------Backpacks----------------------------------------------------------
_i pushBack "B_SPE_GER_Flammenwerfer_41";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_SPE_GER_Radio";
_i pushBack "B_SPE_GER_Radio_battery";
_i pushBack "B_SPE_GER_LW_Paradrop";
_i pushBack "B_SPE_GER_Respawn_Tent";
_i pushBack "B_SPE_GER_Respawn_Tent_ST";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

/*----------------------------------------------------*/
_i pushBack "B_SPE_GER_Belt_bag_camo";
_i pushBack "B_SPE_GER_Belt_bag_zelt_camo";
_i pushBack "B_SPE_GER_erla_bag";
_i pushBack "B_SPE_GER_erla_bag_zelt";
_i pushBack "B_SPE_GER_erla_bag_ST_zelt";
_i pushBack "B_SPE_GER_Belt_bag_ST_zelt_camo";

_i pushBack "B_SPE_GER_FSJ_Belt_bag";
_i pushBack "B_SPE_GER_FSJ_Belt_bag_zelt";
_i pushBack "B_SPE_GER_FSJ_Belt_bag_zelt_trop";
_i pushBack "B_SPE_GER_FSJ_RPzB_Belt_bag";
_i pushBack "B_SPE_GER_FSJ_RPzB_Belt_bag_zelt";
_i pushBack "B_SPE_GER_FSJ_Pzf_Belt_bag";
_i pushBack "B_SPE_GER_FSJ_Pzf_Belt_bag_zelt";
_i pushBack "B_SPE_GER_FSJ_ammo_Belt_bag";
_i pushBack "B_SPE_GER_FSJ_ammo_Belt_bag_camo";
_i pushBack "B_SPE_GER_FSJ_ammo_Belt_bag_zelt";
_i pushBack "B_SPE_GER_FSJ_ammo_Belt_bag_zelt_camo";
_i pushBack "B_SPE_GER_RPzB_Belt_bag";
_i pushBack "B_SPE_GER_RPzB_Belt_bag_zelt";
_i pushBack "B_SPE_GER_Pzf_Belt_bag";
_i pushBack "B_SPE_GER_Pzf_Belt_bag_zelt";
_i pushBack "B_SPE_GER_ammo_Belt_bag";
_i pushBack "B_SPE_GER_ammo_Belt_bag_camo";
_i pushBack "B_SPE_GER_ammo_Belt_bag_zelt";
_i pushBack "B_SPE_GER_ammo_Belt_bag_zelt_camo";
_i pushBack "B_SPE_GER_ammo_Belt_bag_medic";
_i pushBack "B_SPE_ST_RPzB_Belt_bag_zelt";
_i pushBack "B_SPE_ST_Pzf_Belt_bag_zelt";
_i pushBack "B_SPE_ST_ammo_Belt_bag_zelt";
_i pushBack "B_SPE_ST_ammo_Belt_bag_zelt_camo";
/*----------------------------------------------------*/
_i pushBack "B_SPE_GER_Belt_bag";
_i pushBack "B_SPE_GER_Belt_bag_zelt";
_i pushBack "B_SPE_GER_Belt_bag_zelt_trop";
_i pushBack "B_SPE_GER_Belt_bag_ST_zelt";
_i pushBack "B_SPE_GER_Belt_bag_ST_zelt_trop";
_i pushBack "B_SPE_GER_A_frame";
_i pushBack "B_SPE_GER_A_frame_kit";
_i pushBack "B_SPE_GER_A_frame_sturm";
_i pushBack "B_SPE_GER_A_frame_sturm_licht";
_i pushBack "B_SPE_GER_A_frame_zeltbahn";
_i pushBack "B_SPE_GER_A_frame_zeltbahn_licht";
_i pushBack "B_SPE_GER_A_frame_ST";
_i pushBack "B_SPE_GER_A_frame_ST_zeltbahn";
_i pushBack "B_SPE_GER_A_frame_ST_zeltbahn_licht";
_i pushBack "B_SPE_GER_Belt_bag_MG";
_i pushBack "B_SPE_GER_A_frame_MG";
_i pushBack "B_SPE_GER_A_frame_HMG";
_i pushBack "B_SPE_GER_A_frame_K98k_MG";
_i pushBack "B_SPE_GER_Belt_bag_K98k_MG";
_i pushBack "B_SPE_GER_A_frame_G43_MG";
_i pushBack "B_SPE_GER_A_frame_Grenadier";
_i pushBack "B_SPE_GER_A_frame_AT";
_i pushBack "B_SPE_GER_A_frame_STG44_MG";
_i pushBack "B_SPE_GER_A_frame_Gef";
_i pushBack "B_SPE_GER_Belt_bag_Gef";
_i pushBack "B_SPE_GER_A_frame_ST_MG";
_i pushBack "B_SPE_GER_A_frame_ST_STG44_MG";
_i pushBack "B_SPE_GER_A_frame_ST_HMG";
_i pushBack "B_SPE_GER_A_frame_ST_K98k_MG";
_i pushBack "B_SPE_GER_A_frame_ST_K98k_MG_Alt";
_i pushBack "B_SPE_GER_A_frame_ST_G43_MG";
_i pushBack "B_SPE_GER_A_frame_ST_Grenadier";
_i pushBack "B_SPE_GER_A_frame_ST_AT";
_i pushBack "B_SPE_GER_A_frame_ST_Gef";
//60
_i pushBack "B_SPE_GER_A_frame_Full";
_i pushBack "B_SPE_GER_A_frame_ST_Full";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//110
_i pushBack "B_SPE_GER_A_frame_MGCan";
_i pushBack "B_SPE_GER_A_frame_MGCan_zelt";
_i pushBack "B_SPE_GER_A_frame_ST_MGCan";
_i pushBack "B_SPE_GER_A_frame_ST_MGCan_zelt";
_i pushBack "B_SPE_GER_Backpack_MGAmmo";
_i pushBack "B_SPE_GER_Backpack_HMGAmmo";
_i pushBack "B_SPE_GER_Backpack_ST_MGAmmo";
_i pushBack "B_SPE_GER_Backpack_ST_HMGAmmo";
//120
_i pushBack "B_SPE_GER_Tonister34_canvas";
_i pushBack "B_SPE_GER_MedicBackpack";
_i pushBack "B_SPE_GER_MedicBackpack_Empty";
_i pushBack "B_SPE_GER_Tonister34_cowhide";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//160
_i pushBack "B_SPE_GER_Tonister41_Frame";
_i pushBack "B_SPE_GER_Tonister41_Frame_ST";
//180
_i pushBack "B_SPE_GER_Tonister41_Frame_Full";
_i pushBack "B_SPE_GER_Tonister41_Frame_Full_ST";
_i pushBack "B_SPE_GER_Tonister41_Frame_Full_Mortar";
_i pushBack "B_SPE_GER_Tonister41_Frame_Full_Mortar_ST";
_i pushBack "B_SPE_GER_SapperBackpack_empty";
_i pushBack "B_SPE_GER_SapperBackpack";
_i pushBack "B_SPE_GER_SapperBackpack2";

_i pushBack "SPE_Lafette_Tripod";
_i pushBack "SPE_GrW278_1_Stand";
_i pushBack "SPE_GrW278_1_Barrel";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//##########################################################################################################
//												Level 1
//##########################################################################################################
_tech_level = 1;

_i pushBack "SPE_MP40";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_32rnd_9x19";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_32rnd_9x19_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_MG34";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_792x57_SMK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_792x57_sS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_PzFaust_60m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_PzFaust_60m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//------------------------------------Uniforms------------------------------------
//camo
_i pushBack "U_SPE_GER_Soldier_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo_lieutenant";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_GER_Soldier_camo_lieutenant_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//##########################################################################################################
//												Level 2
//##########################################################################################################
_tech_level = 2;

_i pushBack "SPE_G43";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_10Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_10Rnd_792x57_T";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_10Rnd_792x57_T2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_10Rnd_792x57_sS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_10Rnd_792x57_SMK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_STG44";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30rnd_792x33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(792*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30rnd_792x33_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(792*33)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_MG42";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_FM_24_M29";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_25Rnd_75x54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(750*54)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_K98ZF39";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);



_i pushBack "SPE_FG42_E";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Optic_ZFG42";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_792x57_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_792x57_t2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_792x57_sS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_792x57_SMK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_RPzB_43";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_RPzB_54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_RPzBGr_4322";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Glasses------------------------------------------------
_tech_level = 0;
_i pushBack "G_Combat";
_u pushBack _tech_level;
_p pushBack 100;

_i pushBack "G_Shades_Black";
_u pushBack _tech_level;
_p pushBack 50;

_i pushBack "G_Tactical_Clear";
_u pushBack _tech_level;
_p pushBack 50;

_i pushBack "G_Sport_Blackred";
_u pushBack _tech_level;
_p pushBack 50;

_i pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack 50;

_i pushBack "SPE_GER_Headset";
_u pushBack _tech_level;
_p pushBack 50;

//------------------------------------------Items-------------------------------------------------
/*_i = _i		+ "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "SPE_Binocular_GER";
_u pushBack 0;
_p pushBack round 100;

_i pushBack "ItemMap";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemradio";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "SPE_GER_ItemCompass";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "SPE_GER_ItemCompass_deg";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "SPE_GER_ItemWatch";
_u pushBack 0;
_p pushBack round 50;

_i pushBack "SPE_GER_FirstAidKit";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "SPE_ToolKit";
_u pushBack 0;
_p pushBack round 3000;

_i pushBack "SPE_GER_Medkit";
_u pushBack 0;
_p pushBack round 1500;

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_GER.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
