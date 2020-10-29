private "_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level";

_side = _this;

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

_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

_i = [];
_u = [];
_p = [];

//(CTI_ECONOMY_PRIZE_WEAPONS*_level_start)
//100*1 -> $100 weapon
//((rnds*caliber)/1000)*((CTI_ECONOMY_PRIZE_WEAPONS*_level_start)/100)
//((30*545)/1000)*(100*1/100) = $16,35 -> ammo
/*
_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((rnds*caliber)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
*/

_tech_level=0;


//---------------------------Grenades and mines-----------------------------------------
_i pushBack "LIB_Rpg6"; //Ind
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_Rg42"; //Ind
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_Pwm"; //Ind
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_M39"; //RU
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_pomzec_MINE_mag"; //RU
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_US_M1A1_ATMINE_mag"; //US
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 100*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_M3_MINE_mag";	//RU US
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_US_M3_MINE_mag"; //US
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 100*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_PMD6_MINE_mag"; //RU
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_Ladung_Big_MINE_mag"; //All
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 100*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_Ladung_Small_MINE_mag"; //All
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 25*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "ClaymoreDirectionalMine_Remote_Mag"; //All
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//----------------------Flares and Smokes------------------------------
_tech_level = 0;
_i pushBack "lib_1Rnd_flare_white";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_1Rnd_flare_red";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_1Rnd_flare_green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_1Rnd_flare_yellow";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_f1";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShell";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellRed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellGreen";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellYellow";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellPurple";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellBlue";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "SmokeShellOrange";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "FlareWhite_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "FlareGreen_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "FlareRed_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "FlareYellow_F";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 2*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//-------------Ammo----------------------------------------------
_tech_level = 0;
_i pushBack "LIB_5Rnd_762x54";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_5Rnd_762x54_t46";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_5Rnd_762x54_t30";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_5Rnd_762x54_D";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_5Rnd_762x54_b30";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((5*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_47Rnd_762x54";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((47*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_10Rnd_762x54";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_7Rnd_762x38";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((7*762*38)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_8Rnd_9x19_P08";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "lib_8Rnd_762x25";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_35Rnd_762x25";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((35*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_35Rnd_762x25_t";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((35*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_35Rnd_762x25_t2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((35*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_35Rnd_762x25_ap";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((35*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_71Rnd_762x25";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((71*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_71Rnd_762x25_t";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((71*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_71Rnd_762x25_t2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((71*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_71Rnd_762x25_ap";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((71*762*25)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_1Rnd_145x114";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((1*145*114)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_1Rnd_60mm_M6";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_1Rnd_RPzB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);


//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_M9130";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M38";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M1895";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_TT33";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M1908";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_FLARE_PISTOL";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_PTRD";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_M44";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_PPSh41_d";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_PPSh41_m";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M1A1_Bazooka";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "lib_dp28";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M9130PU";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_SVT_40";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_RPzB";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//------------------------------------Uniforms------------------------------------
_tech_level = 0;
_i pushBack "U_LIB_SOV_Strelokart";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Razvedchik_am";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Razvedchik_lis";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Razvedchik_mix";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Leutenant_inset_pocket";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sergeant_inset_pocket";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Tank_ryadovoi";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Tank_private_field";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Pilot";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Efreitor";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Strelok";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
//Winter
_i pushBack "U_LIB_SOV_Strelok_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Strelok_2_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sniper_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "U_LIB_SOV_Tank_Sergeant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Stleutenant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Starshina";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Stsergeant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Leutenant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Artleutenant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Tank_Leutenant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "U_LIB_SOV_Razvedchik_autumn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sniper";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sniper_autumn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sniper_spring";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Efreitor_summer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Kapitan_summer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Strelok_summer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Sergeant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Tank_Kapitan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_SOV_Kapitan";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;
_i pushBack "V_LIB_SOV_RA_OfficerVest";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RAZV_OfficerVest";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RA_MosinBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RA_TankOfficerSet";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RA_MGBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RAZV_MGBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RA_PPShBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RA_SVTBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RAZV_PPShBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_RAZV_SVTBelt";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_tech_level = 2;
_i pushBack "V_LIB_SOV_IShBrVestPPShDisc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_IShBrVestPPShMAg";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_SOV_IShBrVestMG";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//-------------------------------------------Backpacks----------------------------------------------------------
_tech_level = 0;
_i pushBack "B_LIB_SOV_RA_Rucksack";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Rucksack_green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Rucksack2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Rucksack2_green";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_MGAmmoBag_Empty";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_GasBag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_MedicalBag_Empty";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_Parachute";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "LIB_Maxim_Bag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "LIB_Maxim_Bar";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Radio";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Shinel";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_SOV_RA_Paradrop";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);


//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;
_i pushBack "H_LIB_SOV_RA_Helmet";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_RA_PrivateCap";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_TankHelmet";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_RA_OfficerCap";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_PilotHelmet";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Winter
_i pushBack "H_LIB_SOV_RA_Helmet_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_Ushanka";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_SOV_Ushanka2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


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


//-----------------------------------------Attachments------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_ACC_M1891_Bayo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "LIB_ACC_GL_DYAKONOV_Empty";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));


//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_SU";
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

//_i pushBack "Toolkit";
//_u pushBack 0;
//_p pushBack round 5000;

//_i pushBack "Medikit";
//_u pushBack 0;
//_p pushBack round 3000;


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";