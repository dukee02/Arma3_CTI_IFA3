private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_US_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_US_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//winter camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_US_Captain_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_Rifleman_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_Driver_w", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_US_Grenadier_w", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_US_Driver_w", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_US_Grenadier_w", _sid]];
			};
		};
		case 2: {//Desert camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_US_NAC_captain", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_NAC_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_NAC_driver", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_US_NAC_grenadier", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_US_NAC_driver", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_US_NAC_grenadier", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_US_captain", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_US_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_US_driver", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_US_grenadier", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_US_driver", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_US_grenadier", _sid]];
			};
		};	
	};
	//1 pilot for all camos
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_US_Pilot", _sid]];

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//winter camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_US_Willys_MB_w", _sid], []], 
			[format["%1LIB_US_Willys_MB_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_US_NAC_Willys_MB", _sid], []], 
			[format["%1LIB_US_NAC_Willys_MB", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_US_Willys_MB", _sid], []], 
			[format["%1LIB_US_Willys_MB", _sid], []]
		]];
	};
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_US_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_US_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 1: {//winter camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_US_Captain_w", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_US_Rifleman_w", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_US_Driver_w", _sid]];
		};
		case 3: {//Desert camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_US_NAC_captain", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_US_NAC_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_US_NAC_driver", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_US_captain", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_US_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_US_driver", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
