private ["_veh", "_obj", "_to", "_turn"];
_veh = _this select 0;
_obj = _this select 1;
_to = _this select 2;
_turn = if (count _this > 3) then {_this select 3} else {false};

if (_turn) then {
	[_obj, _veh, -180] call IL_Rotate;
};

_obj AttachTo [_veh, _to];
