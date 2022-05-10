if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IL_Server_AddScore.", IL_Script_Inst];
};
if (isServer) then
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
};
