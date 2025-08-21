if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
};
private["_obj", "_obj_type", "_kindOf", "_bbr", "_p0", "_p1"];
_obj = _this select 0;

_obj_type = (typeOf _obj);
_kindOf = "";

_obj setVariable["attachedPos", 0, true];
_obj setVariable["attachedTruck", _obj, true];
_obj setVariable["doors", "N", true];

_bbr = boundingBoxReal _obj;
_p0 = _bbr select 0;
_p1 = _bbr select 1;
_obj setVariable["zload_cargo", abs (_p0 select 2), true];

/*if (_obj_type in IL_Supported_Cargo20) then
{
	_obj setVariable["slots", 6, true];
	_obj setVariable["cargo_offset", 2.6, true];//HEMETT Box ~2.09281
	//LOCAL
	//_obj setMass 2400;
	[_obj, 2400] call IL_SetNewMass;
};*/
//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//prefilter to don't move over the whole maybe very large arrays
if(_obj_type isKindOf "Ammo") then {
	_kindOf = "Ammo";
};
if(_obj_type isKindOf "Static") then {
	_kindOf = "Static";
};
if(_obj_type isKindOf "Car" || _obj_type isKindOf "Truck") then {
	_kindOf = "Car";
};
if(_obj_type isKindOf "Tank") then {
	_kindOf = "Tank";
};
if(_obj_type isKindOf "Air" || _obj_type isKindOf "Plane") then {
	_kindOf = "Air";
};
if(_obj_type isKindOf "Ship") then {
	_kindOf = "Ship";
};

//now we check the specific part or all if we couldn't prefilter it
if (_obj_type in IL_Supported_Bike_Cargo) then
{
	_obj setVariable["slots", 4, true];
	_obj setVariable["cargo_offset", 0.5, true];
};
if (_obj_type in IL_Supported_Motorcicle_Cargo) then
{
	_obj setVariable["slots", 5, true];
	_obj setVariable["cargo_offset", 0.5, true];
};
if (_kindOf == "Ammo" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Small_Crates) then
	{
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0.5, true];
		[_obj, 60] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Medium_Crates) then
	{
		_obj setVariable["slots", 2, true];
		_obj setVariable["cargo_offset", 0.5, true];
		[_obj, 120] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Large_Crates) then
	{
		_obj setVariable["slots", 3, true];
		_obj setVariable["cargo_offset", 0.5, true];
		[_obj, 240] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Stacket_Crates) then
	{
		_obj setVariable["slots", 3, true];
		_obj setVariable["cargo_offset", 0.5, true];
		[_obj, 1200] call IL_SetNewMass;
	};
};
if (_kindOf == "Static" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Mini_Static_Cargo) then
	{
		_obj setVariable["slots", 2, true];
		_obj setVariable["cargo_offset", 0.5, true];
		[_obj, 240] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Small_Static_Cargo) then
	{
		_obj setVariable["slots", 3, true];
		_obj setVariable["cargo_offset", 0.5, true];
		_obj setVariable["turn", 1, true];
		[_obj, 200] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Medium_Static_Cargo) then
	{
		_obj setVariable["slots", 4, true];
		_obj setVariable["cargo_offset", 0.5, true];
		_obj setVariable["turn", 1, true];
		[_obj, 300] call IL_SetNewMass;
	};
	if (_obj_type in IL_Supported_Large_Static_Cargo) then
	{
		_obj setVariable["slots", 5, true];
		_obj setVariable["cargo_offset", 0.5, true];
		_obj setVariable["turn", 1, true];
		[_obj, 600] call IL_SetNewMass;
	};	
	if (_obj_type in IL_Supported_XLarge_Static_Cargo) then
	{
		_obj setVariable["slots", 6, true];
		_obj setVariable["cargo_offset", 0.5, true];
		_obj setVariable["turn", 1, true];
		[_obj, 1000] call IL_SetNewMass;
	};
};
if (_kindOf == "Car" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Gaz_Zis5_Cargo) then
	{
		_obj setVariable["slots", 14, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_Truck_Cargo) then
	{
		_obj setVariable["slots", 14, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_Car_Cargo) then
	{
		_obj setVariable["slots", 7, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_Armoured_Cargo) then
	{
		_obj setVariable["slots", 11, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
};
if (_kindOf == "Tank" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Small_Tank_Cargo) then
	{
		_obj setVariable["slots", 12, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_Medium_Tank_Cargo) then
	{
		_obj setVariable["slots", 14, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_Large_Tank_Cargo) then
	{
		_obj setVariable["slots", 22, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};	
};
if (_kindOf == "Air" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Plane_Cargo) then
	{
		_obj setVariable["slots", 27, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
};
if (_kindOf == "Ship" || _kindOf == "") then {
	if (_obj_type in IL_Supported_Landing_Ship_Cargo) then
	{
		_obj setVariable["slots", 27, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
	if (_obj_type in IL_Supported_L_Landing_Ship_Cargo) then
	{
		_obj setVariable["slots", 33, true];
		_obj setVariable["cargo_offset", 0.5, true];
	};
};

//set slots and offset if not set above
if ((isNil {_obj getVariable "slots"})) then {_obj setVariable["slots", 1, true];};
if ((isNil {_obj getVariable "cargo_offset"})) then {_obj setVariable["cargo_offset", 0.5, true];};
