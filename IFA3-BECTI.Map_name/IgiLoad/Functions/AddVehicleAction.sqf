/*
https://community.bistudio.com/wiki/addAction
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
private ["_obj_main", "_cargo_var", "_action"];
_obj_main = _this select 0;
_cargo_var = _this select 1;
_action = _this select 2;

switch (_action) do {
	case "Load": {
		_obj_main addAction [
		(Format["<img image='IgiLoad\images\load.paa' /><t color=""#007f0e""> Load cargo on %1</t>", _cargo_var]),
		{
			private ["_cargo_type", "_cargo_filter"];
			_cargo_type = (_this select 0) getVariable "supported_cargo";
			_cargo_filter = missionNamespace getVariable [Format["IL_Supported_Cargo_%1", _cargo_type], []];
			[_this select 0, _cargo_filter] call IL_Do_Load;
		},
		[],IL_Action_LU_Priority,true,true,"","(abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
		];
	};
	case "Unload": {
		_obj_main addAction [
		(Format["<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000""> Unload cargo from %1</t>", _cargo_var]),
		{
			[_this select 0] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (_target getVariable 'can_outside')) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
		];
	};
	case "OnDeck": {
		_obj_main addAction [
		(Format["<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000""> Move in vehicle on Deck %1</t>", ""]),
		{
			/*_tmp_pos = getPos vehicle player; 
			_tmp_pos set [2, ((_tmp_pos select 2)+1)]; 
			vehicle player setPos _tmp_pos;*/
			//if !(isNil {(_this select 0) getVariable "last_cargo"}) then {
				if (not isNull vehicle player) then{moveOut player;};
				player moveInDriver ((_this select 0) getVariable "last_cargo");
			//};
		},[],IL_Action_LU_Priority,false,true,"",
		"(abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (_target getVariable 'can_outside')) && (_target getVariable 'can_load')"
		];
	};
	case "UnloadPara": {
		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
		{
			[_this select 0, true] call IL_Do_Unload;
		},[],IL_Action_LU_Priority,false,true,"",
		"(_target getVariable 'box_num' < 0) && (driver _target == _this) || ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
		];
	};
	default { };
};
