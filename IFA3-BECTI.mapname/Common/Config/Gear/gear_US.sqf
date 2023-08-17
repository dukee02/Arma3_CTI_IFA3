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
_tech_level=0;
_i pushBack "LIB_Rpg6"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Rg42"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Pwm"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_US_Mk_2"; //Us
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

/*_i pushBack "lib_m392"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_m3975"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_m3910"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M39"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);*/

_i pushBack "LIB_F1"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_pomzec_MINE_mag"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_US_M1A1_ATMINE_mag"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M3_MINE_mag";	//RU US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_US_M3_MINE_mag"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_PMD6_MINE_mag"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Big_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Small_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "ClaymoreDirectionalMine_Remote_Mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------Flares and Smokes------------------------------
_tech_level = 0;
_i pushBack "lib_1Rnd_flare_white";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_1Rnd_flare_red";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_1Rnd_flare_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_1Rnd_flare_yellow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_f1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShell";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellRed";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellGreen";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellYellow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellPurple";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellBlue";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "SmokeShellOrange";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "FlareWhite_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "FlareGreen_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "FlareRed_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "FlareYellow_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------Ammo----------------------------------------------
_tech_level = 0;
_i pushBack "LIB_15Rnd_762x33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_15Rnd_762x33_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_5Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_5Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_20Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_50Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_45ACP_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_50Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_M3_GreaseGun_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_7Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_250rnd_7_62x54R_maxim_D";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,250,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_250rnd_7_62x54R_maxim";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,250,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_M2_Flamethrower_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_M1903A3_Springfield";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Colt_M1911";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_FLARE_PISTOL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_M1918A2_BAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1918A2_BAR_Bipod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M2_Flamethrower";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M3_Greasegun";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "LIB_M1903A4_Springfield";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1A1_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1_Garand";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1928_Thompson";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1928_Thompson_d";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1928A1_Thompson";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1A1_Thompson";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1919A4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M1919A6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Maxim_M30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//AT Guns
_i pushBack "LIB_M1A1_Bazooka";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_1Rnd_60mm_M6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------Uniforms------------------------------------
_tech_level = 0;
_i pushBack "U_LIB_US_Corp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Private";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Private_1st";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Sergant";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Eng";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Med";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Bomber_Pilot";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Pilot";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Tank_Crew";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Tank_Crew2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Desert
_i pushBack "U_LIB_US_NAC_Uniform";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_NAC_Med";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_NAC_Uniform_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Winter
_i pushBack "U_LIB_US_Private_1st_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Private_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "U_LIB_US_Off_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;
_i pushBack "V_LIB_US_VEST_Asst_MG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Carbine_Eng";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Garand";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Grenadier";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Carbine_nco";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Carbine_nco_Radio";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_45";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Bar";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_M1919";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Thompson_nco";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Thompson_nco_Radio";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Thompson";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_VEST_Medic2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "V_LIB_US_Lifevest";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Backpacks----------------------------------------------------------
_tech_level = 0;
_i pushBack "B_LIB_US_Bandoleer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Backpack_Bandoleer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Backpack_dday";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Backpack_RocketBag_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Backpack_Mk2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_M2Flamethrower";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_M36";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_M36_Bandoleer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_M36_RocketBag_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_M36_Rope";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Rocketbag_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Radio";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Radio_ACRE2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Type5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Parachute";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_TypeA3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;
_i pushBack "H_LIB_US_Helmet";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_first_lieutenant";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_second_lieutenant";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Cap";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_CO";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_NCO";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_ns";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_os";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Med";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Med_ns";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Med_os";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Pilot_Cap";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Pilot_Cap_Khaki";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot_Glasses_Down";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot_Glasses_Up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot_Respirator";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot_Respirator_Glasses_Down";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Pilot_Respirator_Glasses_Up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Tank";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Winter
_i pushBack "H_LIB_US_Helmet_Cover_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_First_lieutenant_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Second_lieutenant_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Net_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Cap_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "H_LIB_US_Helmet_Med_w";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


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


//-----------------------------------------Attachments------------------------------------------------
_tech_level = 1;
_i pushBack "LIB_M1918A2_BAR_Bipod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_US";
_u pushBack 0;
_p pushBack round 100;

_i pushBack "ItemMap";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemradio";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "itemcompass";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemwatch";
_u pushBack 0;
_p pushBack round 50;

_i pushBack "FirstAidKit";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "Toolkit";
_u pushBack 0;
_p pushBack round 3000;

_i pushBack "Medikit";
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
