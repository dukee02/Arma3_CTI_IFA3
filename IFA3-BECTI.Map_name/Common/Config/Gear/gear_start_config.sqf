/*
  # HEADER #
	Script: 		Common\Config\Gear\gear_start_config.sqf
	Alias:			-
	Description:	Get the funds of a group. 0 by default
					Note that if the group is the commander's then
					we retrieve the commander funds
	Author: 		dukee
	Creation Date:	08-09-2022
	Revision Date:	
	
  # PARAMETERS #
    0	[Side]: The side
    1	[Nation]: The selected Nation
    1	[Mod]: The active main Mod
	
  # RETURNED VALUE #
	none
	
  # SYNTAX #
	[SIDE, NATION, MOD] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
	
  # DEPENDENCIES #
  none
	
  # EXAMPLE #
	[west, CTI_BW_ID, CTI_GM_ID] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
*/

private ["_side", "_nationID", "_modID", "_weapon", "_weapon_ammo", "_weapon_att_light", "_weapon_att_optic", "_uniform", "_vest", "_backpack", "_helmet", "_grenades", "_healing", "_bino", "_item_map", "_item_radio", "_item_compass", "_item_watch"];

_side = _this select 0;
_nationID = _this select 1;
_modID = _this select 2;
_defaultGearVar = "CTI_AI_WEST_DEFAULT_GEAR";

if(_side == east) then {
	_defaultGearVar = "CTI_AI_EAST_DEFAULT_GEAR";
};

_weapon = "";
_weapon_ammo = "";
_weapon_att_optic = "";
_weapon_att_light = "";
_uniform = "";
_vest = "";
_backpack = "";
_helmet = "";
_grenades = "";
_healing = "firstaidkit";
_bino = "binocular";
_item_map = "itemmap";
_item_radio = "itemradio";
_item_compass = "itemcompass";
_item_watch = "itemwatch";

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Config\Gear\gear_start_config.sqf", format ["_side <%1> _nationID <%2> _modID <%3> _defaultGearVar<%4>", _side, _nationID, _modID, _defaultGearVar]] call CTI_CO_FNC_Log };

switch(_nationID) do {
	case CTI_GER_ID: {
		if(_modID == CTI_SPE_ID) then {
			switch(CTI_CAMO_ACTIVATION) do {
				case 4: {//urban
					_uniform = "U_SPE_GER_Soldier_Boots";
					_vest = "V_SPE_GER_VestKar98";
					_backpack = "B_SPE_GER_Belt_bag_K98k_MG";
					_helmet = "H_SPE_GER_Helmet";
				};
				default {
					_uniform = "U_SPE_ST_Soldier_E44";
					_vest = "V_SPE_DAK_VestKar98";
					_backpack = "B_SPE_GER_A_frame_ST_K98k_MG";
					_helmet = "H_SPE_ST_Helmet";
				};
			};
			_weapon = "SPE_K98_Late";
			_weapon_ammo = "SPE_5Rnd_792x57";
			_grenades = "SPE_Shg24";
			_healing = "SPE_GER_FirstAidKit";
			_bino = "SPE_Binocular_GER";
			_item_compass = "SPE_GER_ItemCompass_deg";
			_item_watch = "SPE_GER_ItemWatch";
		} else {
			switch(CTI_CAMO_ACTIVATION) do {
				case 1: {//Winter
					_uniform = "U_LIB_GER_Soldier3_w";
					_vest = "V_LIB_GER_VestKar98";
					_backpack = "B_LIB_GER_A_frame";
					_helmet = "H_LIB_GER_Helmet_w";
				};
				case 2: {//Desert
					_uniform = "U_LIB_DAK_Soldier";
					_vest = "V_LIB_DAK_VestKar98";
					_backpack = "B_LIB_DAK_A_frame";
					_helmet = "H_LIB_DAK_Helmet";
				};
				default {
					_uniform = "U_LIB_GER_schutze";
					_vest = "V_LIB_GER_VestKar98";
					_backpack = "B_LIB_GER_A_frame";
					_helmet = "H_LIB_GER_Helmet";
				};
			};
			_weapon = "LIB_K98";
			_weapon_ammo = "LIB_5Rnd_792x57";
			_grenades = "LIB_Shg24";
			_healing = "firstaidkit";
			_bino = "LIB_Binocular_GER";
			_item_compass = "itemcompass";
		};
	};
	case CTI_SOV_ID: {
		if(_modID == CTI_SPE_ID) then {
		} else {
			switch(CTI_CAMO_ACTIVATION) do {
				case 1: {//Winter
					_uniform = "U_LIB_SOV_Strelok_w";
					_helmet = "H_LIB_SOV_Ushanka";
				};
				default {
					_uniform = "U_LIB_SOV_Strelok";
					_helmet = "H_LIB_SOV_RA_Helmet";
				};
			};
			_weapon = "LIB_M9130";
			_weapon_ammo = "LIB_5Rnd_762x54";
			_grenades = "LIB_M39";
			_healing = "firstaidkit";
			_bino = "LIB_Binocular_SU";
			_item_compass = "itemcompass";
			_vest = "V_LIB_SOV_RA_MosinBelt";
			_backpack = "B_LIB_SOV_RA_Rucksack";
		};
	};
	case CTI_UK_ID: {
		if(_modID == CTI_SPE_ID) then {
		} else {
			switch(CTI_CAMO_ACTIVATION) do {
				case 1: {//Winter
					_uniform = "U_LIB_UK_P37_w";
					_vest = "V_LIB_UK_P37_Rifleman_Blanco";
					_backpack = "B_LIB_UK_HSack_Blanco_Tea";
					_helmet = "H_LIB_UK_Helmet_Mk2_w";
				};
				case 2: {//Desert
					_uniform = "U_LIB_UK_KhakiDrills";
					_vest = "V_LIB_UK_P37_Rifleman";
					_backpack = "B_LIB_UK_HSack_Tea";
					_helmet = "H_LIB_UK_Helmet_Mk2_Desert";
				};
				default {
					_uniform = "U_LIB_UK_P37";
					_vest = "V_LIB_UK_P37_Rifleman_Blanco";
					_backpack = "B_LIB_UK_HSack_Blanco_Tea";
					_helmet = "H_LIB_UK_Helmet_Mk2";
				};
			};
			_weapon = "LIB_LeeEnfield_No1_Bayonet";
			_weapon_ammo = "LIB_10Rnd_770x56";
			_grenades = "LIB_No77";
			_healing = "firstaidkit";
			_bino = "LIB_Binocular_UK";
			_item_compass = "itemcompass";
		};
	};
	case CTI_US_ID: {
		if(_modID == CTI_SPE_ID) then {
			switch(CTI_CAMO_ACTIVATION) do {
				case 4: {//urban
					_uniform = "U_SPE_US_Rangers_Uniform";
					_vest = "V_SPE_US_Assault_Vest";
					_backpack = "";
					_helmet = "H_SPE_US_Rangers_Helmet";
				};
				default {
					_uniform = "U_SPE_US_Private";
					_vest = "V_SPE_US_Vest_Garand";
					_backpack = "B_SPE_US_Backpack_Bandoleer_Rifleman";
					_helmet = "H_SPE_US_Helmet_ns";
				};
			};
			_weapon = "SPE_M1903A3_Springfield";
			_weapon_ammo = "SPE_5Rnd_762x63_t";
			_grenades = "SPE_US_Mk_2";
			_healing = "SPE_US_FirstAidKit";
			_bino = "SPE_Binocular_US";
			_item_compass = "SPE_US_ItemCompass";
			_item_watch = "SPE_US_ItemWatch";
		} else {
			switch(CTI_CAMO_ACTIVATION) do {
				case 1: {//Winter
					_uniform = "U_LIB_US_Private_w";
					_helmet = "H_LIB_US_Helmet_w";
				};
				case 2: {//Desert
					_uniform = "U_LIB_US_NAC_Uniform";
					_helmet = "H_LIB_US_Helmet";
				};
				default {
					_uniform = "U_LIB_US_Private";
					_helmet = "H_LIB_US_Helmet";
				};
			};
			_weapon = "LIB_M1903A3_Springfield";
			_weapon_ammo = "LIB_5Rnd_762x63";
			_grenades = "LIB_F1";
			_healing = "firstaidkit";
			_bino = "LIB_Binocular_US";
			_item_compass = "itemcompass";
			_vest = "V_LIB_US_VEST_M1919";
			_backpack = "B_LIB_US_M36";
		};
	};
	case CTI_FR_ID: {
		if(_modID == CTI_SPE_ID && (CTI_SPE_DLC >= 1 && [1175380] call CTI_CO_FNC_HasDLC)) then {
			_uniform = "U_SPE_FR_HBT_Uniform";
			_vest = "V_SPE_US_Vest_Garand";
			_backpack = "B_SPE_FR_Backpack_Bandoleer_Rifleman";
			_helmet = "H_SPE_FR_Adrian";
			_weapon = "SPE_M1903A3_Springfield";
			_weapon_ammo = "SPE_5Rnd_762x63_t";
			_grenades = "SPE_US_Mk_2";
			_healing = "SPE_US_FirstAidKit";
			_bino = "SPE_Binocular_US";
			_item_compass = "SPE_US_ItemCompass";
			_item_watch = "SPE_US_ItemWatch";
		} else {};
	};
	default {};
};

missionNamespace setVariable [_defaultGearVar, [
	[[_weapon,[_weapon_att_optic,_weapon_att_light,"",""],[_weapon_ammo]],["",["","","",""],[""]],
	["",["","","",""],[""]]],
	[[_uniform,[_healing,_healing,_weapon_ammo,_weapon_ammo,_weapon_ammo]],
	[_vest,[_grenades,_grenades,_weapon_ammo,_weapon_ammo]],
	["",[]]],
	[_helmet,""],[["",_bino],[_item_map,"",_item_radio,_item_compass,_item_watch]]]];
