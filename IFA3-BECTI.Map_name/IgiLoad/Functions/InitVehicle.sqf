if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_Init_Veh.", IL_Script_Inst];
};

private["_obj", "_obj_type", "_force"];
_obj = _this select 0;
_force = if (count _this > 1) then {_this select 1} else {false};
_obj_type = (typeOf _obj);
if ((isNil {_obj getVariable "default_mass"}) || (_force)) then
	{
		if (isNil {_obj getVariable "default_mass"}) then
		{
			_obj setVariable["default_mass", getMass _obj, true];
		}
		else
		{
			_obj setMass (_obj getVariable "default_mass");
		};
	};
/*
if (_obj_type in IL_Supported_Vehicles_C17) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C17, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.25, true];};
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 16, true];};//4.5, true];};
	if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
};
*/
//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
// Gaz
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_Gaz")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Gaz, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};	//-0.65
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "Gaz", true];};
};
// Praga
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_Praga")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Praga, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.2, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "Praga", true];};
};
// Blitz
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_Blitz")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Blitz, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.1, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.2, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "Blitz", true];};
};
// Blitz
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_BlitzCSA")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_BlitzCSA, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.2, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "BlitzCSA", true];};
};
// US6
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_US6")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_US6, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 0.15, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.2, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "US6", true];};
};
// GMC
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_GMC")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_GMC, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "GMC", true];};
};
// GMC FoW
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_GMCFOW")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_GMC, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 1.1, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "GMCFOW", true];};
};
// SdKfz7
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_SdKfz7")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_SdKfz7, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.5, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 10, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "SdKfz7", true];};
};
// LCVP
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_LCVP")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCVP, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.1, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -2.5, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 20, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "LCVP", true];};
};
// LCM3
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_LCM3")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCM3, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.4, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -2.5, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 20, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "LCM3", true];};
};
// Liberty Ship
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_CargoShip")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_CargoShip, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -7, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "zload_offset"}) || (_force)) then {_obj setVariable["zload_offset", -5, true];};  // how high the container ends to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -55, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 150, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "CargoShip", true];};
	if ((isNil {_obj getVariable "xload_to_left"}) || (_force)) then {_obj setVariable["xload_to_left", true, true];};
};
// Carrier
if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_Carrier")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_CargoShip, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -8, true];};  // how high the container animates to load
	if ((isNil {_obj getVariable "zload_offset"}) || (_force)) then {_obj setVariable["zload_offset", -10, true];};  // how high the container ends to load
	if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -110, true];};  // how far the container animates to load
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 200, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "Carrier", true];};
};

if (_obj_type in (missionNamespace getVariable "IL_Supported_Vehicles_C47")) then
{
	if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
	if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
	if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
	if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
	if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -4.57, true];};
	if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
	//if (_obj_type == "C130J_Cargo") then
	//{
		if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C47, true];};
		if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 8.5, true];};
	//}
	//else
	//{
		//if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", (IL_Num_Slots_C47 / 2) - 1, true];};
		//if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 13.5, true];};
	//};
	if ((isNil {_obj getVariable "load_range"}) || (_force)) then {_obj setVariable["load_range", 50, true];};
	if ((isNil {_obj getVariable "supported_cargo"}) || (_force)) then {_obj setVariable["supported_cargo", "C47", true];};
};
