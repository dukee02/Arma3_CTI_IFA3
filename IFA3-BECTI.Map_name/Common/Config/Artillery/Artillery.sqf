_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges
_sid = [];

if(CTI_IFA_ADDON >= 1 && CTI_IFA_NEW <= 1) then {
	_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
	if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = [""];};
	{
		_c pushBack format["%1LIB_GrWr34", _x];
		//_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
		
		_c pushBack format["%1LIB_GrWr34_g", _x];
		//_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1LIB_BM37", _x];
		//_m pushBack ["LIB_8Rnd_82mmHE_BM37","ARTY_LIB_8Rnd_82mmHE_BM37","LIB_1rnd_82mmHE_BM37","LIB_82mm_BM37_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1LIB_M2_60", _x];
		//_m pushBack ["LIB_8Rnd_60mmHE_M2","ARTY_LIB_8Rnd_60mmHE_M2","LIB_1rnd_60mmHE_M2","LIB_60mm_M2_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];


		_c pushBack format["%1LIB_Nebelwerfer41", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];
		
		_c pushBack format["%1LIB_Nebelwerfer41_Camo", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];
		
		_c pushBack format["%1LIB_Nebelwerfer41_Gelbbraun", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];

		_c pushBack format["%1LIB_leFH18", _x];
		//_m pushBack ["LIB_Shell_105L28_Gr38_HE","LIB_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];


		_c pushBack format["%1LIB_FlaK_36_ARTY", _x];
		//_m pushBack ["LIB_21x_SprGr_KwK36_HE","LIB_45x_SprGr_KwK36_HE","LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[800,3000], [800,4000], [800,6000], [800,8000]];
		
		_c pushBack format["%1LIB_FlaK_36_ARTY_w", _x];
		//_m pushBack ["LIB_21x_SprGr_KwK36_HE","LIB_45x_SprGr_KwK36_HE","LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[800,3000], [800,4000], [800,6000], [800,8000]];
		
		_c pushBack format["%1LIB_DAK_FlaK_36_ARTY", _x];
		//_m pushBack ["LIB_21x_SprGr_KwK36_HE","LIB_45x_SprGr_KwK36_HE","LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[800,3000], [800,4000], [800,6000], [800,8000]];


		_c pushBack format["%1LIB_US6_BM13", _x];
		//_m pushBack ["ARTY_40Rnd_120mmHE_BM21","LIB_16Rnd_BM13"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];
		

		_c pushBack format["%1LIB_SdKfz124", _x];
		//_m pushBack ["LIB_Shell_105L28_Gr38_HE","LIB_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[300,2000], [300,3000], [300,4000], [300,5000]];
	} forEach _sid;
};

if(CTI_SPE_DLC >= 1) then {
	_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
	if !(("SPE_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = [""];};
	{
		_c pushBack format["%1SPE_GrW278_1", _x];
		//_m pushBack ["SPE_8Rnd_81mm_FA_Mle_1932_HE","SPE_8Rnd_81mm_FA_Mle_1932_Smoke","SPE_8Rnd_81mm_FA_Mle_1932_Illu","SPE_1Rnd_81mm_FA_Mle_1932_HE","SPE_81mm_FA_Mle_1932_Smoke","SPE_81mm_FA_Mle_1932_Illu"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1SPE_M1_81", _x];
		//_m pushBack ["SPE_8Rnd_81mmHE_M1_M43A1","SPE_8rnd_81mm_M1_M57_SmokeShell","SPE_8Rnd_81mmWP_M1_M57","SPE_1Rnd_81mmHE_M1_M43A1","SPE_81mm_M1_M57_SmokeShell","SPE_1Rnd_81mmWP_M1_M57"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
			
		_c pushBack format["%1SPE_MLE_27_31", _x];
		//_m pushBack ["SPE_8Rnd_81mm_FA_Mle_1932_HE","SPE_8Rnd_81mm_FA_Mle_1932_Smoke","SPE_8Rnd_81mm_FA_Mle_1932_Illu","SPE_1Rnd_81mm_FA_Mle_1932_HE","SPE_81mm_FA_Mle_1932_Smoke","SPE_81mm_FA_Mle_1932_Illu"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1SPE_leFH18", _x];
		//_m pushBack ["SPE_20x_Shell_105L28_Gr38_HE","SPE_8x_Shell_105L28_Gr39HlC_HEAT_Artillery","SPE_20x_Shell_105L28_Gr38_NB","SPE_Shell_105L28_Gr38_HE","SPE_Shell_105L28_Gr39HlC_HEAT","SPE_Shell_105L28_Gr38_NB"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
			
		_c pushBack format["%1SPE_M4A1_T34_Calliope", _x];
		//_m pushBack ["SPE_60Rnd_M8"];
		_b pushBack [5, 10, 20, 30, 40];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
		
		_c pushBack format["%1SPE_M4A3_T34_Calliope", _x];
		//_m pushBack ["SPE_60Rnd_M8"];
		_b pushBack [5, 10, 20, 30, 40];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
	} forEach _sid;
};

//_cntstart = count _c;
//_cntend = count _m;
for [{ _i = 0 }, { _i < count _c }, { _i = _i + 1 }] do { 
	_m pushBack [""];
	_r pushBack [[]];
};

[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";