//if true then show debug globalChat (TODO add more hints)
IL_DevMod = false;

//waitUntil { !(isNull player) };
waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

//if (isDedicated) exitwith {};
//if (isServer) exitwith {};

//	VARIABLES
_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);

if (isnil "IL_Variables") then
{
	IL_Variables = true;
	
	with missionNamespace do {
		//Check new vehicles time
		IL_Check_Veh_Min = 30;
		IL_Check_Veh_Max = 60;
			
		//Dealing with cargo damage
		//-1 - do nothing
		//0 - set to 0
		//1 - keep such as before loading/unloading
		IL_CDamage = 0;

		//AddAction menu position
		IL_Action_LU_Priority = 30; //Load and (para)unload
		IL_Action_LU_Priority2 = 25; //Load and (para)unload
		IL_Action_LU_Priority3 = 20; //Load and (para)unload
		IL_Action_LU_Priority4 = 15; //Load and (para)unload
		IL_Action_O_Priority = 0;	//Open and close
		IL_Action_S_Priority = 0; //Setup

		//Maximum capacity for vehicles
		IL_Num_Slots_OFFROAD = -2;
		IL_Num_Slots_VAN = -3;
		IL_Num_Slots_MOHAWK = -7;
		IL_num_Slots_CHINOOK = -8;
		IL_Num_Slots_TEMPEST = -5;
		IL_Num_Slots_HEMTT = -6;
		IL_Num_Slots_MH9 = -1;
		IL_Num_Slots_C130J = -12;
		IL_Num_Slots_C17 = -22;
		// Lyrae completed groups
		IL_Num_Slots_APC = -2;  // APC
		IL_Num_Slots_Dingo = -1;  // Dingo
		IL_Num_Slots_HMMWV = -1;  // HWWMV
		IL_Num_Slots_Ural = -3;  // Ural
		IL_Num_Slots_Zamak = -4;  // Zamak
		// VIOC added vehicles
		IL_Num_Slots_Gaz = -2; 
		IL_Num_Slots_Praga = -2; 
		IL_Num_Slots_Blitz = -3; 
		IL_Num_Slots_BlitzCSA = -3; 
		IL_Num_Slots_US6 = -4; 
		IL_Num_Slots_GMC = -4; 
		IL_Num_Slots_SdKfz7 = -4; 
		IL_Num_Slots_LCVP = -4; 
		IL_Num_Slots_LCM3 = -6;
		IL_Num_Slots_Liberty = -100;
		IL_Num_Slots_C47 = -12;

		//Player addScore after loading and unloading
		IL_Load_Score = 20;
		//Para unload score = 2 * IL_Unload_Score
		IL_Unload_Score = 10;

		//The minimum altitude for the drop with parachute
		IL_Para_Drop_ATL = 50;
		IL_Para_Jump_ATL = 30;
		//The minimum altitude for parachute opening
		IL_Para_Drop_Open_ATL = 150;
		IL_Para_Jump_Open_ATL = 150;
		//Parachute get velocity from player or cargo
		IL_Para_Drop_Velocity = true;
		IL_Para_Jump_Velocity = true;

		//Set smoke and light for parachute drop.
		IL_Para_Smoke = true;
		IL_Para_Light = true;
		//Additional smoke after landing
		IL_Para_Smoke_Add = true;
		//Additional light after landing
		IL_Para_Light_Add = true;
		//Smoke and light color
		IL_Para_Smoke_Default = "SmokeshellGreen";
		IL_Para_Light_Default = "Chemlight_green";
		IL_Para_Smoke_Veh = "SmokeshellBlue";
		IL_Para_Light_Veh = "Chemlight_blue";

		//This allows for loading or unloading, if a player is in the area of loading or copilot
		IL_Can_Inside = true;		//false
		IL_Can_CoPilot = true;		//false
		IL_Can_Outside = true;

		//
		//IL_SDistU = 20;//No longer needed
		IL_SDistL = 4;   // increasing this from 2.5 to 4 to extend the radius of gathering loot
		IL_SDistL_Heli_offset = 1;
		IL_SDistL_boat = 10;
		IL_SDistL_ship = 40;

		//Load and unload (not para) max speed in km/h
		IL_LU_Speed = 10;
		//Load and unload (not para) max height in m
		IL_LU_Alt = 3;
		//Enable or disable usable cargo ramp in CH-49
		IL_Ramp = false;

		//Enable change of vehicle mass
		IL_Mass = true;
	};
	
	// Supported vehicles
	//#include "OriginalVehicles.cpp"
	IL_Supported_Vehicles_MOHAWK = 
		[
			"sab_bf110",
			"sab_bf110_2",
			"sab_ju88",
			"sab_ju88_2",
			"sab_he111",
			"sab_tusb2",
			"LIB_Pe2_2_w",
			"LIB_Pe2_w",
			"LIB_Pe2"
			/*"I_Heli_Transport_02_F",
			"Exile_Chopper_Mohawk_FIA",
			"O_T_VTOL_02_infantry_F",
			"O_T_VTOL_02_vehicle_F" */
		];

	IL_Supported_Vehicles_C130J = 
		[	
			"B_T_VTOL_01_infantry_F",
			"B_T_VTOL_01_vehicle_F"
		];

	IL_Supported_Vehicles_C17 = 
		[];
	
	//*****************************************************************************************************************
	//*										VIOC Units declaration
	//*****************************************************************************************************************		
	
	
	/*if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_fow_s_ger_heer_rifleman")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_CSA38_WH2Bi")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_I_NORTH_FIN_W_41_Unequipped")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	
	
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_fl_bf109e")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_nl_mutsuki")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_bf110")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_SOV_BT_BT7A")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	
	
	_sid = [];
	if(CTI_VIO_ADDON == 0) then {
		_sid = [""];
	} else {
		_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
	};*/
	_sid = ["", "VIOC_B_", "VIOC_O_", "VIOC_I_"];
	
	//maybe using namespace for a better performance?
	//with missionNamespace do {
		
	//};
	
	IL_Supported_Vehicles_Gaz = [];
	IL_Supported_Vehicles_Praga =  [];
	IL_Supported_Vehicles_Blitz =  [];
	IL_Supported_Vehicles_BlitzCSA =  [];
	IL_Supported_Vehicles_US6 =  [];
	IL_Supported_Vehicles_GMC =  [];
	IL_Supported_Vehicles_GMCFOW =  [];
	IL_Supported_Vehicles_SdKfz7 = [];
	IL_Supported_Vehicles_LCVP =  [];
	IL_Supported_Vehicles_LCM3 =  [];
	IL_Supported_Vehicles_C47 =  [];
	IL_Supported_Vehicles_Cargo_Ship =  [];
	
	{
		//IL_Supported_Vehicles_Praga pushBack format["%1", _x];
		
		IL_Supported_Vehicles_Gaz pushBack format["%1ifa3_gazaa_IZ", _x];
		IL_Supported_Vehicles_Gaz pushBack format["%1ifa3_gaz2", _x];
		
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV2", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV4", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV6", _x];
		
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_DAK_OpelBlitz_Open", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_DAK_OpelBlitz_Tent", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _x];
		
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1fow_v_type97_truck_open_ija", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1fow_v_type97_truck_ija", _x];
		
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Open", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Open_Cargo", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Tent_Cargo", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Tent", _x];
				
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Tent", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Open", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Tent_w", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Open_w", _x];
		
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_usa", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_open_usa", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_usmc", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_open_usmc", _x];
		
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_SdKfz_7", _x];
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_DAK_SdKfz_7", _x];
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_SdKfz_7_w", _x];
		
		IL_Supported_Vehicles_LCVP pushBack format["%1LIB_LCVP", _x];
		
		IL_Supported_Vehicles_LCM3 pushBack format["%1LIB_LCM3_Armed", _x];
		
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_Skytrain", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_RAF_bob", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_RAF_snafu", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_Li2", _x];
		
		IL_Supported_Vehicles_Cargo_Ship pushBack format["%1sab_nl_liberty", _x];
		
	} forEach _sid;
	
	//IL_Supported_Vehicles_All = IL_Supported_Vehicles_APC + IL_Supported_Vehicles_Dingo + IL_Supported_Vehicles_HMMWV + IL_Supported_Vehicles_Ural + IL_Supported_Vehicles_Zamak + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD + IL_Supported_Vehicles_CHINOOK + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3;
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47 + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_Praga + IL_Supported_Vehicles_Blitz + IL_Supported_Vehicles_BlitzCSA + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_GMC + IL_Supported_Vehicles_GMCFOW + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3 + IL_Supported_Vehicles_Cargo_Ship;

	// Vehicles with the ability to dropping the load on the parachute
	//IL_Para_Drop_Vehicles = IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_CHINOOK;
	IL_Para_Drop_Vehicles = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47;

	//Supported cargo
	//#include "OriginalCargo.cpp"
	IL_Supported_Box_H1 = 
		[
			"Box_East_Wps_F",  // basic weapons [CSAT]
			"Box_East_WpsLaunch_F",  // launchers [CSAT]
			"Box_East_WpsSpecial_F",  // special weapons [CSAT]

			"Box_IND_Wps_F",  // basic weapons [AAF]
			"Box_IND_WpsLaunch_F",  // launchers [AAF]
			"Box_IND_WpsSpecial_F",  // special weapons [AAF]

			"Box_NATO_Wps_F",  // basic weapons [NATO]
			"Box_NATO_WpsLaunch_F",  // launchers [NATO]
			"Box_NATO_WpsSpecial_F",  // special weapons [NATO]
			"Exile_Container_SupplyBox"  // supply box
		];

	IL_Supported_Box_H2 = 
		[
			"Box_East_Ammo_F",  // basic ammo [CSAT]
			"Box_East_AmmoOrd_F",  // explosives [CSAT] 
			"Box_East_Grenades_F",  // grenades [CSAT]
			"Box_East_Support_F",  // support [CSAT]

			"Box_IND_Ammo_F",  // basic ammo [AAF]
			"Box_IND_AmmoOrd_F",  // explosives [AAF]
			"Box_IND_Grenades_F",  // grenades [AAF]
			"Box_IND_Support_F",  // support [AAF]

			"Box_NATO_Ammo_F",  // basic ammo [NATO]
			"Box_NATO_AmmoOrd_F",  // explosives [NATO]
			"Box_NATO_Grenades_F",  // grenades [NATO]
			"Box_NATO_Support_F"  // support [NATO]
		];

	IL_Supported_Supply_Crate = 
		[
			"B_CargoNet_01_ammo_F",  // cargo net [NATO]
			"B_CargoNET_01_F",  // ???
			"B_supplyCrate_F",  // supply box [NATO]
			"C_supplyCrate_F",  // supply box [CTRG]
			"CargoNet_01_box_F",  // cargo net (box)
			"I_CargoNet_01_ammo_F",  // cargo net [AAF]
			"I_CargoNET_01_F",  // ???
			"I_supplyCrate_F",  // supply box [AAF]
			"IG_supplyCrate_F",  // supply box [FIA]
			"O_CargoNet_01_ammo_F",  // cargo net [CSAT]
			"O_CargoNET_01_F",  // ???
			"O_supplyCrate_F",  // supply box [CSAT]

			// moved here because it's literally a large, netted supply crate
			"Exile_Container_SupplyBox"  // supply box
		];

	IL_Supported_Veh_Ammo = 
		[
			"ASC_B_box",  // ???
			"Box_East_AmmoVeh_F",  // vehicle ammo [CSAT]
			"Box_IND_AmmoVeh_F",  // vehicle ammo [AAF]
			"Box_NATO_AmmoVeh_F",  // vehicle ammo [NATO]
			"Land_CargoBox_V1_F"  // small container
		];

	IL_Supported_Barrel = 
		[
			// "Land_BarrelEmpty_F",
			// "Land_BarrelEmpty_grey_F",
			// "Land_BarrelSand_F",
			// "Land_BarrelSand_grey_F",
			// "Land_BarrelTrash_F",
			// "Land_BarrelTrash_grey_F",
			// "Land_BarrelWater_F",
			// "Land_BarrelWater_grey_F",
			// "Land_MetalBarrel_F"
		];//, "Land_MetalBarrel_empty_F", "MetalBarrel_burning_F"];

	IL_Supported_Tank = 
		[
			// "Land_WaterBarrel_F",
			// "Land_WaterTank_F"
		];

	IL_Supported_Rubberboat = 
		[
			"I_Boat_Transport_01_F",
			"O_Boat_Transport_01_F",
			"B_G_Boat_Transport_01_F",
			"B_Boat_Transport_01_F",
			"C_Rubberboat",
			"O_Lifeboat",
			"B_Lifeboat",
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"C_Scooter_Transport_01_F",
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"I_C_Boat_Transport_02_F",
			"C_Boat_Transport_02_F"
		];

	IL_Supported_SDV = 
		[
			"I_SDV_01_F",
			"O_SDV_01_F",
			"B_SDV_01_F",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
		];

	IL_Supported_Box_H1 = 
		[
			"Box_East_Wps_F",  // basic weapons [CSAT]
			"Box_East_WpsLaunch_F",  // launchers [CSAT]
			"Box_East_WpsSpecial_F",  // special weapons [CSAT]

			"Box_IND_Wps_F",  // basic weapons [AAF]
			"Box_IND_WpsLaunch_F",  // launchers [AAF]
			"Box_IND_WpsSpecial_F",  // special weapons [AAF]

			"Box_NATO_Wps_F",  // basic weapons [NATO]
			"Box_NATO_WpsLaunch_F",  // launchers [NATO]
			"Box_NATO_WpsSpecial_F"  // special weapons [NATO]
		];

	IL_Supported_Box_H2 = 
		[
			"Box_East_Ammo_F",  // basic ammo [CSAT]
			"Box_East_AmmoOrd_F",  // explosives [CSAT] 
			"Box_East_Grenades_F",  // grenades [CSAT]
			"Box_East_Support_F",  // support [CSAT]

			"Box_IND_Ammo_F",  // basic ammo [AAF]
			"Box_IND_AmmoOrd_F",  // explosives [AAF]
			"Box_IND_Grenades_F",  // grenades [AAF]
			"Box_IND_Support_F",  // support [AAF]

			"Box_NATO_Ammo_F",  // basic ammo [NATO]
			"Box_NATO_AmmoOrd_F",  // explosives [NATO]
			"Box_NATO_Grenades_F",  // grenades [NATO]
			"Box_NATO_Support_F"  // support [NATO]
		];
	IL_Supported_Cargo20 = 
		[
			"Land_Cargo20_blue_F", 	// cargo container (medium, blue)
			"Land_Cargo20_brick_red_F",  	// cargo container (medium, brick red)
			"Land_Cargo20_cyan_F",  	// cargo container (medium, cyan)
			"Land_Cargo20_grey_F",  	// cargo container (medium, grey)
			"Land_Cargo20_light_blue_F",  	// cargo container (medium, light blue)
			"Land_Cargo20_light_green_F",  	// cargo container (medium, light green)
			"Land_Cargo20_military_green_F",  	// cargo container (medium, military green)
			"Land_Cargo20_orange_F",  	// cargo container (medium, orange)
			"Land_Cargo20_red_F",  	// cargo container (medium, red)
			"Land_Cargo20_sand_F",   	// small container sand
			"Land_Cargo20_white_F",   	// cargo container (medium, white)
			"Land_Cargo20_yellow_F"  	// cargo container (medium, yellow)
		];
		
	//*****************************************************************************************************************
	//*										VIOC Units declaration
	//*****************************************************************************************************************	
		
	
	IL_Supported_Vehicle_Light = ["Car"];
	IL_Supported_Vehicle_Medium = ["Car","Truck"];
	IL_Supported_Vehicle_Heavy = ["Tank"];
	IL_Supported_Vehicle_Boat = ["Ship"];
		
		
	IL_Supported_Small_Crates = [];
	IL_Supported_Medium_Crates =  [];
	IL_Supported_Large_Crates =  [];
	IL_Supported_Stacket_Crates =  [];
	IL_Supported_Bike_Cargo = [];
	IL_Supported_Mini_Static_Cargo =  [];
	IL_Supported_Small_Static_Cargo =  [];
	IL_Supported_Medium_Static_Cargo =  [];
	IL_Supported_Large_Static_Cargo =  [];
	IL_Supported_XLarge_Static_Cargo =  [];
	IL_Supported_Motorcicle_Cargo =  [];
	IL_Supported_Gaz_Zis5_Cargo =  [];
	IL_Supported_Truck_Cargo =  [];
	IL_Supported_Car_Cargo =  [];
	IL_Supported_Armoured_Cargo =  [];
	IL_Supported_Small_Tank_Cargo = [];
	IL_Supported_Gaz_Zis5_Cargo = [];
	IL_Supported_Truck_Cargo = [];
	IL_Supported_Car_Cargo = [];
	IL_Supported_Armoured_Cargo = [];
	IL_Supported_Small_Tank_Cargo = [];
	IL_Supported_Medium_Tank_Cargo = [];
	IL_Supported_Large_Tank_Cargo = [];
	IL_Supported_Landing_Ship_Cargo = [];
	IL_Supported_L_Landing_Ship_Cargo = [];
	
	
	
	{
		//IL_Supported_Small_Crates pushBack format["%1", _x];
		
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_81mm_Mo_HE", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_81mm_Mo_Smoke", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_82mm_Mo_Smoke", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_BasicAmmunitionBox_US", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_BasicAmmunitionBox_SU", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_AmmoCrate_Mortar_SU", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Lone_Big_Box", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_AmmoCrate_Arty_SU", _x];
		
		IL_Supported_Medium_Crates pushBack format["%1LIB_Box_60mm_Mo_HE", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_Box_60mm_Mo_Smoke", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_AmmoCrate_Mortar_GER", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_BasicAmmunitionBox_GER", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_Mine_Ammo_Box_Ger", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_AmmoCrate_Arty_GER", _x];
		
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_GER", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_4Rnd_RPzB", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_UK", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_US", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_SU", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_Mine_AmmoBox_US", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_Mine_Ammo_Box_Su", _x];
		
		IL_Supported_Stacket_Crates pushBack format["%1LIB_WeaponsBox_Big_GER", _x];
		IL_Supported_Stacket_Crates pushBack format["%1LIB_WeaponsBox_Big_SU", _x];
		
		//IL_Supported_Bike_Cargo pushBack format["%1Exile_Bike_OldBike", _x];
		//IL_Supported_Bike_Cargo pushBack format["%1Exile_Bike_MountainBike", _x];
		
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GER_SearchLight", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_SU_SearchLight", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG34_Lafette_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG34_Lafette_low_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG42_Lafette_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG42_Lafette_low_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_M1919_M2", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Maxim_M30_base", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Maxim_M30_Trench", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Vickers_MMG", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GrWr34", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GrWr34_g", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_BM37", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_M2_60", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_MG34t", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_zb30jt", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1csa38_GrW34", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_2inch_vehicle", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_brenmkiit", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_brenmkiit2", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_TKVZ24mg", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_TKVZ37MG", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_mvz17", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_mvz36", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_low_s_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_low_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type97_mortar_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type97_mortar_adv_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_vickers_uk", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_m37", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_m41", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_mm", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_p", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc_camo01", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc_camo02", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_usa", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_adv_usa", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_adv_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_39_50rm38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_50rm38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_Maxim_41", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_41", _x];
		
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_Maxim_High", _x];
		
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_30_w", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_30", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_38_w", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_38", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_39_45mm1937", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_45mm1937", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1927", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_76mm1927", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1927art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_76mm1927art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_Maxim_Quad", _x];
		
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_57mm_M1", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_QF6_pdr", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Flakvierling_38_w", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Flakvierling_38", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41_Camo", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41_Gelbbraun", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_M45_Quadmount_UK", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_M45_Quadmount", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_FR", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_late", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_W", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_DE", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_KPUV37", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_ija", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_uk", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_usa", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_usmc", _x];
		
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_leFH18", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_leFH18_AT", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_61k", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Pak40_w", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_DAK_Pak40", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Pak40", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Zis3_w", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Zis3", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_camo_foliage_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_camo_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_yellow_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_gray_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_W_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_S_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1902", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_76mm1902", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_S_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_W_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1902art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_76mm1902art", _x];
		
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_AA_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_ARTY_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36_AA", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36_ARTY", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_AA", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_ARTY", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_camo_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_gray_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_green_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_tan_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_41_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_39_152mm1938", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_152mm1938", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_41_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1936", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_76mm1936", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1936art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_76mm1936art", _x];
		
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis6_parm_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis6_Parm", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_fuel_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_Fuel", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_med_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_Med", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_61K", _x];
		
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Open_Cargo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Tent_Cargo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Tent_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Open_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Parm_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ammo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Fuel_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Fuel", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ambulance_w", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Parm_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ammo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Fuel_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Fuel", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7", _x];	
		
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_M1919_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1_hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1_MG42", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_GazM1_SOV", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_GazM1_SOV_camo_sand", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_M1919_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Ambulance", _x];
		
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_m3_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_M3_Halftrack_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_M8_Greyhound", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_SdKfz251", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_SdKfz251_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Sdkfz251_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SOV_M3_Halftrack_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SOV_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_m3_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_W_41_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_S_41_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_SOV_W_39_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_SOV_41_BA10", _x];
		
		//IL_Supported_Armoured_Cargo pushBack format["%1", _x];
		//IL_Supported_XLarge_Static_Cargo pushBack format["%", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_SOV", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_SOV", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_w", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_desert", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_UK_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_DR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_UK", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_UK_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_DR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_UK", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIA", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_FR", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR2_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_DE2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_1", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_FR", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_mzm35t_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR2_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_mzm35t", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_LATE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_LATE2", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD8", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD6", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD7", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD9", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD10", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD11", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD12", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD13", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD458", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD456", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD457%", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD459", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD452", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD453", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD454", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD455", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD45", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4510", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4511", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4512", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4513", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17ADW", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_TCvz33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz34", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIAvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz35", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a1", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17APL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3RU2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3RU1", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26E", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26E", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_Vickers6t", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT5Com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT5Com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_BT42", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_BT42", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T26_M39", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7A", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7_M1937", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7TU_M1937", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_1_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_2_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_3_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_universalCarrier", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m5a1_usa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m5a1_usmc", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m4a2_usa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m4a2_usmc", _x];
		
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G_WS_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_SdKfz124", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_PzKpfwIV_H_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_DAK_PzKpfwIV_H", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_PzKpfwIV_H", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_FlakPanzerIV_Wirbelwind_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_I_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_IB_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_UK_DR_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_I", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_IB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_UK_Italy_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_US_NAC_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75_Tubes", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4E5_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4E5", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_76", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4T34_Calliope", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_76_HVSS", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_FlakPanzerIV_Wirbelwind", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_76_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_76", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A2_SOV_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A2_SOV", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_85_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_85", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_StugIII", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_DAK2", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVC_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVC_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVcv38", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIBvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIICvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIDvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34cz5", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34cz1", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVBvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU3", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU1", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU2", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7A", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7Com_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7A", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7Com_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T28_M34", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T28_M34_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_M34", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_M34_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT7", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usa_p", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usa", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usmc", _x];
		

		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_E_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_DAK_PzKpfwVI_E", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_E", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwV_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwV", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_B_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_B", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_SU85_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_SU85", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_JS2_43_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_JS2_43", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk4_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk6_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_IC_Firefly_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_IC_Firefly", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_M4A4_FIREFLY", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_camo_foliage_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_camo_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_cromwell_uk", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPL2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPLHELA", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DPL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_PL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo9W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo10W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo12W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo11W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo1W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo4W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo5W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo6W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo7W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo8W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCSW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4ENW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo9", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo10", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo11", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo12", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2B", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo8", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4EN", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo9", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo10", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo11", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo12", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C453", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C452", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D452", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D453", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_145", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_345", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo8", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_5EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_6EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIRU2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIRU1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_RU2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_RU1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_5", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_SOV_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_T34_76_1941", _x];
		
		
		IL_Supported_Landing_Ship_Cargo pushBack format["%1LIB_UK_LCA", _x];
		IL_Supported_Landing_Ship_Cargo pushBack format["%1LIB_LCVP", _x];
		IL_Supported_Landing_Ship_Cargo pushBack format["%1LIB_LCA", _x];
		
		IL_Supported_L_Landing_Ship_Cargo pushBack format["%1LIB_LCM3_Armed", _x];
		
	} forEach _sid;
	
	missionNamespace setVariable ["IL_Supported_Small_Crates", IL_Supported_Small_Crates];
	missionNamespace setVariable ["IL_Supported_Medium_Crates", IL_Supported_Medium_Crates];
	missionNamespace setVariable ["IL_Supported_Large_Crates", IL_Supported_Large_Crates];
	missionNamespace setVariable ["IL_Supported_Stacket_Crates", IL_Supported_Stacket_Crates];
	missionNamespace setVariable ["IL_Supported_Bike_Cargo", IL_Supported_Bike_Cargo];
	missionNamespace setVariable ["IL_Supported_Mini_Static_Cargo", IL_Supported_Mini_Static_Cargo];
	missionNamespace setVariable ["IL_Supported_Small_Static_Cargo", IL_Supported_Small_Static_Cargo];
	missionNamespace setVariable ["IL_Supported_Medium_Static_Cargo", IL_Supported_Medium_Static_Cargo];
	missionNamespace setVariable ["IL_Supported_Large_Static_Cargo", IL_Supported_Large_Static_Cargo];
	missionNamespace setVariable ["IL_Supported_XLarge_Static_Cargo", IL_Supported_XLarge_Static_Cargo];
	missionNamespace setVariable ["IL_Supported_Motorcicle_Cargo", IL_Supported_Motorcicle_Cargo];
	missionNamespace setVariable ["IL_Supported_Gaz_Zis5_Cargo", IL_Supported_Gaz_Zis5_Cargo];
	missionNamespace setVariable ["IL_Supported_Truck_Cargo", IL_Supported_Truck_Cargo];
	missionNamespace setVariable ["IL_Supported_Car_Cargo", IL_Supported_Car_Cargo];
	missionNamespace setVariable ["IL_Supported_Armoured_Cargo", IL_Supported_Armoured_Cargo];
	missionNamespace setVariable ["IL_Supported_Small_Tank_Cargo", IL_Supported_Small_Tank_Cargo];
	missionNamespace setVariable ["IL_Supported_Medium_Tank_Cargo", IL_Supported_Medium_Tank_Cargo];
	missionNamespace setVariable ["IL_Supported_Large_Tank_Cargo", IL_Supported_Large_Tank_Cargo];
	missionNamespace setVariable ["IL_Supported_Landing_Ship_Cargo", IL_Supported_Landing_Ship_Cargo];
	missionNamespace setVariable ["IL_Supported_L_Landing_Ship_Cargo", IL_Supported_L_Landing_Ship_Cargo];
	
	/*
	IL_Supported_Cargo_Veh_C17 = IL_Supported_Cargo_Veh_C130J;
	IL_Supported_Cargo_NonVeh_C17 = IL_Supported_Cargo_NonVeh_C130J;
	IL_Supported_Cargo_C17 = IL_Supported_Cargo_Veh_C17 + IL_Supported_Cargo_NonVeh_C17;*/
	
	
	//*****************************************************************************************************************
	//*										VIOC Cargo declaration
	//*****************************************************************************************************************
	//cargo with extra set of higth after unload
	IL_Cargo_To_Drop = IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo + IL_Supported_Medium_Static_Cargo + IL_Supported_Large_Static_Cargo + IL_Supported_XLarge_Static_Cargo;
	
	//IL_Supported_Bike_Cargo
	
	IL_Supported_Crates_place_near = IL_Supported_Small_Crates + IL_Supported_Medium_Crates + IL_Supported_Large_Crates;
		
	IL_Supported_Cargo_Veh_Gaz = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Gaz = IL_Supported_Crates_place_near + IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20 + IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo;
	IL_Supported_Cargo_Gaz = IL_Supported_Cargo_Veh_Gaz + IL_Supported_Cargo_NonVeh_Gaz;
	
	IL_Supported_Cargo_Veh_Praga = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Praga = IL_Supported_Crates_place_near + IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20 + IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo;
	IL_Supported_Cargo_Praga = IL_Supported_Cargo_Veh_Gaz + IL_Supported_Cargo_NonVeh_Gaz;
	
	IL_Supported_Cargo_Veh_Blitz = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Blitz = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_Blitz = IL_Supported_Cargo_Veh_Blitz + IL_Supported_Cargo_NonVeh_Blitz;
	
	IL_Supported_Cargo_Veh_BlitzCSA = IL_Supported_Cargo_Veh_Blitz;
	IL_Supported_Cargo_NonVeh_BlitzCSA = IL_Supported_Cargo_NonVeh_Blitz;
	IL_Supported_Cargo_BlitzCSA = IL_Supported_Cargo_Blitz;
	
	IL_Supported_Cargo_Veh_US6 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_US6 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_US6 = IL_Supported_Cargo_Veh_US6 + IL_Supported_Cargo_NonVeh_US6;
	
	IL_Supported_Cargo_Veh_GMC = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_GMC = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_GMC = IL_Supported_Cargo_Veh_GMC + IL_Supported_Cargo_NonVeh_GMC;
	
	IL_Supported_Cargo_Veh_GMCFOW = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_GMCFOW = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_GMCFOW = IL_Supported_Cargo_Veh_GMC + IL_Supported_Cargo_NonVeh_GMC;
	
	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Car_Cargo + IL_Supported_Motorcicle_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_SdKfz7 = IL_Supported_Cargo_NonVeh_US6 + IL_Supported_Large_Static_Cargo + IL_Supported_XLarge_Static_Cargo;
	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Cargo_Veh_SdKfz7 + IL_Supported_Cargo_NonVeh_SdKfz7;
	
	IL_Supported_Cargo_Veh_LCVP = IL_Supported_Car_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_LCVP = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCVP = IL_Supported_Cargo_Veh_LCVP + IL_Supported_Cargo_NonVeh_LCVP;

	IL_Supported_Cargo_Veh_LCM3 = IL_Supported_Armoured_Cargo + IL_Supported_Gaz_Zis5_Cargo + IL_Supported_Truck_Cargo + IL_Supported_Cargo_Veh_LCVP;
	IL_Supported_Cargo_NonVeh_LCM3 = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCM3 = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Cargo_NonVeh_LCM3;
	
	IL_Supported_Cargo_Veh_C47 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_C47 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank;
	IL_Supported_Cargo_C47 = IL_Supported_Cargo_Veh_C47 + IL_Supported_Cargo_NonVeh_C47;
	
	IL_Supported_Cargo_Ship_Liberty = IL_Supported_Landing_Ship_Cargo + IL_Supported_L_Landing_Ship_Cargo;
	IL_Supported_Cargo_Light_Liberty = IL_Supported_Cargo_Veh_LCM3;
	IL_Supported_Cargo_Heavy_Liberty = IL_Supported_Medium_Tank_Cargo + IL_Supported_Large_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_Liberty = IL_Supported_Cargo_NonVeh_LCM3;
	IL_Supported_Cargo_Veh_Liberty = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Medium_Tank_Cargo + IL_Supported_Large_Tank_Cargo + IL_Supported_Landing_Ship_Cargo + IL_Supported_L_Landing_Ship_Cargo;
	//IL_Supported_Cargo_Liberty = IL_Supported_Cargo_Light_Liberty + IL_Supported_Cargo_NonVeh_Liberty;
	
	IL_Supported_ShipCargo = [
		"Car",
		"Truck",
		"Tank",
		"Ship"
	];
};

//https://community.bistudio.com/wiki/in

//	PROCEDURES AND FUNCTIONS
if (isnil "IL_Procedures") then
{
	IL_Procedures = true;

	/*VIOC_Part_In_Array = {
		private["_part", "_array"];
		_part = _this select 0;
		_array = _this select 1;
		
		//[_this select 0, IL_Supported_Cargo_NonVeh_Liberty] call IL_Do_Load;
		
	};*/
	
	IL_Init_Veh = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\InitVehicle.sqf";
	IL_Init_Box = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\InitCargoBox.sqf";
	IL_Score = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\Score.sqf";
	IL_Rotate = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\Rotate.sqf";
	IL_GetCargoMass = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\GetCargoMass.sqf";
	IL_GetDefaultMass = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\GetDefaultMass.sqf";
	IL_SetNewMass = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SetNewMass.sqf";
	IL_Vehicle_Chat = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\VehicleChat.sqf";
	IL_Move_Attach = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\MoveAttach.sqf";
	IL_Create_And_Attach = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\CreateAttach.sqf";
	IL_Cargo_Para = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\CargoPara.sqf";
	IL_Do_Load = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\DoLoad.sqf";
	IL_Do_Unload = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\DoUnload.sqf";
	IL_GetOut = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\GetOut.sqf";

	IL_Server_AddScore = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\AddScore.sqf";
	IL_Server_SetDir = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SetDir.sqf";
	IL_Server_SetMass = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SetMass.sqf";
	
	//https://community.bistudio.com/wiki/addPublicVariableEventHandler
	//command is deprecated!!!!
	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
	
};
//	END PROCEDURES AND FUNCTIONS

//	MAIN CODE
_vsupported = false;
/*
if (_obj_main_type in IL_Supported_Vehicles_C17) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C17.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_NonVeh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_Veh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#007f0e"">Get in C17</t>",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<t color=""#ff0000"">Get out C17</t>",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C17</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Open cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp', 1];
		_this select 0 animate ['back_ramp_door_main', 1];
		_this select 0 animate ['back_ramp_st', 1];
		
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Close cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp_st', 0];
		_this select 0 animate ['back_ramp', 0];
		_this select 0 animate ['back_ramp_door_main', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 1) && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];
};
*/

//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//Gaz
if (_obj_main_type in IL_Supported_Vehicles_Gaz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Gaz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Praga) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Praga.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Blitz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Blitz.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_BlitzCSA) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_BlitzCSA.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// US6
if (_obj_main_type in IL_Supported_Vehicles_US6) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_US6.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from US6</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMC) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMC.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMCFOW) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMCFOW.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// SdKfz7
if (_obj_main_type in IL_Supported_Vehicles_SdKfz7) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_SdKfz7.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from SdKfz7</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCVP
if (_obj_main_type in IL_Supported_Vehicles_LCVP) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCVP.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCVP</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCM3
if (_obj_main_type in IL_Supported_Vehicles_LCM3) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCM3.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCM3</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	//"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Liberty Ship
if (_obj_main_type in IL_Supported_Vehicles_Cargo_Ship) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Cargo_Ship.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*
	this addAction
	[
		"title",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
		},
		nil,		// arguments
		1.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"true", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
	
	*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority2,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Light_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Medium, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_ShipCargo, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	/*_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load heavy vehicle on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Heavy_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority3,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Heavy_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Heavy, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Heavy, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load Boat on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Ship_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority4,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Ship_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Boat, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Ship_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Cargo Ship</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];	
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
//C47
if (_obj_main_type in IL_Supported_Vehicles_C47) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C47.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*if (_obj_main_type == "C130J") then
	{
		_obj_main addAction [
		"<t color=""#ff0000"">Get out on the side of ramp</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' > 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' > 0.9) && (_target getVariable 'usable_ramp')"
		];
	};*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, 30]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], 30])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_C47, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_Veh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C47</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
/*
	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];*/
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};
//	EOF
