_side = _this;
_sid = "";

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};

//Defense Guns for Towns
_classes_town = [];
_categories_town = [];
if(CTI_IFA_ADDON > 0) then {
	if !(("LIB_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = [""];};

	if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_classes_town pushBack 		format["%1LIB_FlaK_30_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_AA_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Flakvierling_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Pak40_w", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_AA", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_ARTY", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_Pak40", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//Desert camo active
			//_classes_town pushBack 		format["%1LIB_GER_SearchLight", _sid];
			//_categories_town pushBack 	"View";
				
			_classes_town pushBack 		format["%1LIB_MG34_Lafette_Deployed", _sid];
			_categories_town pushBack 	"MG";
				
			//_classes_town pushBack 		format["%1LIB_MG34_Lafette_low_Deployed", _sid];
			//_categories_town pushBack 	"Defense";
				
			_classes_town pushBack 		format["%1LIB_GrWr34", _sid];
			_categories_town pushBack 	"Mortar";
				
			_classes_town pushBack 		format["%1LIB_GrWr34_g", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1LIB_FlaK_30", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_leFH18", _sid];
			_categories_town pushBack 	"Artillery";
			
			//_classes_town pushBack 		format["%1LIB_leFH18_AT", _sid];
			//_categories_town pushBack 	"AT";
		
			_classes_town pushBack 		format["%1LIB_MG42_Lafette_Deployed", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_MG42_Lafette_low_Deployed", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_AA", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_38", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41", _sid];
			_categories_town pushBack 	"Artillery";
				
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Camo", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Gelbbraun", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_Flakvierling_38", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Pak40", _sid];
			_categories_town pushBack 	"AT";
		};
	};
	if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		
		_classes_town pushBack 		format["%1LIB_SU_SearchLight", _sid];
		_categories_town pushBack 	"View";

		_classes_town pushBack 		format["%1LIB_Maxim_M30_base", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_Maxim_M30_Trench", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_BM37", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
		
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_classes_town pushBack 		format["%1LIB_Zis3_w", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//Desert camo active
			_classes_town pushBack 		format["%1LIB_Zis3", _sid];
			_categories_town pushBack 	"AT";
		};
	};
	if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		
		_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_Zis3", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};
	if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
			
		_classes_town pushBack 		format["%1LIB_Zis3", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};
};
if(CTI_SPE_DLC >= 1) then {
	if !(("SPE_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = [""];};

	if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_classes_town pushBack 		format["%1SPE_MG34_Lafette_Deployed", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1SPE_GrW278_1", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1SPE_Pak40", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1SPE_FlaK_30", _sid];
		_categories_town pushBack 	"AA";
	};
	if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_classes_town pushBack 		format["%1SPE_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1SPE_M1_81", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1SPE_57mm_M1", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1SPE_M45_Quadmount", _sid];
		_categories_town pushBack 	"AA";
	};
};

//--- Defenses management for towns.
if (isServer) then {[_side, _classes_town, _categories_town] Call Compile preprocessFileLineNumbers "Common\Config\Config_Defenses_Towns.sqf"};