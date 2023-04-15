/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer, modifié par tanin

***	Description : 
	Loadouts de la mission

*** Utilisation :
		this setVariable ["loadout", "sl"];

*** Le format du loadout est un tableau documenté à https://community.bistudio.com/wiki/Unit_Loadout_Array. Il peut être exporté par l'arsenal ACE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Russes VDV modernes */

hard_setLoadout = {

	params ["_unit"];
	_loadout = _unit getVariable ["loadout","fsl"];
	
	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "CUP_arifle_AK74M_1p63";
		_pwMuzzleAtt      = "";	//muzzle attachment
		_pwPointer        = ""; //pointer
		_pwOptic          = "CUP_optic_1p63";
		_pwMagFirstAmmo   = ["CUP_30Rnd_545x39_AK74M_M",30];
		_pwMagSecondAmmo  = [];	//loaded ammo for second muzzle : mag class name + ammo
		_pwBipod          = "";	//bipod
		//Secondary weapon configuration : same structure as primary weapon
		_secondaryWeapon  = "";
		_swMuzzleAtt      = "";
		_swPointer        = ""; 			 					
		_swOptic          = "";
		_swMagFirstAmmo   = [];
		_swMagSecondAmmo  = [];
		_swBipod          = "";
		//Handgun weapon configuration : same structure as primary weapon
		_handgun          = "hgun_Rook40_F";
		_hgMuzzleAtt      = "";
		_hgPointer        = ""; 			 					
		_hgOptic          = "";
		_hgMagFirstAmmo   = ["16Rnd_9x21_Mag",17];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = selectRandom ["CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_gloves_pads","CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_rolled_up_gloves_pads"]; //uniform class name
		_itemsU           = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACRE_PRC343",1],["ACE_CableTie",1],["SmokeShell",2,1],["16Rnd_9x21_Mag",2,17]];
		//Vest configuration : same structure as uniform
		_vestCls          = "CUP_Vest_RUS_6B45_Sh117_Nut";
		_itemsV           = [["CUP_30Rnd_545x39_AK74M_M",10,30],["CUP_HandGrenade_RGD5",2,1]];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = selectRandom ["CUP_H_RUS_6B47_v2_GogglesUp_Summer","CUP_H_RUS_6B47_v2_GogglesDown_Summer","CUP_H_RUS_6B47_v2_GogglesClosed_Summer","CUP_H_RUS_6B47_v2_Summer"];
		_facewear         = "";
		//Binocular config : same structure as weapons !
		_binocCls         = "";
		_binocMuzzleAtt   = "";
		_binocPointer     = ""; 			 					
		_binocOptic       = "";
		_binocMagFirstAmmo = [];
		_binocMagSecondAmmo = [];
		_binocBipod       = "";
		//attached items
		_items            = ["ItemMap","","","ItemCompass","ItemWatch",""];
	/* Change here for common loadout */

	/* Call loadout per role. Don't change unless you want to add a new role */
		switch _loadout do 
		{
			case "off"  : {[_unit] call loadout_off};
			case "sl"   : {[_unit] call loadout_sl};
			case "tl"   : {[_unit] call loadout_tl};
			case "fsl"  : {[_unit] call loadout_fsl};
			case "medic": {[_unit] call loadout_medic};
			case "ar"   : {[_unit] call loadout_ar};
			case "mg"   : {[_unit] call loadout_mg};
			case "lat"  : {[_unit] call loadout_lat};
			case "at"   : {[_unit] call loadout_at};
			case "gl"   : {[_unit] call loadout_gl};
			case "tp"   : {[_unit] call loadout_tp};
			case "explo": {[_unit] call loadout_explo};
		};
	/* call loadout per role. Don't change unless you want to add a new role */

};

/* Helper function to easy set loadout */
	setLoadOut = {
		params["_unit"];
		_pwArray = [_primaryWeapon,_pwMuzzleAtt,_pwPointer,_pwOptic,_pwMagFirstAmmo,_pwMagSecondAmmo,_pwBipod];
		_swArray = [_secondaryWeapon,_swMuzzleAtt,_swPointer,_swOptic,_swMagFirstAmmo,_swMagSecondAmmo,_swBipod];
		_hgArray = [_handgun,_hgMuzzleAtt,_hgPointer,_hgOptic,_hgMagFirstAmmo,_hgMagSecondAmmo,_hgBipod];
		_uniformArray = [_uniformCls] + [_itemsU];
		_vestArray        = [_vestCls] + [_itemsV];
		_backpackArray    = [_backpackCls] + [_itemsB];
		_binocArray       = [_binocCls,_binocMuzzleAtt,_binocPointer,_binocOptic,_binocMagFirstAmmo,_binocMagSecondAmmo,_binocBipod];
		{if ((_x#0) isEqualTo "") then {_x resize 0;};} forEach [_pwArray,_swArray,_hgArray,_uniformArray,_vestArray,_backpackArray, _binocArray];
		_loArray = [_pwArray,_swArray,_hgArray,_uniformArray,_vestArray,_backpackArray,_headgear,_facewear,_binocArray,_items];
		//copyToClipboard str _loArray;
		_unit setUnitLoadout _loArray;
	};
/* Helper function to esay set loadout */

/* Add specific loadout per role by assigning an item/asset to the right variable */

	loadout_off = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_AKS74U";
		_pwMuzzleAtt="";
		_pwPointer="";
		_pwOptic="";
		_pwMagFirstAmmo=["CUP_30Rnd_545x39_AK74_plum_M",30];
		_itemsU=_itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_itemsV=[["CUP_30Rnd_545x39_AK74_plum_M",8,30],["CUP_HandGrenade_RGD5",2,1]];
		_binocCls="RangeFinder";		
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_AK74M_pso_open";
		_pwOptic="CUP_optic_PSO_1_AK_open";
		_itemsU=_itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_binocCls="Binocular";		
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_AK74M_GL_pso_open";
		_pwOptic="CUP_optic_PSO_1_AK_open";
		_pwMagSecondAmmo=["CUP_1Rnd_HE_GP25_M",1];
		_itemsU=_itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_itemsV=[["CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M",7,30],["CUP_HandGrenade_RGD5",2,1],["CUP_1Rnd_HE_GP25_M",9,1]];
		_binocCls="Binocular";		
		[_unit] call setLoadOut;
	};

	loadout_fsl = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};
	loadout_medic = //
	{
		params["_unit"];
		_backpackCls="CUP_O_RUS_Patrol_bag_Summer_Medic";
		_itemsB=[["Medikit",1],["FirstAidKit",10],["ACE_surgicalKit",1],["ACE_splint",8],["ACE_salineIV",3],["ACE_salineIV_250",2],["ACE_salineIV_500",6],["ACE_tourniquet",4],["ACE_morphine",8],["ACE_epinephrine",6],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_elasticBandage",15],["ACE_quikclot",10]];		
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_RPK74M_1p78";
		_pwOptic="CUP_optic_PechenegScope";
		_pwMagFirstAmmo=["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M",45];
		_itemsV=[["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M",9,45],["CUP_HandGrenade_RGD5",2,1]];
		_binocCls="Binocular";	
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_Pecheneg_PScope";
		_pwOptic="CUP_optic_PechenegScope";
		_pwMagFirstAmmo=["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",100];
		_vestCls="CUP_Vest_RUS_6B45_Sh117_PKP";
		_itemsV=[["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",3,100],["CUP_HandGrenade_RGD5",2,1]];		
		[_unit] call setLoadOut;
	};

	loadout_lat = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_RPG26";		
		[_unit] call setLoadOut;
	};

	loadout_at = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_RPG7V_PGO7V3";
		_swOptic="CUP_optic_PGO7V3";
		_swMagFirstAmmo=["CUP_PG7VL_M",1];
		_backpackCls="CUP_B_RUS_Pack_AT";
		_itemsB=[["CUP_PG7VL_M",1,1],["CUP_PG7VR_M",1,1]];		
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_AK74M_GL_1p63";
		_pwOptic="CUP_optic_1p63";
		_pwMagSecondAmmo=["CUP_1Rnd_HE_GP25_M",1];
		_itemsV=[["CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M",7,30],["CUP_HandGrenade_RGD5",2,1],["CUP_1Rnd_HE_GP25_M",12,1]];		
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];
		_primaryWeapon="CUP_srifle_SVD_pso";
		_pwOptic="CUP_optic_PSO_1";
		_pwMagFirstAmmo=["CUP_10Rnd_762x54_SVD_M",10];
		_itemsU=_itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1],["ACE_RangeCard",1]];
		_itemsV=[["CUP_10Rnd_762x54_SVD_M",14,10],["CUP_HandGrenade_RGD5",2,1]];		
		[_unit] call setLoadOut;
	};

	loadout_explo = //
	{
		params["_unit"];
		_backpackCls="CUP_O_RUS_Patrol_bag_Summer_Shovel_Exp";
		_itemsB=[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_M26_Clacker",1],["CUP_PipeBomb_M",1,1],["APERSBoundingMine_Range_Mag",2,1],["APERSMine_Range_Mag",5,1]];		
		[_unit] call setLoadOut;
	};

/* Add specific loadout per role by assigning an item/asset to the right variable */

