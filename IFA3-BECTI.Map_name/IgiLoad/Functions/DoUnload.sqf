if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_Do_Unload.", IL_Script_Inst];
};
private ["_v", "_para", "_supported_cargo", "_doors", "_counter", "_done", "_obj_lst", "_zload", "_x_cargo_offset", "_cargo_offset", "_obj_type", "_damage", "_nic", "_free_slots", "_turn", "_skip", "_last_attach_pos", "_cargo_type"];
_v = _this select 0;
_para = if (count _this > 1) then {_this select 1} else {false};
//_para = _this select 1;
// _supported_cargo = _this select 2;
// _doors = if (count _this > 3) then {_this select 3} else {"B"};
_doors = if (count _this > 2) then {_this select 2} else {"B"};

_v setVariable["can_load", false, true];
_counter = 0;
_done = false;
_turn = false;
_skip = true;
_obj_lst = [];
_obj_type = (typeOf _v);
//if (_obj_type in IL_Supported_Vehicles_MH9) then
//{
//	if (_doors == "L") then
//	{
//		_obj_lst = [_v getVariable "box_l"];
//	}
//	else
//	{
//		_obj_lst = [_v getVariable "box_r"];
//	};
//}
//else
//{
//	//_obj_lst = nearestObjects[_v, _supported_cargo, IL_SDistU];
//	_obj_lst = attachedObjects _v;
//};
_obj_lst = attachedObjects _v;

if (count (_obj_lst) > 0) then
{
	{
		_obj_type = (typeOf _v);
		
		if (_x getVariable "doors" == _doors) then
		{
			if (_doors == "B") then
			{
				_counter = (_v getVariable "box_num");
			};
			if (_doors == "L") then
			{
				_counter = (_v getVariable "box_num_l");
			};
			if (_doors == "R") then
			{
				_counter = (_v getVariable "box_num_r");
			};
			if (((_x getVariable "attachedTruck") == _v) && ((_x getVariable "attachedPos") == (_counter)) && (_counter < 0) && !_done) then
			{
				[_v, Format ["Unloading ""%1"" from ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
				_done = true;
				_skip = false;
				_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
				_zload_offset = (_v getVariable "zload_offset");
				_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
				_damage = getDammage _x;
				//if ((typeOf _x) in IL_Supported_UGV) then
				//{
				//	_x_cargo_offset = -0.4;
				//}
				//else
				//{
				//	_x_cargo_offset = 0;
				//};
				_x_cargo_offset = 0;
				_obj_type = (typeOf _v);
				
				//if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
				//{
				//	if !(_para) then
				//	{
				//		[_v, _x, [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], [_x_cargo_offset,-5.5,_zload], 1, _turn] call IL_Move_Attach;
				//	};
				//	[_v, _x, [_x_cargo_offset,-6.5,_zload], [_x_cargo_offset,-13,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
				//	[_v, _x, [_x_cargo_offset,-14,-1.75 + _zload], [_x_cargo_offset,-16.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
				//	if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
				//	{
				//		[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-19.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
				//		_last_attach_pos = [_x_cargo_offset,-19.5,-1.75 + _zload];
				//	};
				//};
				//*****************************************************************************************************************
				//*										VIOC Units declaration
				//*****************************************************************************************************************
				//Gaz
				if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Praga
				if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Blitz
				if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Blitz
				if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// US6
				if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// GMC
				if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// GMC FoW
				if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				//SdKfz7
				if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// LCVP
				if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,8,_zload], 1, _turn] call IL_Move_Attach;
				};
				// LCVP
				if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,10,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Liberty Ship
				if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,10,_zload], 1, _turn] call IL_Move_Attach;
					//[_v, _x, [_x_cargo_offset,_counter + 0.25 + 50,_zload], [_x_cargo_offset,_cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,_counter + 0.25 + 50,_zload_offset], [_x_cargo_offset,_cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				//C47
				if ((_obj_type in IL_Supported_Vehicles_C47)  && (_doors == "B")) then
				{
					if !(_para) then
					{
						[_v, _x, [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], [_x_cargo_offset,-2.5,_zload], 1, _turn] call IL_Move_Attach;
					};
					[_v, _x, [_x_cargo_offset,-3.5,_zload], [_x_cargo_offset,-7,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-8,-0.93 + _zload], [_x_cargo_offset,-9,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
					if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
					{
						[_v, _x, [_x_cargo_offset,-10,-0.93 + _zload], [_x_cargo_offset,-12,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
						_last_attach_pos = [_x_cargo_offset,-12,_zload];
					};
				};
			
				if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
				{
					[_x, _v, _last_attach_pos] spawn IL_Cargo_Para;
				}
				else
				{
					sleep 0.2;
					detach _x;
					_x enableSimulationGlobal true;  // Lyrae: wtf is this
					_x setVelocity [0, 0, -0.2];
				};
				if (_x isKindOf "AllVehicles") then
				{
					_x forceSpeed -1;
				};
				
				_counter = _counter + (_x getVariable "slots");
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
					_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
				};
				if (_doors == "L") then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _v, true];
					_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
				};
				if (_doors == "R") then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _v, true];
					_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
				};
				
				[_v] call IL_SetNewMass;
				
				_x setVariable["attachedPos", 0, true];
				_x setVariable["attachedTruck", _x, true];
				_x setVariable["doors", "N", true];
				if (IL_CDamage == 0) then
				{
					_x setDamage 0;
				};
				
				if (IL_CDamage == 1) then
				{
					_x setDamage _damage;
					if (_damage != (getDammage _x)) then
					{
						sleep 1;
						_x setDamage _damage;
					};
				};
				
				//some WW2 statics hovering in the air after unloade them, fixed it
				_cargo_type = (typeOf _x);
				if (_cargo_type in IL_Cargo_To_Drop) then {
					_x setPos [getPos _x select 0, getPos _x select 1, 0];
				};
				
				[_v, Format ["""%1"" was unloaded from the ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), _free_slots], true] call IL_Vehicle_Chat;
				//player addScore IL_Unload_Score;
				[Player, IL_Unload_Score] call IL_Score;
				sleep 1;
			};
		};
		if (_done) exitWith {};
	} forEach (_obj_lst);
	if (_skip) then
	{
		[_v, "Can not find cargo. Try again."] call IL_Vehicle_Chat;
		
		if (_counter < 0) then
		{
			_counter = _counter + 1;
		};
		
		if (_doors == "B") then
		{
			_v setVariable["box_num", _counter, true];
			_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
		};
		if (_doors == "L") then
		{
			_v setVariable["box_num_l", _counter, true];
			_v setVariable["box_l", _v, true];
			_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
		};
		if (_doors == "R") then
		{
			_v setVariable["box_num_r", _counter, true];
			_v setVariable["box_r", _v, true];
			_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
		};
	};
}
else
{
	[_v, "BOX 404 error. Box not found O.o. Vehicle data reset..."] call IL_Vehicle_Chat;
	[_v, true] call IL_Init_Veh;
	[_v, "Vehicle data reset done."] call IL_Vehicle_Chat;
};
[_v] call IL_SetNewMass;
_v setVariable["can_load", true, true];
