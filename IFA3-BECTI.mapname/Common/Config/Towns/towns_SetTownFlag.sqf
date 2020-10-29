private ["_side","_texture"];
_side = _this;



switch (missionNamespace getVariable format["CTI_%1FLAG", _side]) do {
//switch (format["CTI_%1FLAG", _side]) do {
	case 1: {
		_texture = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";
	};
	case 2: {
		_texture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
	};
	case 3: {
		_texture = "\WOG_ifa3_Markers\data\Flag_USA_01_F.paa";
	};
	case 4: {
		_texture = "\WOG_ifa3_Markers\data\Flag_GreatBritain_F.paa";
	};
	case 5: {
		_texture = "\WOG_ifa3_Markers\data\Flag_POL_Armia_Krajowa_02_F.paa";
	};
	case 6: {
		_texture = "\WOG_ifa3_Markers\data\Flag_France_F.paa";
	};
	case 7: {
		_texture = "\WOG_ifa3_Markers\data\Flag_France_Libre_F.paa";
	};
	case 8: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Nippon_01_F.paa";
	};
	case 9: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Nippon_02_F.paa";
	};
	case 10: {
		_texture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
	};
	case 11: {
		_texture = "\WOG_ifa3_Markers\data\Flag_SOV_URSS_01_F.paa";		//icon large
	};
	case 12: {
		_texture = "\WOG_ifa3_Markers\data\Flag_SOV_URSS_02_F.paa";		//icon medium
	};
	case 13: {
		_texture = "\WOG_ifa3_Markers\data\Flag_SOV_URSS_03_F.paa";		//icon small
	};
	/*case 14: {
	};*/
	case 21: {
		_texture = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";
	};
	case 22: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_C1_F.paa";
	};
	case 23: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_C22_F.paa";
	};
	case 24: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_C23_F.paa";
	};
	case 25: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_C3_F.paa";
	};
	case 26: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_Wehrmacht_F.paa";
	};
	case 27: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_S1_F.paa";
	};
	case 28: {
		_texture = "\WOG_ifa3_Markers\data\Flag_Reich3_S3_F.paa";
	};
	/*case 29: {
		_texture = "";
	};*/
	default {
		if(_side == "WEST_") then {
			_texture = "\A3\Data_F\Flags\Flag_blue_CO.paa";
		} 
		else {
			if(_side == "EAST_") then {
				_texture = "\A3\Data_F\Flags\Flag_red_CO.paa";
			} 
			else {
				_texture = "\A3\Data_F\Flags\Flag_green_CO.paa";
			};
		};
	};
};
	
if(_side == "WEST_") then {
	missionNamespace setVariable ["CTI_WESTFLAG", _texture];
} else {
	if(_side == "EAST_") then {
		missionNamespace setVariable ["CTI_EASTFLAG", _texture];
	} 
	else {
		missionNamespace setVariable ["CTI_GUERFLAG", _texture];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SetTownFlag.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", missionNamespace getVariable format["CTI_%1FLAG", _side], _texture]] call CTI_CO_FNC_Log;
};