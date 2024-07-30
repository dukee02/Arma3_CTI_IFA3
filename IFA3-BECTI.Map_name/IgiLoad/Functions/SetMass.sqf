if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
};
private ["_obj", "_mass"];
_obj = _this select 1 select 0;
_mass = _this select 1 select 1;
if ((getMass _obj) != _mass) then
{
	_obj setMass _mass;
};
