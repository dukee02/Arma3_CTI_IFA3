private ["_veh", "_obj", "_vehicletype", "_local", "_dehKeyDown", "_dehKeyUp", "_dehMouse", "_dir", "_height", "_pos", "_inragne", "_unload"];
_veh = _this select 0;			//the transporting vehicle
_obj = _this select 1;			//the cargo

//get the vehicle classname to create a visual copy for placement
_vehicletype = typeOf _obj;
_local = _vehicletype createVehicleLocal getPos player;
IL_StructurePlaced = false;
IL_StructureCanceled = false;
IL_StructureRotate = 0;
IL_StructureElevation = 0;
IL_StructureRotateMulti = 1;
//Set the key handlers for easy placement with mouse and ctrl/alt keys
_dehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_KeyDown"];
_dehKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_KeyUp"];
_dehMouse = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_MouseButtonDown"];

_dir = getDir _veh; 
_height = 1;
_pos = [];
_unload = false;

_local AttachTo [_veh, getPos _veh];

if (isNil 'IL_PlacementCamera') then {[_veh, (_veh getVariable "load_range"), (_veh getVariable "load_range")] call IL_Create_Camera};

while {!IL_StructurePlaced && !IL_StructureCanceled && alive player} do {
	_pos = screenToWorld [0.5,0.5];

	_dir = _dir + (IL_StructureRotate * IL_StructureRotateMulti);
	_height = _height + (IL_StructureElevation * IL_StructureRotateMulti);
	if(_height < 1) then {_height = 1};
	_local setPos [_pos select 0, _pos select 1, _height];
	_local setDir _dir;	

	_inragne = "<t color='#F86363'>Placement: to far</t>";
	if((_veh distance _local) <= (_veh getVariable "load_range") && (_veh distance _local) <= (_veh getVariable "load_range")) then {
		_inragne = "<t color='#9CF863'>Placement: OK</t>";
		_local hideObject false;
		_unload = true;
	} else {
		_local hideObject true;
		_unload = false;
	};

	hintSilent parseText format ["<t size='1.3' color='#2394ef'>Information</t> <br />
	<br />
	<t align='justify'>Is this your first time in the <t color='#74bbf2'>Unload Preview Mode</t>? <br />
	<br />
	The dummy unit shows where the units which may be unloaded from that cargo will spawn at. <br />
	%1<br /><br />
	Some of these controls may help you during the placement: <br />
	<br />
	- Left click: <t color='#9CF863'>Place</t> defense. <br />
	- Right click: <t color='#F86363'>Cancel</t> defense. <br />
	- Left Ctrl: <t color='#f4cb38'>Rotate</t> clockwise. <br />
	- Left Alt: <t color='#f4cb38'>Rotate</t> anti-clockwise. <br />
	- Left Shift: <t color='#f4cb38'>Rot./Elev.</t> faster. <br />
	- Right Ctrl: <t color='#f4cb38'>Elevation</t> up. <br />
	- Right Shift: <t color='#f4cb38'>Elevation</t> down. <br /><br/>
	<br/>
	Be sure to place the unit on flat terrain and above the ground without hitting any other object!<br /></t>", _inragne];
	sleep .01;
};

//if the cargo has placed we detach it and set the new position
if(!IL_StructureCanceled && _unload) then {
	_obj allowDamage false;
	_local hideObject true;
	detach _obj;
	_obj setPos [_pos select 0, _pos select 1, _height];
	if((typeOf _obj) in IL_Supported_Plane_Cargo) then {_obj setDir _dir+180;} else {_obj setDir _dir;};
	//_obj setDir _dir;
	if (IL_DevMod) then
	{
		diag_log format["[IgiLoad (%1)] IL_Move_Attach _pos <%2><%3> dmg <%4>", IL_Script_Inst, getPos _obj, getDir _obj, damage _obj];
	};
	_obj allowDamage true;
};

deleteVehicle _local;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _dehKeyDown];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _dehKeyUp];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _dehMouse];
camDestroy IL_PlacementCamera;
IL_PlacementCamera = nil;

IL_StructurePlaced;
