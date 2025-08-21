if (IL_DevMod) then
{
	Player globalChat Format ["IgiLoad ""%1"" in IL_Do_Load", IL_Script_Inst];
};
private["_NoBoxHint", "_v", "_supported_cargo", "_zload", "_x_cargo_offset", "_cargo_offset", "_sdist", "_spoint", "_slot_num", "_counter", "_done", "_obj_lst", "_damage", "_obj_type", "_doors", "_box_num", "_dummy", "_nic", "_turn", "_force", "_cargo"];
_NoBoxHint = "The box is in the vicinity. Perhaps it is outside of the loading area.";
_v = _this select 0;
_supported_cargo = _this select 1;
_doors = if (count _this > 2) then {_this select 2} else {"B"};
_force = if (count _this > 3) then {_this select 3} else {false};
_cargo = if (count _this > 4) then {_this select 4} else {ObjNull};

_v setVariable["can_load", false, true];
_zload = _v getVariable "zload";
_obj_type = (typeOf _v);
_sdist = 0;
_counter = 0;
_done = false;
_turn = false;

//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//_obj_container = missionNamespace getVariable Format["IL_Supported_Vehicles_", (_obj getVariable "supported_cargo")]
if (IL_DevMod) then
{
	Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
};
_sdist = IL_SDistL;
//_spoint = _v modelToWorld [0,-4.5,-1.6];
//_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
_box_num = _v getVariable "box_num";
_slot_num = _v getVariable "slots_num";

if !(_force) then
{
	//nearestObjects [position, types, radius, 2Dmode]
	//_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
	_obj_lst = [_v, 100] call IL_Select_Attach;
}
else
{
	_obj_lst = [_cargo];
};
if (count (_obj_lst) > 0) then
{
	{
		if( locked _x > 1 ) exitWith {
			["Cannot load a locked vehicle",false] call SA_Hint;
		};
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". Cargo: ""%2"" found.", IL_Script_Inst, _x];
		};
		if (isNil {_x getVariable "attachedPos"}) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Init box: ""%2"".", IL_Script_Inst, _x];
			};
			[_x] call IL_Init_Box;
		};
		/*
		*
		*
		*	TODO: change turn to number for th deg to turn!
		*
		*/
		if(_x getVariable ["turn", 0] == 1) then {
			_turn = true;
		};
		if ((typeOf _x) in (IL_Supported_Cargo20 + ["Land_WaterTank_F"])) then
		{
			_turn = true;
		};
		//It allows you to load oversize loads, but they must be on the list of supported cargo!!!
		if ((abs(_slot_num - _box_num) < (_x getVariable "slots")) && (_box_num != 0)) then
		{
			[_v, "This cargo is to big. "] call IL_Vehicle_Chat;
		}
		else
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". _box_num: ""%2"" _slot_num: ""%3""", IL_Script_Inst,  _box_num, _slot_num];
			};
			/*if (_obj_type in IL_Supported_Vehicles_MH9) then
			{
				_turn = !_turn;
			};*/
			if ((_box_num > _slot_num) && !_done) then
			{
				[_v, Format ["Loading ""%1"" on ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
				_done = true;
				_counter = (_box_num);
				_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
				_zload_offset = (_v getVariable "zload_offset");
				_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
				/*if ((typeOf _x) in IL_Supported_UGV) then
				{
					_x_cargo_offset = -0.4;
				}
				else
				{
					_x_cargo_offset = 0;
				};*/
				_x_cargo_offset = 0;
				_damage = damage _x;
				
				//*****************************************************************************************************************
				//										VIOC Units declaration
				//*****************************************************************************************************************

				[_v, Format ["""%1"" is loaded onto ""%2"".", (_counter * (_x getVariable "cargo_offset")), (_x getVariable "cargo_offset")], true] call IL_Vehicle_Chat;
				//[_v, _x, [_x_cargo_offset,_counter - _cargo_offset,_zload], _turn] call IL_Attach;
				
				if((typeOf _x) in IL_Supported_Landing_Ship_Cargo || (typeOf _x) in IL_Supported_L_Landing_Ship_Cargo) then {
					if((_v getVariable "xload_to_left")) then {
						_x_cargo_offset = -12;
						_v setVariable["xload_to_left", false, true];
					} else {
						_x_cargo_offset = 12;
						_v setVariable["xload_to_left", true, true];
					};
					diag_log format["[IgiLoad (%1)] IL_Move_Attach X offset set to <%2>", IL_Script_Inst, _x_cargo_offset];
				};
				[_v, _x, [_x_cargo_offset,(_counter * (_x getVariable "cargo_offset")) - _cargo_offset,_zload], _turn] call IL_Attach;
				
				_counter = _counter - (_x getVariable "slots");
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
				};
				/*if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _x, true];
				};
				if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _x, true];
				};*/
				
				[_v] call IL_SetNewMass;
				
				if (_x isKindOf "AllVehicles") then
				{
					_x forceSpeed 0;
				};
				
				_x setVariable["attachedPos", _counter, true];
				_x setVariable["attachedTruck", _v, true];
				_x setVariable["doors", _doors, true];
				
				if (IL_CDamage == 0) then
				{
					_x setDamage 0;
				};
				
				if (IL_CDamage == 1) then
				{
					_x setDamage _damage;
					if (_damage != (damage _x)) then
					{
						sleep 1;
						_x setDamage _damage;
					};
				};
				
				if (_counter > _slot_num) then
				{
					[_v, Format ["""%1"" is loaded onto ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), abs(_slot_num - _counter)], true] call IL_Vehicle_Chat;
				}
				else
				{
					[_v, Format ["""%1"" is loaded onto ""%2"" There is no more space.", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")], true] call IL_Vehicle_Chat;
				};
				//player addScore IL_Load_Score;
				[Player, IL_Load_Score] call IL_Score;
			}
			else
			{
				if ((_box_num > _slot_num) && !_done) then
				{
					[_v, _NoBoxHint] call IL_Vehicle_Chat;
				};
			};
		};
		if (_done) exitWith {};
	} forEach (_obj_lst);
}
else
{
	//_msgErr = format["Vehicles found: %1", _obj_lst];
	//[_v, "No supported Cargo in range!"] call IL_Vehicle_Chat;
};
_v setVariable["can_load", true, true];
