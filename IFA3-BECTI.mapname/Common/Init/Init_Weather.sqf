// Script by Zonekiller  -- http://www.zonekiller.net --    -- zonekiller@live.com.au --
// edit by dukee, params added to enable or disable fog and skip the night if aktivated


//Set All the weather settings to manual and full in the mission editor of your mission

sleep 1;

["INFORMATION", "FILE: Common\Init\Init_Weather.sqf", format ["------ weather script running -------"]] call CTI_CO_FNC_Log;

//  ARRAY SETTINGS [fog,gusts,(wind dir),(wind force),overcast,rain]

// Weather Types
/*
_clear = [(Random 1),0,0,0,0,0];
_clearwindy = [(Random 1),(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),0,0];
_windy = [(Random 1),(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),(.1 + (Random .9)),0];
_stillrain = [(Random 1),0,0,0,(.45 + (Random .55)),(.1 + (Random .9))];
_storm = [(Random 1),(.5 + (Random .5)),(Random 360),(.5 + (Random .5)),(.5 + (Random .5)),(.5 + (Random .5))];

_weatherpattern = [_clear,_clearwindy,_windy,_stillrain,_storm];
_weather = (_weatherpattern select (floor(random (count _weatherpattern))));


_fog = (_weather select 0);
_gust = (_weather select 1);
_dir = (_weather select 2);
_force = (_weather select 3);
_oc = (_weather select 4);
_rain = (_weather select 5);

// only foggy in the mornings

if ((daytime > 4) && (daytime < 8)) then 
	{
	0 setFog _fog;
	0 setRain _rain;
	}
else{
	0 setFog 0;
	0 setRain 0;
	};

0 setGusts _gust;
0 setWindDir _dir;
0 setWindForce _force;
0 setOvercast _oc;

_foggy = 0;
sleep 120;
*/

while {true} do
{
/*
_weather = (_weatherpattern select (floor(random (count _weatherpattern))));

_fog = (_weather select 0);
_gust = (_weather select 1);
_dir = (_weather select 2);
_force = (_weather select 3);
_oc = (_weather select 4);
_rain = (_weather select 5); 


if ((daytime > 4) && (daytime < 8)) then 
{
(200 + (Random 1000)) setFog _fog;
_foggy = 0;
}else{
if (_foggy == 0) then {_foggy = 1;(120 + (Random 1680)) setFog 0};
};

(120 + (Random 1680)) setGusts _gust;
(120 + (Random 1680)) setWindDir _dir;
(120 + (Random 1680)) setWindForce _force;
(120 + (Random 1680)) setOvercast _oc;
(120 + (Random 1680)) setRain _rain;
*/



if(CTI_ENVIRONMENT_WEATHER_FOG == 0) then {
	0 setFog 0;
	99999 setFog 0;
	0 setRain 0;
	99999 setRain 0;
	forceWeatherChange;
};

if(CTI_ENVIRONMENT_WEATHER_SKIPNIGHT == 1) then {
	//check if night is comming, if true - skip time until morning
	if (daytime > 19.0 || daytime < 5.0) then {	
		["INFORMATION", "FILE: Common\Init\Init_Weather.sqf", format ["------ skip Time -------", daytime]] call CTI_CO_FNC_Log;
		if (daytime > 19 && daytime < 20) then {skipTime 9;};
		if (daytime > 20 && daytime < 21) then {skipTime 8;};
		if (daytime > 21 && daytime < 22) then {skipTime 7;};
		if (daytime > 22 && daytime < 23) then {skipTime 6;};
		if (daytime > 23) then {skipTime 5;};
		if (daytime < 1) then {skipTime 4;};
		if (daytime > 1 && daytime < 2) then {skipTime 3;};
		if (daytime > 2 && daytime < 3) then {skipTime 2;};
		if (daytime > 3 && daytime < 4) then {skipTime 1;};
	};
};

sleep 1800; 

};

