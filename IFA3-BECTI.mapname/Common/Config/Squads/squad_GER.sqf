_side = _this;
_sid = "";

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["ArmoredMBT", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 

//Infantry setup for the AI groups
units_infantry = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	units_to_add = [format["%1LIB_GER_rifleman", _sid], 1, 60];
	units_to_add pushBack [format["%1LIB_GER_medic", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_GER_sapper", _sid], 1, 30];
	units_to_add pushBack [format["%1LIB_GER_AT_grenadier", _sid], 1, 30];
	units_to_add pushBack [format["%1LIB_GER_radioman", _sid], 1, 10];
	units_to_add pushBack [format["%1LIB_GER_smgunner", _sid], 1, 30];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_GER_Rifleman_w", _sid], 1, 60];	
		units_to_add pushBack [format["%1LIB_GER_Medic_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_GER_Sapper_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_GER_AT_grenadier_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_GER_Radioman_w", _sid], 1, 10];
		units_to_add pushBack [format["%1LIB_GER_Smgunner_w", _sid], 1, 30];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Soldier", _sid], 1, 60];	
		units_to_add pushBack [format["%1LIB_DAK_medic", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_DAK_grenadier", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_DAK_AT_grenadier", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_DAK_radioman", _sid], 1, 10];
		units_to_add pushBack [format["%1LIB_DAK_Soldier_3", _sid], 1, 30];
	};
	units_infantry pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	units_to_add = [format["%1LIB_GER_unterofficer", _sid], 1, 40];
	units_to_add pushBack [format["%1LIB_GER_mgunner", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_GER_AT_soldier", _sid], 1, 40];
	units_to_add pushBack [format["%1LIB_GER_stggunner", _sid], 1, 10];
	units_to_add pushBack [format["%1LIB_GER_lieutenant", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_GER_ober_grenadier_w", _sid], 1, 40];	
		units_to_add pushBack [format["%1LIB_GER_Mgunner_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_GER_AT_soldier_w", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_GER_Unterofficer_w", _sid], 1, 10];
		units_to_add pushBack [format["%1LIB_GER_Lieutenant_w", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Soldier_4", _sid], 1, 40];	
		units_to_add pushBack [format["%1LIB_DAK_AT_soldier", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_DAK_Lieutenant", _sid], 1, 10];
	};
	units_infantry pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	units_to_add = [format["%1LIB_GER_scout_sniper", _sid], 1, 10];
	units_to_add pushBack [format["%1LIB_GER_scout_lieutenant", _sid], 1, 5];
	units_to_add pushBack [format["%1LIB_GER_scout_smgunner", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_GER_scout_mgunner", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_GER_Scout_sniper_w", _sid], 1, 10];	
		units_to_add pushBack [format["%1LIB_GER_Scout_lieutenant_w", _sid], 1, 5];
		units_to_add pushBack [format["%1LIB_GER_Scout_smgunner_w", _sid], 1, 20];	
		units_to_add pushBack [format["%1LIB_GER_Stggunner_w", _sid], 1, 10];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Sniper", _sid], 1, 1];	
		units_to_add pushBack [format["%1LIB_DAK_NCO", _sid], 1, 5];
	};
	units_infantry pushBack units_to_add;
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];


//***************************************************************************************************************************************
//														Motorized Troops																*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [format["%1LIB_Kfz1_Hood", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_Kfz1_Hood_w", _sid], 1, 10];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Kfz1_hood", _sid], 1, 10];				
	};
	units_wheeled pushBack units_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_to_add = [format["%1LIB_Kfz1_MG42", _sid], 1, 30];
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Kfz1_MG42", _sid], 1, 30];
	};
	units_wheeled pushBack units_to_add;
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_to_add = [format["%1LIB_SdKfz251_FFV", _sid], 1, 40];
	if(CTI_IFA3_NEW > 0) then {
		units_to_add pushBack [format["%1LIB_SdKfz251_2", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_SdKfz251_FFV_w", _sid], 1, 40];
		if(CTI_IFA3_NEW > 0) then {
			units_to_add pushBack [format["%1LIB_SdKfz251_2_w", _sid], 1, 40];
		};
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_SdKfz251_FFV", _sid], 1, 40];
		if(CTI_IFA3_NEW > 0) then {
			units_to_add pushBack [format["%1LIB_DAK_SdKfz251_2", _sid], 1, 40];
		};
	};
	units_wheeled pushBack units_to_add;
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	if(CTI_IFA3_NEW > 0) then {
		units_to_add = [format["%1LIB_SdKfz251_22", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_SdKfz251_23", _sid], 1, 40];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			units_to_add = [format["%1LIB_SdKfz251_22_w", _sid], 1, 40];
			units_to_add pushBack [format["%1LIB_SdKfz251_23_w", _sid], 1, 40];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			units_to_add = [format["%1LIB_DAK_SdKfz251_22", _sid], 1, 40];
			units_to_add pushBack [format["%1LIB_SdKfz251_23", _sid], 1, 40];
		};
	};
	units_wheeled pushBack units_to_add;
};
//Level 4
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_to_add = [format["%1LIB_SdKfz251_W40", _sid], 1, 20];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			units_to_add = [format["%1LIB_SdKfz251_W40_w", _sid], 1, 20];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			units_to_add = [format["%1LIB_DAK_SdKfz251_W40", _sid], 1, 20];
		};
	};
	units_wheeled pushBack units_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];



//***************************************************************************************************************************************
//														Armored Troops																	*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	units_tracked = units_infantry;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [format["%1LIB_StuG_III_G", _sid], 1, 30];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_StuG_III_G_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_StuG_III_G_WS_w", _sid], 1, 30];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_level = _level + 1;
};
//Level 1
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [format["%1LIB_PzKpfwIV_H", _sid], 1, 60];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add pushBack [format["%1LIB_PzKpfwIV_H_w", _sid], 1, 60];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add pushBack [format["%1LIB_DAK_PzKpfwIV_H", _sid], 1, 60];
	};
	_level = _level + 1;
};
//Level 2
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [format["%1LIB_FlakPanzerIV_Wirbelwind", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid], 1, 20];
	};
	units_tracked pushBack units_to_add;
	_level = _level + 1;
};
//Level 3
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [format["%1LIB_PzKpfwVI_E", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_PzKpfwVI_E_w", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_PzKpfwVI_E", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
	_level = _level + 1;
};
//Level 4
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [format["%1LIB_PzKpfwV", _sid], 1, 40];
	units_to_add pushBack [format["%1LIB_PzKpfwVI_B", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_PzKpfwV_w", _sid], 1, 40];
		units_to_add pushBack [format["%1LIB_PzKpfwVI_B_w", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];


//***************************************************************************************************************************************
//														AntiAir Troops																	*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0 && CTI_ECONOMY_LEVEL_TRACKED < 2) then {
	units_antiair = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [format["%1LIB_Kfz1_MG42", _sid], 1, 60];
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	units_to_add = [format["%1LIB_SdKfz_7_AA", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_SdKfz_7_AA_w", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_SdKfz_7_AA", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	units_to_add = [format["%1LIB_FlakPanzerIV_Wirbelwind", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid], 1, 20];
	};
	units_tracked pushBack units_to_add;
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];

//***************************************************************************************************************************************
//														Air Troops																	*
//***************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	units_air = units_infantry;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_to_add = [format["%1LIB_Ju87", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_Ju87_w", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_DAK_Ju87", _sid], 1, 40];
	};
	units_air pushBack units_to_add;
	_level = _level + 1;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		units_air pushBack [format["%1LIB_Ju87_G2", _sid], 1, 40];
	};
	_level = _level + 1;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_to_add pushBack [format["%1LIB_FW190F8", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add pushBack [format["%1LIB_FW190F8_w", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo activea
		units_to_add pushBack [format["%1LIB_DAK_FW190F8", _sid], 1, 50];
	};
	units_air pushBack units_to_add;
	_level = _level + 1;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_GER.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";