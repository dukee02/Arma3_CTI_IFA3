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

if(CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	_i pushBack "SPE_US_M1A1_ATMINE_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M3_MINE_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M3_Pressure_MINE_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_TNT_4pound_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_TNT_half_pound_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_Bangalore_mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);


	_i pushBack "SPE_M39";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_Mk_2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_Mk_2_Yellow";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_Mk_3";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M15";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_AN_M14";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);


	_i pushBack "SPE_US_M18";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M18_Red";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M18_Green";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M18_Yellow";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_M18_Violet";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_US_Mk_1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);


	_i pushBack "SPE_1Rnd_G_Mk2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M9A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_AN_M14";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_ANM8";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M17A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M19A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M21A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M51A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_M18_Red";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_M18_Green";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_M18_Yellow";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_G_M2_M18_Violet";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);


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


	_i pushBack "SPE_MAS_36";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_5Rnd_75x54";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(750*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_5Rnd_75x54_35P_AP";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(750*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
	

	_i pushBack "SPE_M2_Flamethrower";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_M2_Flamethrower_Mag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//------------------------------------Uniforms------------------------------------
_i pushBack "U_SPE_FR_Tank_Crew2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_FR_Tank_Crew3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_FR_Tank_Crew";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_FR_HBT_Uniform";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_SPE_FR_HBT_Uniform_Trop";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

if(CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	_i pushBack "U_SPE_US_HBT44_Med";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------Helms-------------------------------------------
_i pushBack "H_SPE_FR_Adrian";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_Adrian_ns";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_Adrian_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_Adrian_Medic_ns";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_US_Helmet";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_US_Helmet_ns";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_SPE_FR_US_Helmet_os";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

if(CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	_i pushBack "H_SPE_US_Helmet_Tank";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "H_SPE_US_Helmet_Tank_M1_OS";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "H_SPE_US_Helmet_Tank_NG";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	//-----------------------------------------Vests----------------------------------------------------
	//load 80
	_i pushBack "V_SPE_US_LifeVest";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_45";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_45_off";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

	//load 100
	_i pushBack "V_SPE_US_Vest_Bar";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_M1919";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Asst_MG";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine_eng";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine_mk2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine_m43";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine_nco";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Carbine_nco_Radio";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_M43";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_gp";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_mk2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_eng";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_45";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Garand_map";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Grenadier";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Thompson";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Thompson_M43";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Thompson_nco";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Thompson_nco_Radio";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	//load  120
	_i pushBack "V_SPE_US_Vest_Bar_assist";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	//load  190
	_i pushBack "V_SPE_US_Vest_Medic";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Medic2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "V_SPE_US_Vest_Medic3";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,4.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//-------------------------------------------Backpacks----------------------------------------------------------
_i pushBack "B_SPE_FR_Backpack_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_SPE_FR_Backpack_FM24";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
//140
_i pushBack "B_SPE_FR_Backpack_Bandoleer_Rifleman";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_SPE_FR_Backpack_Bandoleer_Grenadier";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_SPE_FR_AMGBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
//250
_i pushBack "B_SPE_FR_packboard_mortar_loaded";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

if(CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
	_i pushBack "B_SPE_US_M2Flamethrower";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	//100
	_i pushBack "B_SPE_US_Backpack_SL";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "B_SPE_US_HMGbag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "B_SPE_US_Suspender";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "B_SPE_US_Backpack_ASL";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "B_SPE_US_HMGAssistantBag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	//125
	_i pushBack "B_SPE_US_Radio_packboard_light";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	//160
	_i pushBack "B_SPE_US_Backpack_eng";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	//210
	_i pushBack "B_SPE_US_Backpack_RocketBag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	//250
	_i pushBack "B_SPE_US_packboard_ammo_HMG";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

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
};
/*
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


_i pushBack "SPE_M1918A2_BAR";
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
*/
if(CTI_US_SIDE != (_side) call CTI_CO_FNC_GetSideID) then {
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

	//##########################################################################################################
	//												Level 2
	//##########################################################################################################
	_tech_level = 2;
	
	_i pushBack "SPE_M1_Carbine";
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


	_i pushBack "SPE_Sten_Mk2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_Sten_Mk2_Suppressed";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_32Rnd_9x19_Sten";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
	

	//_i pushBack "SPE_M1919A6";
	//_u pushBack _tech_level;
	//_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


	_i pushBack "SPE_M1903A4_Springfield";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	
	_i pushBack "SPE_M1A1_Bazooka";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_i pushBack "SPE_1Rnd_60mm_M6";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_tech_level = 2;

_i pushBack "SPE_FM_24_M29";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SPE_25Rnd_75x54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(750*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

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
