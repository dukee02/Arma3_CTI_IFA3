private ["_veh", "_range", "_obj_lst", "_closest", "_canLoad", "_helpermodel", "_helper", "_dehKeyDown", "_dehKeyUp", "_dehMouse", "_closestType", "_near", "_targeting", "_cpart"];
_veh = _this select 0;
_range = _this select 1;
_obj_lst = [];
_closest = objNull;
_canLoad = false;

_helpermodel = "Sign_Arrow_Blue_F";
_helper = _helpermodel createVehicleLocal getPos player;
IL_StructurePlaced = false;
IL_StructureCanceled = false;

_dehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_KeyDown"];
_dehKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_KeyUp"];
_dehMouse = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "nullReturn = _this spawn IL_KeyHandler_BuildMenu_MouseButtonDown"];

if (isNil 'IL_PlacementCamera') then {[_veh, (_veh getVariable "load_range"), (_veh getVariable "load_range")] call IL_Create_Camera};

while {!IL_StructurePlaced && !IL_StructureCanceled && alive player} do {

	_targeting = screenToWorld [0.5,0.5];
	_helper setPos _targeting;
	
	_cpart = _veh getVariable "supported_cargo";
	_supported = missionNamespace getVariable [Format["IL_Supported_Cargo_%1", _cpart], []];
	
	_near = nearestObjects [_targeting,_supported,5,true];
	_closestType = "";

	if (count _near > 0) then {
		_closest = _near select 0;
		if((typeOf _closest) == "Sign_Arrow_Blue_F") then {
			if (count _near > 1) then {_closest = _near select 1;};
		};
		_closestType = typeOf (_closest);
		
		if((_veh distance _targeting) <= (_veh getVariable "load_range") && (_veh distance _targeting) <= (_veh getVariable "load_range")) then {
			_canLoad = true;
		} else {
			_closestType = "too far away";
		};
	} else {_canLoad = false;};
	if(_canLoad) then {
		hintSilent parseText format["<t size='1.3' color='#2394ef'>Cargo Info</t> <br />
		<br />
		<t align='justify'>Is this your first time in the <t color='#74bbf2'>Cargo selection mode</t>? 	<br />
		<br />
		These controls may help you: 	<br />
		<br />
		- Left click: <t color='#9CF863'>Select</t> vehicle you want to load. <br />
		- Right click: <t color='#F86363'>Cancel</t> and go back. <br />
		<br />
		<t size='1.3' color='#2394ef'>Unitinfo</t><br />
		<br />
		- <t color='#9CF863'>Type: %1</t><br />
		- <t color='#9CF863'>You can load this!</t><br />
		</t>",_closestType];
	} else {
		hintSilent parseText format["<t size='1.3' color='#2394ef'>Cargo Info</t> <br />
		<br />
		<t align='justify'>Is this your first time in the <t color='#74bbf2'>Cargo selection mode</t>? 	<br />
		<br />
		These controls may help you: 	<br />
		<br />
		- Left click: <t color='#9CF863'>Select</t> vehicle for loading. <br />
		- Right click: <t color='#F86363'>Cancel</t> and go back. <br />
		<br />
		<t size='1.3' color='#2394ef'>Unitinfo</t><br />
		<br />
		- <t color='#74bbf2'>nothing in range</t><br />
		<t color='#74bbf2'>%1</t><br />
		</t>",_closestType];
	};
	sleep .01;
};

if(!IL_StructureCanceled && _closest != objNull) then {
	_obj_lst pushBack _closest;
};

deleteVehicle _helper;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _dehKeyDown];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _dehKeyUp];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _dehMouse];
camDestroy IL_PlacementCamera;
IL_PlacementCamera = nil;

_obj_lst;
