/*
  # HEADER #
	Script: 		Common_DropParatroopers.sqf
	Alias:			CTI_CO_FNC_DropParatroopers
	Description:	Starts the Linedrop for paratroopers from the IFA3 WW2 Mod.
	Author: 		dukee
	Creation Date:	28-07-2022
	Revision Date:	-
	
  # PARAMETERS #
	None
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	Call CTI_CO_FNC_DropParatroopers
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
	Call CTI_CO_FNC_DropParatroopers
*/
private ["_grp", "_distance", "_direction", "_wpPos", "_paraPoint", "_markerparaPoint", "_vehicle"];

_vehicle = objNull;
_grp = group player;
_playerUnits = units _grp;
{
	// Current result is saved in variable _x
	_vehicle = vehicle _x;
	if (_vehicle != _x) then {
		//"Unit is in a vehicle"
		if(_vehicle isKindOf "Air") then {
			if((typeOf _vehicle) in CTI_VEHICLES_PARADROPERS) then {
				//break;
			};
		};
	};
} forEach _playerUnits;

_distance = 400;
_direction = direction _vehicle;
_wpPos = _vehicle modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
_paraPoint = _grp addWaypoint [_wpPos, 0];
_paraPoint setWaypointType "MOVE";
_paraPoint setWaypointVisible false;
_paraPoint showWaypoint "NEVER"; //"ALWAYS";
_paraPoint setWPPos _wpPos;
//_markerparaPoint = createMarker ["ParaPoint", _wpPos]; // Not visible yet.
//_markerparaPoint setMarkerText "ParaPoint";
//_markerparaPoint setMarkerType "mil_pickup"; // Visible.
_grp setCurrentWaypoint _paraPoint;

[_grp, _wpPos, _vehicle] call WW2_PARADROP;
