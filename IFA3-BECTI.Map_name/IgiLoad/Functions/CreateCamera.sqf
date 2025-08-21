/*
	script copy from BECTI
  # HEADER #
	Script: 		CreateCamera.sqf
	Alias:			IL_Create_Camera
	Description:	Creates a camera with the given parameters
	Author: 		Sari
	Creation Date:	17-03-2015
	Revision Date:	12-08-2025 by dukee
	
  # PARAMETERS #
    0	[Object]: The object for the camera center to be based around
	1	[Number]: The range the camera may travel from the center
	2	[Number]: The height the camera may travel from the center

  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[Object, Range, Height] call IL_Create_Camera
	
  # DEPENDENCIES #
	BIS Function: BIS_fnc_setPitchBank
	
  # EXAMPLE #
    [player, 100, 20] call IL_Create_Camera;
*/

Private ["_camera", "_centerObj", "_height", "_pos", "_range"];
_centerObj = _this select 0;
_range = _this select 1;
_height = _this select 2;
_camera = objNull;
_pos = getPos _centerObj;
_camHeight = 0;
_posASL = getPosASL _centerObj;
_posATL = getPosATL _centerObj;
if((_posASL select 2) > _posATL select 0) then {
	_camHeight = (_posASL select 2) + (_posATL select 2) + (_height*0.20);
} else {
	_camHeight = (_posATL select 2) + (_height*0.20);
};
_pos set [1, (_pos select 1) - 15];
_pos set [2, _camHeight];
_camera = "camconstruct" camCreate _pos;
_camera cameraEffect ["internal","back"];
_camera camPrepareFov 0.900;
_camera camPrepareFocus [-1,-1];
_camera camCommitPrepared 0;
cameraEffectEnableHUD true;
_camera setdir direction _centerObj;
_camera setPos _pos;
[_camera,-30,0] call BIS_fnc_setPitchBank;
_camera camConstuctionSetParams [_pos, _range, (_height*2)];

IL_PlacementCamera = _camera;
