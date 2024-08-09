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

_i pushBack "SPE_US_M18";
_i pushBack "SPE_US_M18_Red";
_i pushBack "SPE_US_M18_Green";
_i pushBack "SPE_US_M18_Yellow";
_i pushBack "SPE_US_M18_Violet";
_i pushBack "SPE_US_Mk_1";
_i pushBack "SPE_1Rnd_G_M2_M18_Red";
_i pushBack "SPE_1Rnd_G_M2_M18_Green";
_i pushBack "SPE_1Rnd_G_M2_M18_Yellow";
_i pushBack "SPE_1Rnd_G_M2_M18_Violet";
_i pushBack "SPE_Type_A1_Lamp_Blue";
_i pushBack "SPE_Type_A1_Lamp_Green";
_i pushBack "SPE_Type_A1_Lamp_Orange";
_i pushBack "SPE_Type_A1_Lamp_Red";
_i pushBack "SPE_Type_A1_Lamp_White";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_1Rnd_G_M17A1";
_i pushBack "SPE_US_TNT_half_pound_mag";
_i pushBack "SPE_US_Bangalore_mag";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_US_M3_Pressure_MINE_mag";
_i pushBack "SPE_US_TNT_4pound_mag";
_i pushBack "SPE_US_M15";
_i pushBack "SPE_US_AN_M14";
_i pushBack "SPE_1Rnd_G_M19A1";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_M39";
_i pushBack "SPE_US_Mk_2";
_i pushBack "SPE_US_Mk_2_Yellow";
_i pushBack "SPE_US_Mk_3";

_i pushBack "SPE_1Rnd_G_Mk2";
_i pushBack "SPE_1Rnd_G_M9A1";
_i pushBack "SPE_1Rnd_G_M2_AN_M14";
_i pushBack "SPE_1Rnd_G_M2_ANM8";
_i pushBack "SPE_1Rnd_G_M21A1";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SPE_US_M1A1_ATMINE_mag";
_i pushBack "SPE_US_M3_MINE_mag";
_i pushBack "SPE_1Rnd_G_M51A1";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "SPE_M1911";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_7Rnd_45ACP_1911";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_7Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);



_i pushBack "SPE_M1903A3_Springfield";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_762x63_M1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_762x63_M2_AP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_M1_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_M1905_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_GL_M1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_No3_Mk1_Enfield_M1917_Bayonet";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_M1917_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_770x56";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_770x56_MKVIII";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_770x56_AP_MKI";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_Model_37_Riotgun";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Model_37_Trenchgun";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_12x70_Pellets";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(120*70)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_12x70_Slug";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(120*70)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_5Rnd_12x70_No4_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(120*70)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M2_Flamethrower";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M2_Flamethrower_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//------------------------------------Uniforms------------------------------------
_i pushBack "U_SPE_US_Pilot";
_i pushBack "U_SPE_US_Pilot_glove";
_i pushBack "U_SPE_US_Pilot_boot";
_i pushBack "U_SPE_US_Pilot_lthr";
_i pushBack "U_SPE_US_Pilot_lthr_glove";
_i pushBack "U_SPE_US_Pilot_lthr_boot";

_i pushBack "U_SPE_US_S31A";
_i pushBack "U_SPE_US_S31A_glove";
_i pushBack "U_SPE_US_S31A_boot";
_i pushBack "U_SPE_US_S31_erla";
_i pushBack "U_SPE_US_S31_erla_glove";
_i pushBack "U_SPE_US_S31_erla_boot";

_i pushBack "U_SPE_US_Private";
_i pushBack "U_SPE_US_Private_1st";
_i pushBack "U_SPE_US_Corp";
_i pushBack "U_SPE_US_Sergeant";
_i pushBack "U_SPE_US_Technician";
_i pushBack "U_SPE_US_Med";
_i pushBack "U_SPE_US_Private_late";
_i pushBack "U_SPE_US_Med_late";

_i pushBack "U_SPE_US_HBT44";
_i pushBack "U_SPE_US_HBT44_Med";
_i pushBack "U_SPE_US_HBT44_trop";
_i pushBack "U_SPE_US_HBT44_roll";
_i pushBack "U_SPE_US_HBT44_late";
_i pushBack "U_SPE_US_HBT44_late_roll";
_i pushBack "U_SPE_US_HBT44_Half";
_i pushBack "U_SPE_US_HBT44_FrogSkin_Jungle";
_i pushBack "U_SPE_US_HBT44_FrogSkin_Jungle_Half";
_i pushBack "U_SPE_US_HBT44_FrogSkin_Jungle_trop";
_i pushBack "U_SPE_US_HBT44_FrogSkin_Jungle_roll";

_i pushBack "U_SPE_US_CC_EM";
_i pushBack "U_SPE_US_CC_EM_roll";
_i pushBack "U_SPE_US_CC_EM_trop";
_i pushBack "U_SPE_US_CC_EM_trop_roll";
_i pushBack "U_SPE_US_CC_HBT_EM";
_i pushBack "U_SPE_US_CC_HBT_EM_roll";
_i pushBack "U_SPE_US_CC_HBT_EM_trop";
_i pushBack "U_SPE_US_CC_HBT_EM_trop_roll";
_i pushBack "U_SPE_US_CC_HBT_camo";
_i pushBack "U_SPE_US_CC_HBT_camo_roll";
_i pushBack "U_SPE_US_CC_HBT_camo_trop";
_i pushBack "U_SPE_US_CC_HBT_camo_trop_roll";
_i pushBack "U_SPE_US_CC_2LT";
_i pushBack "U_SPE_US_CC_1LT";
_i pushBack "U_SPE_US_CC_CPT";

_i pushBack "U_SPE_US_Tank_Coverall";
_i pushBack "U_SPE_US_Tank_Coverall_Trop";
_i pushBack "U_SPE_US_Tank_Coverall_Legging";
_i pushBack "U_SPE_US_Tank_Crew";
_i pushBack "U_SPE_US_Tank_Crew2";
_i pushBack "U_SPE_US_Tank_Crew3";
_i pushBack "U_SPE_US_Tank_Crew4";
_i pushBack "U_SPE_US_Tank_Crew_camo";
_i pushBack "U_SPE_US_Tank_Crew_camo2";
_i pushBack "U_SPE_US_Tank_Crew_medic";
_i pushBack "U_SPE_US_Tank_Crew_medic_camo";

_i pushBack "U_SPE_US_Rangers_Uniform";
_i pushBack "U_SPE_US_Rangers_Private_1st";
_i pushBack "U_SPE_US_Rangers_Corp";
_i pushBack "U_SPE_US_Rangers_Sergeant";
_i pushBack "U_SPE_US_Rangers_Technician";
_i pushBack "U_SPE_US_Rangers_Med";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------Helms-------------------------------------------
_i pushBack "H_SPE_US_Pilot_Cap";
_i pushBack "H_SPE_US_Pilot_Cap_Khaki";
_i pushBack "H_SPE_US_Helmet_Pilot";
_i pushBack "H_SPE_US_Helmet_Pilot_Op";
_i pushBack "H_SPE_US_Helmet_Pilot_Glasses_Up";
_i pushBack "H_SPE_US_Helmet_Pilot_Glasses_Down";
_i pushBack "H_SPE_US_Helmet_Pilot_Respirator";
_i pushBack "H_SPE_US_Helmet_Pilot_Respirator_Glasses_Up";
_i pushBack "H_SPE_US_Helmet_Pilot_Respirator_Glasses_Down";
_i pushBack "H_SPE_US_Helmet_Pilot_SWDG_Respirator";
_i pushBack "H_SPE_US_Helmet_Pilot_SWDG_low_Respirator";

_i pushBack "H_SPE_US_Helmet_H15";
_i pushBack "H_SPE_US_Helmet_H15_Op";
_i pushBack "H_SPE_US_Helmet_H15_SWDG";
_i pushBack "H_SPE_US_Helmet_H15_SWDG_low";
_i pushBack "H_SPE_US_Helmet_H15_O2";
_i pushBack "H_SPE_US_Helmet_H15_B7_O2";
_i pushBack "H_SPE_US_Helmet_H15_B7_low_O2";
_i pushBack "H_SPE_US_Helmet_H15_SWDG_O2";
_i pushBack "H_SPE_US_Helmet_H15_SWDG_low_O2";

_i pushBack "H_SPE_US_Helmet_Tank";
_i pushBack "H_SPE_US_Helmet_Tank_M1_OS";
_i pushBack "H_SPE_US_Helmet_Tank_M1_NS";
_i pushBack "H_SPE_US_Helmet_Tank_M1_Scrim";
_i pushBack "H_SPE_US_Helmet_Tank_polar";
_i pushBack "H_SPE_US_Helmet_Tank_polar_tapes";
_i pushBack "H_SPE_US_Helmet_Tank_polar_low";
_i pushBack "H_SPE_US_Helmet_Tank_NG";
_i pushBack "H_SPE_US_Helmet_Tank_tapes";
_i pushBack "H_SPE_US_Helmet_Tank_Nun";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "H_SPE_US_Helmet";
_i pushBack "H_SPE_US_Helmet_ns";
_i pushBack "H_SPE_US_Helmet_os";
_i pushBack "H_SPE_US_Helmet_Net";
_i pushBack "H_SPE_US_Helmet_Net_ns";
_i pushBack "H_SPE_US_Helmet_Net_os";
_i pushBack "H_SPE_US_Helmet_band";
_i pushBack "H_SPE_US_Helmet_band_ns";
_i pushBack "H_SPE_US_Helmet_band_os";
_i pushBack "H_SPE_US_Helmet_band_net";
_i pushBack "H_SPE_US_Helmet_band_net_ns";
_i pushBack "H_SPE_US_Helmet_band_net_os";
_i pushBack "H_SPE_US_Helmet_Scrim";
_i pushBack "H_SPE_US_Helmet_Scrim_ns";
_i pushBack "H_SPE_US_Helmet_Scrim_os";
_i pushBack "H_SPE_US_Helmet_polar";
_i pushBack "H_SPE_US_Helmet_polar_ns";
_i pushBack "H_SPE_US_Helmet_polar_os";
_i pushBack "H_SPE_US_Helmet_polar_net";
_i pushBack "H_SPE_US_Helmet_polar_net_ns";
_i pushBack "H_SPE_US_Helmet_polar_net_os";
_i pushBack "H_SPE_US_Helmet_polar_Scrim";
_i pushBack "H_SPE_US_Helmet_polar_Scrim_ns";
_i pushBack "H_SPE_US_Helmet_polar_Scrim_os";

_i pushBack "H_SPE_US_Helmet_Med";
_i pushBack "H_SPE_US_Helmet_Med_ns";
_i pushBack "H_SPE_US_Helmet_Med_os";
_i pushBack "H_SPE_US_Helmet_Cap";
_i pushBack "H_SPE_US_Helmet_CO";
_i pushBack "H_SPE_US_Helmet_CO_Net";
_i pushBack "H_SPE_US_Helmet_NCO";
_i pushBack "H_SPE_US_Helmet_NCO_net";
_i pushBack "H_SPE_US_Helmet_NCO_scrim";
_i pushBack "H_SPE_US_Helmet_First_lieutenant";
_i pushBack "H_SPE_US_Helmet_Second_lieutenant";

_i pushBack "H_SPE_US_Helmet_29ID";
_i pushBack "H_SPE_US_Helmet_29ID_ns";
_i pushBack "H_SPE_US_Helmet_29ID_os";
_i pushBack "H_SPE_US_Helmet_29ID_Net";
_i pushBack "H_SPE_US_Helmet_29ID_Net_ns";
_i pushBack "H_SPE_US_Helmet_29ID_Net_os";
_i pushBack "H_SPE_US_Helmet_29ID_Scrim";
_i pushBack "H_SPE_US_Helmet_29ID_Scrim_ns";
_i pushBack "H_SPE_US_Helmet_29ID_Scrim_os";
_i pushBack "H_SPE_US_Helmet_29ID_CO";
_i pushBack "H_SPE_US_Helmet_29ID_NCO";

_i pushBack "H_SPE_US_MP_Helmet_White";
_i pushBack "H_SPE_US_MP_Helmet_White_ns";
_i pushBack "H_SPE_US_MP_Helmet_White_os";

_i pushBack "H_SPE_US_Rangers_Helmet";
_i pushBack "H_SPE_US_Rangers_Helmet_ns";
_i pushBack "H_SPE_US_Rangers_Helmet_os";
_i pushBack "H_SPE_US_Rangers_Helmet_Cap";
_i pushBack "H_SPE_US_Rangers_Helmet_First_lieutenant";
_i pushBack "H_SPE_US_Rangers_Helmet_Second_lieutenant";
_i pushBack "H_SPE_US_Rangers_Helmet_NCO";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//-----------------------------------------Vests----------------------------------------------------
//load 80
_i pushBack "V_SPE_US_LifeVest";
_i pushBack "V_SPE_US_Vest_45";
_i pushBack "V_SPE_US_Vest_45_off";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load 100
_i pushBack "V_SPE_US_Vest_Bar";
_i pushBack "V_SPE_US_Vest_M1919";
_i pushBack "V_SPE_US_Vest_Asst_MG";
_i pushBack "V_SPE_US_Vest_Carbine";
_i pushBack "V_SPE_US_Vest_Carbine_eng";
_i pushBack "V_SPE_US_Vest_Carbine_mk2";
_i pushBack "V_SPE_US_Vest_Carbine_m43";
_i pushBack "V_SPE_US_Vest_Carbine_nco";
_i pushBack "V_SPE_US_Vest_Carbine_nco_Radio";
_i pushBack "V_SPE_US_Vest_Garand";
_i pushBack "V_SPE_US_Vest_Garand_M43";
_i pushBack "V_SPE_US_Vest_Garand_gp";
_i pushBack "V_SPE_US_Vest_Garand_mk2";
_i pushBack "V_SPE_US_Vest_Garand_eng";
_i pushBack "V_SPE_US_Vest_Garand_45";
_i pushBack "V_SPE_US_Vest_Garand_map";
_i pushBack "V_SPE_US_Vest_Grenadier";
_i pushBack "V_SPE_US_Vest_Thompson";
_i pushBack "V_SPE_US_Vest_Thompson_M43";
_i pushBack "V_SPE_US_Vest_Thompson_nco";
_i pushBack "V_SPE_US_Vest_Thompson_nco_Radio";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load  120
_i pushBack "V_SPE_US_Vest_Bar_assist";
_i pushBack "V_SPE_US_Assault_Vest";
_i pushBack "V_SPE_US_Assault_Vest_alt";
_i pushBack "V_SPE_US_Assault_Vest_Light";
_i pushBack "V_SPE_US_Assault_Vest_dday";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//load  190
_i pushBack "V_SPE_US_Vest_Medic";
_i pushBack "V_SPE_US_Vest_Medic2";
_i pushBack "V_SPE_US_Vest_Medic3";
_i pushBack "V_SPE_US_Assault_Vest_Bag";
_i pushBack "V_SPE_US_Assault_Vest_dday_Bag";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//-------------------------------------------Backpacks----------------------------------------------------------
_i pushBack "B_SPE_US_M2Flamethrower";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M3_Tripod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M2_50";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_SPE_US_Radio";
_i pushBack "B_SPE_AssaultPack_Base";
_i pushBack "B_SPE_US_TypeA3";
_i pushBack "B_SPE_US_QAC";
_i pushBack "B_SPE_US_Respawn_Tent";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "B_SPE_US_Suspender";
_i pushBack "B_SPE_US_Bandoleer_backup";
_i pushBack "B_SPE_US_Bandoleer";
_i pushBack "B_SPE_US_Bandoleer_2";
_i pushBack "B_SPE_US_Suspender_band_right";
_i pushBack "B_SPE_US_Suspender_band_left";
_i pushBack "B_SPE_US_Suspender_band_left_BAR";
_i pushBack "B_SPE_US_Suspender_band_right_Rifleman";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//80
_i pushBack "B_SPE_US_Bandoleer_3";
_i pushBack "B_SPE_US_Suspender_band";
_i pushBack "B_SPE_US_GP_Bag";
_i pushBack "B_SPE_US_MGbag";
_i pushBack "B_SPE_US_MGbag_M1919";
_i pushBack "B_SPE_US_Suspender_band_sniper";
_i pushBack "B_SPE_US_Suspender_band_Grenadier";
_i pushBack "B_SPE_US_Suspender_band_SL";
_i pushBack "B_SPE_US_Suspender_band_ASL";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

/*----------------------------------------------------*/
_i pushBack "B_SPE_US_Backpack_dday";
_i pushBack "B_SPE_US_M36_Bandoleer_duplet";
_i pushBack "B_SPE_US_M36_Bandoleer_mk2";
_i pushBack "B_SPE_US_M36_Rope";
_i pushBack "B_SPE_US_M36_Rocketbag";
_i pushBack "B_SPE_US_M36_roll";
_i pushBack "B_SPE_US_M36_roll_2";
_i pushBack "B_SPE_US_M36_m7";
_i pushBack "B_SPE_US_M36_m7_Bandoleer";
_i pushBack "B_SPE_US_M36_m6";
_i pushBack "B_SPE_US_M36_m6_Bandoleer";
_i pushBack "B_SPE_US_M36_landing_m7";
_i pushBack "B_SPE_US_M36_landing_m6";
_i pushBack "B_SPE_US_T5_erla";
_i pushBack "B_SPE_US_T5_M7";
_i pushBack "B_SPE_US_T5_M6";
_i pushBack "B_SPE_US_Backpack_dday_m43";
_i pushBack "B_SPE_US_Backpack_dday_eng";
_i pushBack "B_SPE_US_Backpack_dday_side";
_i pushBack "B_SPE_US_Backpack_dday_4ID";
_i pushBack "B_SPE_US_Backpack_M7_rear";
_i pushBack "B_SPE_US_Backpack_M7_rear_bandoleer";
_i pushBack "B_SPE_US_Backpack_M7_side";
_i pushBack "B_SPE_US_Backpack_M7_side_bandoleer";
_i pushBack "B_SPE_US_Backpack_M6";
_i pushBack "B_SPE_US_Backpack_M6_M43";
_i pushBack "B_SPE_US_Backpack_M43_Bandoleer";
/*----------------------------------------------------*/
//100
_i pushBack "B_SPE_US_Backpack";
_i pushBack "B_SPE_US_Backpack_dday";
_i pushBack "B_SPE_US_Backpack_Mk2";
_i pushBack "B_SPE_US_Backpack_M43";
_i pushBack "B_SPE_US_M36";
_i pushBack "B_SPE_US_M36_Bandoleer";
_i pushBack "B_SPE_US_HMGbag";
_i pushBack "B_SPE_US_HMGAssistantBag";
_i pushBack "B_SPE_US_Backpack_BAR";
_i pushBack "B_SPE_US_Backpack_Bandoleer_Grenadier";
_i pushBack "B_SPE_US_Backpack_Bandoleer_Grenadier_1903";
_i pushBack "B_SPE_US_Backpack_SL";
_i pushBack "B_SPE_US_Backpack_ASL";
_i pushBack "B_SPE_US_M36_1stLT";
_i pushBack "B_SPE_US_M36_Captain";
_i pushBack "B_SPE_US_M36_Bandoleer_SL";
_i pushBack "B_SPE_US_M36_Bandoleer_2ndLT";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//120 125
_i pushBack "B_SPE_US_Backpack_roll";
_i pushBack "B_SPE_US_Radio_alt";
_i pushBack "B_SPE_US_Radio_packboard";
_i pushBack "B_SPE_US_Radio_packboard_light";
_i pushBack "B_SPE_US_packboard";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//140 187
_i pushBack "B_SPE_US_Backpack_Bandoleer";
_i pushBack "B_SPE_US_AMGBag";
_i pushBack "B_SPE_US_Backpack_Bandoleer_Rifleman";
_i pushBack "B_SPE_US_Backpack_M43_GP";
_i pushBack "B_SPE_US_RocketBag";
_i pushBack "B_SPE_US_RocketBag_Empty";
_i pushBack "B_SPE_US_Backpack_eng";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//210 250
_i pushBack "B_SPE_US_Backpack_RocketBag";
_i pushBack "B_SPE_US_Backpack_RocketBag_Empty";
_i pushBack "B_SPE_US_Backpack_roll_gp";
//_i pushBack "B_SPE_US_Backpack_RocketBag_Big_Empty";
//_i pushBack "B_SPE_US_RocketBag_Big_Empty";
_i pushBack "B_SPE_US_packboard_eng";
_i pushBack "B_SPE_US_packboard_eng_loaded";
_i pushBack "B_SPE_US_packboard_ammo";
_i pushBack "B_SPE_US_packboard_ammo_HMG";
_i pushBack "B_SPE_US_packboard_ammo_loaded";
_i pushBack "B_SPE_US_packboard_mortar";
_i pushBack "B_SPE_US_packboard_mortar_loaded";
_i pushBack "B_SPE_US_Suspender_RocketBag";
_i pushBack "B_SPE_US_Suspender_RocketBag_loaded";
//_i pushBack "B_SPE_US_MGbag_Big_Empty";
_i pushBack "B_SPE_US_Backpack_Bandoleer_AmmoBearer";
_i pushBack "B_SPE_US_Backpack_eng_bangalore";

_i pushBack "SPE_M2_Tripod";
_i pushBack "SPE_M1_81_Stand";
_i pushBack "SPE_M1_81_Barrel";
_i pushBack "SPE_MLE_27_31_Stand";
_i pushBack "SPE_MLE_27_31_Barrel";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//##########################################################################################################
//												Level 1
//##########################################################################################################
_tech_level = 1;

_i pushBack "SPE_M3_GreaseGun";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M3_GreaseGun_Suppressed";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_M3_GreaseGun_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_M3_GreaseGun_45ACP_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_M3_Suppressor_45acp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M1A1_Thompson";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_Thompson_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_Thompson_45ACP_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_Thompson_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_Thompson_45ACP_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M1_Garand";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_8Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_8Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_8Rnd_762x63_M1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_8Rnd_762x63_M2_AP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_GL_M7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M1918A0_BAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M1918A2_BAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M1918A2_erla_BAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_762x63_M1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_20Rnd_762x63_M2_AP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M1918A2_BAR_Handle";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M1918A2_BAR_Bipod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_LMG_303_Mk2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_770x56";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_770x56_MKVIII";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_30Rnd_770x56_AP_MKI";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(770*56)] call CTI_CO_FNC_GetCalculatedItemPrize);

//##########################################################################################################
//												Level 2
//##########################################################################################################
_tech_level = 2;
 
_i pushBack "SPE_M1_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
 
_i pushBack "SPE_M1A1_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
 
_i pushBack "SPE_M1_Carbine_M8";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_15Rnd_762x33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_15Rnd_762x33_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_ACC_GL_M8";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Carbine_pouch";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Carbine_pouch_od7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_Sten_Mk2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_Sten_Mk2_Suppressed";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_32Rnd_9x19_Sten";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
 

_i pushBack "SPE_M1919A6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M1903A4_Springfield";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "SPE_M1919A4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_762x63_M1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_50Rnd_762x63_M2_AP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

 
_i pushBack "SPE_M1A1_Bazooka";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M9_Bazooka";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_M9A1_Bazooka";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_60mm_M6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_1Rnd_60mm_M6A3";
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
_p pushBack round 100;

_i pushBack "G_Shades_Black";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "G_Tactical_Clear";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "G_Sport_Blackred";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack 50;

//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "SPE_Binocular_US";
_u pushBack 0;
_p pushBack round 100;

_i pushBack "ItemMap";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemradio";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "SPE_US_ItemCompass";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "SPE_US_ItemWatch";
_u pushBack 0;
_p pushBack round 50;

_i pushBack "SPE_US_FirstAidKit";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "SPE_ToolKit";
_u pushBack 0;
_p pushBack round 3000;

_i pushBack "SPE_US_Medkit";
_u pushBack 0;
_p pushBack round 1500;

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_US.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
