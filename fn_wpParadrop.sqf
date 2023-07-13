/*
	Author: Kerc

	Description:
	Makes people jump out of a perfectly good airplane

	Parameters:
		0: GROUP
		1: ARRAY - waypoint position
		2: OBJECT - target to which waypoint is attached to

	Returns:
	BOOL
*/

params [["_group", grpNull, [grpNull]], ["_pos", [], [[]], 3], "", "_arg1", "_arg2"];

private _AILandedParachute = true;
private _removeParachutes = -1;
if (!isNil "_arg1") then
{
	if (_arg1 isEqualType true) then
	{
		_AILandedParachute = _arg1;
		_removeParachutes = if !(isNil "_arg2") then {_arg2} else {-1};
	}
	else
	{
		_AILandedParachute = if !(isNil "_arg2") then {_arg2} else {true};
		_removeParachutes = _arg1;
	};
};

private _wp = currentwaypoint _group;
_pos = waypointPosition [_group,_wp]; //_pos past the script is 2d only
private _vehsMove = [];
private _vehsLand = [];

private _radius = waypointCompletionRadius [_group,_wp];
if (_radius == 0) then { _radius = 350; };

waituntil {
	private _countReady = 0;
	private _vehsGroup = [];

	//--- Check state of group members
	{
		private _veh = vehicle _x;
		if (_x == driver _veh && {(_veh isKindOf "Air")}) then
		{
			if (!(_veh in _vehsMove)) then
			{

				//--- Move to landing position
				if ((_pos select 2) < 140) then
				{
					_pos set [2, 140];
				};
				_veh flyInHeight (_pos select 2);
				_veh move _pos;
				_veh call LIB_cargoOpenDoorStatement;
				//[_group,(currentWaypoint _group)] setWaypointType "TR UNLOAD";

				_vehsMove pushBack _veh;
			}
			else
			{
				if (alive _veh && _veh distance2d _pos < _radius) then
				{
					private _unitsInCargo = (crew _veh) - ([driver _veh]) - ([_veh turretUnit [0]]);
					if (!(_veh in _vehsLand)) then
					{
						[_veh, _AILandedParachute, _removeParachutes, _unitsInCargo] spawn
						{
							params ["_veh", "_landedParachutes", "_removeParachutes", "_unitsInCargo"];
							{
								[_veh, _x, _landedParachutes, _removeParachutes] remoteExecCall ["LIB_fnc_deployStaticLine", _x, false];
								sleep 0.7;
							} foreach _unitsIncargo;
						};
						_vehsLand pushBack _veh;
						_countReady = _countReady + 1;
					}
					else
					{
						_countReady = _countReady + 1;
					};
				};
			};
			_vehsGroup pushBack _veh;
		};
	} foreach (units _group);

	//--- Remove vehicles which are no longer in the group
	_vehsMove = _vehsMove - (_vehsMove - _vehsGroup);
	_vehsLand = _vehsLand - (_vehsLand - _vehsGroup);

	sleep 1;
	count _vehsGroup == _countReady
};
true
