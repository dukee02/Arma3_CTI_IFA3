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
// APC
/*
if ((_obj_type in IL_Supported_Vehicles_C17) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL + IL_SDistL_Heli_offset;
	_spoint = _v modelToWorld [0,-16.5,-3];//Ramp end [0,-13.5,-3.2]
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
*/
//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//Gaz
if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	//_spoint = _v modelToWorld [0,-4.5,-1.6];
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// Praga
if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-5 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// Blitz
if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// Blitz
if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-5 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// US6
if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// GMC
if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// GMC FoW
if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
//SdKfz7
if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = IL_SDistL;
	_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// LCVP
if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = 20;	//IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	//_spoint = _v modelToWorld [0,12,0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// LCVP
if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = 30;	//IL_SDistL;
	_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
	//_spoint = _v modelToWorld [0,6,0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
// Liberty Ship
if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = 50;	//IL_SDistL;
	_spoint = _v modelToWorld [0,(_v getVariable "load_offset"),0];
	//_spoint = _v modelToWorld [0,6,0];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};
//C47
if ((_obj_type in IL_Supported_Vehicles_C47) && (_doors == "B")) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
	};
	_sdist = 20;	//IL_SDistL + IL_SDistL_Heli_offset;
	_spoint = _v modelToWorld [0,-9,-5.4];
	_box_num = _v getVariable "box_num";
	_slot_num = _v getVariable "slots_num";
};

if !(_force) then
{
	//nearestObjects [position, types, radius, 2Dmode]
	_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
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
				
				/*if ((typeOf _x) in IL_Supported_SDV) then
				{
					_x animate ["periscope", 3]; 
					_x animate ["Antenna", 3]; 
					_x animate ["HideScope", 3]; 
					_x animate["display_on_R", 1];
					//animationPhase
					[_v, "Waiting for periscope."] call IL_Vehicle_Chat;
					while {_x animationPhase "periscope" < 3} do
					{
						sleep 1;
					};
				};*/
				/*
				if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-14,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-13,-1.75 + _zload], [_x_cargo_offset,-6.5,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-5.5,_zload], [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				*/
				//*****************************************************************************************************************
				//*										VIOC Units declaration
				// IL_Move_Attach
				// private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
				// _v = "_veh"
				// _x = "_obj"
				// [...] = "_from"
				// [...] = "_to"
				// 1 = "_pos"
				// _turn = "_step"
				//*****************************************************************************************************************
				// Gaz
				if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.85 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Praga
				if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-5 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Blitz
				if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Blitz
				if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-5 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// US6
				if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// GMC
				if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// GMC FoW
				if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// SdKfz7
				if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-1 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// LCVP
				if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,8,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// LCM3
				if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
				{
					//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,10,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
				// Liberty Ship
				if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,_cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 + 50,_zload_offset], 1, _turn] call IL_Move_Attach;
				};
				//C47
				if ((_obj_type in IL_Supported_Vehicles_C130J)  && (_doors == "B")) then
				{
					[_v, _x, [_x_cargo_offset,-9,-0.93 + _zload], [_x_cargo_offset,-8,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-7,-0.93 + _zload], [_x_cargo_offset,-3.5,_zload], 1, _turn] call IL_Move_Attach;
					[_v, _x, [_x_cargo_offset,-2.5,_zload], [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
				};
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
	[_v, "No supported Cargo in range!"] call IL_Vehicle_Chat;
};
_v setVariable["can_load", true, true];
