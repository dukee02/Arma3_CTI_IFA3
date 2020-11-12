_side = _this;
_sid = "";
_tag = "";

if(_side == west) then {
	_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

INFANTRY = [[format["%1LIB_GER_rifleman", _sid],1],[format["%1LIB_GER_medic", _sid],1],[format["%1LIB_GER_AT_grenadier", _sid],1],[format["%1LIB_GER_rifleman", _sid],1],[format["%1LIB_GER_Recruit", _sid],1],[format["%1LIB_GER_Recruit", _sid],1]];
INFANTRY_MG = [[format["%1LIB_GER_rifleman", _sid],1],[format["%1LIB_GER_medic", _sid],1],[format["%1LIB_GER_smgunner", _sid],1],[format["%1LIB_GER_smgunner", _sid],1],[format["%1LIB_GER_mgunner", _sid],1],[format["%1LIB_GER_stggunner", _sid],1]];
INFANTRY_AT = [[format["%1LIB_GER_rifleman", _sid],1],[format["%1LIB_GER_medic", _sid],1],[format["%1LIB_GER_AT_grenadier", _sid],1],[format["%1LIB_GER_rifleman", _sid],1],[format["%1LIB_GER_AT_soldier", _sid],1],[format["%1LIB_GER_AT_soldier", _sid],1]];

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	INFANTRY = [[format["%1LIB_GER_Rifleman_w", _sid],1],[format["%1LIB_GER_Medic_w", _sid],1],[format["%1LIB_GER_AT_grenadier_w", _sid],1],[format["%1LIB_GER_Rifleman_w", _sid],1],[format["%1LIB_GER_Recruit_w", _sid],1],[format["%1LIB_GER_Recruit_w", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_GER_Rifleman_w", _sid],1],[format["%1LIB_GER_Medic_w", _sid],1],[format["%1LIB_GER_Smgunner_w", _sid],1],[format["%1LIB_GER_Smgunner_w", _sid],1],[format["%1LIB_GER_Mgunner_w", _sid],1],[format["%1LIB_GER_Rifleman_ADS_w", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_GER_Rifleman_w", _sid],1],[format["%1LIB_GER_Medic_w", _sid],1],[format["%1LIB_GER_AT_grenadier_w", _sid],1],[format["%1LIB_GER_LAT_Rifleman_w", _sid],1],[format["%1LIB_GER_AT_soldier_w", _sid],1],[format["%1LIB_GER_AT_soldier_w", _sid],1]];
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	INFANTRY = [[format["%1LIB_DAK_Soldier", _sid],1],[format["%1LIB_DAK_medic", _sid],1],[format["%1LIB_DAK_AT_grenadier", _sid],1],[format["%1LIB_DAK_Soldier", _sid],1],[format["%1LIB_DAK_Sentry", _sid],1],[format["%1LIB_DAK_Sentry", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_DAK_Soldier", _sid],1],[format["%1LIB_DAK_medic", _sid],1],[format["%1LIB_DAK_Soldier_2", _sid],1],[format["%1LIB_DAK_Soldier_3", _sid],1],[format["%1LIB_DAK_Soldier_4", _sid],1],[format["%1LIB_DAK_Soldier_4", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_DAK_Soldier", _sid],1],[format["%1LIB_DAK_medic", _sid],1],[format["%1LIB_DAK_AT_grenadier", _sid],1],[format["%1LIB_DAK_Soldier", _sid],1],[format["%1LIB_DAK_AT_soldier", _sid],1],[format["%1LIB_DAK_AT_soldier", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_Kfz1_MG42", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_Kfz1_MG42", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_DAK_Kfz1_MG42", _sid],1],[format["%1LIB_DAK_Kfz1_MG42", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_DAK_Kfz1_MG42", _sid],1],[format["%1LIB_DAK_Kfz1_MG42", _sid],1]];
		};
	};
	case 2: {
		WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_Kfz1_MG42", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_SdKfz251", _sid],1],[format["%1LIB_SdKfz251", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_HEAVY = [[format["%1LIB_Sdkfz251_w", _sid],1],[format["%1LIB_Sdkfz251_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_DAK_Kfz1_MG42", _sid],1],[format["%1LIB_DAK_Kfz1_MG42", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_DAK_SdKfz251", _sid],1],[format["%1LIB_DAK_SdKfz251", _sid],1]];
		};
	};
	case 3: {
		WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_SdKfz251", _sid],1]];
		if(CTI_IFA3_NEW > 0) then {
			WHEELED_HEAVY = [[format["%1LIB_SdKfz251_22", _sid],1],[format["%1LIB_SdKfz251_23", _sid],1]];
		} else {
			WHEELED_HEAVY = [[format["%1LIB_SdKfz251", _sid],1],[format["%1LIB_SdKfz251", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_Sdkfz251_w", _sid],1]];
			if(CTI_IFA3_NEW > 0) then {
				WHEELED_HEAVY = [[format["%1LIB_SdKfz251_22_w", _sid],1],[format["%1LIB_SdKfz251_23_w", _sid],1]];
			} else {
				WHEELED_HEAVY = [[format["%1LIB_Sdkfz251_w", _sid],1],[format["%1LIB_Sdkfz251_w", _sid],1]];
			};
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_DAK_Kfz1_MG42", _sid],1],[format["%1LIB_DAK_SdKfz251", _sid],1]];
			if(CTI_IFA3_NEW > 0) then {
				WHEELED_HEAVY = [[format["%1LIB_DAK_SdKfz251_22", _sid],1],[format["%1LIB_DAK_SdKfz251_22", _sid],1]];
			} else {
				WHEELED_HEAVY = [[format["%1LIB_DAK_SdKfz251", _sid],1],[format["%1LIB_DAK_SdKfz251", _sid],1]];
			};
		};
	};
	case 4: {
		WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_SdKfz251", _sid],1]];
		if(CTI_IFA3_NEW > 0) then {
			WHEELED_HEAVY = [[format["%1LIB_SdKfz251_22", _sid],1],[format["%1LIB_SdKfz251_23", _sid],1]];
		} else {
			WHEELED_HEAVY = [[format["%1LIB_SdKfz251", _sid],1],[format["%1LIB_SdKfz251", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_Kfz1_MG42", _sid],1],[format["%1LIB_Sdkfz251_w", _sid],1]];
			if(CTI_IFA3_NEW > 0) then {
				WHEELED_HEAVY = [[format["%1LIB_SdKfz251_22_w", _sid],1],[format["%1LIB_SdKfz251_23_w", _sid],1]];
			} else {
				WHEELED_HEAVY = [[format["%1LIB_Sdkfz251_w", _sid],1],[format["%1LIB_Sdkfz251_w", _sid],1]];
			};
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_DAK_Kfz1_MG42", _sid],1],[format["%1LIB_DAK_SdKfz251", _sid],1]];
			if(CTI_IFA3_NEW > 0) then {
				WHEELED_HEAVY = [[format["%1LIB_DAK_SdKfz251_22", _sid],1],[format["%1LIB_DAK_SdKfz251_22", _sid],1]];
			} else {
				WHEELED_HEAVY = [[format["%1LIB_DAK_SdKfz251", _sid],1],[format["%1LIB_DAK_SdKfz251", _sid],1]];
			};
		};
	};
	default {
		WHEELED_LIGHT = [[format["%1LIB_Kfz1", _sid],1],[format["%1LIB_Kfz1", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_Kfz1", _sid],1],[format["%1LIB_Kfz1", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_Kfz1_w", _sid],1],[format["%1LIB_Kfz1_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_Kfz1_w", _sid],1],[format["%1LIB_Kfz1_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_DAK_Kfz1", _sid],1],[format["%1LIB_DAK_Kfz1", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_DAK_Kfz1", _sid],1],[format["%1LIB_DAK_Kfz1", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		if(CTI_IFA3LIB_ADDON == 0 && CTI_CSA38_ADDON == 0) then {
			TRACKED_LIGHT = [[format["%1LIB_StuG_III_G", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_StuG_III_G", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_StuG_III_G", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				TRACKED_LIGHT = [[format["%1LIB_StuG_III_G_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_StuG_III_G_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_StuG_III_G_WS_w", _sid],1]];
			};
		} else {
			TRACKED_LIGHT = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				TRACKED_LIGHT = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				TRACKED_LIGHT = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			};
		};
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1LIB_StuG_III_G", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			TRACKED_LIGHT = [[format["%1LIB_StuG_III_G_w", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
		};
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1LIB_StuG_III_G", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_PzKpfwVI_E", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			TRACKED_LIGHT = [[format["%1LIB_StuG_III_G_w", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_PzKpfwVI_E_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_DAK_PzKpfwVI_E", _sid],1]];
		};
	};
	case 4: {
		TRACKED_LIGHT = [[format["%1LIB_StuG_III_G", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_PzKpfwVI_E", _sid],1],[format["%1LIB_PzKpfwVI_B", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			TRACKED_LIGHT = [[format["%1LIB_StuG_III_G_w", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_PzKpfwIV_H_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_PzKpfwVI_E_w", _sid],1],[format["%1LIB_PzKpfwVI_B_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_DAK_PzKpfwIV_H", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_DAK_PzKpfwVI_E", _sid],1],[format["%1LIB_PzKpfwVI_B", _sid],1]];
		};
	};
	default {
		if(CTI_IFA3LIB_ADDON == 0 && CTI_CSA38_ADDON == 0) then {
			TRACKED_LIGHT = [[format["%1LIB_StuG_III_G", _sid],1]];
			TRACKED_MEDIUM = [[format["%1LIB_StuG_III_G", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_StuG_III_G", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				TRACKED_LIGHT = [[format["%1LIB_StuG_III_G_w", _sid],1]];
				TRACKED_MEDIUM = [[format["%1LIB_StuG_III_G_w", _sid],1]];
				TRACKED_HEAVY = [[format["%1LIB_StuG_III_G_WS_w", _sid],1]];
			};
		};
	};
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_FIGHTER = [[format["%1LIB_Ju87_G2", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Ju87", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_BOMBER = [[format["%1LIB_Ju87_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			AIR_BOMBER = [[format["%1LIB_DAK_Ju87", _sid],1]];
		};
	};
	case 2: {
		AIR_FIGHTER = [[format["%1LIB_FW190F8", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Ju87", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_FIGHTER = [[format["%1LIB_FW190F8_w", _sid],1]];
			AIR_BOMBER = [[format["%1LIB_Ju87_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			AIR_FIGHTER = [[format["%1LIB_DAK_FW190F8", _sid],1]];
			AIR_BOMBER = [[format["%1LIB_DAK_Ju87", _sid],1]];
		};
	};
	default {
		AIR_FIGHTER = [[format["%1LIB_Ju87", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Ju87", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_FIGHTER = [[format["%1LIB_Ju87_w", _sid],1]];
			AIR_BOMBER = [[format["%1LIB_Ju87_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			AIR_FIGHTER = [[format["%1LIB_DAK_Ju87", _sid],1]];
			AIR_BOMBER = [[format["%1LIB_DAK_Ju87", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	ANTI_AIR = [[format["%1LIB_Kfz1_MG42_sernyt", _sid],1],[format["%1LIB_Kfz1_MG42_sernyt", _sid],1]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	ANTI_AIR = [[format["%1LIB_SdKfz_7_AA", _sid],1],[format["%1LIB_SdKfz_7_AA", _sid],1]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		ANTI_AIR = [[format["%1LIB_SdKfz_7_AA_w", _sid],1],[format["%1LIB_SdKfz_7_AA_w", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		ANTI_AIR = [[format["%1LIB_DAK_SdKfz_7_AA", _sid],1],[format["%1LIB_DAK_SdKfz_7_AA", _sid],1]];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	ANTI_AIR = [[format["%1LIB_SdKfz_7_AA", _sid],1],[format["%1LIB_FlakPanzerIV_Wirbelwind", _sid],1]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		ANTI_AIR = [[format["%1LIB_SdKfz_7_AA_w", _sid],1],[format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		ANTI_AIR = [[format["%1LIB_DAK_SdKfz_7_AA", _sid],1],[format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_GER.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};