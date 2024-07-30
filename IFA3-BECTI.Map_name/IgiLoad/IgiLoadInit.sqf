waituntil {!isnil "bis_fnc_init"};
//if (isDedicated) exitwith {};
//if (isServer) exitwith {};
//waitUntil { !(isNull player) };
waitUntil { time > 0 };

//if true then show debug globalChat (TODO add more hints)
IL_DevMod = false;

IL_EV_Count = 0;
IL_Veh_Array = [];

cutText ["IgiLoad is loading. Please wait...","PLAIN",2];
sleep (random 30);

cutText [Format ["IgiLoad init Player: %1", Player],"PLAIN",2];

//compileFinal preprocessFileLineNumbers "IgiLoad\IgiLoadConfig.sqf";
_iginew = execVM "IgiLoad\IgiLoadConfig.sqf";
waitUntil {scriptDone _iginew};

/*_null = [Player] execVM "IgiLoad\IgiLoad.sqf";
waitUntil {scriptDone _null};

sleep (random (IL_Check_Veh_Max - IL_Check_Veh_Min));

{
	if ((typeOf _x) in (IL_Supported_Vehicles_All)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] execVM "IgiLoad\IgiLoad.sqf";
		waitUntil {scriptDone _null};
	};
} forEach (vehicles);*/

cutText ["IgiLoad loaded. Have fun :)","PLAIN",2];

while {true} do 
{
	sleep (IL_Check_Veh_Min + (random (IL_Check_Veh_Max - IL_Check_Veh_Min)));
	
	//https://community.bistudio.com/wiki/vehicles
	//Delete vehicles from "IL_Veh_Array" if not in "vehicles"
	/*{
		if !(_x in vehicles) then
		{
			IL_Veh_Array = IL_Veh_Array - [_x];
		};
	} forEach (IL_Veh_Array);
	{
		if (((typeOf _x) in (IL_Supported_Vehicles_All)) && !(_x in IL_Veh_Array)) then
		{
			IL_Veh_Array = IL_Veh_Array + [_x];
			_null = [_x] execVM "IgiLoad\IgiLoad.sqf";
			waitUntil {scriptDone _null};
		};
	} forEach (vehicles);*/

	if (vehicle player != player) then {
		//Player is in a vehicle
		_cargoVehicle = vehicle player;
		_canCargo = _cargoVehicle getVariable "canCargo";
		if (isNil "_canCargo") then {
			//_null = [_cargoVehicle] execVM "IgiLoad\IgiLoad.sqf";
			_null = [_cargoVehicle] execVM "IgiLoad\IgiLoadCheck.sqf";
			waitUntil {scriptDone _null};
			if (IL_DevMod) then {
				_canCargo = _cargoVehicle getVariable "canCargo";
				//diag_log format["vehicle can handle cargo: <%1>", _canCargo];
				//player globalChat Format["vehicle can handle cargo: %1", _canCargo];
			};
		} else {
			if (IL_DevMod) then {player globalChat Format["vehicle can handle cargo: %1", _canCargo];};
		};
	};
};
