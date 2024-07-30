private ["_faction", "_side"];

_side = _this;
_faction = "West";
if (_side isEqualTo east) then {
	_faction = "East";
};

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];

// Vanilla templates
// no Vanilla gear its WW2!
//_t = _t 	+ [[[["arifle_SPAR_01_blk_F",[],["30Rnd_556x45_Stanag_Tracer_Yellow"]]],[["U_B_T_Soldier_F",["Medikit","Medikit"]],["V_BandollierB_rgr",["HandGrenade","HandGrenade"]],["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]],["H_HelmetB_light",""],[[],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];

if (CTI_Log_Level >= CTI_Log_Debug) then {["DEBUG", "FILE: Common\Config\Gear\Gear_Template.sqf", format ["_side [%1] _faction [%2]. CTI_GER_SIDE %3", _side, _faction, CTI_GER_SIDE]] call CTI_CO_FNC_Log};

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//German Gear active
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {						//Winter camo active 
			_t = _t 	+ [[[["LIB_K98",["","","",""],["LIB_5Rnd_792x57"]]],[["U_LIB_GER_Soldier3_w",["firstaidkit","firstaidkit"]],["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24"]],["B_LIB_GER_A_frame",["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"]]],["H_LIB_GER_Helmet_w",""],[["", "LIB_Binocular_GER"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		case 2: {						//Desert camo active
			_t = _t 	+ [[[["LIB_K98",["","","",""],["LIB_5Rnd_792x57"]]],[["U_LIB_DAK_Soldier",["firstaidkit","firstaidkit"]],["V_LIB_DAK_VestKar98",["LIB_Shg24","LIB_Shg24"]],["B_LIB_DAK_A_frame",["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"]]],["H_LIB_DAK_Helmet",""],[["", "LIB_Binocular_GER"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		default {
			_t = _t 	+ [[[["LIB_K98",["","","",""],["LIB_5Rnd_792x57"]]],[["U_LIB_GER_schutze",["firstaidkit","firstaidkit"]],["V_LIB_GER_VestKar98",["LIB_Shg24","LIB_Shg24"]],["B_LIB_GER_A_frame",["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"]]],["H_LIB_GER_Helmet",""],[["","LIB_Binocular_GER"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//Soviet Gear active
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {						//Winter camo active 
			_t = _t 	+ [[[["LIB_M9130",["","","",""],["LIB_5Rnd_762x54"]]],[["U_LIB_SOV_Strelok",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_MosinBelt",["LIB_M39","LIB_M39"]],["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],["H_LIB_SOV_RA_Helmet",""],[["", "LIB_Binocular_SU"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		case 2: {						//Desert camo active
			_t = _t 	+ [[[["LIB_M9130",["","","",""],["LIB_5Rnd_762x54"]]],[["U_LIB_SOV_Strelok_w",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_MosinBelt",["LIB_M39","LIB_M39"]],["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],["H_LIB_SOV_Ushanka",""],[["", "LIB_Binocular_SU"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		default {
			_t = _t 	+ [[[["LIB_M9130",["","","",""],["LIB_5Rnd_762x54"]]],[["U_LIB_SOV_Strelok",["firstaidkit","firstaidkit"]],["V_LIB_SOV_RA_MosinBelt",["LIB_M39","LIB_M39"]],["B_LIB_SOV_RA_Rucksack",["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54"]]],["H_LIB_SOV_RA_Helmet",""],[["", "LIB_Binocular_SU"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//US Gear active
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {						//Winter camo active 
			_t = _t 	+ [[[["LIB_M1903A3_Springfield",["","","",""],["LIB_5Rnd_762x63"]]],[["U_LIB_US_Private_w",["firstaidkit","firstaidkit"]],["V_LIB_US_VEST_Carbine",["LIB_F1","LIB_F1"]],["B_LIB_US_M36",["LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63"]]],["H_LIB_US_Helmet_w",""],[["", "LIB_Binocular_US"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		case 2: {						//Desert camo active
			_t = _t 	+ [[[["LIB_M1903A3_Springfield",["","","",""],["LIB_5Rnd_762x63"]]],[["U_LIB_US_NAC_Uniform",["firstaidkit","firstaidkit"]],["V_LIB_US_VEST_Carbine",["LIB_F1","LIB_F1"]],["B_LIB_US_M36",["LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63"]]],["H_LIB_US_Helmet",""],[["", "LIB_Binocular_US"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		default {
			_t = _t 	+ [[[["LIB_M1903A3_Springfield",["","","",""],["LIB_5Rnd_762x63"]]],[["U_LIB_US_Private",["firstaidkit","firstaidkit"]],["V_LIB_US_VEST_Carbine",["LIB_F1","LIB_F1"]],["B_LIB_US_M36",["LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63","LIB_5Rnd_762x63"]]],["H_LIB_US_Helmet",""],[["", "LIB_Binocular_US"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//UK Gear active
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {						//Winter camo active 
			_t = _t 	+ [[[["LIB_LeeEnfield_No1_Bayonet",["","","",""],["LIB_10Rnd_770x56"]]],[["U_LIB_UK_P37_w",["firstaidkit","firstaidkit"]],["V_LIB_UK_P37_Rifleman_Blanco",["LIB_No77","LIB_No77"]],["B_LIB_UK_HSack_Blanco",["LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56"]]],["H_LIB_UK_Helmet_Mk2_w",""],[["", "LIB_Binocular_UK"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		case 2: {						//Desert camo active
			_t = _t 	+ [[[["LIB_LeeEnfield_No1_Bayonet",["","","",""],["LIB_10Rnd_770x56"]]],[["U_LIB_UK_KhakiDrills",["firstaidkit","firstaidkit"]],["V_LIB_UK_P37_Rifleman",["LIB_No77","LIB_No77"]],["B_LIB_UK_HSack",["LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56"]]],["H_LIB_UK_Helmet_Mk2_Desert",""],[["", "LIB_Binocular_UK"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
		default {
			_t = _t 	+ [[[["LIB_LeeEnfield_No1_Bayonet",["","","",""],["LIB_10Rnd_770x56"]]],[["U_LIB_UK_P37",["firstaidkit","firstaidkit"]],["V_LIB_UK_P37_Rifleman_Blanco",["LIB_No77","LIB_No77"]],["B_LIB_UK_HSack_Blanco",["LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56","LIB_10Rnd_770x56"]]],["H_LIB_UK_Helmet_Mk2",""],[["", "LIB_Binocular_UK"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
		};
	};
};

/*
_t = _t 	+ [
	[
		[
			["arifle_SPAR_01_blk_F",["","","",""],["30Rnd_556x45_Stanag_Tracer_Yellow"]],
			["",[],[""]],
			["",[],[""]]
		],
		[
			["U_B_T_Soldier_F",["firstaidkit","firstaidkit"]],
			["V_BandollierB_rgr",["MiniGrenade","HandGrenade"]],
			["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]
		],
		["H_HelmetB_light",""],
		[
			["", "binocular"],
			["itemmap","","itemradio","itemcompass","itemwatch"]
		]
	]
];
*/

[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 
