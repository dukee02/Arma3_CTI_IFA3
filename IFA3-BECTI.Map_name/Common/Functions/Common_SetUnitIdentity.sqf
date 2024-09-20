/*
  # HEADER #
	Script: 		Common\Functions\Common_SetUnitIdentity.sqf
	Alias:			CTI_CO_FNC_SetUnitIdentity
	Description:	Set the Identety of a unit
	Author: 		dukee
	Creation Date:	03-07-2024
	Revision Date:	03-07-2024
	
  # PARAMETERS #
    0	[Object]: The unit to set
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[UNIT] call CTI_CO_FNC_SetUnitIdentity
	
  # DEPENDENCIES #
	
  # EXAMPLE #
	[player] call CTI_CO_FNC_SetUnitIdentity; 
*/

private ["_unit", "_voice", "_voices"];
_unit = _this select 0;

//set up the units identety, in this case its voice.
_voices = [];
_mainsetup = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", (Side _unit)], []];
switch (_mainsetup select 0) do {
	case CTI_GER_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01ger","male02ger","male03ger","male04ger","male05ger","male06ger"];
		};
		if(CTI_SPE_DLC >= 1) then {
			_voices append ["SPE_male01ger","SPE_male02ger"];
		};
	};
	case CTI_SOV_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01su","male02su","male03su"];
		};
		//if((_mainsetup select 1) == CTI_SPE_ID) then {} else {};
		if([1021790] call CTI_CO_FNC_HasDLC) then {		//Contact
			_voices append ["Male01RUS","Male02RUS","Male03RUS"];
		};
	};
	case CTI_UK_ID: {
		if((_mainsetup select 1) == CTI_SPE_ID) then {
			//_voices append ["",""];
		} else {
			//_voices append ["male01eng"];
		};
		_voices append ["male01engb","male02engb","male03engb","male04engb","male05engb"];
	};
	case CTI_US_ID: {
		if((_mainsetup select 1) == CTI_SPE_ID) then {
			//_voices append ["",""];
		} else {
			//_voices append ["male01eng"];
		};
	};
	case CTI_FR_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01FR","male02FR","male03FR"];
		};
		if([395180] call CTI_CO_FNC_HasDLC) then {		//APEX
			_voices append ["male01FRE","male02FRE","male03FRE"];
		};
	};
	default {};
};
//If no voices selected, use the deafult ENG voice
if(count _voices <= 0) then {
	_voices append ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"];
};
_voice = selectRandom _voices;
[_unit,"",_voice] call BIS_fnc_setIdentity;

if([_unit] call BIS_fnc_getUnitInsignia != "") then {
	[_unit, "MANW"] call BIS_fnc_setUnitInsignia;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_SetUnitIdentity.sqf", format ["Units Voice = <%1>", _voice]] call CTI_CO_FNC_Log };
