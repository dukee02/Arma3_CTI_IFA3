/*
  # HEADER #
	Script: 		Server\Functions\Server_OnBuildingHandleDamage.sqf
	Alias:			CTI_SE_FNC_OnBuildingHandleDamage
	Description:	Triggered by the handleDamage EH whenever a structure get hit
					Note this function shall only be called by an Event Handler (EH)
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	31-05-2022 dukee
	
  # PARAMETERS #
    0	[Object]: The hit structure
    1	[Number]: The inflicted damage by the hit
    2	[Object]: The shooter
    3	[Integer]: The Side ID of the structure
    4	[Number]: Damage reduction
    5	[Number]: The structure variable name
    6	[Array]: The position of the structure
    7	[Object]: The source unit that caused the damage.
    8	[String]: Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)
	
  # RETURNED VALUE #
	[Number]: The afflicted damage
	
  # SYNTAX #
	[STRUCTURE, DAMAGES, SHOOTER, SIDE ID, DAMAGE REDUCTION, VARIABLE, POSITION] call CTI_SE_FNC_OnBuildingHandleDamage
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideFromID
	Common Function: CTI_CO_FNC_GetSideLogic
	Common Function: CTI_CO_FNC_NetSend
	
  # EXAMPLE #
    _structure addEventHandler ["handledamage", format ["[_this select 0, _this select 2, _this select 3, %1, %2, '%3', %4] call CTI_SE_FNC_OnBuildingHandleDamage", (_side) call CTI_CO_FNC_GetSideID, _reduce_damages, _variable, _position]];
*/

private ["_damage", "_damaged", "_logic", "_position", "_reduce_damages", "_shooter", "_side", "_sideID", "_variable", "_source", "_projectile"];

_damaged = _this select 0;
_damage = _this select 1;
_shooter = _this select 2;
_sideID = _this select 3;
_reduce_damages = _this select 4;
_variable = _this select 5;
_position = _this select 6;
_source = if (count _this > 6) then {_this select 7} else {ObjNull};
_projectile = if (count _this > 7) then {_this select 8} else {ObjNull};

//CTI_DMG_BALANCE_AMMO = ["SAB_FL_POD_V40","SAB_FL_POD_NS37","SAB_FL_POD_BK37","SAB_FL_POD_WB81"];
//CTI_DMG_BALANCE_AMMO = ["sab_fl_pod_s40mm_ap_pylon_mag","sab_fl_pod_ns37_ap_pylon_mag","sab_fl_pod_bk37_ap_pylon_mag"];
//CTI_DMG_BALANCE_AMMO = ["sab_fl_pod_s40mm_ap_ammo","sab_fl_pod_ns37_ap_ammo","sab_fl_pod_bk37_ap_ammo"];
CTI_DMG_BALANCE_AMMO = ["sab_fl_pod_37mm_ap_ammo","sab_fl_pod_37mm_he_ammo"];
CTI_DMG_BALANCE_AMOUNT = 20;

if(_source in CTI_DMG_BALANCE_AMMO) then {
	_reduce_damages = _reduce_damages + CTI_DMG_BALANCE_AMOUNT;
};

_side = (_sideID) call CTI_CO_FNC_GetSideFromID;

if (CTI_BASE_NOOBPROTECTION == 1 && side _shooter in [_side, sideEnemy]) exitWith {0};
if (_reduce_damages > 0) then {_currentdmg = getDammage _damaged; _damage = _currentdmg + ((_damage - _currentdmg) / _reduce_damages)};

_logic = (_side) call CTI_CO_FNC_GetSideLogic;

if (time - (_logic getVariable "cti_structures_lasthit") > 30 && _damage >= 0.02 && alive _damaged) then {
	_logic setVariable ["cti_structures_lasthit", time];
	//[["CLIENT", _side], "Client_OnMessageReceived", ["structure-attacked", [_variable, _position]]] call CTI_CO_FNC_NetSend;
	[["CLIENT", _side], "Client_OnMessageReceived", ["structure-attacked", [_variable, _position, _damage]]] call CTI_CO_FNC_NetSend;
	if (CTI_Log_Level >= CTI_Log_Debug || CTI_DEBUG) then {
		["VIOC-DEBUG", "File: Server\Functions\Server_OnBuildingHandleDamage.sqf", format["Building %1 gets damage: <%2><%3><%4><%5>", _damaged, _damage, getDammage _damaged, _reduce_damages, _position]] call CTI_CO_FNC_Log;
	};
};

/*if(isPlayer _shooter) then {
	[["CLIENT", _shooter], "Client_OnBuildingHit", ["structure-hit", [_variable, _position, _damage]]] call CTI_CO_FNC_NetSend;
	["VIOC-DEBUG", "File: Server\Functions\Server_OnBuildingHandleDamage.sqf", format["shooter yes: <%1> - <%2>", _shooter, driver vehicle _shooter]] call CTI_CO_FNC_Log;
} else {
	[["CLIENT", driver vehicle _shooter], "Client_OnBuildingHit", ["structure-hit", [_variable, _position, _damage]]] call CTI_CO_FNC_NetSend;
	["VIOC-DEBUG", "File: Server\Functions\Server_OnBuildingHandleDamage.sqf", format["shooter no: <%1> - <%2>", _shooter, driver vehicle _shooter]] call CTI_CO_FNC_Log;
};*/

_damage