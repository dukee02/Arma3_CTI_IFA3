if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
};
private ["_v", "_player", "_para", "_chute",  "_backpack", "_pos", "_x_offset", "_dist", "_dist_out", "_dist_out_para", "_velocity"];
_v = _this select 0;
_player = _this select 1;
_para = if (count _this > 2) then {_this select 2} else {false};
/*if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
{
	_dist_out = 5;
	_dist_out_para = 5;
};
if ((typeOf _v) in IL_Supported_Vehicles_MOHAWK) then
{
	_dist_out = 5;
	_dist_out_para = 11;
};
if ((typeOf _v) in IL_Supported_Vehicles_CHINOOK) then
{
	_dist_out = 7;
	_dist_out_para = 11;
};
if ((typeOf _v) in IL_Supported_Vehicles_C17) then
{
	_dist_out = 15;
	_dist_out_para = 20;
};*/
if ((typeOf _v) in IL_Supported_Vehicles_C130J) then
{
	_dist_out = 7;
	_dist_out_para = 15;
};
if ((typeOf _v) in IL_Supported_Vehicles_C47) then
{
	_dist_out = 7;
	_dist_out_para = 15;
};
/*
_pos = (_v worldToModel (getPosATL _player));
_x_offset = _pos select 0;
if (_x_offset < 0) then
{
	if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
	{
		_x_offset = 90;
	}
	else
	{
		_x_offset = 8;
	};
}
else
{
	if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
	{
		_x_offset = -90;
	}
	else
	{
		_x_offset = -8;
	};
};*/

_player allowDamage false;
sleep 0.2;
unassignVehicle _player;
_player action ["EJECT",vehicle _player];
sleep 0.5;

if !(_para) then
{
	_player setDir ((getDir _v) + 180);
	_pos = ([_v, _dist_out, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
	_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
	_player setPosATL _pos;
}
else
{
	_pos = ([_v, _dist_out_para, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
	_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
	_player setPosATL _pos;
	_dist = _v distance _player;
	while {(_v distance _player) - _dist < 20} do
	{
		sleep 0.2;
	};
	if (IL_Para_Jump_Open_ATL > 0) then
	{
		while {(getPosATL _player) select 2 > IL_Para_Jump_Open_ATL} do
		{
			sleep 0.2;
		};
	};
	if !(unitBackpack _player isKindOf "B_Parachute") then
	{
		_chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "CAN_COLLIDE"];
		//_chute setPos getPos _player;
		_chute AttachTo [_player, [0,0,0]];
		detach _chute;
		_velocity = velocity _player;
		_player moveInDriver _chute;
		if (IL_Para_Jump_Velocity) then
		{
			_chute setVelocity _velocity;
		};
	};
};
_player allowDamage true;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
	Player globalChat Format["IgiLoad ""%1"" IL_GetOut. Player ATL: ""%2""", IL_Script_Inst, _pos];
};
