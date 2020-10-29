_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

_sid = [];
if(CTI_VIO_ADDON == 0) then {
	_sid = [""];
} else {
	_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
};

{
	_c pushBack format["%1LIB_GrWr34", _x];
	_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
	_b pushBack [1, 2, 4];
	_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

	_c pushBack format["%1LIB_GrWr34_g", _x];
	_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
	_b pushBack [1, 2, 4];
	_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

	_c pushBack format["%1LIB_BM37", _x];
	_m pushBack ["LIB_8Rnd_82mmHE_BM37"];
	_b pushBack [1, 2, 4];
	_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

	_c pushBack format["%1LIB_M2_60", _x];
	_m pushBack ["LIB_8Rnd_60mmHE_M2","LIB_8Rnd_60mmHE_M2","LIB_8Rnd_60mmHE_M2","LIB_8Rnd_60mmWP_M2"];
	_b pushBack [1, 2, 4];
	_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];


	_c pushBack format["%1LIB_Nebelwerfer41", _x];
	_m pushBack ["LIB_6Rnd_NbW41"];
	_b pushBack [1, 2, 4, 6];
	_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];

	_c pushBack format["%1LIB_leFH18", _x];
	_m pushBack ["LIB_20x_Shell_105L28_Gr38_HE","LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_NB"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];


	_c pushBack format["%1LIB_FlaK_36_ARTY", _x];
	_m pushBack ["LIB_45x_SprGr_KwK36_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[800,3000], [800,4000], [800,6000], [800,8000]];


	_c pushBack format["%1LIB_US6_BM13", _x];
	_m pushBack ["LIB_16Rnd_BM13"];
	_b pushBack [8, 16];
	_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];

	/*if(CTI_IFA3LIB_ADDON > 0) then {
		_c pushBack format["%1Ifa3_p27", _x];
		_m pushBack ["ifa3_50xUOF353","ifa3_40xUBR353"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
		
		_c pushBack format["%1Ifa3_p27G", _x];
		_m pushBack ["ifa3_50xUOF353","ifa3_40xUBR353"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
	};*/

	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_SdKfz251_2", _x];
		_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
		
		_c pushBack format["%1LIB_SdKfz251_2_w", _x];
		_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
	};
} forEach _sid;




[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";