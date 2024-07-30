//if true then show debug globalChat (TODO add more hints)
IL_DevMod = false;

//waitUntil { !(isNull player) };
waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

//if (isDedicated) exitwith {};
//if (isServer) exitwith {};

//	VARIABLES
_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);

//	MAIN CODE
_vsupported = false;
/*
if (_obj_main_type in IL_Supported_Vehicles_C17) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C17.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_NonVeh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_Veh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#007f0e"">Get in C17</t>",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<t color=""#ff0000"">Get out C17</t>",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C17</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Open cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp', 1];
		_this select 0 animate ['back_ramp_door_main', 1];
		_this select 0 animate ['back_ramp_st', 1];
		
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Close cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp_st', 0];
		_this select 0 animate ['back_ramp', 0];
		_this select 0 animate ['back_ramp_door_main', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 1) && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];
};
*/

//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//Gaz
if (_obj_main_type in IL_Supported_Vehicles_Gaz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Gaz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Praga) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Praga.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Blitz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Blitz.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_BlitzCSA) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_BlitzCSA.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// US6
if (_obj_main_type in IL_Supported_Vehicles_US6) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_US6.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from US6</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMC) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMC.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMCFOW) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMCFOW.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// SdKfz7
if (_obj_main_type in IL_Supported_Vehicles_SdKfz7) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_SdKfz7.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from SdKfz7</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCVP
if (_obj_main_type in IL_Supported_Vehicles_LCVP) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCVP.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCVP</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCM3
if (_obj_main_type in IL_Supported_Vehicles_LCM3) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCM3.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCM3</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	//"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Liberty Ship
if (_obj_main_type in IL_Supported_Vehicles_Cargo_Ship) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Cargo_Ship.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*
	this addAction
	[
		"title",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
		},
		nil,		// arguments
		1.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"true", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
	
	*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority2,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Light_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Medium, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_ShipCargo, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	/*_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load heavy vehicle on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Heavy_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority3,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Heavy_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Heavy, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Heavy, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load Boat on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Ship_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority4,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Ship_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	//"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Vehicle_Boat, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Ship_Liberty, IL_SDistL_ship]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Cargo Ship</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];	
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
//C47
if (_obj_main_type in IL_Supported_Vehicles_C47) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C47.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*if (_obj_main_type == "C130J") then
	{
		_obj_main addAction [
		"<t color=""#ff0000"">Get out on the side of ramp</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' > 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' > 0.9) && (_target getVariable 'usable_ramp')"
		];
	};*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, 30]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], 30])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_C47, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_Veh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C47</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
/*
	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];*/
};

if (_vsupported) then {
	_obj_main setVariable ["canCargo", true];
} else {
	if (IL_DevMod) then {Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type]};
	_obj_main setVariable ["canCargo", false];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};
//	EOF
