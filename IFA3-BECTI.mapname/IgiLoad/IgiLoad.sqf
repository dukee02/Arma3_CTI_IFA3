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
	IL_Num_Slots_Blitz = -3; 
	IL_Num_Slots_US6 = -4; 
	IL_Num_Slots_GMC = -4; 
	IL_Num_Slots_SdKfz7 = -4; 
	IL_Num_Slots_LCVP = -4; 
	IL_Num_Slots_LCM3 = -6;
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
	IL_Can_Inside = false;
	IL_Can_CoPilot = false;
	IL_Can_Outside = true;

	//
	//IL_SDistU = 20;//No longer needed
	IL_SDistL = 4;   // increasing this from 2.5 to 4 to extend the radius of gathering loot
	IL_SDistL_Heli_offset = 1;

	//Load and unload (not para) max speed in km/h
	IL_LU_Speed = 10;
	//Load and unload (not para) max height in m
	IL_LU_Alt = 3;
	//Enable or disable usable cargo ramp in CH-49
	IL_Ramp = false;

	//Enable change of vehicle mass
	IL_Mass = true;

	// Supported vehicles
	//#include "OriginalVehicles.cpp"
	// APC
	/*IL_Supported_Vehicles_APC = 
		[
			"BRDM2_HQ_CHDKZ",
			"B_APC_Tracked_01_CRV_F",
			"B_APC_Tracked_01_rcws_F",
			"B_APC_Wheeled_01_cannon_F",
			"B_T_APC_Tracked_01_CRV_F",
			"B_T_APC_Tracked_01_rcws_F",
			"B_T_APC_Wheeled_01_cannon_F",
			"CUP_B_AAV_USMC",
			"CUP_B_AAV_Unarmed_USMC",
			"CUP_B_BMP2_AMB_CDF",
			"CUP_B_BMP2_AMB_CZ",
			"CUP_B_BMP2_AMB_CZ_Des",
			"CUP_B_BMP2_CDF",
			"CUP_B_BMP2_CZ",
			"CUP_B_BMP2_CZ_Des",
			"CUP_B_BMP_HQ_CDF",
			"CUP_B_BMP_HQ_CZ",  // Lyrae: The vertical hitbox is broken. Script doesn't seem to work. Related?
			"CUP_B_BMP_HQ_CZ_Des",  // Lyrae: The vertical hitbox is broken. Script doesn't seem to work. Related?
			"CUP_B_BRDM2_ATGM_CDF",
			"CUP_B_BRDM2_CDF",
			"CUP_B_BRDM2_CZ",
			"CUP_B_BRDM2_CZ_Des",
			"CUP_B_BRDM2_HQ_CDF",
			"CUP_B_BRDM2_HQ_CZ",
			"CUP_B_BRDM2_HQ_CZ_Des",
			"CUP_B_BTR60_CDF",
			"CUP_B_FV432_Bulldog_GB_D",
			"CUP_B_FV432_Bulldog_GB_D_RWS",
			"CUP_B_FV432_Bulldog_GB_W",
			"CUP_B_FV432_Bulldog_GB_W_RWS",
			"CUP_B_FV510_GB_D",
			"CUP_B_FV510_GB_D_SLAT",
			"CUP_B_FV510_GB_W",
			"CUP_B_FV510_GB_W_SLAT",
			"CUP_B_LAV25M240_USMC",
			"CUP_B_LAV25M240_desert_USMC",
			"CUP_B_LAV25_HQ_USMC",
			"CUP_B_LAV25_HQ_desert_USMC",
			"CUP_B_LAV25_USMC",
			"CUP_B_LAV25_desert_USMC",
			"CUP_B_M2A3Bradley_NATO_T",
			"CUP_B_M2A3Bradley_USA_D",
			"CUP_B_M2A3Bradley_USA_W",
			"CUP_B_M2Bradley_NATO_T",
			"CUP_B_M2Bradley_USA_D",
			"CUP_B_M2Bradley_USA_W",
			"CUP_B_M7Bradley_USA_D",
			"CUP_B_M7Bradley_USA_W",
			"CUP_B_M113_Med_USA",
			"CUP_B_M113_USA",
			"CUP_B_M113_desert_USA",
			"CUP_B_M1126_ICV_M2_Desert",
			"CUP_B_M1126_ICV_M2_Desert_Slat",
			"CUP_B_M1126_ICV_M2_Woodland",
			"CUP_B_M1126_ICV_M2_Woodland_Slat",
			"CUP_B_M1126_ICV_MK19_Desert",
			"CUP_B_M1126_ICV_MK19_Desert_Slat",
			"CUP_B_M1126_ICV_MK19_Woodland",
			"CUP_B_M1126_ICV_MK19_Woodland_Slat",
			"CUP_B_M1128_MGS_Desert",
			"CUP_B_M1128_MGS_Desert_Slat",
			"CUP_B_M1128_MGS_Woodland",
			"CUP_B_M1128_MGS_Woodland_Slat",
			"CUP_B_M1130_CV_M2_Desert",
			"CUP_B_M1130_CV_M2_Desert_Slat",
			"CUP_B_M1130_CV_M2_Woodland",
			"CUP_B_M1130_CV_M2_Woodland_Slat",
			"CUP_B_M1133_MEV_Desert",
			"CUP_B_M1133_MEV_Desert_Slat",
			"CUP_B_M1133_MEV_Woodland",
			"CUP_B_M1133_MEV_Woodland_Slat",
			"CUP_B_M1135_ATGMV_Desert",
			"CUP_B_M1135_ATGMV_Desert_Slat",
			"CUP_B_M1135_ATGMV_Woodland",
			"CUP_B_M1135_ATGMV_Woodland_Slat",
			"CUP_B_MCV80_GB_D",
			"CUP_B_MCV80_GB_D_SLAT",
			"CUP_B_MCV80_GB_W",
			"CUP_B_MCV80_GB_W_SLAT",
			"CUP_I_AAV_RACS",
			"CUP_I_BMP1_TK_GUE",
			"CUP_I_BMP2_AMB_NAPA",
			"CUP_I_BMP2_AMB_UN",
			"CUP_I_BMP2_NAPA",
			"CUP_I_BMP2_UN",
			"CUP_I_BMP_HQ_NAPA",
			"CUP_I_BMP_HQ_UN",
			"CUP_I_BRDM2_ATGM_NAPA",
			"CUP_I_BRDM2_ATGM_TK_Gue",
			"CUP_I_BRDM2_HQ_NAPA",
			"CUP_I_BRDM2_HQ_TK_Gue",
			"CUP_I_BRDM2_HQ_UN",
			"CUP_I_BRDM2_NAPA",
			"CUP_I_BRDM2_TK_Gue",
			"CUP_I_BRDM2_UN",
			"CUP_I_BTR40_MG_TKG",
			"CUP_I_BTR40_TKG",
			"CUP_I_BTR60_UN",
			"CUP_I_M113_AAF",
			"CUP_I_M113_Med_AAF",
			"CUP_I_M113_Med_RACS",
			"CUP_I_M113_Med_UN",
			"CUP_I_M113_RACS",
			"CUP_I_M113_UN",
			"CUP_O_BMP1P_CSAT",
			"CUP_O_BMP1P_CSAT_T",
			"CUP_O_BMP1P_TKA",
			"CUP_O_BMP1_CSAT",
			"CUP_O_BMP1_CSAT_T",
			"CUP_O_BMP1_TKA",
			"CUP_O_BMP2_AMB_CHDKZ",
			"CUP_O_BMP2_AMB_CSAT",
			"CUP_O_BMP2_AMB_CSAT_T",
			"CUP_O_BMP2_AMB_RU",
			"CUP_O_BMP2_AMB_TKA",
			"CUP_O_BMP2_AMB_sla",
			"CUP_O_BMP2_CHDKZ",
			"CUP_O_BMP2_CSAT",
			"CUP_O_BMP2_CSAT_T",
			"CUP_O_BMP2_RU",
			"CUP_O_BMP2_SLA",
			"CUP_O_BMP2_TKA",
			"CUP_O_BMP2_ZU_CSAT",
			"CUP_O_BMP2_ZU_CSAT_T",
			"CUP_O_BMP2_ZU_TKA",
			"CUP_O_BMP3_CSAT_T",
			"CUP_O_BMP3_RU",
			"CUP_O_BMP_HQ_CHDKZ",
			"CUP_O_BMP_HQ_CSAT",
			"CUP_O_BMP_HQ_CSAT_T",
			"CUP_O_BMP_HQ_RU",
			"CUP_O_BMP_HQ_TKA",
			"CUP_O_BMP_HQ_sla",
			"CUP_O_BRDM2_ATGM_CHDKZ",
			"CUP_O_BRDM2_ATGM_CSAT",
			"CUP_O_BRDM2_ATGM_CSAT_T",
			"CUP_O_BRDM2_ATGM_RUS",
			"CUP_O_BRDM2_ATGM_SLA",
			"CUP_O_BRDM2_ATGM_TKA",
			"CUP_O_BRDM2_CHDKZ",
			"CUP_O_BRDM2_CSAT",
			"CUP_O_BRDM2_CSAT_T",
			"CUP_O_BRDM2_HQ_CHDKZ",
			"CUP_O_BRDM2_HQ_CSAT",
			"CUP_O_BRDM2_HQ_CSAT_T",
			"CUP_O_BRDM2_HQ_RUS",
			"CUP_O_BRDM2_HQ_SLA",
			"CUP_O_BRDM2_HQ_TKA",
			"CUP_O_BRDM2_RUS",
			"CUP_O_BRDM2_SLA",
			"CUP_O_BRDM2_TKA",
			"CUP_O_BTR40_MG_TKA",
			"CUP_O_BTR40_MG_TKM",
			"CUP_O_BTR40_TKA",
			"CUP_O_BTR40_TKM",
			"CUP_O_BTR60_CSAT",
			"CUP_O_BTR60_SLA",
			"CUP_O_BTR60_TK",
			"CUP_O_BTR90_HQ_RU",
			"CUP_O_BTR90_RU",
			"CUP_O_GAZ_Vodnik_AGS_RU",
			"CUP_O_GAZ_Vodnik_BPPU_RU",
			"CUP_O_GAZ_Vodnik_MedEvac_RU",
			"CUP_O_GAZ_Vodnik_PK_RU",
			"CUP_O_M113_Med_TKA",
			"CUP_O_M113_TKA",
			"Exile_Car_BRDM2_HQ",
			"I_APC_Wheeled_03_cannon_F",
			"I_APC_tracked_03_cannon_F",
			"O_APC_Tracked_02_cannon_F",
			"O_APC_Wheeled_02_rcws_F",
			"O_T_APC_Tracked_02_cannon_ghex_F",
			"O_T_APC_Wheeled_02_rcws_ghex_F"
		];

	// Dingo
	IL_Supported_Vehicles_Dingo = 
		[	
			"CUP_B_Dingo_CZ_Des",  // Dingo 2 (MG) (Desert)
			"CUP_B_Dingo_CZ_Wdl",  // Dingo 2 (MG) (Woodland)
			"CUP_B_Dingo_GER_Des",  // Dingo 2 (MG) (Desert)
			"CUP_B_Dingo_GER_Wdl",  // Dingo 2 (MG) (Woodland)
			"CUP_B_Dingo_GL_CZ_Des",  // Dingo 2 (GL) (Desert)
			"CUP_B_Dingo_GL_CZ_Wdl",  // Dingo 2 (GL) (Woodland)
			"CUP_B_Dingo_GL_GER_Des",  // Dingo 2 (GL) (Desert)
			"CUP_B_Dingo_GL_GER_Wdl"  // Dingo 2 (GL) (Woodland) 
		];

	// HMMWV
	IL_Supported_Vehicles_HMMWV = 
		[
			"CUP_B_HMMWV_Ambulance_ACR",  // HMMWV Ambulance
			"CUP_B_HMMWV_AGS_GPK_ACR",  // HMMWV M1114 AGS
			"CUP_B_HMMWV_DSHKM_GPK_ACR",  // HMMWV M1114 DSHKM
			"CUP_B_HMMWV_M2_GPK_ACR",  // HMMWV M1151 M2
			"CUP_B_HMMWV_UNARMED_NATO_T",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_NATO_T",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_NATO_T",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_NATO_T",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_NATO_T",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_NATO_T",  // HMMWV M2
			"CUP_B_HMMWV_MK19_NATO_T",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_NATO_T",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_NATO_T",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_NATO_T",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_NATO_T",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_NATO_T",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_NATO_T",  // M1151 (M2)
			"CUP_B_M1151_Deploy_NATO_T",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_NATO_T",  // M1151 (Mk19)
			"CUP_B_M1151_NATO_T",  // M1151 (Unarmed)
			"CUP_B_M1152_NATO_T",  // M1152 EVC
			"CUP_B_M1165_GMV_NATO_T",  // M1165 GMV (M134)
			"CUP_B_M1167_NATO_T",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USA",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USA",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_USA",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_USA",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_USA",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_USA",  // HMMWV M2
			"CUP_B_HMMWV_MK19_USA",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_USA",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_USA",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_USA",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_USA",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_USA",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_USA",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USA",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USA",  // M1151 (Mk19)
			"CUP_B_M1151_USA",  // M1151 (Unarmed)
			"CUP_B_M1152_USA",  // M1152 EVC
			"CUP_B_M1165_GMV_USA",  // M1165 GMV (M134)
			"CUP_B_M1167_USA",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USMC",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USMC",  // HMMWV Ambulance
			"CUP_B_HMMWV_M2_USMC",  // HMMWV M2
			"CUP_B_HMMWV_M1114_USMC",  // HMMWV M240
			"CUP_B_HMMWV_MK19_USMC",  // HMMWV MK19
			"CUP_B_HMMWV_TOW_USMC",  // HMMWV TOW
			"CUP_B_M1151_M2_USMC",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USMC",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USMC",  // M1151 (Mk19)
			"CUP_B_M1151_USMC",  // M1151 (Unarmed)
			"CUP_B_M1152_USMC",  // M1152 EVC
			"CUP_B_M1165_GMV_USMC",  // M1165 GMV (M134)
			"CUP_B_M1167_USMC",  // M1167 (TOW-2)
			"Exile_Car_HMMWV_M134_Green",  // HMMWV (M134)
			"Exile_Car_HMMWV_M134_Desert",  // HMMWV (M134)
			"Exile_Car_HMMWV_M2_Desert",  // HMMWV (M2)
			"Exile_Car_HMMWV_M2_Green",  // HMMWV (M2)
			"Exile_Car_HMMWV_MEV_Desert",  // HMMWV (MEV)
			"Exile_Car_HMMWV_MEV_Green",  // HMMWV (MEV)
			"Exile_Car_HMMWV_UNA_Desert",  // HMMWV (Unarmed)
			"Exile_Car_HMMWV_UNA_Green",  // HMMWV (Unarmed)
			"HMMWV_UNA",  // HMMWV (Unarmed)
			"HMMWV_UNA_des",  // HMMWV (Unarmed)
			"HMMWV_M2_GPK_Base",  // HMMWV M1151 M2 Forest
			"HMMWV_M2_GPK_1",  // HMMWV M1151 M2 Sand
			"HMMWV_M134_des",  // HMMWV-M134
			"HMMWV_M134",  // HMMWV-M134
			"HMMWV_M2_des",  // HMMWV-M2
			"HMMWV_M2",  // HMMWV-M2
			"HMMWV_MEV_des",  // HMMWV-MEV
			"HMMWV_MEV"  // HMMWV-MEV
		];

	// Ural
	IL_Supported_Vehicles_Ural = 
		[
			"CUP_B_Ural_CDF",
			"CUP_B_Ural_Empty_CDF",
			"CUP_B_Ural_Open_CDF",
			"CUP_B_Ural_Reammo_CDF",
			"CUP_B_Ural_Refuel_CDF",
			"CUP_B_Ural_Repair_CDF",
			"CUP_C_Ural_Civ_01",
			"CUP_C_Ural_Civ_02",
			"CUP_C_Ural_Civ_03",
			"CUP_C_Ural_Open_Civ_01",
			"CUP_C_Ural_Open_Civ_02",
			"CUP_C_Ural_Open_Civ_03",
			"CUP_I_Ural_Empty_UN",
			"CUP_I_Ural_Reammo_UN",
			"CUP_I_Ural_Repair_UN",
			"CUP_I_Ural_UN",
			"CUP_O_Ural_CHDKZ",
			"CUP_O_Ural_Empty_CHDKZ",
			"CUP_O_Ural_Empty_RU",
			"CUP_O_Ural_Empty_SLA",
			"CUP_O_Ural_Empty_TKA",
			"CUP_O_Ural_Open_CHDKZ",
			"CUP_O_Ural_Open_RU",
			"CUP_O_Ural_Open_SLA",
			"CUP_O_Ural_Open_TKA",
			"CUP_O_Ural_Reammo_CHDKZ",
			"CUP_O_Ural_Reammo_RU",
			"CUP_O_Ural_Reammo_SLA",
			"CUP_O_Ural_Reammo_TKA",
			"CUP_O_Ural_Refuel_CHDKZ",
			"CUP_O_Ural_Refuel_RU",
			"CUP_O_Ural_Refuel_SLA",
			"CUP_O_Ural_Refuel_TKA",
			"CUP_O_Ural_Repair_CHDKZ",
			"CUP_O_Ural_Repair_RU",
			"CUP_O_Ural_Repair_SLA",
			"CUP_O_Ural_Repair_TKA",
			"CUP_O_Ural_RU",
			"CUP_O_Ural_SLA",
			"CUP_O_Ural_TKA",
			"Exile_Car_Ural_Covered_Blue",
			"Exile_Car_Ural_Covered_Military",
			"Exile_Car_Ural_Covered_Worker",
			"Exile_Car_Ural_Covered_Yellow",
			"Exile_Car_Ural_Open_Blue",
			"Exile_Car_Ural_Open_Military",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Open_Yellow",
			"Ural_Civ_01",
			"Ural_Civ_02",
			"Ural_Civ_03",
			"Ural_Open_Civ_01",
			"Ural_Open_Civ_02",
			"Ural_Open_Civ_03"
		];

	// Zamak
	IL_Supported_Vehicles_Zamak = 
		[
			"C_IDAP_Truck_02_F",
			"C_IDAP_Truck_02_transport_F",
			"C_IDAP_Truck_02_water_F",
			"C_Truck_02_box_F",
			"C_Truck_02_covered_F",
			"C_Truck_02_fuel_F",
			"C_Truck_02_transport_F",
			"Exile_Car_Zamak",
			"I_Truck_02_ammo_F",
			"I_Truck_02_box_F",
			"I_Truck_02_covered_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_medical_F",
			"I_Truck_02_transport_F",
			"O_Truck_02_Ammo_F",
			"O_Truck_02_box_F",
			"O_Truck_02_covered_F",
			"O_Truck_02_fuel_F",
			"O_Truck_02_medical_F",
			"O_Truck_02_transport_F"
		];

	IL_Supported_Vehicles_OFFROAD = 
		[
			"C_Offroad_01_F",
			"B_G_Offroad_01_F",
			"Exile_Car_Offroad_Red",
			"Exile_Car_Offroad_Beige",
			"Exile_Car_Offroad_White",
			"Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed",
			"Exile_Car_Offroad_BlueCustom",
			"Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02",
			"Exile_Car_Offroad_Guerilla03",
			"Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05",
			"Exile_Car_Offroad_Guerilla06",
			"Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08",
			"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11",
			"Exile_Car_Offroad_Guerilla12",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"B_GEN_Offroad_01_gen_F"
		];

	IL_Supported_Vehicles_VAN = 
		[
			"C_Van_01_box_F",
			"B_G_Van_01_transport_F",
			"C_Van_01_transport_F",
			"Exile_Car_Van_Black",
			"Exile_Car_Van_White",
			"Exile_Car_Van_Red",
			"Exile_Car_Van_Guerilla01",
			"Exile_Car_Van_Guerilla02",
			"Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",
			"Exile_Car_Van_Guerilla05",
			"Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",
			"Exile_Car_Van_Guerilla08",
			"I_C_Van_01_transport_F",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White",
			"Exile_Car_Van_Box_Red",
			"Exile_Car_Van_Box_Guerilla01",
			"Exile_Car_Van_Box_Guerilla02",
			"Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04",
			"Exile_Car_Van_Box_Guerilla05",
			"Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07",
			"Exile_Car_Van_Box_Guerilla08"
		];

	IL_Supported_Vehicles_HEMTT = 
		[
			"B_Truck_01_covered_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_box_F",
			"Exile_Car_HEMMT"
		];

	IL_Supported_Vehicles_TEMPEST = 
		[
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"O_T_Truck_03_transport_ghex_F",
			"O_T_Truck_03_covered_ghex_F",
			"Exile_Car_Tempest"
		];*/

	IL_Supported_Vehicles_MOHAWK = 
		[
			"VIOC_EXILE_G_sab_bf110",
			"VIOC_EXILE_G_sab_bf110_2",
			"VIOC_EXILE_G_sab_ju88",
			"VIOC_EXILE_G_sab_ju88_2",
			"VIOC_EXILE_G_sab_he111",
			"VIOC_EXILE_S_sab_tusb2",
			"VIOC_EXILE_S_LIB_Pe2_2_w",
			"VIOC_EXILE_S_LIB_Pe2_w",
			"VIOC_EXILE_S_LIB_Pe2"
			/*"I_Heli_Transport_02_F",
			"Exile_Chopper_Mohawk_FIA",
			"O_T_VTOL_02_infantry_F",
			"O_T_VTOL_02_vehicle_F" */
		];

	/*IL_Supported_Vehicles_CHINOOK = 
		[
			"Exile_Chopper_Huron_Black",
			"Exile_Chopper_Huron_Green"
		];

	IL_Supported_Vehicles_MH9 = 
		[
			"B_Heli_Light_01_F",
			"Exile_Chopper_Hummingbird_Green"
		];*/

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
	IL_Supported_Vehicles_Gaz = 
		[
			//"VIOC_EXILE_S_LIB_Zis5v_w",
			//"VIOC_EXILE_S_LIB_Zis5v",
			//"VIOC_EXILE_S_ifa3_gazaa",
			//"VIOC_EXILE_S_ifa3_gaz",
			"VIOC_EXILE_S_ifa3_gazaa_IZ",
			"VIOC_EXILE_S_ifa3_gaz2"
		];
	IL_Supported_Vehicles_Blitz = 
		[
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_Y_Camo",
			"VIOC_EXILE_G_LIB_OpelBlitz_Tent_Y_Camo",
			"VIOC_EXILE_G_LIB_DAK_OpelBlitz_Open",
			"VIOC_EXILE_G_LIB_DAK_OpelBlitz_Tent",
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_G_Camo_w",
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_Y_Camo_w",
			"VIOC_EXILE_G_LIB_OpelBlitz_Tent_Y_Camo_w"
		];	
	IL_Supported_Vehicles_US6 = 
		[
			"VIOC_EXILE_S_LIB_US6_Open",
			"VIOC_EXILE_S_LIB_US6_Open_Cargo",
			"VIOC_EXILE_S_LIB_US6_Tent_Cargo",
			"VIOC_EXILE_S_LIB_US6_Tent"
		];	
	IL_Supported_Vehicles_GMC = 
		[
			"VIOC_EXILE_U_LIB_US_GMC_Tent",
			"VIOC_EXILE_U_LIB_US_GMC_Open",
			"VIOC_EXILE_U_LIB_US_GMC_Tent_w",
			"VIOC_EXILE_U_LIB_US_GMC_Open_w"
		];	
	IL_Supported_Vehicles_SdKfz7 = 
		[
			"VIOC_EXILE_G_LIB_SdKfz_7",
			"VIOC_EXILE_G_LIB_DAK_SdKfz_7",
			"VIOC_EXILE_G_LIB_SdKfz_7_w"
		];	
	IL_Supported_Vehicles_LCVP = 
		[
			"VIOC_EXILE_U_LIB_LCVP"
		];
	IL_Supported_Vehicles_LCM3 = 
		[
			"VIOC_EXILE_U_LIB_LCM3_Armed"
		];
	IL_Supported_Vehicles_C47 = 
		[	
			"VIOC_EXILE_U_LIB_C47_Skytrain",
			"VIOC_EXILE_U_LIB_C47_RAF_bob",
			"VIOC_EXILE_U_LIB_C47_RAF_snafu",
			"VIOC_EXILE_S_LIB_Li2"
		];
	
	//IL_Supported_Vehicles_All = IL_Supported_Vehicles_APC + IL_Supported_Vehicles_Dingo + IL_Supported_Vehicles_HMMWV + IL_Supported_Vehicles_Ural + IL_Supported_Vehicles_Zamak + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD + IL_Supported_Vehicles_CHINOOK + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3;
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47 + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_Blitz + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_GMC + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3;

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

	IL_Supported_HEMTT = 
		[
			"B_Truck_01_covered_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_box_F",
			"B_Truck_01_mover_F",
			"B_Truck_01_ammo_F",
			"B_Truck_01_fuel_F",
			"B_Truck_01_medical_F",
			"B_Truck_01_Repair_F",
			"Exile_Car_HEMMT"
		];

	// Zamak
	IL_Supported_Zamak = 
		[
			"C_IDAP_Truck_02_F",
			"C_IDAP_Truck_02_transport_F",
			"C_IDAP_Truck_02_water_F",
			"C_Truck_02_box_F",
			"C_Truck_02_covered_F",
			"C_Truck_02_fuel_F",
			"C_Truck_02_transport_F",
			"Exile_Car_Zamak",
			"I_Truck_02_ammo_F",
			"I_Truck_02_box_F",
			"I_Truck_02_covered_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_medical_F",
			"I_Truck_02_transport_F",
			"O_Truck_02_Ammo_F",
			"O_Truck_02_box_F",
			"O_Truck_02_covered_F",
			"O_Truck_02_fuel_F",
			"O_Truck_02_medical_F",
			"O_Truck_02_transport_F"
		];

	IL_Supported_TEMPEST = 
		[
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"Exile_Car_Tempest",
			"O_T_Truck_03_transport_ghex_F",
			"O_T_Truck_03_covered_ghex_F",
			"O_Truck_03_device_F",
			"O_T_Truck_03_device_ghex_F",
			"O_Truck_03_ammo_F",
			"O_T_Truck_03_ammo_ghex_F",
			"O_Truck_03_fuel_F",
			"O_T_Truck_03_fuel_ghex_F",
			"O_Truck_03_medical_F",
			"O_T_Truck_03_medical_ghex_F",
			"O_Truck_03_repair_F",
			"O_T_Truck_03_repair_ghex_F"
		];

	IL_Supported_Strider = 
		[
			"I_MRAP_03_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"Exile_Car_Strider",
			"O_LSV_02_unarmed_F",
			"O_T_LSV_02_unarmed_F",
			"O_LSV_02_armed_F",
			"O_T_LSV_02_armed_F",
			"B_CTRG_LSV_01_light_F",
			"B_LSV_01_unarmed_F",
			"B_T_LSV_01_unarmed_F",
			"B_LSV_01_armed_F",
			"B_T_LSV_01_armed_F"
		];

	IL_Supported_Hunter = 
		[
			"B_MRAP_01_F",
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			"Exile_Car_Hunter"
		];

	IL_Supported_Ifrit = 
		[
			"O_MRAP_02_F",
			"O_MRAP_02_gmg_F",
			"O_MRAP_02_hmg_F",
			"Exile_Car_Ifrit",
			"O_T_MRAP_02_ghex_F",
			"O_T_MRAP_02_gmg_ghex_F",
			"O_T_MRAP_02_hmg_ghex_F"
		];

	IL_Supported_UGV = 
		[
			"B_UGV_01_rcws_F",
			"B_UGV_01_F",
			"O_UGV_01_rcws_F",
			"O_UGV_01_F",
			"I_UGV_01_rcws_F",
			"I_UGV_01_F",
			"Exile_Car_TowTractor_White"
		];

	IL_Supported_VAN = 
		[
			"C_Van_01_box_F",
			"B_G_Van_01_transport_F",
			"C_Van_01_transport_F",
			"Exile_Car_Van_Black",
			"Exile_Car_Van_White",
			"Exile_Car_Van_Red",
			"Exile_Car_Van_Guerilla01",
			"Exile_Car_Van_Guerilla02",
			"Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",
			"Exile_Car_Van_Guerilla05",
			"Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",
			"Exile_Car_Van_Guerilla08",
			"I_C_Van_01_transport_F",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White",
			"Exile_Car_Van_Box_Red",
			"Exile_Car_Van_Box_Guerilla01",
			"Exile_Car_Van_Box_Guerilla02",
			"Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04",
			"Exile_Car_Van_Box_Guerilla05",
			"Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07",
			"Exile_Car_Van_Box_Guerilla08",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Van_Fuel_White",
			"Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01",
			"Exile_Car_Van_Fuel_Guerilla02",
			"Exile_Car_Van_Fuel_Guerilla03",
			"Exile_Car_Tractor_Red",
			"Exile_Car_OldTractor_Red"
		];

	IL_Supported_OFFROAD = 
		[
			"C_Offroad_01_F",
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_armed_F",
			"Exile_Car_Offroad_Red",
			"Exile_Car_Offroad_Beige",
			"Exile_Car_Offroad_White",
			"Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed",
			"Exile_Car_Offroad_BlueCustom",
			"Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02",
			"Exile_Car_Offroad_Guerilla03",
			"Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05",
			"Exile_Car_Offroad_Guerilla06",
			"Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08",
			"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11",
			"Exile_Car_Offroad_Guerilla12",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"B_GEN_Offroad_01_gen_F",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Offroad_Armed_Guerilla02",
			"Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04",
			"Exile_Car_Offroad_Armed_Guerilla05",
			"Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07",
			"Exile_Car_Offroad_Armed_Guerilla08",
			"Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10",
			"Exile_Car_Offroad_Armed_Guerilla11",
			"Exile_Car_Offroad_Armed_Guerilla12",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Repair_Red",
			"Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White",
			"Exile_Car_Offroad_Repair_Blue",
			"Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom",
			"Exile_Car_Offroad_Repair_Guerilla01",
			"Exile_Car_Offroad_Repair_Guerilla02",
			"Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04",
			"Exile_Car_Offroad_Repair_Guerilla05",
			"Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07",
			"Exile_Car_Offroad_Repair_Guerilla08",
			"Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10",
			"Exile_Car_Offroad_Repair_Guerilla11",
			"Exile_Car_Offroad_Repair_Guerilla12"
		];

	IL_Supported_SUV = 
		[
			"C_SUV_01_F",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUV_Black",
			"Exile_Car_SUV_Grey",
			"Exile_Car_SUV_Orange",
			"Exile_Car_SUV_Rusty1",
			"Exile_Car_SUV_Rusty2",
			"Exile_Car_SUV_Rusty3",
			"Exile_Car_SUVXL_Black"
		];

	IL_Supported_Hatchback = 
		[
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"Exile_Car_Octavius_White",
			"Exile_Car_Octavius_Black",
			"Exile_Car_Lada_Green",
			"Exile_Car_Lada_Taxi",
			"Exile_Car_Lada_Red",
			"Exile_Car_Lada_White",
			"Exile_Car_Lada_Hipster",
			"Exile_Car_Volha_Blue",
			"Exile_Car_Volha_White",
			"Exile_Car_Volha_Black"
		];

	IL_Supported_HMMWV = 
		[
			"CUP_B_HMMWV_Ambulance_ACR",  // HMMWV Ambulance
			"CUP_B_HMMWV_AGS_GPK_ACR",  // HMMWV M1114 AGS
			"CUP_B_HMMWV_DSHKM_GPK_ACR",  // HMMWV M1114 DSHKM
			"CUP_B_HMMWV_M2_GPK_ACR",  // HMMWV M1151 M2
			"CUP_B_HMMWV_UNARMED_NATO_T",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_NATO_T",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_NATO_T",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_NATO_T",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_NATO_T",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_NATO_T",  // HMMWV M2
			"CUP_B_HMMWV_MK19_NATO_T",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_NATO_T",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_NATO_T",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_NATO_T",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_NATO_T",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_NATO_T",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_NATO_T",  // M1151 (M2)
			"CUP_B_M1151_Deploy_NATO_T",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_NATO_T",  // M1151 (Mk19)
			"CUP_B_M1151_NATO_T",  // M1151 (Unarmed)
			"CUP_B_M1152_NATO_T",  // M1152 EVC
			"CUP_B_M1165_GMV_NATO_T",  // M1165 GMV (M134)
			"CUP_B_M1167_NATO_T",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USA",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USA",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_USA",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_USA",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_USA",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_USA",  // HMMWV M2
			"CUP_B_HMMWV_MK19_USA",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_USA",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_USA",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_USA",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_USA",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_USA",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_USA",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USA",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USA",  // M1151 (Mk19)
			"CUP_B_M1151_USA",  // M1151 (Unarmed)
			"CUP_B_M1152_USA",  // M1152 EVC
			"CUP_B_M1165_GMV_USA",  // M1165 GMV (M134)
			"CUP_B_M1167_USA",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USMC",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USMC",  // HMMWV Ambulance
			"CUP_B_HMMWV_M2_USMC",  // HMMWV M2
			"CUP_B_HMMWV_M1114_USMC",  // HMMWV M240
			"CUP_B_HMMWV_MK19_USMC",  // HMMWV MK19
			"CUP_B_HMMWV_TOW_USMC",  // HMMWV TOW
			"CUP_B_M1151_M2_USMC",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USMC",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USMC",  // M1151 (Mk19)
			"CUP_B_M1151_USMC",  // M1151 (Unarmed)
			"CUP_B_M1152_USMC",  // M1152 EVC
			"CUP_B_M1165_GMV_USMC",  // M1165 GMV (M134)
			"CUP_B_M1167_USMC",  // M1167 (TOW-2)
			"Exile_car_HMMWV_M134_Green",  // HMMWV (M134)
			"Exile_car_HMMWV_M134_Desert",  // HMMWV (M134)
			"Exile_car_HMMWV_M2_Desert",  // HMMWV (M2)
			"Exile_car_HMMWV_M2_Green",  // HMMWV (M2)
			"Exile_car_HMMWV_MEV_Desert",  // HMMWV (MEV)
			"Exile_car_HMMWV_MEV_Green",  // HMMWV (MEV)
			"Exile_car_HMMWV_UNA_Desert",  // HMMWV (Unarmed)
			"Exile_car_HMMWV_UNA_Green",  // HMMWV (Unarmed)
			"HMMWV_UNA",  // HMMWV (Unarmed)
			"HMMWV_UNA_des",  // HMMWV (Unarmed)
			"HMMWV_M2_GPK_Base",  // HMMWV M1151 M2 Forest
			"HMMWV_M2_GPK_1",  // HMMWV M1151 M2 Sand
			"HMMWV_M134_des",  // HMMWV-M134
			"HMMWV_M134",  // HMMWV-M134
			"HMMWV_M2_des",  // HMMWV-M2
			"HMMWV_M2",  // HMMWV-M2
			"HMMWV_MEV_des",  // HMMWV-MEV
			"HMMWV_MEV"  // HMMWV-MEV
		];

	IL_Supported_Quadbike = 
		[				
			"Exile_Bike_QuadBike_Black",
			"Exile_Bike_QuadBike_Blue",
			"Exile_Bike_QuadBike_Red",
			"Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato",
			"Exile_Bike_QuadBike_Csat",
			"Exile_Bike_QuadBike_Fia",
			"Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02",
			"B_G_Quadbike_01_F",
			"O_T_Quadbike_01_ghex_F",
			"Exile_Car_Kart_BluKing",
			"Exile_Car_Kart_RedStone",
			"Exile_Car_Kart_Vrana",
			"Exile_Car_Kart_Green",
			"Exile_Car_Kart_Blue",
			"Exile_Car_Kart_Orange",
			"Exile_Car_Kart_White",
			"Exile_Car_Kart_Yellow",
			"Exile_Car_Kart_Black",
			"C_Kart_01_Fuel_F",
			"I_Quadbike_01_F",
			"C_Quadbike_01_F",
			"O_Quadbike_01_F",
			"B_Quadbike_01_F"
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
	IL_Supported_Small_Crates = 
		[
			"LIB_Box_81mm_Mo_HE",
			"LIB_Box_81mm_Mo_Smoke",
			"LIB_Box_82mm_Mo_Smoke",
			"LIB_BasicAmmunitionBox_US",
			"LIB_BasicAmmunitionBox_SU",
			"LIB_AmmoCrate_Mortar_SU",
			"LIB_Lone_Big_Box",
			"LIB_AmmoCrate_Arty_SU"
		];
	IL_Supported_Medium_Crates = 
		[
			"LIB_Box_60mm_Mo_HE",
			"LIB_Box_60mm_Mo_Smoke",
			"LIB_AmmoCrate_Mortar_GER",
			"LIB_BasicAmmunitionBox_GER",
			"LIB_Mine_Ammo_Box_Ger",
			"LIB_AmmoCrate_Arty_GER"
		];
	IL_Supported_Large_Crates = 
		[
			"LIB_BasicWeaponsBox_GER",
			"LIB_4Rnd_RPzB",
			"LIB_BasicWeaponsBox_UK",
			"LIB_BasicWeaponsBox_US",
			"LIB_BasicWeaponsBox_SU",
			"LIB_Mine_AmmoBox_US",
			"LIB_Mine_Ammo_Box_Su"
		];
	IL_Supported_Stacket_Crates = 
		[
			"LIB_WeaponsBox_Big_GER",
			"LIB_WeaponsBox_Big_SU"
		];	
	IL_Supported_Bike_Cargo = 
		[	
			"Exile_Bike_OldBike",
			"Exile_Bike_MountainBike"
		];
	
	IL_Supported_Mini_Static_Cargo = 
		[	
			"LIB_GER_SearchLight",
			"LIB_SU_SearchLight",
			"LIB_MG34_Lafette_Deployed",
			"LIB_MG34_Lafette_low_Deployed",
			"LIB_MG42_Lafette_Deployed",
			"LIB_MG42_Lafette_low_Deployed",
			"IFA3_DSHkM_Mini_TriPod",
			"LIB_M1919_M2",
			"ifa3_M2StaticMG_base",
			"LIB_Maxim_M30_base",
			"LIB_Maxim_M30_Trench",
			"LIB_Vickers_MMG",
			"LIB_GrWr34",
			"LIB_GrWr34_g",
			"LIB_BM37",
			"LIB_M2_60"
		];
	
	IL_Supported_Small_Static_Cargo = 
		[	
			"LIB_FlaK_30_w",
			"LIB_FlaK_30",
			"LIB_FlaK_38_w",
			"LIB_FlaK_38"
		];
		
	IL_Supported_Medium_Static_Cargo = 
		[	
			"Ifa3_p27G",
			"Ifa3_p27",
			"IFA3_Pak38",
			"IFA3_53K",
			"LIB_57mm_M1",
			"LIB_QF6_pdr",
			"LIB_Flakvierling_38_w",
			"LIB_Flakvierling_38",
			"LIB_Nebelwerfer41",
			"LIB_Nebelwerfer41_Camo",
			"LIB_Nebelwerfer41_Gelbbraun",
			"LIB_M45_Quadmount_UK",
			"LIB_M45_Quadmount"
		];
		
	IL_Supported_Large_Static_Cargo = 
		[	
			"LIB_leFH18",
			"LIB_leFH18_AT",
			"LIB_61k",
			"LIB_Pak40_w",
			"LIB_DAK_Pak40",
			"LIB_Pak40",
			"LIB_Zis3_w",
			"LIB_Zis3"
		];
		
	IL_Supported_XLarge_Static_Cargo = 
		[	
			"LIB_FlaK_36_w",
			"LIB_FlaK_36_AA_w",
			"LIB_FlaK_36_ARTY_w",
			"LIB_DAK_FlaK_36",
			"LIB_DAK_FlaK_36_AA",
			"LIB_DAK_FlaK_36_ARTY",
			"LIB_FlaK_36",
			"LIB_FlaK_36_AA",
			"LIB_FlaK_36_ARTY"
		];
		
	IL_Supported_Motorcicle_Cargo = 
		[
			"VIOC_EXILE_U_R71USA",
			"VIOC_EXILE_G_R71GerPre43",
			"VIOC_EXILE_G_R71Ger44",
			"VIOC_EXILE_G_R71Ger44Camo",
			"VIOC_EXILE_S_R71RusOlive",
			"VIOC_EXILE_S_R71RusGreenCamo",
			"VIOC_EXILE_S_R71RusDark",
			"VIOC_EXILE_S_R71RusGreen"
		];
	IL_Supported_Gaz_Zis5_Cargo = 
		[
			"VIOC_EXILE_G_ifa3_gaz55_ger",
			"VIOC_EXILE_S_ifa3_gaz55",
			"VIOC_EXILE_S_ifa3_gaz55_van",
			"VIOC_EXILE_S_LIB_Zis5v_w",
			"VIOC_EXILE_S_LIB_Zis5v",
			"VIOC_EXILE_S_ifa3_gazaa",
			"VIOC_EXILE_S_ifa3_gazaa_IZ",
			"VIOC_EXILE_S_ifa3_gaz",
			"VIOC_EXILE_S_ifa3_gaz2"
		];
	IL_Supported_Truck_Cargo = 
		[
			"VIOC_EXILE_S_LIB_US6_Open",
			"VIOC_EXILE_S_LIB_US6_Open_Cargo",
			"VIOC_EXILE_S_LIB_US6_Tent_Cargo",
			"VIOC_EXILE_S_LIB_US6_Tent",
			"VIOC_EXILE_U_LIB_US_GMC_Tent_w",
			"VIOC_EXILE_U_LIB_US_GMC_Open_w",
			"VIOC_EXILE_U_LIB_US_GMC_Tent",
			"VIOC_EXILE_U_LIB_US_GMC_Open",			
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_Y_Camo",
			"VIOC_EXILE_G_LIB_OpelBlitz_Tent_Y_Camo",
			"VIOC_EXILE_G_LIB_DAK_OpelBlitz_Open",
			"VIOC_EXILE_G_LIB_DAK_OpelBlitz_Tent",
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_G_Camo_w",
			"VIOC_EXILE_G_LIB_OpelBlitz_Open_Y_Camo_w",
			"VIOC_EXILE_G_LIB_OpelBlitz_Tent_Y_Camo_w"
		];
	IL_Supported_Car_Cargo = 
		[
			"VIOC_EXILE_U_LIB_US_Willys_MB_w",
			"VIOC_EXILE_U_LIB_US_Willys_MB_Hood_w",
			"VIOC_EXILE_U_LIB_US_Willys_MB_M1919_w",
			"VIOC_EXILE_U_LIB_US_Willys_MB_Ambulance_w",
			"VIOC_EXILE_U_LIB_US_Willys_MB",
			"VIOC_EXILE_U_LIB_US_Willys_MB_Hood",
			"VIOC_EXILE_U_LIB_US_Willys_MB_M1919",
			"VIOC_EXILE_U_LIB_US_Willys_MB_Ambulance",
			"VIOC_EXILE_U_LIB_US_NAC_Willys_MB",
			"VIOC_EXILE_U_LIB_US_NAC_Willys_MB_Hood",
			"VIOC_EXILE_U_LIB_US_NAC_Willys_MB_M1919",
			"VIOC_EXILE_U_LIB_US_NAC_Willys_MB_Ambulance",
			"VIOC_EXILE_G_LIB_Kfz1",
			"VIOC_EXILE_G_LIB_Kfz1_camo",
			"VIOC_EXILE_G_LIB_Kfz1_Hood",
			"VIOC_EXILE_G_LIB_Kfz1_Hood_camo",
			"VIOC_EXILE_G_LIB_Kfz1_Hood_sernyt",
			"VIOC_EXILE_G_LIB_Kfz1_sernyt",
			"VIOC_EXILE_G_LIB_Kfz1_MG42",
			"VIOC_EXILE_G_LIB_Kfz1_MG42_camo",
			"VIOC_EXILE_G_LIB_Kfz1_MG42_sernyt",
			"VIOC_EXILE_G_LIB_Kfz1_w",
			"VIOC_EXILE_G_LIB_Kfz1_Hood_w",
			"VIOC_EXILE_G_LIB_DAK_Kfz1",
			"VIOC_EXILE_G_LIB_DAK_Kfz1_hood",
			"VIOC_EXILE_G_LIB_DAK_Kfz1_MG42",
			"VIOC_EXILE_S_LIB_GazM1_SOV",
			"VIOC_EXILE_S_LIB_GazM1_SOV_camo_sand",
			"VIOC_EXILE_S_LIB_Willys_MB_w",
			"VIOC_EXILE_S_LIB_Willys_MB_Hood_w",
			"VIOC_EXILE_S_LIB_Willys_MB_Ambulance_w",
			"VIOC_EXILE_S_LIB_Willys_MB",
			"VIOC_EXILE_S_LIB_Willys_MB_Hood",
			"VIOC_EXILE_S_LIB_Willys_MB_Ambulance"
		];
		
	IL_Supported_Armoured_Cargo = 
		[
			"VIOC_EXILE_U_LIB_US_Scout_m3_w",
			"VIOC_EXILE_U_LIB_US_Scout_M3_FFV_w",
			"VIOC_EXILE_U_LIB_US_Scout_M3",
			"VIOC_EXILE_U_LIB_US_Scout_M3_FFV",
			"VIOC_EXILE_U_LIB_US_NAC_Scout_M3",
			"VIOC_EXILE_U_LIB_US_NAC_Scout_M3_FFV",
			"VIOC_EXILE_U_LIB_US_M3_Halftrack_w",
			"VIOC_EXILE_U_LIB_US_M3_Halftrack",
			"VIOC_EXILE_U_LIB_US_NAC_M3_Halftrack",
			"VIOC_EXILE_U_LIB_M8_Greyhound",
			"VIOC_EXILE_G_LIB_SdKfz251_FFV",
			"VIOC_EXILE_G_ifa3_sdkfz251T_2mg",
			"VIOC_EXILE_G_ifa3_sdkfz251T",
			"VIOC_EXILE_G_LIB_SdKfz251",
			"VIOC_EXILE_G_LIB_DAK_SdKfz251",
			"VIOC_EXILE_G_LIB_DAK_SdKfz251_FFV",
			"VIOC_EXILE_G_LIB_Sdkfz251_w",
			"VIOC_EXILE_G_LIB_SdKfz251_FFV_w",
			"VIOC_EXILE_G_LIB_DAK_M3_Halftrack",
			"VIOC_EXILE_G_LIB_DAK_Scout_M3",
			"VIOC_EXILE_G_LIB_DAK_Scout_M3_FFV",
			"VIOC_EXILE_S_ifa3_ba64B",
			"VIOC_EXILE_S_LIB_SOV_M3_Halftrack_w",
			"VIOC_EXILE_S_LIB_SOV_M3_Halftrack",
			"VIOC_EXILE_S_LIB_SdKfz251_captured_w",
			"VIOC_EXILE_S_LIB_SdKfz251_captured_FFV_w",
			"VIOC_EXILE_S_LIB_SdKfz251_captured",
			"VIOC_EXILE_S_LIB_SdKfz251_captured_FFV",
			"VIOC_EXILE_S_LIB_Scout_m3_w",
			"VIOC_EXILE_S_LIB_Scout_M3_FFV_w",
			"VIOC_EXILE_S_LIB_Scout_M3",
			"VIOC_EXILE_S_LIB_Scout_M3_FFV"
		];
		
	IL_Supported_Small_Tank_Cargo = 
		[
			"VIOC_EXILE_U_LIB_M3A3_Stuart",
			"VIOC_EXILE_G_pz2f",
			"VIOC_EXILE_G_pz2f2",
			"VIOC_EXILE_G_ifa3_pz3j",
			"VIOC_EXILE_G_ifa3_pz3N",
			"VIOC_EXILE_G_ifa3_StuG_III_G",
			"VIOC_EXILE_G_ifa3_StuH_42",
			"VIOC_EXILE_G_LIB_StuG_III_G",
			"VIOC_EXILE_S_ifa3_t26_w",
			"VIOC_EXILE_S_ifa3_t26",
			"VIOC_EXILE_S_ifa3_t60",
			"VIOC_EXILE_S_ifa3_t70m",
			"VIOC_EXILE_G_ifa3_pz3J_sov"
			//"VIOC_EXILE_G_ifa3_Ba10_wm",
			//"VIOC_EXILE_S_ifa3_Ba10",
		];

	//TODO
	//IL_Supported_Backpack = ["B_AssaultPack_blk", "B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_AssaultPackG", "B_Bergen_blk", "B_Bergen_mcamo", "B_Bergen_rgr", "B_Bergen_sgg", "B_BergenC_blu", "B_BergenC_grn", "B_BergenC_red", "B_BergenG", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_HuntingBackpack", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_sgg", "B_OutdoorPack_blk", "B_OutdoorPack_blu", "B_OutdoorPack_tan", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "C_Bergen_blu", "C_Bergen_grn", "C_Bergen_red", "G_AssaultPack", "G_Bergen"];
	//IL_Supported_Backpack_Support = ["B_HMG_01_support_F", "B_HMG_01_support_high_F", "B_Mortar_01_support_F", "I_Mortar_01_support_F", "O_Mortar_01_support_F"];
	//IL_Supported_Backpack_Weapon = ["B_AA_01_weapon_F", "B_AT_01_weapon_F", "B_GMG_01_A_high_weapon_F", "B_GMG_01_A_weapon_F", "B_GMG_01_A_weapon_F", "B_GMG_01_high_weapon_F", "B_GMG_01_weapon_F", "B_HMG_01_A_high_weapon_F", "B_HMG_01_A_weapon_F", "B_HMG_01_high_weapon_F", "B_HMG_01_weapon_F", "B_Mortar_01_weapon_F"];
	//IL_Supported_Backpack_Uav = ["B_UAV_01_backpack_F", "I_UAV_01_backpack_F", "O_UAV_01_backpack_F"];
	//IL_Supported_Parachute = ["B_Parachute"];

	//IL_Supported_Backpack_All = IL_Supported_Backpack + IL_Supported_Backpack_Support + IL_Supported_Backpack_Weapon + IL_Supported_Backpack_Uav + IL_Supported_Parachute;

	// APC
	/*IL_Supported_Cargo_APC = IL_Supported_Box_H1 + IL_Supported_Box_H2;

	// Dingo
	IL_Supported_Cargo_Dingo = IL_Supported_Box_H1 + IL_Supported_Box_H2;

	// HMMWV
	IL_Supported_Cargo_HMMWV = IL_Supported_Box_H1 + IL_Supported_Box_H2;

	// Ural
	IL_Supported_Cargo_Veh_Ural = IL_Supported_Quadbike + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_UGV + IL_Supported_VAN;
	IL_Supported_Cargo_NonVeh_Ural = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20;

	// Zamak
	IL_Supported_Cargo_Veh_Zamak = IL_Supported_Quadbike + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_UGV + IL_Supported_VAN;
	IL_Supported_Cargo_NonVeh_Zamak = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20;

	IL_Supported_Cargo_MH9 = IL_Supported_Supply_Crate + IL_Supported_Barrel; // + IL_Supported_Box_H1 + IL_Supported_Box_H2;// + IL_Supported_Backpack_All;
	
	IL_Supported_Cargo_Veh_Offroad = IL_Supported_Quadbike;
	IL_Supported_Cargo_NonVeh_Offroad = (IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1 + IL_Supported_Box_H2);
	IL_Supported_Cargo_Offroad = IL_Supported_Cargo_Veh_Offroad + IL_Supported_Cargo_NonVeh_Offroad;
	
	IL_Supported_Cargo_Veh_VAN = IL_Supported_Cargo_Veh_Offroad;
	IL_Supported_Cargo_NonVeh_VAN = IL_Supported_Cargo_NonVeh_Offroad;
	IL_Supported_Cargo_VAN = IL_Supported_Cargo_Veh_VAN + IL_Supported_Cargo_NonVeh_VAN;
	
	IL_Supported_Cargo_Veh_HEMTT = IL_Supported_Cargo_Veh_Zamak + IL_Supported_OFFROAD + IL_Supported_SUV;
	IL_Supported_Cargo_NonVeh_HEMTT = IL_Supported_Cargo_NonVeh_Zamak;
	IL_Supported_Cargo_HEMTT = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Cargo_NonVeh_HEMTT;
	
	IL_Supported_Cargo_Veh_TEMPEST = IL_Supported_Cargo_Veh_HEMTT;
	IL_Supported_Cargo_NonVeh_TEMPEST = IL_Supported_Cargo_NonVeh_HEMTT + IL_Supported_Box_H1;
	IL_Supported_Cargo_TEMPEST = IL_Supported_Cargo_Veh_TEMPEST + IL_Supported_Cargo_NonVeh_TEMPEST;
	
	IL_Supported_Cargo_Veh_Mohawk = IL_Supported_Quadbike + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_UGV + IL_Supported_Box_H1;
	IL_Supported_Cargo_NonVeh_Mohawk = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1;
	IL_Supported_Cargo_Mohawk = IL_Supported_Cargo_Veh_Mohawk + IL_Supported_Cargo_NonVeh_Mohawk;
	
	IL_Supported_Cargo_Veh_CHINOOK = IL_Supported_Cargo_Veh_Mohawk;
	IL_Supported_Cargo_NonVeh_CHINOOK = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1;
	IL_Supported_Cargo_CHINOOK = IL_Supported_Cargo_Veh_CHINOOK + IL_Supported_Cargo_NonVeh_CHINOOK;
	
	IL_Supported_Cargo_Veh_C130J = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Strider + IL_Supported_Hunter + IL_Supported_Ifrit + IL_Supported_HMMWV + IL_Supported_HEMTT;
	IL_Supported_Cargo_NonVeh_C130J = IL_Supported_Cargo_NonVeh_Mohawk;// Damage the plane + IL_Supported_Cargo20;
	IL_Supported_Cargo_C130J = IL_Supported_Cargo_Veh_C130J + IL_Supported_Cargo_NonVeh_C130J;
	
	IL_Supported_Cargo_Veh_C17 = IL_Supported_Cargo_Veh_C130J;
	IL_Supported_Cargo_NonVeh_C17 = IL_Supported_Cargo_NonVeh_C130J;
	IL_Supported_Cargo_C17 = IL_Supported_Cargo_Veh_C17 + IL_Supported_Cargo_NonVeh_C17;*/
	
	
	//*****************************************************************************************************************
	//*										VIOC Cargo declaration
	//*****************************************************************************************************************
	//IL_Supported_Bike_Cargo
	
	IL_Supported_Crates_place_near = IL_Supported_Small_Crates + IL_Supported_Medium_Crates + IL_Supported_Large_Crates;
		
	IL_Supported_Cargo_Veh_Gaz = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Gaz = IL_Supported_Crates_place_near + IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20 + IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo;
	IL_Supported_Cargo_Gaz = IL_Supported_Cargo_Veh_Gaz + IL_Supported_Cargo_NonVeh_Gaz;
	
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

	IL_Supported_Cargo_Veh_LCM3 = IL_Supported_Armoured_Cargo + IL_Supported_Gaz_Zis5_Cargo + IL_Supported_Truck_Cargo + IL_Supported_Cargo_Veh_LCVP;
	IL_Supported_Cargo_NonVeh_LCM3 = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCM3 = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Cargo_NonVeh_LCM3;
	
	IL_Supported_Cargo_Veh_C47 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_C47 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank;
	IL_Supported_Cargo_C47 = IL_Supported_Cargo_Veh_C47 + IL_Supported_Cargo_NonVeh_C47;
	
};

//	PROCEDURES AND FUNCTIONS
if (isnil "IL_Procedures") then
{
	IL_Procedures = true;

	IL_Init_Veh =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Veh.", IL_Script_Inst];
		};
		
		private["_obj", "_obj_type", "_force"];
		_obj = _this select 0;
		_force = if (count _this > 1) then {_this select 1} else {false};
		_obj_type = (typeOf _obj);

		if ((isNil {_obj getVariable "default_mass"}) || (_force)) then
			{
				if (isNil {_obj getVariable "default_mass"}) then
				{
					_obj setVariable["default_mass", getMass _obj, true];
				}
				else
				{
					_obj setMass (_obj getVariable "default_mass");
				};
			};

		// APC
		/*if (_obj_type in IL_Supported_Vehicles_APC) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_APC, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.2, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};		

		// Dingo
		if (_obj_type in IL_Supported_Vehicles_Dingo) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Dingo, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.7, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};

		// HMMWV
		if (_obj_type in IL_Supported_Vehicles_HMMWV) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_HMMWV, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.2, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};

		// Ural
		if (_obj_type in IL_Supported_Vehicles_Ural) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Ural, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};

		// Zamak
		if (_obj_type in IL_Supported_Vehicles_Zamak) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Zamak, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.1, true];};  // how far the container animates to load
		};
		
		if (_obj_type in IL_Supported_Vehicles_C130J) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -4.57, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
			if (_obj_type == "C130J_Cargo") then
			{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C130J, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 8.5, true];};
			}
			else
			{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", (IL_Num_Slots_C130J / 2) - 1, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 13.5, true];};
			};
			
		};
		if (_obj_type in IL_Supported_Vehicles_C17) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C17, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.25, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 16, true];};//4.5, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_MOHAWK) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_MOHAWK, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -2.25, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 4.5, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_CHINOOK) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if (_obj_type == "CH_47F") then
			{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_CHINOOK - 2, true];};
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -3.1, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 4.5, true];};
			};
			if (_obj_type == "CH_147F") then
			{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_CHINOOK, true];};
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -2.55, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 5.25, true];};
			};
			if (_obj_type in ["kyo_MH47E_HC", "kyo_MH47E_Ramp", "kyo_MH47E_base"]) then
			{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_CHINOOK, true];};
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.5, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 6, true];};
			};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_MH9) then
		{
			if ((isNil {_obj getVariable "box_l"}) || (_force)) then {_obj setVariable["box_l", _obj, true];};
			if ((isNil {_obj getVariable "box_r"}) || (_force)) then {_obj setVariable["box_r", _obj, true];};

			if ((isNil {_obj getVariable "box_num_l"}) || (_force)) then {_obj setVariable["box_num_l", 0, true];};
			if ((isNil {_obj getVariable "box_num_r"}) || (_force)) then {_obj setVariable["box_num_r", 0, true];};
			if ((isNil {_obj getVariable "slots_num_l"}) || (_force)) then {_obj setVariable["slots_num_l", IL_Num_Slots_MH9, true];};
			if ((isNil {_obj getVariable "slots_num_r"}) || (_force)) then {_obj setVariable["slots_num_r", IL_Num_Slots_MH9, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.48, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_OFFROAD) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_OFFROAD, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.65, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1.5, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_VAN) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_VAN, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
		};

		if (_obj_type in IL_Supported_Vehicles_TEMPEST) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_TEMPEST, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.4, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_HEMTT) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_HEMTT, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if (_obj_type in ["B_Truck_01_box_F", "Marinir_Truck_01_box_FG"]) then
			{
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.4, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.8, true];};
			}
			else
			{
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};
			};
		};*/
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		// Gaz
		if (_obj_type in IL_Supported_Vehicles_Gaz) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Gaz, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};	//-0.65
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
		};
		// Blitz
		if (_obj_type in IL_Supported_Vehicles_Blitz) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Blitz, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.1, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// US6
		if (_obj_type in IL_Supported_Vehicles_US6) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_US6, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 0.15, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// GMC
		if (_obj_type in IL_Supported_Vehicles_GMC) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_GMC, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};
		// SdKfz7
		if (_obj_type in IL_Supported_Vehicles_SdKfz7) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_SdKfz7, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};  // how far the container animates to load
		};
		// LCVP
		if (_obj_type in IL_Supported_Vehicles_LCVP) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCVP, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -3, true];};  // how far the container animates to load
		};
		// LCM3
		if (_obj_type in IL_Supported_Vehicles_LCM3) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCM3, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.5, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -3, true];};  // how far the container animates to load
		};
		
		if (_obj_type in IL_Supported_Vehicles_C47) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -4.57, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
			//if (_obj_type == "C130J_Cargo") then
			//{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C47, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 8.5, true];};
			//}
			//else
			//{
				//if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", (IL_Num_Slots_C47 / 2) - 1, true];};
				//if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 13.5, true];};
			//};
		};
	};
//	END IL_Init_Veh

	IL_Init_Box =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
		};

		private["_obj", "_obj_type", "_bbr", "_p0", "_p1"];
		_obj = _this select 0;
		
		_obj setVariable["attachedPos", 0, true];
		_obj setVariable["attachedTruck", _obj, true];
		_obj setVariable["doors", "N", true];
		
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0, true];
		
		_bbr = boundingBoxReal _obj;
		_p0 = _bbr select 0;
		_p1 = _bbr select 1;
		_obj setVariable["zload_cargo", abs (_p0 select 2), true];
		
		_obj_type = (typeOf _obj);
		
		if (_obj_type in IL_Supported_Cargo20) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.6, true];//HEMETT Box ~2.09281
			//LOCAL
			//_obj setMass 2400;
			[_obj, 2400] call IL_SetNewMass;
		};
		
		/*if (_obj_type in IL_Supported_HEMTT) then
		{
			_obj setVariable["slots", 10, true];
			_obj setVariable["cargo_offset", 4.2, true];
		};

		if (_obj_type in IL_Supported_HMMWV) then
		{
			if (_obj_type in ["M1114_AGS_ACR", "HMMWV_M1151_M2"]) then
			{
				_obj setVariable["slots", 6, true];
				_obj setVariable["cargo_offset", 2.2, true];
			}
			else
			{
				_obj setVariable["slots", 5, true];
				if (_obj_type in ["HMMWV_M1035"]) then
				{
					_obj setVariable["cargo_offset", 1.9, true];
				}
				else
				{
					if (_obj_type in ["rc_hmmwv"]) then
					{
						_obj setVariable["cargo_offset", 2, true];
					}
					else
					{
						_obj setVariable["cargo_offset", 1.9, true];
					};
				};
			};
		};
		if (_obj_type in IL_Supported_Strider) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.2, true];
		};
		if (_obj_type in IL_Supported_Hunter) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.5, true];
		};
		if (_obj_type in IL_Supported_Ifrit) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.3, true];
		};
		if (_obj_type in IL_Supported_VAN) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.8, true];
		};
		if (_obj_type in IL_Supported_UGV) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 2.1, true];
		};
		if (_obj_type in IL_Supported_Hatchback) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 1.9, true];
		};
		if (_obj_type in IL_Supported_SUV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_OFFROAD) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.4, true];
		};
		if (_obj_type in IL_Supported_Rubberboat) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_SDV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.6, true];
		};
		if (_obj_type in IL_Supported_Quadbike) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.5, true];
		};
		if (_obj_type in IL_Supported_Veh_Ammo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.4, true];
		};
		if (_obj_type in IL_Supported_Tank) then
		{
			if (_obj_type == "Land_WaterTank_F") then
			{
				_obj setVariable["slots", 3, true];
				_obj setVariable["cargo_offset", 1, true];
			}
			else
			{
				_obj setVariable["slots", 2, true];
				_obj setVariable["cargo_offset", 0.4, true];
			};
			_turn = true;
		};*/
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		if (_obj_type in IL_Supported_Small_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 60] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Medium_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 120] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Large_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 240] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Stacket_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 1200] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Motorcicle_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Gaz_Zis5_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Truck_Cargo) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Car_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Armoured_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Small_Tank_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Mini_Static_Cargo) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Small_Static_Cargo) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Medium_Static_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Large_Static_Cargo) then
		{
			_obj setVariable["slots", 3, true];
			_obj setVariable["cargo_offset", 1, true];
		};	
		if (_obj_type in IL_Supported_XLarge_Static_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
	};
//	END IL_Init_Box

	IL_Server_AddScore =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_AddScore.", IL_Script_Inst];
		};
		if (isServer) then
		{
			((_this select 1) select 0) addScore ((_this select 1) select 1);
		};
	};
//	END IL_Server_AddScore

	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
//	END publicVariable "IL_SetScore";

	IL_Score = 
	{
		private ["_obj", "_score"];
		
		_obj = _this select 0;
		_score = _this select 1;
		
		if (_score != 0) then
		{
			IL_SetScore = [_obj, _score];
			if (isServer) then
			{
				["Cos", IL_SetScore] spawn IL_Server_AddScore;
			}
			else
			{
				publicVariableServer "IL_SetScore";
			};
		};
	};
//	END IL_Score

	IL_Server_SetDir =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj", "_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);
	};
//	END IL_Server_Turn_Obj

	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
//	END publicVariable "IL_SetDir";

	IL_Rotate = 
	{
		private ["_obj", "_to", "_change"];
		
		_obj = _this select 0;
		_to = _this select 1;
		_change = _this select 2;
		
		_change = (getDir _obj + _change) - getDir _to;
		
		IL_SetDir = [_obj, _change];
		if (local _obj) then
		{
			["Cos", IL_SetDir] spawn IL_Server_SetDir;
		}
		else
		{
			if (isDedicated) then
			{
				(owner _obj) publicVariableClient "IL_SetDir";
			}
			else
			{
				publicVariableServer "IL_SetDir";
			};
		};
	};
//	END IL_Rotate
	
	IL_Server_SetMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
		};
		private ["_obj", "_mass"];
		_obj = _this select 1 select 0;
		_mass = _this select 1 select 1;
		if ((getMass _obj) != _mass) then
		{
			_obj setMass _mass;
		};
	};
//	END IL_Server_SetMass
	
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
//	END publicVariable "IL_SetMass";

	IL_GetCargoMass =
	{
		private ["_v", "_cargo_mass"];
		_v = _this select 0;
		_cargo_mass = 0;
		if (count(attachedObjects _v) > 0) then
		{
			{
				_cargo_mass = _cargo_mass + getMass _x;
			} forEach attachedObjects _v;
		};
		_cargo_mass;
	};
//	END IL_GetCargoMass

	IL_GetDefaultMass =
	{
		private ["_v"];
		_v = _this select 0;
		_v getVariable "default_mass";
	};
//	END IL_GetDefaultMass

	IL_SetNewMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_SetMass", IL_Script_Inst];
		};
		
		if !(IL_Mass) ExitWith {};
		private ["_v", "_v_def_mass", "_cargo_mass"];
		_v = _this select 0;
		_v_def_mass =  if (count _this > 1) then {_this select 1} else {0};
		_cargo_mass =  if (count _this > 2) then {_this select 2} else {0};
		
		if (_v_def_mass == 0) then
		{
			_v_def_mass = [_v] call IL_GetDefaultMass;
		};
		if (_cargo_mass == 0) then
		{
			_cargo_mass = [_v] call IL_GetCargoMass;
		};
		
		if ((getMass _v) != (_v_def_mass + _cargo_mass)) then
		{
			IL_SetMass = [_v, (_v_def_mass + _cargo_mass)];
			if (local _v) then
			{
				["Cos", IL_SetMass] spawn IL_Server_SetMass;
			}
			else
			{
				if (isDedicated) then
				{
					(owner _v) publicVariableClient "IL_SetMass";
				}
				else
				{
					publicVariableServer "IL_SetMass";
				};
			};
		};
	};
//	END IL_SetNewMass
	
	IL_Vehicle_Chat =
	{
		private["_v", "_msg", "_mass_info", "_text", "_cargo_mass", "_v_def_mass"];
		_v = _this select 0;
		_msg = _this select 1;
		_mass_info =  if (count _this > 2) then {_this select 2} else {false};

		_v vehicleChat _msg;
		if (_mass_info && IL_Mass) then
		{
			_cargo_mass = 0;
			_v_def_mass = [_v] call IL_GetDefaultMass;
			_cargo_mass = [_v] call IL_GetCargoMass;
			
			_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "picture")];
			_text = _text + Format ["<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t><br/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo   mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _cargo_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass + _cargo_mass];
		};
		if (vehicle Player != _v) then
		{
			if (_mass_info && IL_Mass) then
			{
				_text = _text + _msg;
				hint parseText (_text);
			}
			else
			{
				Hint Format ["%1", _msg];
			};
		}
		else
		{
			if (_mass_info && IL_Mass) then
			{
				hint parseText (_text);
			};
		};
	};
//	END IL_Vehicle_Chat
	
	IL_Move_Attach=
	{
		private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
		_veh = _this select 0;
		_obj = _this select 1;
		_from = _this select 2;
		_to = _this select 3;
		_step = _this select 4;
		_turn = if (count _this > 5) then {_this select 5} else {false};
		
		_from_x = _from select 0;
		_from_y = _from select 1;
		_from_z = _from select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _from_x =""%2"", _from_y =""%3"", _from_z =""%4""", IL_Script_Inst, _from_x, _from_y, _from_z];
		};

		_to_x = _to select 0;
		_to_y = _to select 1;
		_to_z = _to select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _to_x =""%2"", _to_y =""%3"", _to_z =""%4""", IL_Script_Inst, _to_x, _to_y, _to_z];
		};
		
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x =""%2"", _y =""%3"", _z =""%4""", IL_Script_Inst, _x, _y, _z];
		};
		
		if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
		{
			_steps = round ((abs _x) / _step);
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x > _y and _z, _steps =""%2""", IL_Script_Inst, _steps];
			};
		}
		else
		{
			if ((abs _y) > (abs _z)) then
			{
				_steps = round ((abs _y) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _y > _z, _steps =""%2""", IL_Script_Inst, _steps];
				};
			}
			else
			{
				_steps = round ((abs _z) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _z > _y, _steps =""%2""", IL_Script_Inst, _steps];
				};
			};
		};

		_i = 0;
		_obj AttachTo [_veh, _from];
		while {_i < _steps} do
		{
			_i = _i + 1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_veh, _pos];
			if (_turn) then
			{
				[_obj, _veh, -90] call IL_Rotate;
				_turn = false;
			};
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _pos =""%2""", IL_Script_Inst, _pos];
			};
			sleep 0.25;
		};

		_obj AttachTo [_veh, _to];
	};
//	END IL_Move_Attach

	IL_Create_And_Attach =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Create_And_Attach", IL_Script_Inst];
		};
		_type = _this select 0;
		_to = _this select 1;
		_x = if (count _this > 2) then {_this select 2} else {0};
		_y = if (count _this > 3) then {_this select 3} else {0};
		_z = if (count _this > 4) then {_this select 4} else {0};
		_m = createVehicle [_type, position _to, [], 0, "CAN_COLLIDE"];
		_m AttachTo [_to,[_x,_y,_z]];
		_m
	};
//	END IL_Create_And_Attach

	IL_Cargo_Para =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Cargo_Para", IL_Script_Inst];
		};
		[Player, IL_Unload_Score] call IL_Score;
		private ["_smoke", "_light", "_damage", "_smoke_type", "_chemlight_type", "_cargo_pos", "_last_attach_pos", "_dist", "_velocity", "_tmp"];
		_cargo = _this select 0;
		_v = _this select 1;
		_last_attach_pos = _this select 2;
		if (((IL_Para_Smoke) || (IL_Para_Smoke_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_smoke_type = IL_Para_Smoke_Veh;
		}
		else
		{
			_smoke_type = IL_Para_Smoke_Default;
		};
		if (((IL_Para_Light) || (IL_Para_Light_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_chemlight_type = IL_Para_Light_Veh;
		}
		else
		{
			_chemlight_type = IL_Para_Light_Default;
		};

		_cargo_pos = [0,0,0];
		
		_damage = getDammage _cargo;
		detach _cargo;
		_dist = _v distance _cargo;
		_tmp = [_cargo] spawn
		{
			while {(getPosATL (_this select 0)) select 2 > IL_Para_Drop_Open_ATL} do
			{
				sleep 0.2;
			};
		};
		while {(_v distance _cargo) - _dist < 20} do
		{
			sleep 0.2;
		};
		if (IL_Para_Drop_Open_ATL > 0) then
		{
			while {(getPosATL _cargo) select 2 > (IL_Para_Drop_Open_ATL + ((velocity _cargo) select 2) * -0.5)} do
			{
				sleep 0.2;
			};
		};
		_chute = createVehicle ["B_Parachute_02_F", position _cargo, [], 0, "CAN_COLLIDE"];
		_chute attachTo [_cargo, _cargo_pos];
		_velocity = velocity _cargo;
		detach _chute;

		if (IL_Para_Drop_Velocity) then
		{
			_chute setVelocity _velocity;
		};
		_cargo attachTo [_chute, _cargo_pos];
		
		if (IL_Para_Smoke) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
		};
		if (IL_Para_Light) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
		};
		while {(getPos _cargo) select 2 > 2} do
		{
			sleep 0.2;
		};
		detach _cargo;
		if (IL_Para_Smoke) then
		{
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light) then
		{
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
		//Additional lights and smoke
		if (IL_Para_Smoke_Add) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light_Add) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
//	END IL_Cargo_Para
		
		_cargo setPosASL getPosASL _cargo;
		
		if (IL_CDamage == 0) then
		{
			_cargo setDamage 0;
		};
		
		if (IL_CDamage == 1) then
		{
			_cargo setDamage _damage;
			if (_damage != (getDammage _cargo)) then
			{
				sleep 1;
				_cargo setDamage _damage;
			};
		};
	};

	IL_Do_Load =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Do_Load", IL_Script_Inst];
		};

		private["_NoBoxHint", "_v", "_supported_cargo", "_zload", "_x_cargo_offset", "_cargo_offset", "_sdist", "_spoint", "_slot_num", "_counter", "_done", "_obj_lst", "_damage", "_obj_type", "_doors", "_box_num", "_dummy", "_nic", "_turn", "_force", "_cargo"];
		_NoBoxHint = "The box is in the vicinity. Perhaps it is outside of the loading area.";
		_v = _this select 0;
		_supported_cargo = _this select 1;
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		_force = if (count _this > 3) then {_this select 3} else {false};
		_cargo = if (count _this > 4) then {_this select 4} else {ObjNull};
		
		_v setVariable["can_load", false, true];
		_zload = _v getVariable "zload";
		_obj_type = (typeOf _v);
		_sdist = 0;

		_counter = 0;
		_done = false;
		_turn = false;

		// APC
		/*if ((_obj_type in IL_Supported_Vehicles_APC) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};

		// Dingo
		if ((_obj_type in IL_Supported_Vehicles_Dingo) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};

		// HMMWV
		if ((_obj_type in IL_Supported_Vehicles_HMMWV) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};

		// Ural
		if ((_obj_type in IL_Supported_Vehicles_Ural) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};

		// Zamak
		if ((_obj_type in IL_Supported_Vehicles_Zamak) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};


		if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};

		if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6.5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_C130J) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-9,-5.4];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_C17) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-16.5,-3];//Ramp end [0,-13.5,-3.2]
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_CHINOOK) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-9,-3];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_MOHAWK) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-6,-3];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_MH9) && (_doors == "L")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0-3,1.3,-1.3];
			_box_num = _v getVariable "box_num_l";
			_slot_num = _v getVariable "slots_num_l";
		};
		if ((_obj_type in IL_Supported_Vehicles_MH9) && (_doors == "R")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0+3,1.3,-1.3];
			_box_num = _v getVariable "box_num_r";
			_slot_num = _v getVariable "slots_num_r";
		};*/
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		//Gaz
		if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			//_spoint = _v modelToWorld [0,-4.5,-1.6];
			_spoint = _v modelToWorld [0,-4.5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// Blitz
		if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// US6
		if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// GMC
		if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		//SdKfz7
		if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// LCVP
		if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 20;	//IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			//_spoint = _v modelToWorld [0,12,0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// LCVP
		if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 30;	//IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			//_spoint = _v modelToWorld [0,6,0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		//C47
		if ((_obj_type in IL_Supported_Vehicles_C47) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 20;	//IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-9,-5.4];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if !(_force) then
		{
			_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
		}
		else
		{
			_obj_lst = [_cargo];
		};

		if (count (_obj_lst) > 0) then
		{
			{
				if( locked _x > 1 ) exitWith {
					["Cannot load a locked vehicle",false] call SA_Hint;
				};
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". Cargo: ""%2"" found.", IL_Script_Inst, _x];
				};
				if (isNil {_x getVariable "attachedPos"}) then
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". Init box: ""%2"".", IL_Script_Inst, _x];
					};
					[_x] call IL_Init_Box;
				};
				/*
				*
				*
				*	TODO: change turn to number for th deg to turn!
				*
				*/
				if ((typeOf _x) in (IL_Supported_Cargo20 + ["Land_WaterTank_F"])) then
				{
					_turn = true;
				};
				//It allows you to load oversize loads, but they must be on the list of supported cargo!!!
				if ((abs(_slot_num - _box_num) < (_x getVariable "slots")) && (_box_num != 0)) then
				{
					[_v, "This cargo is to big. "] call IL_Vehicle_Chat;
				}
				else
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". _box_num: ""%2"" _slot_num: ""%3""", IL_Script_Inst,  _box_num, _slot_num];
					};
					/*if (_obj_type in IL_Supported_Vehicles_MH9) then
					{
						_turn = !_turn;
					};*/
					if ((_box_num > _slot_num) && !_done) then
					{
						[_v, Format ["Loading ""%1"" on ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_counter = (_box_num);
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						}
						else
						{
							_x_cargo_offset = 0;
						};
						_damage = getDammage _x;
						
						if ((typeOf _x) in IL_Supported_SDV) then
						{
							_x animate ["periscope", 3]; 
							_x animate ["Antenna", 3]; 
							_x animate ["HideScope", 3]; 
							_x animate["display_on_R", 1];
							//animationPhase
							[_v, "Waiting for periscope."] call IL_Vehicle_Chat;
							while {_x animationPhase "periscope" < 3} do
							{
								sleep 1;
							};
						};

						// APC
						/*if ((_obj_type in IL_Supported_Vehicles_APC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Dingo
						if ((_obj_type in IL_Supported_Vehicles_Dingo) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						// HMMWV
						if ((_obj_type in IL_Supported_Vehicles_HMMWV) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Ural
						if ((_obj_type in IL_Supported_Vehicles_Ural) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Zamak
						if ((_obj_type in IL_Supported_Vehicles_Zamak) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6.5 - _cargo_offset,_zload], [_x_cargo_offset,_counter - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_C130J)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-9,-0.93 + _zload], [_x_cargo_offset,-8,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-7,-0.93 + _zload], [_x_cargo_offset,-3.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-2.5,_zload], [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-14,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-13,-1.75 + _zload], [_x_cargo_offset,-6.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-5.5,_zload], [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_CHINOOK)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-9,-0.75 + _zload], [_x_cargo_offset,-7,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-7,-0.75 + _zload], [_x_cargo_offset,-4,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-4,_zload], [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MOHAWK)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6,-0.75 + _zload], [_x_cargo_offset,-4.5,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-4.5,-0.75 + _zload], [_x_cargo_offset,-1.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-1.5,_zload], [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							[_v, _x, [_x_cargo_offset-3,1.3,-1.3 + _zload], [_x_cargo_offset-1,-0.2,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							[_v, _x, [_x_cargo_offset+3,1.3,-1.3 + _zload], [_x_cargo_offset+1,-0.2,_zload], 1, _turn] call IL_Move_Attach;
						};*/
						//*****************************************************************************************************************
						//*										VIOC Units declaration
						// IL_Move_Attach
						// private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
						// _v = "_veh"
						// _x = "_obj"
						// [...] = "_from"
						// [...] = "_to"
						// 1 = "_pos"
						// _turn = "_step"
						//*****************************************************************************************************************
						// Gaz
						if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
						{
							/*if(_x in IL_Supported_Crates_place_near) then {
								[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.1 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							} else {
								[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							};*/
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// US6
						if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC
						if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// SdKfz7
						if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-1 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,8,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCM3
						if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,10,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						//C47
						if ((_obj_type in IL_Supported_Vehicles_C130J)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-9,-0.93 + _zload], [_x_cargo_offset,-8,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-7,-0.93 + _zload], [_x_cargo_offset,-3.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-2.5,_zload], [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						_counter = _counter - (_x getVariable "slots");

						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
						};
						/*if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _x, true];
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _x, true];
						};*/
						
						[_v] call IL_SetNewMass;
						
						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed 0;
						};
						
						_x setVariable["attachedPos", _counter, true];
						_x setVariable["attachedTruck", _v, true];
						_x setVariable["doors", _doors, true];
						
						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						
						if (_counter > _slot_num) then
						{
							[_v, Format ["""%1"" is loaded onto ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), abs(_slot_num - _counter)], true] call IL_Vehicle_Chat;
						}
						else
						{
							[_v, Format ["""%1"" is loaded onto ""%2"" There is no more space.", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")], true] call IL_Vehicle_Chat;
						};
						//player addScore IL_Load_Score;
						[Player, IL_Load_Score] call IL_Score;
					}
					else
					{
						if ((_box_num > _slot_num) && !_done) then
						{
							[_v, _NoBoxHint] call IL_Vehicle_Chat;
						};
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
		}
		else
		{
			[_v, _NoBoxHint] call IL_Vehicle_Chat;
		};
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Load

	IL_Do_Unload =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Do_Unload.", IL_Script_Inst];
		};

		private ["_v", "_para", "_supported_cargo", "_doors", "_counter", "_done", "_obj_lst", "_zload", "_x_cargo_offset", "_cargo_offset", "_obj_type", "_damage", "_nic", "_free_slots", "_turn", "_skip", "_last_attach_pos"];
		_v = _this select 0;
		_para = if (count _this > 1) then {_this select 1} else {false};
		//_para = _this select 1;
		// _supported_cargo = _this select 2;
		// _doors = if (count _this > 3) then {_this select 3} else {"B"};
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		
		_v setVariable["can_load", false, true];
		_counter = 0;
		_done = false;
		_turn = false;
		_skip = true;
		_obj_lst = [];

		_obj_type = (typeOf _v);
		/*if (_obj_type in IL_Supported_Vehicles_MH9) then
		{
			if (_doors == "L") then
			{
				_obj_lst = [_v getVariable "box_l"];
			}
			else
			{
				_obj_lst = [_v getVariable "box_r"];
			};
		}
		else
		{
			//_obj_lst = nearestObjects[_v, _supported_cargo, IL_SDistU];
			_obj_lst = attachedObjects _v;
		};*/
		_obj_lst = attachedObjects _v;
		
		if (count (_obj_lst) > 0) then
		{
			{
				_obj_type = (typeOf _v);
				
				if (_x getVariable "doors" == _doors) then
				{
					if (_doors == "B") then
					{
						_counter = (_v getVariable "box_num");
					};
					if (_doors == "L") then
					{
						_counter = (_v getVariable "box_num_l");
					};
					if (_doors == "R") then
					{
						_counter = (_v getVariable "box_num_r");
					};
					if (((_x getVariable "attachedTruck") == _v) && ((_x getVariable "attachedPos") == (_counter)) && (_counter < 0) && !_done) then
					{
						[_v, Format ["Unloading ""%1"" from ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_skip = false;
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						_damage = getDammage _x;
						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						}
						else
						{
							_x_cargo_offset = 0;
						};

						_obj_type = (typeOf _v);

						// APC
						/*if ((_obj_type in IL_Supported_Vehicles_APC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Dingo
						if ((_obj_type in IL_Supported_Vehicles_Dingo) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};

						// HMMWV
						if ((_obj_type in IL_Supported_Vehicles_HMMWV) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Ural
						if ((_obj_type in IL_Supported_Vehicles_Ural) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						// Zamak
						if ((_obj_type in IL_Supported_Vehicles_Zamak) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};

						if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-7 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter - _cargo_offset,_zload], [_x_cargo_offset,-6.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_C130J)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], [_x_cargo_offset,-2.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-3.5,_zload], [_x_cargo_offset,-7,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-8,-0.93 + _zload], [_x_cargo_offset,-9,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								[_v, _x, [_x_cargo_offset,-10,-0.93 + _zload], [_x_cargo_offset,-12,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
								_last_attach_pos = [_x_cargo_offset,-12,_zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], [_x_cargo_offset,-5.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-6.5,_zload], [_x_cargo_offset,-13,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-14,-1.75 + _zload], [_x_cargo_offset,-16.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-19.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
								_last_attach_pos = [_x_cargo_offset,-19.5,-1.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_CHINOOK)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], [_x_cargo_offset,-4,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-4,_zload], [_x_cargo_offset,-7,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-7,-0.75 + _zload], [_x_cargo_offset,-9,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset,-10,-0.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_MOHAWK)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], [_x_cargo_offset,-1.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-1.5,_zload], [_x_cargo_offset,-4.5,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-4.5,-0.75 + _zload], [_x_cargo_offset,-6,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset,-6,-0.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							[_v, _x, [_x_cargo_offset-1,-0.2,_zload], [_x_cargo_offset-3,1.3,-0.75 + _zload], 1] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset-3,1.3,-0.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							[_v, _x, [_x_cargo_offset+1,-0.2,_zload], [_x_cargo_offset+3,1.3,-0.75 + _zload], 1] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset+3,1.3,-0.75 + _zload];
							};
						};*/
						//*****************************************************************************************************************
						//*										VIOC Units declaration
						//*****************************************************************************************************************
						//Gaz
						if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// US6
						if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC
						if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						//SdKfz7
						if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,8,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,10,_zload], 1, _turn] call IL_Move_Attach;
						};
						//C47
						if ((_obj_type in IL_Supported_Vehicles_C47)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], [_x_cargo_offset,-2.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-3.5,_zload], [_x_cargo_offset,-7,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-8,-0.93 + _zload], [_x_cargo_offset,-9,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								[_v, _x, [_x_cargo_offset,-10,-0.93 + _zload], [_x_cargo_offset,-12,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
								_last_attach_pos = [_x_cargo_offset,-12,_zload];
							};
						};
					
						if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
						{
							[_x, _v, _last_attach_pos] spawn IL_Cargo_Para;
						}
						else
						{
							sleep 0.2;
							detach _x;
							_x enableSimulationGlobal true;  // Lyrae: wtf is this
							_x setVelocity [0, 0, -0.2];
						};

						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed -1;
						};
						
						_counter = _counter + (_x getVariable "slots");
						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
							_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
						};
						if (_doors == "L") then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _v, true];
							_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
						};
						if (_doors == "R") then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _v, true];
							_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
						};
						
						[_v] call IL_SetNewMass;
						
						_x setVariable["attachedPos", 0, true];
						_x setVariable["attachedTruck", _x, true];
						_x setVariable["doors", "N", true];

						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						[_v, Format ["""%1"" was unloaded from the ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), _free_slots], true] call IL_Vehicle_Chat;
						//player addScore IL_Unload_Score;
						[Player, IL_Unload_Score] call IL_Score;
						sleep 1;
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
			if (_skip) then
			{
				[_v, "Can not find cargo. Try again."] call IL_Vehicle_Chat;
				
				if (_counter < 0) then
				{
					_counter = _counter + 1;
				};
				
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
					_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
				};
				if (_doors == "L") then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _v, true];
					_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
				};
				if (_doors == "R") then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _v, true];
					_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
				};
			};
		}
		else
		{
			[_v, "BOX 404 error. Box not found O.o. Vehicle data reset..."] call IL_Vehicle_Chat;
			[_v, true] call IL_Init_Veh;
			[_v, "Vehicle data reset done."] call IL_Vehicle_Chat;
		};
		[_v] call IL_SetNewMass;
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Unload

	IL_GetOut =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};

		private ["_v", "_player", "_para", "_chute",  "_backpack", "_pos", "_x_offset", "_dist", "_dist_out", "_dist_out_para", "_velocity"];
		_v = _this select 0;
		_player = _this select 1;
		_para = if (count _this > 2) then {_this select 2} else {false};

		/*if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
		{
			_dist_out = 5;
			_dist_out_para = 5;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_MOHAWK) then
		{
			_dist_out = 5;
			_dist_out_para = 11;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_CHINOOK) then
		{
			_dist_out = 7;
			_dist_out_para = 11;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_C17) then
		{
			_dist_out = 15;
			_dist_out_para = 20;
		};*/
		if ((typeOf _v) in IL_Supported_Vehicles_C130J) then
		{
			_dist_out = 7;
			_dist_out_para = 15;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_C47) then
		{
			_dist_out = 7;
			_dist_out_para = 15;
		};
		/*
		_pos = (_v worldToModel (getPosATL _player));
		_x_offset = _pos select 0;
		if (_x_offset < 0) then
		{
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = 90;
			}
			else
			{
				_x_offset = 8;
			};
		}
		else
		{
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = -90;
			}
			else
			{
				_x_offset = -8;
			};
		};*/
//	END IL_GetOut
		
		_player allowDamage false;
		sleep 0.2;
		unassignVehicle _player;
		_player action ["EJECT",vehicle _player];
		sleep 0.5;
	 
		if !(_para) then
		{
			_player setDir ((getDir _v) + 180);
			_pos = ([_v, _dist_out, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
		}
		else
		{
			_pos = ([_v, _dist_out_para, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
			_dist = _v distance _player;
			while {(_v distance _player) - _dist < 20} do
			{
				sleep 0.2;
			};
			if (IL_Para_Jump_Open_ATL > 0) then
			{
				while {(getPosATL _player) select 2 > IL_Para_Jump_Open_ATL} do
				{
					sleep 0.2;
				};
			};
			if !(unitBackpack _player isKindOf "B_Parachute") then
			{
				_chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "CAN_COLLIDE"];
//				_chute setPos getPos _player;
				_chute AttachTo [_player, [0,0,0]];
				detach _chute;
				_velocity = velocity _player;
				_player moveInDriver _chute;
				if (IL_Para_Jump_Velocity) then
				{
					_chute setVelocity _velocity;
				};
			};
		};
		_player allowDamage true;
		
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut. Player ATL: ""%2""", IL_Script_Inst, _pos];
		};
	};
};
//	END PROCEDURES AND FUNCTIONS

//	MAIN CODE
_vsupported = false;
/*
// APC
if (_obj_main_type in IL_Supported_Vehicles_APC) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_APC.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on APC</t>",
	{
		[_this select 0, IL_Supported_Cargo_APC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_APC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from APC</t>",
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

// Dingo
if (_obj_main_type in IL_Supported_Vehicles_Dingo) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Dingo.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Dingo</t>",
	{
		[_this select 0, IL_Supported_Cargo_Dingo] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Dingo, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Dingo</t>",
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

// HMMWV
if (_obj_main_type in IL_Supported_Vehicles_HMMWV) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_HMMWV.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on HMMWV</t>",
	{
		[_this select 0, IL_Supported_Cargo_HMMWV] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_HMMWV, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from HMMWV</t>",
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

// Ural
if (_obj_main_type in IL_Supported_Vehicles_Ural) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Ural.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Ural</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Ural] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Ural, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Ural</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Ural] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Ural, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Ural</t>",
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

// Zamak
if (_obj_main_type in IL_Supported_Vehicles_Zamak) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Zamak.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Zamak</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Zamak] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Zamak, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Zamak</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Zamak] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Zamak, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Zamak</t>",
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

if (_obj_main_type in IL_Supported_Vehicles_MOHAWK) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MOHAWK.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on CH-49</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_NonVeh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on CH-49</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_Veh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<t color=""#007f0e"">Get in CH-49</t>",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<t color=""#ff0000"">Get out CH-49</t>",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from CH-49</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Open cargo ramp in CH-49</t>",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 1];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Close cargo ramp in CH-49</t>",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 1) && (_target getVariable 'can_load')"
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
if (_obj_main_type in IL_Supported_Vehicles_CHINOOK) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_CHINOOK.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	if (typeOf _obj_main == "CH_147F") then
	{
		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_NonVeh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_NonVeh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' == 1)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_Veh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_Veh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' == 1)"
		];

		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook Ride in back</t>",
		{
			(_this select 1) moveInCargo (_this select 0);
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook</t>",
		{
			(_this select 1) setDir (getDir (_this select 0));
			_pos = ([(_this select 0), 4.5, (getDir (_this select 0))] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL (_this select 0)) select 2) + 1];
			(_this select 1) setPosATL _pos;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#ff0000"">Get out Chinook</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'ani_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Chinook</t>",
		{
			[_this select 0] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ani_ramp' == 1)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
		{
			[_this select 0, true] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ani_ramp' == 1)"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
		{
			while {((_this select 0) getVariable "box_num") != 0} do
			{
				[_this select 0, true] call IL_Do_Unload;
			};
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ani_ramp' == 1)"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Open cargo ramp in Chinook</t>",
		{
			_this select 0 animatedoor ['ani_ramp', 1];
			_this select 0 animatedoor ['ani_ramp2', 1];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'ani_ramp' == 0) && (_target getVariable 'can_load')"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Close cargo ramp in Chinook</t>",
		{
			_this select 0 animatedoor ['ani_ramp', 0];
			_this select 0 animatedoor ['ani_ramp2', 0];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'ani_ramp' == 1) && (_target getVariable 'can_load')"
		];
	};
	if (typeOf _obj_main == "CH_47F") then
	{
		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_NonVeh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_NonVeh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' == 1)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_Veh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_Veh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' == 1)"
		];

		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook Ride in back</t>",
		{
			(_this select 1) moveInCargo (_this select 0);
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook</t>",
		{
			(_this select 1) setDir (getDir (_this select 0));
			_pos = ([(_this select 0), 4.5, (getDir (_this select 0))] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL (_this select 0)) select 2) + 1];
			(_this select 1) setPosATL _pos;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#ff0000"">Get out Chinook</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'Ramp' > 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Chinook</t>",
		{
			[_this select 0] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ramp' == 1)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
		{
			[_this select 0, true] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'Ramp' == 1)"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
		{
			while {((_this select 0) getVariable "box_num") != 0} do
			{
				[_this select 0, true] call IL_Do_Unload;
			};
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'Ramp' == 1)"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Open cargo ramp in Chinook</t>",
		{
			_this select 0 animate ['Ramp', 1];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'Ramp' == 0) && (_target getVariable 'can_load')"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Close cargo ramp in Chinook</t>",
		{
			_this select 0 animate ['Ramp', 0];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'Ramp' == 1) && (_target getVariable 'can_load')"
		];
	};
	if (typeOf _obj_main in ["kyo_MH47E_HC", "kyo_MH47E_Ramp", "kyo_MH47E_base"]) then
	{
		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_NonVeh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_NonVeh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Chinook</t>",
		{
			[_this select 0, IL_Supported_Cargo_Veh_CHINOOK] call IL_Do_Load;
		},[],IL_Action_LU_Priority,true,true,"",
		"(count(nearestObjects[ _target modelToWorld [0,-9,-3], IL_Supported_Cargo_Veh_CHINOOK, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43)"
		];

		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook Ride in back</t>",
		{
			(_this select 1) moveInCargo (_this select 0);
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#007f0e"">Get in Chinook</t>",
		{
			(_this select 1) setDir (getDir (_this select 0));
			_pos = ([(_this select 0), 4.5, (getDir (_this select 0))] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL (_this select 0)) select 2) + 1];
			(_this select 1) setPosATL _pos;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<t color=""#ff0000"">Get out Chinook</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'Ani_Ramp' < 0.43) && (_target getVariable 'usable_ramp')"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Chinook</t>",
		{
			[_this select 0] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'Ani_Ramp' < 0.43)"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
		{
			[_this select 0, true] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'Ani_Ramp' < 0.43)"
		];
		
		_obj_main addAction [
		"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
		{
			while {((_this select 0) getVariable "box_num") != 0} do
			{
				[_this select 0, true] call IL_Do_Unload;
			};
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'Ani_Ramp' < 0.43)"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Open cargo ramp in Chinook</t>",
		{
			_this select 0 animate ['Ani_Ramp', 0];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'Ani_Ramp' == 1) && (_target getVariable 'can_load')"
		];

		_obj_main addAction [
		"<t color=""#0000ff"">Close cargo ramp in Chinook</t>",
		{
			_this select 0 animate ['Ani_Ramp', 1];
		},[],IL_Action_O_Priority,false,true,"",
		"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'Ani_Ramp' == 0) && (_target getVariable 'can_load')"
		];
	};
	
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
if (_obj_main_type in IL_Supported_Vehicles_C130J) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C130J.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	if (_obj_main_type == "C130J") then
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
	};
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C-130J</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_C130J] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C130J, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C-130J</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_C130J] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_Veh_C130J, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C-130J</t>",
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
if (_obj_main_type in IL_Supported_Vehicles_MH9) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MH9.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on left MH-9</t>",
	{
		[_this select 0, IL_Supported_Cargo_MH9, "L"] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count (nearestObjects[ _target modelToWorld [0-3,1,-1.3], IL_Supported_Cargo_MH9, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0-3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num_l' > _target getVariable 'slots_num_l') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on right MH-9</t>",
	{
		[_this select 0, IL_Supported_Cargo_MH9, "R"] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count (nearestObjects[ _target modelToWorld [0+3,1,-1.3], IL_Supported_Cargo_MH9, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0+3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num_r' > _target getVariable 'slots_num_r') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from left MH-9</t>",
	{
		[_this select 0, false, "L"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_l' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0-3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from right MH-9</t>",
	{ 
		[_this select 0, false, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0+3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt)"
	];
///////////////////////////
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute left MH-9</t>",
	{
		[_this select 0, true, "L"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_l' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute right MH-9</t>",
	{
		[_this select 0, true, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		[_this select 0, true, "L"] call IL_Do_Unload;
		[_this select 0, true, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && (_target getVariable 'box_num_l' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target getVariable 'usable_ramp')"
	];
//////////////////////////////////////////////////
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
//////////////////////
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
/////////////////////////
};
if (_obj_main_type in IL_Supported_Vehicles_OFFROAD) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Offroad</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Offroad</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Offroad</t>",
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
if (_obj_main_type in IL_Supported_Vehicles_VAN) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_VAN.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on VAN</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on VAN</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from VAN</t>",
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

if (_obj_main_type in IL_Supported_Vehicles_TEMPEST) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_TEMPEST.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on TEMPEST</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_TEMPEST] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on TEMPEST</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_TEMPEST] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from TEMPEST</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
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
if (_obj_main_type in IL_Supported_Vehicles_HEMTT) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_HEMTT.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on HEMTT</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on HEMTT</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from HEMTT</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
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
};*/

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
	IL_SDistL_boat = 6; //IL_SDistL
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
	IL_SDistL_boat = 10; //IL_SDistL
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