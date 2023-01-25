/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer, modifié par tanin

***	Description : 
	Loadouts de la mission

*** this setVariable ["loadout", "sl"];

*** Le format du loadout est un tableau documenté à https://community.bistudio.com/wiki/Unit_Loadout_Array. Il peut être exporté par l'arsenal ACE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* British Armed Forces CUP */

hard_setLoadout = {

	params ["_unit"];
	_loadout = _unit getVariable ["loadout","fsl"];
	
	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "CUP_arifle_M16A4_Aim_Laser";	//weapon class name
		_pwMuzzleAtt      = "";	//muzzle attachment
		_pwPointer        = "CUP_acc_ANPEQ_15_Black"; //pointer
		_pwOptic          = "CUP_optic_CompM2_low";	//optic
		_pwMagFirstAmmo   = ["CUP_30Rnd_556x45_Stanag",30]; //loaded ammo for first muzzle : mag class name + ammo
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
		_handgun          = "CUP_hgun_M9";
		_hgMuzzleAtt      = "";
		_hgPointer        = ""; 			 					
		_hgOptic          = "";
		_hgMagFirstAmmo   = ["CUP_15Rnd_9x19_M9",15];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = selectRandom ["CUP_U_B_USMC_FROG1_WMARPAT","CUP_U_B_USMC_FROG2_WMARPAT","CUP_U_B_USMC_FROG3_WMARPAT","CUP_U_B_USMC_FROG4_WMARPAT"]; //uniform class name
		_itemsU           = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["SmokeShell",2,1]]; //uniform inventory
		//Vest configuration : same structure as uniform
		_vestCls          = "CUP_V_B_Eagle_SPC_Rifleman";
		_itemsV           = [["CUP_30Rnd_556x45_Stanag",10,30],["CUP_HandGrenade_M67",2,1],["CUP_15Rnd_9x19_M9",3,15]];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = "CUP_H_USMC_LWH_NVGMOUNT_WDL";
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
		_primaryWeapon="CUP_arifle_M4A1";
		_pwPointer="";
		_pwOptic="";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];	
		_vestCls="CUP_V_B_Eagle_SPC_Officer";
		_binocCls="CUP_Vector21Nite";
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_M16A4_Aim_Laser";
		_pwPointer="CUP_acc_ANPEQ_15_Black";
		_pwOptic="CUP_optic_CompM2_low";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_vestCls="CUP_V_B_Eagle_SPC_SL";
		_binocCls="Binocular";		
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_M16A4_GL_ACOG_Laser";
		_pwMagSecondAmmo=["CUP_1Rnd_HEDP_M203",1];
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_itemsV=[["CUP_30Rnd_556x45_Stanag",5,30],["CUP_HandGrenade_M67",4,1],["CUP_1Rnd_HEDP_M203",3,1]];
		_vestCls="CUP_V_B_Eagle_SPC_TL";
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
		_primaryWeapon="CUP_arifle_M4A1_Aim";
		_pwMuzzleAtt="";
		_pwPointer="";
		_pwOptic="CUP_optic_CompM2_low";
		_vestCls="CUP_V_B_Eagle_SPC_Corpsman";
		_backpackCls="CUP_B_USMC_AssaultPack_Medic";
		_itemsB=[["Medikit",1],["FirstAidKit",10],["ACE_surgicalKit",1],["ACE_splint",8],["ACE_salineIV",3],["ACE_salineIV_250",2],["ACE_salineIV_500",6],["ACE_tourniquet",4],["ACE_morphine",8],["ACE_epinephrine",6],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_elasticBandage",15],["ACE_quikclot",10]];		
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_M249";
		_pwMuzzleAtt="";
		_pwPointer="";
		_pwOptic="";
		_pwMagFirstAmmo=["CUP_200Rnd_TE4_Green_Tracer_556x45_M249",200];
		_vestCls="CUP_V_B_Eagle_SPC_AR";
		_backpackCls="CUP_B_USMC_MOLLE_AR";
		_itemsB=[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3,200]];		
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_M240";
		_pwMuzzleAtt="";
		_pwPointer="";
		_pwOptic="";
		_pwMagFirstAmmo=["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100];
		_vestCls="CUP_V_B_Eagle_SPC_MG";
		_backpackCls="CUP_B_USMC_MOLLE_MG";
		_itemsB=[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",4,100]];		
		[_unit] call setLoadOut;
	};

	loadout_lat = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_M136";
		_vestCls="CUP_V_B_Eagle_SPC_AT";		
		[_unit] call setLoadOut;
	};

	loadout_at = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_Mk153Mod0_SMAWOptics";
		_swOptic="CUP_optic_SMAW_Scope";
		_swMagFirstAmmo=["CUP_SMAW_HEAA_M",1];
		_swMagSecondAmmo=["CUP_SMAW_Spotting",5];
		_vestCls="CUP_V_B_Eagle_SPC_AT";
		_itemsV=[["CUP_HandGrenade_M67",2,1],["CUP_SMAW_Spotting",1,5]];
		_backpackCls="CUP_B_USMC_AssaultPack_SMAW";
		_itemsB=[["CUP_SMAW_HEDP_M",1,1],["CUP_SMAW_HEAA_M",1,1]];			
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_M16A4_GL_ACOG_Laser";
		_pwMagSecondAmmo=["CUP_1Rnd_HEDP_M203",1];
		_vestCls="CUP_V_B_Eagle_SPC_GL";
		_itemsV=[["CUP_30Rnd_556x45_Stanag",4,30],["CUP_1Rnd_HEDP_M203",7,1]];
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];
		_primaryWeapon="CUP_srifle_DMR_LeupoldMk4";
		_pwMuzzleAtt="";
		_pwPointer="";
		_pwOptic="CUP_optic_LeupoldMk4";
		_pwMagFirstAmmo=["CUP_20Rnd_762x51_DMR",20];
		_pwBipod="CUP_bipod_Harris_1A2_L_BLK";
		_itemsU= _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1],["ACE_RangeCard",1]];
		_itemsV=[["CUP_20Rnd_762x51_DMR",7,20],["CUP_HandGrenade_M67",2,1]];
		_headgear="CUP_H_USMC_LWH_ESS_HS_WDL";
		_binocCls="Binocular";		
		[_unit] call setLoadOut;
	};

	loadout_explo = //
	{
		params["_unit"];
		_vestCls="CUP_V_B_Eagle_SPC_Corpsman";
		_backpackCls="CUP_B_USMC_MOLLE_Exp";
		_itemsB=[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_M26_Clacker",1],["CUP_PipeBomb_M",1,1],["APERSBoundingMine_Range_Mag",2,1],["APERSMine_Range_Mag",5,1]];		
		[_unit] call setLoadOut;
	};

/* Add specific loadout per role by assigning an item/asset to the right variable */

