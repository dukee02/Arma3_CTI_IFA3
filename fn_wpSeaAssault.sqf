/*
	Author: Karel Moricky, modified by Kerc

	Description:
	Modified 'land' waypoint for landing seacraft and having them deploy units

	Parameters:
		0: GROUP
		1: ARRAY - waypoint position
		2: OBJECT - target to which waypoint is attached to

	Returns:
	BOOL
*/

params [
	["_group", grpNull, [grpNull]],
	["_pos", [], [[]], 3],
	"",
	["_speedBoost", true, [true]]
];

private _wp = [_group, currentWaypoint _group];
_wp setWaypointDescription localize "STR_A3_CfgWaypoints_Land";

private _vehsMove = [];
private _vehsLand = [];

private _fnc_goFaster =
{
	params ["_veh","_wp"];
	private _wpPos = getWPPos _wp;
	private _speed = 11;
	private _max = getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "maxSpeed");
	sleep 2;
	while {!(getTerrainHeightASL (getposatl _veh) > -0.2 || isTouchingGround _veh) and (alive _veh) and (alive (driver _veh)) } do
	{
		private _vel = velocity _veh;
		private _dir = direction _veh;
		private _dirTo = _veh getRelDir _wpPos;
		if (speed _veh > 0 and speed _veh < _max and {_dirTo < 30}) then
		{
			_veh setVelocity [_speed * sin(_dir), _speed * cos(_dir), (_vel select 2)];
		};
		sleep 0.2;
	};
};

waituntil {
	private _countReady = 0;
	private _vehsGroup = [];

	//--- Check state of group members
	{
		private _veh = vehicle _x;
		if (_x == driver _veh && {(_veh isKindOf "Ship")}) then {
			if (!(_veh in _vehsMove)) then {

				//--- Move to landing position
 				_veh doMove _pos;

				//[_group,(currentWaypoint _group)] setWaypointType "TR UNLOAD";
				(group _x) setSpeedMode "FULL";
				if (_veh getvariable ["LIB_EnableAISpeedBoost", _speedBoost]) then {
					[_veh, _wp] spawn _fnc_goFaster;
				};
				_vehsMove pushBack _veh;
			} else {
				if ((getTerrainHeightASL (getPosATL _veh) > -0.2 || isTouchingGround _veh) && speed _veh < 1) then {
						if (!(_veh in _vehsLand)) then {
						_veh land "LAND";


						private _Deployment_Actions = getArray (configFile >> "CfgVehicles" >> (typeOf _veh) >> "LIB_Deployment_Actions");
						if !(count _Deployment_Actions == 0 || isNil "_Deployment_Actions") then {

							_veh forcespeed 0;
							_veh setVelocityModelSpace [0,0,0];
							sleep 3;
							{
								_veh spawn compile ("this = _this;" + (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "UserActions" >> _x >> "statement")));
							} foreach _Deployment_Actions;
						} else {
							private _TRUnload = _group addwaypoint [_pos,0];
							_TRUnload setWaypointType "TR UNLOAD";
							_group setCurrentWaypoint _TRUnload;
						};


						_vehsLand pushBack _veh;

					} else {
						private "_time";
						if (count (fullCrew [_veh,"cargo"]) == 0 && (count getVehicleCargo _veh == 0)) then {
							if (isNil "_time") then { _time = time + 10 };
							_veh setVelocityModelSpace [0,0,0];
							if (time > _time) then {
								_countReady = _countReady + 1;
								_veh forcespeed -1;
							};
						} else {
							_veh setVelocityModelSpace [0,0,0];
						};
					};
				} else {
					if (!(_veh in _vehsLand)) then {
						_veh engineOn true;
					} else {
						_veh setVelocityModelSpace [0,0,0];
					};
				};
			};
			_vehsGroup pushBack _veh;
		};
	} foreach units _group;

	//--- Remove vehicles which are no longer in the group
	_vehsMove = _vehsMove - (_vehsMove - _vehsGroup);
	_vehsLand = _vehsLand - (_vehsLand - _vehsGroup);

	sleep 0.1;
	count _vehsGroup == _countReady
};
true
