private ["_side","_texture"];
_side = _this;

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

switch (missionNamespace getVariable format["CTI_%1FLAG", _side]) do {
//switch (format["CTI_%1FLAG", _side]) do {
	case 1: {
		if(CTI_IFA_ADDON >= 1) then {
			_texture = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";
		};
		if(CTI_SPE_DLC >= 1) then {
			_texture = "\WW2\SPE_Core_t\Data_t\Flags\flag_GER_co.paa";
		};
	};
	case 2: {
		if(CTI_IFA_ADDON >= 1) then {
			_texture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
		};
	};
	case 3: {
		if(CTI_IFA_ADDON >= 1) then {
			_texture = "\WW2\Core_t\IF_Decals_t\US\flag_USA_co.paa";
		};
		if(CTI_SPE_DLC >= 1) then {
			_texture = "\WW2\SPE_Core_t\Data_t\Flags\flag_USA_co.paa";
		};
	};
	case 4: {
		if(CTI_IFA_ADDON >= 1) then {
			_texture = "\A3\Data_F\Flags\Flag_uk_CO.paa";
		};
	};
	/*case 5: {
		_texture = "";
		if(CTI_SPE_DLC >= 1) then {
			_texture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
		};
	};*/
	default {};
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