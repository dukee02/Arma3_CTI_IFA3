/*
Checks if the given classname is set as a variable in missionNamespace to makes the vehicle list more clear for BECTI
*/
private ["__classname", "_load_not_NS", "_used", "_varFound"];
_classname = _this select 0;
_load_not_NS = _this select 1;
_used = [];

//first check the base unit, we must make it here because "" are not supported in forEach
_class_found = isClass(configFile >> "CfgVehicles" >> format["%1", _classname]);
if(_class_found) then {
	_varFound = missionNamespace getVariable [_classname, []];
	if (count _varFound > 0) then {
		_used pushBack _classname;
		//diag_log format["[IgiLoad ] class found <%1> added", _classname];
	} else {
		if(_load_not_NS) then {
			_used pushBack _classname;
			//diag_log format["[IgiLoad ] class found <%1> added with NS", _classname];
		};
	};
};
//now we check the VIO sidepatch versions
{
	_class_found = isClass(configFile >> "CfgVehicles" >> format["%1%2", _x, _classname]);
	if(_class_found) then {
		_varFound = missionNamespace getVariable [format["%1%2", _x, _classname], []];
		if (count _varFound > 0) then {
			_used pushBack (format["%1%2", _x, _classname]);
			//diag_log format["[IgiLoad ] class found <%1%2> added", _x, _classname];
		} else {
			if(_load_not_NS) then {
				_used pushBack (format["%1%2", _x, _classname]);
				//diag_log format["[IgiLoad ] class found <%1%2> added with NS", _x, _classname];
			};
		};
	};
} forEach ["VIOC_B_", "VIOC_O_", "VIOC_I_"];

_used;
