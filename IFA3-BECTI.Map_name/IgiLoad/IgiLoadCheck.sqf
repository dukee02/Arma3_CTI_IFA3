//if true then show debug globalChat (TODO add more hints)
//IL_DevMod = false;

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

//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************

//Gaz
if (_obj_main_type in IL_Supported_Vehicles_Gaz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Gaz.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	[_obj_main, "Gaz", "Load"] call IL_Add_Action;
	[_obj_main, "Gaz", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "Praga", "Load"] call IL_Add_Action;
	[_obj_main, "Praga", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "Blitz", "Load"] call IL_Add_Action;
	[_obj_main, "Blitz", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "BlitzCSA", "Load"] call IL_Add_Action;
	[_obj_main, "BlitzCSA", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "US6", "Load"] call IL_Add_Action;
	[_obj_main, "US6", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "GMC", "Load"] call IL_Add_Action;
	[_obj_main, "GMC", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "GMCFOW", "Load"] call IL_Add_Action;
	[_obj_main, "GMCFOW", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "SdKfz7", "Load"] call IL_Add_Action;
	[_obj_main, "SdKfz7", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "LCVP", "Load"] call IL_Add_Action;
	[_obj_main, "LCVP", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
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

	[_obj_main, "LCM3", "Load"] call IL_Add_Action;
	[_obj_main, "LCM3", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
};
// Liberty Ship
if (_obj_main_type in IL_Supported_Vehicles_CargoShip) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_CargoShip.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	[_obj_main, "CargoShip", "Load"] call IL_Add_Action;
	[_obj_main, "CargoShip", "Unload"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
};
// Aircraft Carrier
if (_obj_main_type in IL_Supported_Vehicles_Carrier) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Carrier.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	[_obj_main, "Carrier", "Load"] call IL_Add_Action;
	[_obj_main, "Carrier", "Unload"] call IL_Add_Action;
	[_obj_main, "Carrier", "OnDeck"] call IL_Add_Action;

	_obj_main setVariable ["canCargo", true];
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
	
	[_obj_main, "C47", "Load"] call IL_Add_Action;
	[_obj_main, "C47", "Unload"] call IL_Add_Action;
	[_obj_main, "C47", "UnloadPara"] call IL_Add_Action;
	
	_obj_main setVariable ["canCargo", true];
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};
//	EOF
