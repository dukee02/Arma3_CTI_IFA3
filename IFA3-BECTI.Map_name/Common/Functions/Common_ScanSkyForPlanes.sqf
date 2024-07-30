/*
  # HEADER #
	Script: 		Common\Functions\Common_ScanSkyForPlanes.sqf
	Alias:			CTI_CO_FNC_ScanSkyForPlanes
	Description:	Scan the sky fpr planes and reveal the targets to the unit/team.
	Author: 		dukee
	Creation Date:	13-07-2022
	Revision Date:	13-07-2022
	
  # PARAMETERS #
	None
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	Call CTI_CO_FNC_ScanSkyForPlanes
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
	Call CTI_CO_FNC_ScanSkyForPlanes
*/
Private ["_side","_logic","_defenses","_defense","_objects","_object","_height","_defense_data","_object_cnt","_defensesInArea"];

if(CTI_BASE_DEFENSES_AIR_DETECTION_MODE > 0) then {

	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_ScanSkyForPlanes.sqf", "Start scanning the Area"] call CTI_CO_FNC_Log;};

	{
		//get the defenses of the side
		_side = _x;		//for a better reading
		_logic= (_side) call CTI_CO_FNC_GetSideLogic;
		_defenses = [];
		_object_cnt = -1;

		if(CTI_BASE_DEFENSES_AIR_DETECTION_MODE == 1) then {
			_defenses = _logic getVariable ["cti_defences",[]];
		} else {
			_baseAreas = _logic getVariable ["cti_structures_areas",[]];
			if(count _baseAreas > 0) then {
				{
					// Current result is saved in variable _x
					_defensesInArea = _x nearEntities [["StaticWeapon"], CTI_BASE_DEFENSES_AUTO_RANGE];
					if(count _defensesInArea > 0) then {
						_defenses append _defensesInArea;
					};
				} forEach _baseAreas;
			};
		};
		
		if(count _defenses > 0) then {
			{
				_defense = _x;		//for a better reading
				if(CTI_BASE_DEFENSES_AIR_DETECTION_MODE == 1) then {
					_defense = _x select 0;		//for a better reading
				};
				//data of the defense, needed to check if it is a AA or not
				_defense_data = missionNamespace getVariable [format["CTI_%1_%2",_side,(typeOf _defense)],["","","",""]];
				//get the planes in range
				//_objects nearTargets 2000	//??? maybe faster ???
				//_objects = nearestObjects [_defense, ["Air"], CTI_BASE_DEFENSES_AIR_DETECTION_RANGE];
				_objects = (nearestObjects [_defense, ["Air"], CTI_BASE_DEFENSES_AIR_DETECTION_RANGE]) unitsBelowHeight CTI_BASE_DEFENSES_AIR_DETECTION_HEIGHT;
				//_objects = (_location nearEntities[["Man","Car","Motorcycle","Tank","Air","Ship"], _town_capture_range]) unitsBelowHeight 40;
				//_objects = _defense nearObjects ["Air", CTI_BASE_DEFENSES_AIR_DETECTION_RANGE];
				_object_cnt = count _objects;
				if(_object_cnt > 0 && _defense_data select 3 == "AA") then {
					{
						//_object = _x;		//for a better reading
						_defense reveal _x;
						//speed _object
						//velocity _object
						//_height = (getPos _object) select 2;
						//if(_height > CTI_BASE_DEFENSES_AIR_DETECTION_HEIGHT) then {
						//	_defense reveal _object;
						//};
					} forEach _objects;
				};
			} forEach _defenses;
		};
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_ScanSkyForPlanes.sqf", format["End scanning the Area <%1> <%2>", _object_cnt, count _defenses]] call CTI_CO_FNC_Log;};
	} forEach [east,west];
};
