
if (isnil "IL_Variables") then
{
	with missionNamespace do {
		IL_Variables = true;
		IL_LoadIfNotInNS = false;

		//Check new vehicles time
		IL_Check_Veh_Min = 10;
		IL_Check_Veh_Max = 20;
		if(IL_DevMod) then {
			IL_Check_Veh_Min = 2;
			IL_Check_Veh_Max = 4;
		};
			
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
		/*IL_Num_Slots_OFFROAD = -2;
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
		IL_Num_Slots_Zamak = -4;  // Zamak*/
		// VIOC added vehicles
		IL_Num_Slots_Gaz = -6; 
		IL_Num_Slots_Praga = -8; 
		IL_Num_Slots_Blitz = -8; 
		IL_Num_Slots_BlitzCSA = -8; 
		IL_Num_Slots_US6 = -8; 
		IL_Num_Slots_GMC = -8; 
		IL_Num_Slots_SdKfz7 = -12; 
		IL_Num_Slots_LCVP = -13; 
		IL_Num_Slots_LCM3 = -15;
		IL_Num_Slots_CargoShip = -300;
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
		IL_Mass = false;

		//helping function to check the used vehicle classes if sidepatch is used.
		//IL_GetUsedOrAll = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\GetUsedOrAll.sqf";

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
	IL_Supported_Vehicles_Gaz =  [];			// NF Zis5  + FordV8
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
	IL_Supported_Vehicles_CargoShip =  [];
	IL_Supported_Vehicles_Carrier =  [];

	if (isClass(configFile >> "CfgVehicles" >> "LIB_OpelBlitz_Open_Y_Camo")) then {
		IL_Supported_Vehicles_Blitz append (["LIB_OpelBlitz_Open_Y_Camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_OpelBlitz_Tent_Y_Camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_DAK_OpelBlitz_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_DAK_OpelBlitz_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_OpelBlitz_Open_G_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_OpelBlitz_Open_Y_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["LIB_OpelBlitz_Tent_Y_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US6_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US6_Open_Cargo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US6_Tent_Cargo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US6_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US_GMC_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US_GMC_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US_GMC_Tent_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_US6 append (["LIB_US_GMC_Open_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_SdKfz7 append (["LIB_SdKfz_7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_SdKfz7 append (["LIB_DAK_SdKfz_7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_SdKfz7 append (["LIB_SdKfz_7_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_LCVP append (["LIB_LCVP",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_LCM3 append (["LIB_LCM3_Armed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_C47 append (["LIB_C47_Skytrain",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_C47 append (["LIB_C47_RAF_bob",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_C47 append (["LIB_C47_RAF_snafu",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_C47 append (["LIB_Li2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "SPE_OpelBlitz_Open")) then {
		IL_Supported_Vehicles_Blitz append (["SPE_OpelBlitz_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Blitz append (["SPE_OpelBlitz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "CSA38_pragaRV")) then {
		IL_Supported_Vehicles_Praga append (["CSA38_pragaRV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Praga append (["CSA38_pragaRV2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Praga append (["CSA38_pragaRV4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Praga append (["CSA38_pragaRV6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz3_LATE2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz3_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz2_LATE2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz2_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz_LATE2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz3_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz2_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz3_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz2_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["CSA38_opelblitz_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "NORTH_FIN_W_39_FordV8_Open")) then {
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_S_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_S_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_S_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_39_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_S_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_S_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_FIN_W_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_W_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_W_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_W_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Gaz append (["NORTH_SOV_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "fow_v_type97_truck_ija")) then {
		IL_Supported_Vehicles_BlitzCSA append (["fow_v_type97_truck_open_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_BlitzCSA append (["fow_v_type97_truck_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_GMCFOW append (["fow_v_gmc_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_GMCFOW append (["fow_v_gmc_open_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_GMCFOW append (["fow_v_gmc_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_GMCFOW append (["fow_v_gmc_open_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "sab_nl_liberty")) then {
		IL_Supported_Vehicles_CargoShip append (["sab_nl_liberty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "sab_nl_enterprise")) then {
		IL_Supported_Vehicles_Carrier append (["sab_nl_enterprise",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Vehicles_Carrier append (["sab_nl_akagi",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
		
	//IL_Supported_Vehicles_All = IL_Supported_Vehicles_APC + IL_Supported_Vehicles_Dingo + IL_Supported_Vehicles_HMMWV + IL_Supported_Vehicles_Ural + IL_Supported_Vehicles_Zamak + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD + IL_Supported_Vehicles_CHINOOK + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3;
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47 + IL_Supported_Vehicles_Praga + IL_Supported_Vehicles_Blitz + IL_Supported_Vehicles_BlitzCSA + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_GMC + IL_Supported_Vehicles_GMCFOW + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3 + IL_Supported_Vehicles_CargoShip + IL_Supported_Vehicles_Carrier;

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
	IL_Supported_Plane_Cargo = [];
	
	if (isClass(configFile >> "CfgVehicles" >> "Exile_Bike_OldBike")) then {
		IL_Supported_Bike_Cargo append (["Exile_Bike_OldBike",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Bike_Cargo append (["Exile_Bike_MountainBike",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "LIB_Zis5v_w")) then {
		IL_Supported_Small_Crates append (["LIB_AmmoCrate_Mortar_SU",IL_LoadIfNotInNS] call IL_GetUsedOrAll);//used for calc space
		IL_Supported_Small_Crates append (["LIB_Box_81mm_Mo_HE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_Box_81mm_Mo_Smoke",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_Box_82mm_Mo_Smoke",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_AmmoCrate_Arty_SU",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_Box_60mm_Mo_HE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_Box_60mm_Mo_Smoke",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_AmmoCrate_Mortar_GER",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_BasicAmmunitionBox_GER",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_Mine_Ammo_Box_Ger",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_AmmoCrate_Arty_GER",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_BasicWeaponsBox_US",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Crates append (["LIB_BasicWeaponsBox_SU",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_Lone_Big_Box",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_BasicWeaponsBox_GER",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_BasicAmmunitionBox_US",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_BasicAmmunitionBox_SU",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_4Rnd_RPzB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_BasicWeaponsBox_UK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_Mine_AmmoBox_US",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Crates append (["LIB_Mine_Ammo_Box_Su",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Crates append (["LIB_WeaponsBox_Big_GER",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Crates append (["LIB_WeaponsBox_Big_SU",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_GER_SearchLight",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_SU_SearchLight",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_MG34_Lafette_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_MG34_Lafette_low_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_MG42_Lafette_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_MG42_Lafette_low_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_M1919_M2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_Maxim_M30_base",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_Maxim_M30_Trench",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_Vickers_MMG",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_GrWr34",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_GrWr34_g",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_BM37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["LIB_M2_60",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["LIB_FlaK_30_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["LIB_FlaK_30",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["LIB_FlaK_38_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["LIB_FlaK_38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_57mm_M1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_QF6_pdr",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_Flakvierling_38_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_Flakvierling_38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_Nebelwerfer41",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_Nebelwerfer41_Camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["LIB_Nebelwerfer41_Gelbbraun",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_leFH18",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_leFH18_AT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_61k",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_Pak40_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_DAK_Pak40",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_Pak40",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_Zis3_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["LIB_Zis3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36_AA_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36_ARTY_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_DAK_FlaK_36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_DAK_FlaK_36_AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_DAK_FlaK_36_ARTY",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36_AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["LIB_FlaK_36_ARTY",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis6_parm_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis6_Parm",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_fuel_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_med_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_Med",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Gaz_Zis5_Cargo append (["LIB_Zis5v_61K",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_Open_Cargo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_Tent_Cargo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US6_BM13",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Tent_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Open_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Parm_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Parm",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Ammo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Fuel_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_US_GMC_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Ambulance_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Open_Y_Camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Tent_Y_Camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Tent",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Open_G_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Open_Y_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Tent_Y_Camo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Parm_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Parm",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Parm",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Ammo_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Fuel_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_DAK_OpelBlitz_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_OpelBlitz_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_SdKfz_7_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_SdKfz_7_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["LIB_SdKfz_7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_Hood_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_M1919_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_Ambulance_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_M1919",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_Willys_MB_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_NAC_Willys_MB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_NAC_Willys_MB_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_NAC_Willys_MB_M1919",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_US_NAC_Willys_MB_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_Hood_camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_Hood_sernyt",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_sernyt",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_MG42",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_MG42_camo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_MG42_sernyt",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Kfz1_Hood_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_DAK_Kfz1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_DAK_Kfz1_hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_DAK_Kfz1_MG42",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_GazM1_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_GazM1_SOV_camo_sand",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB_Hood_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB_Ambulance_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_Willys_MB_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_Hood_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_DR_Willys_MB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_DR_Willys_MB_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_Hood",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_M1919_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_DR_Willys_MB_M1919",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_M1919",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_Ambulance_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_DR_Willys_MB_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["LIB_UK_Willys_MB_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_Scout_m3_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_Scout_M3_FFV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_Scout_M3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_Scout_M3_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_NAC_Scout_M3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_NAC_Scout_M3_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_M3_Halftrack_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_M3_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_US_NAC_M3_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_M8_Greyhound",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_DAK_SdKfz251",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_DAK_SdKfz251_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_Sdkfz251_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_FFV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_DAK_M3_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_DAK_Scout_M3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_DAK_Scout_M3_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SOV_M3_Halftrack_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SOV_M3_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_captured_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_captured_FFV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_captured",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_SdKfz251_captured_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_Scout_m3_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_Scout_M3_FFV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_Scout_M3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["LIB_Scout_M3_FFV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_UniversalCarrier_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_UniversalCarrier_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_UniversalCarrier_desert",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_UniversalCarrier",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart_UK_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart_DR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart_UK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M5A1_Stuart_UK_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M5A1_Stuart_DR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M5A1_Stuart_UK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M3A3_Stuart",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["LIB_M5A1_Stuart",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_StuG_III_G_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_StuG_III_G_WS_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_StuG_III_G",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_SdKfz124",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_PzKpfwIV_H_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_DAK_PzKpfwIV_H",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_PzKpfwIV_H",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_FlakPanzerIV_Wirbelwind_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_DAK_FlakPanzerIV_Wirbelwind",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_Sherman_I_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_Sherman_IB_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_UK_DR_M4A3_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_Sherman_I",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_Sherman_IB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_UK_Italy_M4A3_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A3_75_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_US_NAC_M4A3_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A3_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A3_75_Tubes",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4E5_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4E5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A3_76",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4T34_Calliope",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A3_76_HVSS",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_FlakPanzerIV_Wirbelwind",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_T34_76_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_T34_76",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A2_SOV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_M4A2_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_T34_85_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["LIB_T34_85",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwVI_E_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_DAK_PzKpfwVI_E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwVI_E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwV_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwVI_B_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_PzKpfwVI_B",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_SU85_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_SU85",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_JS2_43_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_JS2_43",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_AVRE_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Howitzer_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Crocodile_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_AVRE_desert",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Howitzer_desert",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_desert",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Crocodile_desert",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_AVRE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Howitzer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Churchill_Mk7_Crocodile",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Cromwell_Mk4_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Cromwell_Mk6_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Cromwell_Mk4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_Cromwell_Mk6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_IC_Firefly_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_IC_Firefly",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["LIB_M4A4_FIREFLY",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Landing_Ship_Cargo append (["LIB_UK_LCA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Landing_Ship_Cargo append (["LIB_LCVP",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Landing_Ship_Cargo append (["LIB_LCA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_L_Landing_Ship_Cargo append (["LIB_LCM3_Armed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_Ju87_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_DAK_Ju87_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_Ju87",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_FW190F8_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_DAK_FW190F8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_FW190F8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_P39_w",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_P39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_RAF_P39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_US_NAC_P39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["LIB_US_P39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "CSA38_pzbfwI_W")) then {
		IL_Supported_Mini_Static_Cargo append (["CSA38_MG34t",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_zb30jt",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["csa38_GrW34",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_2inch_vehicle",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_brenmkiit",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_brenmkiit2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_TKVZ24mg",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_TKVZ37MG",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_mvz17",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["CSA38_mvz36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_pak35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_pak35_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_pak35_late",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_pak35_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_pak35_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["csa38_KPUV37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwI_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIA_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwI_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwI_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIA_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwI_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwIA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwI",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwI",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwI_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIA_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwI_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwI_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIA_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwI_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIa_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIb_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm35_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm35_FR2_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIa_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIb_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII_DE2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIb",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm35_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIa_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIb_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm35_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm35_FR2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIa_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIb_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzII_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwIamb_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_mzm35t_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_FR2_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwIamb",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_mzm35t",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzbfwIamb_DE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_FR2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltm38_LATE2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37ADW2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37ADW3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37ADW4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37ADW5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37ADW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD9",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD11",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD12",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD13",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD458",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD456",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD457",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD459",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD452",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD453",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD454",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD455",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD4510",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD4511",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD4512",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a37AD4513",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17ADW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17AD4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17AD",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17AD3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17AD2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_TCvz33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltvz34",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIAvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzkpfwIvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltvz35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_pzIIvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["CSA38_ltvz38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m5a17APL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a3RU2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["csa38_m3a3RU1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_StugIII",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIB_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIC_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_DAK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_DAK2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIC",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIB_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIC_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIB_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIC_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_FR",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIB_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIC_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIID_LATE",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIV_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVB_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVC_W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIV_DAK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVB_DAK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVC_DAK",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVB",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVcv38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIBvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIICvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIIIDvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["csa38_t34cz5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["csa38_t34cz1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["CSA38_pzIVBvcz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["csa38_t34RU3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["csa38_t34RU1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["csa38_t34RU2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_CPL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_CPL2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_CPLHELA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DPL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_PL",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo9W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo10W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo12W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo11W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo1W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo2W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo3W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo4W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C2W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C3W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_CW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D3W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D2W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo5W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo6W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo7W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo8W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCS2W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCSW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCS3W",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_4ENW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo9",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo11",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo12",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2B",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_2camo8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_4EN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCS3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCS",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_DCS2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo9",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo11",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo12",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C453",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C452",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_C45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D452",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D453",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_D45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_145",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_345",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_245camo8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_5EN45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_6EN45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_cromwell_4EN45",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIRU2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIRU1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIW",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkII3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIgreen",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIgreen2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIgreen3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_valentineMkIIgreen4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_RU2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_RU1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_6",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaii_5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["csa38_matildaiiCS_5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};

	if (isClass(configFile >> "CfgVehicles" >> "fow_ija_type95_HaGo_1_ija")) then {
		IL_Supported_Mini_Static_Cargo append (["fow_w_type92_tripod_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_type92_tripod_low_s_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_type92_tripod_low_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_type97_mortar_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_type97_mortar_adv_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_vickers_uk",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usa_m37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usa_m41",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usa_mm",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usa_p",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usmc_camo01",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usmc_camo02",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m1919_tripod_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m2_mortar_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m2_mortar_adv_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m2_mortar_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["fow_w_m2_mortar_adv_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["fow_w_6Pounder_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["fow_w_6Pounder_uk",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["fow_w_6Pounder_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["fow_w_6Pounder_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["fow_w_pak40_camo_foliage_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["fow_w_pak40_camo_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["fow_w_pak40_yellow_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["fow_w_pak40_gray_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["fow_w_flak36_camo_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["fow_w_flak36_gray_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["fow_w_flak36_green_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["fow_w_flak36_tan_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_ija_type95_HaGo_1_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_ija_type95_HaGo_2_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_ija_type95_HaGo_3_ija",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_v_universalCarrier",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_v_m5a1_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_v_m5a1_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_v_m4a2_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["fow_v_m4a2_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["fow_v_lvta2_usa_p",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["fow_v_lvta2_usa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["fow_v_lvta2_usmc",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["fow_v_panther_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["fow_v_panther_camo_foliage_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["fow_v_panther_camo_ger_heer",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["fow_v_cromwell_uk",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_a6m_green",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_a6m_white",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_faa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_c_faa",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_kick",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_sweet",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_c",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_c_death",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_c_kick",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["fow_va_f6f_c_sweet",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "NORTH_FIN_W_41_BA10")) then {
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_81krh32",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_81krh32",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_41_81krh32",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_50krh38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_50krh38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_41_50krh38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_W_39_50rm38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_50rm38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Lahti_L39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Maxim",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_Lahti_L39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_Maxim_41",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_41_Lahti_L39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_Maxim_41",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_Lahti_L39AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_Maxim_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_Maxim_SOV_High",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_S_41_Maxim_SOV_Medium",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Lahti_L39AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Maxim_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Maxim_SOV_High",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_W_Maxim_SOV_Medium",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_Lahti_L39AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_Maxim_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_Maxim_SOV_High",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_FIN_Maxim_SOV_Medium",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_W_Maxim",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_W_Maxim_High",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_W_Maxim_Medium",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_Maxim",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["NORTH_SOV_Maxim_High",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_W_37PSTK36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_S_41_37PSTK36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_41_37PSTK36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_W_39_45mm1937",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_45mm1937",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_W_45PSTK37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_S_41_45PSTK37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_41_45PSTK37",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_W_76RK27",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_S_41_76RK27",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_41_76RK27",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_W_39_76mm1927",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_76mm1927",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_S_41_76RK27art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_W_76RK27art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_W_76mm1927art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_76mm1927art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_76RK27art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_S_41_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_W_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_FIN_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_W_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["NORTH_SOV_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_W_76k02",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_41_S_76k02",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_41_76k02",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_SOV_W_39_76mm1902",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_SOV_76mm1902",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_41_S_76k02art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_W_76k02art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_FIN_76k02art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_SOV_W_76mm1902art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["NORTH_SOV_76mm1902art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_W_152H38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_S_41_152H38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_41_152H38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_W_39_152mm1938",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_152mm1938",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_W_76k36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_S_41_76k36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_41_76k36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_W_39_76mm1936",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_76mm1936",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_S_41_76k36art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_W_76k36art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_FIN_76k36art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_W_76mm1936art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["NORTH_SOV_76mm1936art",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_W_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_S_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_41_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_W_41_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["NORTH_FIN_S_41_Tempo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_39_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_39_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_41_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_41_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_W_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Medical",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_SOV_ZIS5_Maxim_Quad",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_S_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_41_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["NORTH_FIN_W_39_FordV8_Empty",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["NORTH_FIN_W_41_BA10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["NORTH_FIN_S_41_BA10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["NORTH_FIN_BA10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["NORTH_SOV_W_39_BA10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["NORTH_SOV_41_BA10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26_M33com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M33com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_Vickers6t",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_BT5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_BT5Com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_BT5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_BT5Com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_39_T26_M39_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26_M39_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_BT5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_BT5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_BT42",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_BT5",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_BT42",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_T20",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_T38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_39_T26_M39_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M39_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M39_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_T26_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_T26E_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_T26E_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_T26E_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_T26E_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26E_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_41_T26E_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26E_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_W_41_T26E_M39",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_39_T26_M33_OT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_39_T26_M31",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_39_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_39_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_SOV_39_T26_M33com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_T26E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_T26_M33",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_T26_M33_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_T26_M38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_T26_M39_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_T26E",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_T26_M33_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_T26_M39_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_41_T26_M33_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_41_T26_M39_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M33_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_W_41_T26_M39_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M33_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["NORTH_FIN_S_41_T26_M39_OT_FIN",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_41_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_S_41_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_41_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_39_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_41_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_S_41_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_41_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_41_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_41_T28_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_T28_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_41_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_BT7_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_BT7A",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_BT7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_BT7Com_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_BT7_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_BT7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_BT7A",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_BT7Com_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_T28_M34",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_39_T28_M34_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_T28_M34",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_41_T28_M34_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_39_BT7_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_39_BT7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_41_BT7_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_41_BT7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_S_41_BT7_M35",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_S_41_BT7",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_W_T28_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_39_T28",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_SOV_39_T28_com",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["NORTH_FIN_W_T28e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_SOV_W_41_T34_76_1941",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_SOV_41_T34_76_1941",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_W_41_T34_76_1941",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_S_41_T34_76_1941",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_T34_76_1941",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_SOV_T34_76_1943",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_SOV_W_T34_76_1943",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_T34_76_1943",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_W_T34_76_1943",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["NORTH_FIN_S_T34_76_1943",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};		
	if (isClass(configFile >> "CfgVehicles" >> "SPE_OpelBlitz")) then {
		IL_Supported_Mini_Static_Cargo append (["SPE_MG34_Lafette_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG34_Bipod",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG34_Lafette_low_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG34_Lafette_Trench_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG42_Lafette_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG42_Bipod",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG42_Lafette_low_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_MG42_Lafette_trench_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_M1919_M2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_M1919_M2_Trench_Deployed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_M1919A6_Bipod",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_GrW278_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_M1_81",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Mini_Static_Cargo append (["SPE_GER_SearchLight",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["SPE_FlaK_30",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Static_Cargo append (["SPE_FlaK_38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["SPE_57mm_M1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Static_Cargo append (["SPE_M45_Quadmount",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["SPE_leFH18",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["SPE_leFH18_AT",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Static_Cargo append (["SPE_Pak40",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["SPE_FlaK_36",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_XLarge_Static_Cargo append (["SPE_FlaK_36_AA",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Truck_Cargo append (["SPE_OpelBlitz_Flak38",IL_LoadIfNotInNS] call IL_GetUsedOrAll);	
		IL_Supported_Armoured_Cargo append (["SPE_SdKfz250_1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Unarmed_Open",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Unarmed",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Ammo",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Fuel",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Repair",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack_Ambulance",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M3_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["SPE_US_M16_Halftrack",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_PzKpfwIII_J",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_PzKpfwIII_L",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_PzKpfwIII_M",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_PzKpfwIII_N",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_PzKpfwIV_G",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A0_75_Early",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A0_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M10",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A1_75",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A1_T34_Calliope_Direct",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A1_T34_Calliope",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M18_Hellcat",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["SPE_M4A1_76",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["SPE_PzKpfwVI_H1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["SPE_Nashorn",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["SPE_FW190F8",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["SPE_P47",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
		IL_Supported_Small_Tank_Cargo append (["SOV_BT_BT7A",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["SOV_BT_BT7_M1937",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["SOV_BT_BT7TU_M1937",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T17E1")) then {
		IL_Supported_Car_Cargo append (["FA_DaimlerMk2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["FA_T17E1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["FA_BA64",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Car_Cargo append (["FA_BA64_Captured",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["FA_BA10M",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["FA_BA10M_Captured",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["FA_Sdkfz231",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["FA_Sdkfz234_4",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Armoured_Cargo append (["FA_Sdkfz234",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26")) then {
		IL_Supported_Small_Tank_Cargo append (["FA_T26",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["FA_T26_Captured",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["FA_Pz38t",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Small_Tank_Cargo append (["FA_Panzer2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["FA_ValentineMk3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Medium_Tank_Cargo append (["FA_ValentineMk3_SOV",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["FA_M26",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Large_Tank_Cargo append (["FA_KV1",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "sab_fl_hurricane")) then {
		IL_Supported_Plane_Cargo append (["sab_fl_hurricane",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_hurricane_trop",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_hurricane_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_f4f",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_sbd",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_f4u",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_p51d",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_yak3",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_bf109e",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_bf109f",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_bf109g",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_bf109k",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_fw190a",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_fl_a6m",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
	if (isClass(configFile >> "CfgVehicles" >> "sab_sw_tbf")) then {
		IL_Supported_Plane_Cargo append (["sab_sw_tbf",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_p40",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_i16",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_il2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_il2_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_ju87",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_ju87_2",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
		IL_Supported_Plane_Cargo append (["sab_sw_do335",IL_LoadIfNotInNS] call IL_GetUsedOrAll);
	};
		
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
	missionNamespace setVariable ["IL_Supported_Plane_Cargo", IL_Supported_Plane_Cargo];
	
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

	IL_Supported_Cargo_Veh_US6 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_US6 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_US6 = IL_Supported_Cargo_Veh_US6 + IL_Supported_Cargo_NonVeh_US6;
	
	IL_Supported_Cargo_Veh_GMC = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_GMC = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_GMC = IL_Supported_Cargo_Veh_GMC + IL_Supported_Cargo_NonVeh_GMC;

	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Car_Cargo + IL_Supported_Motorcicle_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_SdKfz7 = IL_Supported_Cargo_NonVeh_US6 + IL_Supported_Large_Static_Cargo + IL_Supported_XLarge_Static_Cargo;
	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Cargo_Veh_SdKfz7 + IL_Supported_Cargo_NonVeh_SdKfz7;
	
	IL_Supported_Cargo_Veh_LCVP = IL_Supported_Car_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_LCVP = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCVP = IL_Supported_Cargo_Veh_LCVP + IL_Supported_Cargo_NonVeh_LCVP;

	IL_Supported_Cargo_Veh_LCM3 = IL_Supported_Medium_Tank_Cargo + IL_Supported_Armoured_Cargo + IL_Supported_Gaz_Zis5_Cargo + IL_Supported_Truck_Cargo + IL_Supported_Cargo_Veh_LCVP;
	IL_Supported_Cargo_NonVeh_LCM3 = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCM3 = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Cargo_NonVeh_LCM3;
	
	IL_Supported_Cargo_Veh_C47 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_C47 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank;
	IL_Supported_Cargo_C47 = IL_Supported_Cargo_Veh_C47 + IL_Supported_Cargo_NonVeh_C47;

	IL_Supported_Cargo_NonVeh_CargoShip = IL_Supported_Cargo_NonVeh_LCM3;
	IL_Supported_Cargo_Veh_CargoShip = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Medium_Tank_Cargo + IL_Supported_Large_Tank_Cargo + IL_Supported_Landing_Ship_Cargo + IL_Supported_L_Landing_Ship_Cargo;
	IL_Supported_Cargo_CargoShip = IL_Supported_Cargo_Veh_CargoShip + IL_Supported_Cargo_NonVeh_CargoShip;

	IL_Supported_Cargo_NonVeh_Carrier = [];
	IL_Supported_Cargo_Veh_Carrier = IL_Supported_Plane_Cargo;
	IL_Supported_Cargo_Carrier = IL_Supported_Cargo_NonVeh_Carrier + IL_Supported_Cargo_Veh_Carrier;
	
	IL_Supported_ShipCargo = [
		"Car",
		"Truck",
		"Tank",
		"Ship",
		"Plane"
	];
	
	};
};

//https://community.bistudio.com/wiki/in

//	PROCEDURES AND FUNCTIONS
if (isnil "IL_Procedures") then
{
	IL_Procedures = true;
	
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
	IL_Select_Attach = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SelectToAttach.sqf";
	IL_Select_Detach = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SelectToDetach.sqf";
	IL_Add_Action = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\AddVehicleAction.sqf";
	IL_Attach = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\Attach.sqf";
	IL_Create_Camera = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\CreateCamera.sqf";

	IL_Server_AddScore = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\AddScore.sqf";
	IL_Server_SetDir = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SetDir.sqf";
	IL_Server_SetMass = compileFinal preprocessFileLineNumbers "IgiLoad\Functions\SetMass.sqf";

	IL_KeyHandler_BuildMenu_KeyDown = {
		private ["_key"];
		_key = _this select 1;
		
		switch (_key) do {
			case (42): {IL_StructureRotateMulti = 10};
			case (29): {IL_StructureRotate = 0.5};
			case (56): {IL_StructureRotate = -0.5};
			case (54): {IL_StructureElevation = 0.1};
			case (157): {IL_StructureElevation = -0.1};
		};
	};

	IL_KeyHandler_BuildMenu_KeyUp = {
		private ["_key"];
		_key = _this select 1;
		
		switch (_key) do {
			case (42): {IL_StructureRotateMulti = 1};
			case (29): {IL_StructureRotate = 0};
			case (56): {IL_StructureRotate = 0};
			case (54): {IL_StructureElevation = 0};
			case (157): {IL_StructureElevation = 0};
		};
	};

	IL_KeyHandler_BuildMenu_MouseButtonDown = {
		private ["_control", "_button"];
		_button = _this select 1;
		_control = _this select 4;
		
		switch (_button) do {
			case (0): {IL_StructurePlaced = true};
			case (1): {IL_StructureCanceled = true};
		};
	};
	
	//https://community.bistudio.com/wiki/addPublicVariableEventHandler
	//command is deprecated!!!!
	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
	
};
//	END PROCEDURES AND FUNCTIONS