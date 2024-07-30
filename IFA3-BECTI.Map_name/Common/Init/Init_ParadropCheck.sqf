/*
  # HEADER #
	Script: 		Common\Init\Init_ParadropCheck.sqf
	Alias:			NONE better call it with execVM
	Description:	Starts the checkup loop for paratroop planes
	Author: 		dukee
	Creation Date:	28-07-2022
	Revision Date:	-
	
  # PARAMETERS #
	None
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	execVM "Common\Init\Init_ParadropCheck.sqf";
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
	execVM "Common\Init\Init_ParadropCheck.sqf";
	_paraCheck = execVM "Common\Init\Init_ParadropCheck.sqf";
*/
private ["_playerGrp", "_playerUnits", "_paraVehicle", "_actionAdd", "_actionID"];

waituntil {!isnil "bis_fnc_init"};
waitUntil { time > 0 };

while {true} do 
{
	_paraVehicle = objNull;
	_actionAdd = false;
	_playerGrp = group player;
	_playerUnits = units _playerGrp;
	{
		// Current result is saved in variable _x
		_vehicle = vehicle _x;
		if (_vehicle != _x) then {
			//"Unit is in a vehicle"
			if(_vehicle isKindOf "Air" && alive _vehicle) then {
				if((typeOf _vehicle) in CTI_VEHICLES_PARADROPERS) then {
					_paraVehicle = _vehicle;
					_actionAdd = true;
				};
			};
		};
	} forEach _playerUnits;

	if(_actionAdd) then {
		_canParadrop = player getVariable ["canParadrop", -1];
		if(_canParadrop < 0) then {
			//_playerVehicle addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition, radius, unconscious, selection, memoryPoint];
			_actionID = player addAction ["<img image='\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa' /><t color=""#007f0e""> Drop Paratroopers</t>",{call CTI_CO_FNC_DropParatroopers},nil,1.5,true,true,"","true", /* _target, _this, _originalTarget */50,false,"",""];
			player setVariable ["canParadrop", _actionID];
		};
	} else {
		_canParadrop = player getVariable ["canParadrop", -1];
		if(_canParadrop >= 0) then {
			player removeAction _canParadrop;
			player setVariable ["canParadrop", -1];
		};
	};
	
	sleep (30);
};


