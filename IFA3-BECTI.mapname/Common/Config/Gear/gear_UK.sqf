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

_i pushBack "LIB_1Rnd_G_MillsBomb"; //UK
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 40*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_MillsBomb"; //UK
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 30*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_No77"; //UK
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 5*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

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
_i pushBack "LIB_6Rnd_455";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((6*1160*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_10Rnd_770x56";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*770*56)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_32Rnd_9x19_Sten";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((32*900*19)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_7Rnd_45ACP";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((7*1160*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_7Rnd_45ACP_DeLisle";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((7*1160*45)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_1Rnd_89m_PIAT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/3);

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "LIB_30Rnd_770x56";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*770*56)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "LIB_1Rnd_60mm_M6";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);


//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_Webley_mk6";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_LeeEnfield_No1_Bayonet";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_LeeEnfield_No4";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_Sten_Mk2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_DELISLE";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_PIAT";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "LIB_Sten_Mk5";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_Bren_Mk2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_LeeEnfield_No4_Scoped";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "LIB_M1A1_Bazooka";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//------------------------------------Uniforms------------------------------------
_tech_level = 0;
_i pushBack "U_LIB_UK_P37";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37_LanceCorporal";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37_Corporal";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37_Sergeant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Desert
_i pushBack "U_LIB_UK_KhakiDrills";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Winter
_i pushBack "U_LIB_UK_P37_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "U_LIB_UK_P37Jerkins";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37Jerkins_LanceCorporal";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37Jerkins_Corporal";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_P37Jerkins_Sergeant";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Winter
_i pushBack "U_LIB_UK_P37Jerkins_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "U_LIB_UK_DenisonSmock";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "U_LIB_UK_DenisonSmock_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;
_i pushBack "V_LIB_UK_P37_Rifleman_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Gasmask_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Heavy_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Holster_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Officer_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Sten_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Crew";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

//desert
_i pushBack "V_LIB_UK_P37_Rifleman";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Officer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Gasmask";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Heavy";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Holster";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "V_LIB_UK_P37_Sten";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//-------------------------------------------Backpacks----------------------------------------------------------
_tech_level = 0;
_i pushBack "B_LIB_UK_HSack_Blanco";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_UK_HSack_Blanco_Cape";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_UK_HSack_Blanco_Tea";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

//desert
_i pushBack "B_LIB_UK_HSack";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_UK_HSack_Cape";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "B_LIB_UK_HSack_Tea";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);


//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;
_i pushBack "H_LIB_UK_Beret_Commando";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Beret_Commando_Kieffer";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Para_Beret";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Beret";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Beret_Headset";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Beret_Tankist";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Pilot_Cap";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "H_LIB_UK_Helmet_Mk2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Bowed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_FAK";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Net";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Para_Helmet_Mk2";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Para_Helmet_Mk2_Net";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk3";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk3_Net";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//desert
_i pushBack "H_LIB_UK_Helmet_Mk2_Cover";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Desert_Bowed";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Desert";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//Winter
_i pushBack "H_LIB_UK_Helmet_Mk2_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Cover_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Net_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Para_Helmet_Mk2_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Para_Helmet_Mk2_Net_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk3_w";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

//camo
_tech_level = 2;
_i pushBack "H_LIB_UK_Helmet_Mk2_Beachgroup";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_Camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk2_FAK_Camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Para_Helmet_Mk2_Camo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "H_LIB_UK_Helmet_Mk3_Camo";
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

_i pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack 50;


//-----------------------------------------Attachments------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_ACC_P1903_Bayo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "LIB_ACC_No4_Mk2_Bayo";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_ACC_GL_Enfield_CUP_Empty";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));


//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_UK";
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


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
