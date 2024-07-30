private ["_obj", "_score"];

_obj = _this select 0;
_score = _this select 1;

if (_score != 0) then
{
	IL_SetScore = [_obj, _score];
	if (isServer) then
	{
		["Cos", IL_SetScore] spawn IL_Server_AddScore;
	}
	else
	{
		publicVariableServer "IL_SetScore";
	};
};
