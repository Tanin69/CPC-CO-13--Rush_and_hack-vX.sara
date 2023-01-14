/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer, modifié par tanin

***	Description : 
	Loadouts de la mission

*** Utilisation :
	1/ Copiez les fichiers 'loadout.sqf', 'initPlayerLocal.sqf' et 'inventory_briefing.sqf' dans le dossier de votre mission.
	2/ Modifiez le fichier loadout.sqf à votre convenance.
		- Vous pouvez creer vos loadouts dans l'arsenal virtuel de Arma 3, les exporter avec la commande ingame et les coller dans le script comme ci-dessous.
		- Une fois ceci fait, remplacez tout les 'this' par '_unit'.
	3/ Dans l'éditeur, placez la commande ci-dessous dans les init d'unités jouables pour leur attribuer le loadout souhaité :
		this setVariable ["loadout", "sl"];

*** Le format du loadout est un tableau documenté à https://community.bistudio.com/wiki/Unit_Loadout_Array. Il peut être exporté par l'arsenal ACE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* British Armed Forces CUP */

hard_setLoadout = {

	_unit = _this select 0;
	_loadout = _unit getVariable ["loadout","fsl"];
	
	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "CUP_arifle_L85A2_G";     			//weapon class name
		_pwMuzzleAtt      = "";	                      			//muzzle attachment
		_pwPointer        = ""; 			 					//pointer
		_pwOptic          = "cup_optic_elcan_reflex"; 			//optic
		_pwMagFirstAmmo   = ["CUP_30Rnd_556x45_Stanag_L85",30]; //loaded ammo for first muzzle : mag class name + ammo
		_pwMagSecondAmmo  = [];									//loaded ammo for second muzzle : mag class name + ammo
		_pwBipod          = "";		  							//bipod
		//Secondary weapon configuration : same structure as primary weapon
		_secondaryWeapon  = "";
		_swMuzzleAtt      = "";
		_swPointer        = ""; 			 					
		_swOptic          = "";
		_swMagFirstAmmo   = [];
		_swMagSecondAmmo  = [];
		_swBipod          = "";
		//Handgun weapon configuration : same structure as primary weapon
		_handgun          = "CUP_hgun_Glock17_blk";
		_hgMuzzleAtt      = "";
		_hgPointer        = ""; 			 					
		_hgOptic          = "";
		_hgMagFirstAmmo   = ["CUP_17Rnd_9x19_glock17",17];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = selectRandom ["CUP_U_B_BAF_DPM_UBACSLONG","CUP_U_B_BAF_DPM_UBACSLONG_Gloves","CUP_U_B_BAF_DPM_UBACSLONGKNEE","CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves","CUP_U_B_BAF_DPM_UBACSROLLED","CUP_U_B_BAF_DPM_UBACSTSHIRTKNEE"];//uniform class name
		_itemsU           = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACRE_PRC343",1],["ACE_CableTie",1]]; //uniform inventory
		//Vest configuration : same structure as uniform
		_vestCls          = "CUP_V_B_BAF_DPM_Osprey_Mk3_Empty";
		_itemsV           = [["CUP_HandGrenade_L109A1_HE",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag_L85",10,30],["CUP_17Rnd_9x19_glock17",2,17]];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = "CUP_H_BAF_DPM_Mk6_EMPTY";
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
/* Helper private function to esay set loadout */

/* Add specific loadout per role by assigning an item/asset to the right variable */

	loadout_off = //
	{
		params["_unit"];
		_headgear="CUP_H_BAF_PARA_PRROVER_BERET";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_microDAGR",1]];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Officer";
		_backpackCls="B_AssaultPack_rgr";
		_itemsB=[["CUP_H_BAF_DPM_Mk6_NETTING_PRR",1]];
		_binocCls="CUP_Vector21Nite";
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Officer";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_microDAGR",1]];
		_binocCls="Binocular";
		_headgear="CUP_H_BAF_DPM_Mk6_EMPTY_PRR";
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_L85A2_GL_Elcan_Laser";
		_pwMagSecondAmmo=["CUP_1Rnd_HE_M203",1];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Grenadier";
		_itemsU = _itemsU + [["ACRE_PRC148",1]];
		_backpackCls="CUP_B_Motherlode_MTP";
		_itemsB = [["CUP_1Rnd_HE_M203",10,1],["CUP_1Rnd_SmokeGreen_M203",1,1],["CUP_1Rnd_SmokeRed_M203",1,1],["CUP_HandGrenade_L109A2_HE",3,1]];
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
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Medic";
		_backpackCls="CUP_B_Motherlode_Medic_MTP";
		_itemsB=[["Medikit",1],["FirstAidKit",15],["ACE_surgicalKit",1],["ACE_splint",8],["ACE_salineIV",3],["ACE_salineIV_250",2],["ACE_salineIV_500",6],["ACE_tourniquet",4],["ACE_morphine",8],["ACE_epinephrine",6],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_elasticBandage",15],["ACE_quikclot",10]];
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_minimipara";	
		_pwMagFirstAmmo=["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman";
		_itemsV=[["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",4,100]];
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_L7A2";
		_pwMagFirstAmmo=["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman";
		_itemsV=[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,100]];
		_backpackCls="B_AssaultPack_rgr";
		_itemsB=[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",2,100]];
		[_unit] call setLoadOut;
	};

	loadout_lat = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_M136";
		[_unit] call setLoadOut;
	};

	loadout_at = //
	{
		params["_unit"];
		_secondaryWeapon="CUP_launch_NLAW";
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_L85A2_GL_Elcan_Laser";
		_pwMagSecondAmmo=["CUP_1Rnd_HE_M203",1];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Grenadier";
		_itemsV = _itemsV + [["CUP_1Rnd_HE_M203",10,1],["CUP_HandGrenade_L109A2_HE",5,1]];
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];
		_primaryWeapon="CUP_srifle_L129A1_HG_TA648_Bipod_w";
		_pwMuzzleAtt="";
		_pwPointer="CUP_acc_LLM";
		_pwOptic="CUP_optic_ACOG_TA648_308_RDS_Wdl";
		_pwMagFirstAmmo=["CUP_20Rnd_762x51_L129_M",20];
		_pwMagSecondAmmo=[];
		_pwBipod="CUP_bipod_Harris_1A2_L_BLK";
		_handgun="CUP_hgun_Glock17_blk";
		_hgMagFirstAmmo=["CUP_17Rnd_9x19_glock17",17];
		_vestCls="CUP_V_B_BAF_DPM_Osprey_Mk3_Scout";
		_itemsV=[["CUP_HandGrenade_L109A1_HE",1,1],["SmokeShell",3,1],["CUP_17Rnd_9x19_glock17",3,17],["CUP_20Rnd_762x51_L129_M",6,20]];
		_binocCls="CUP_Vector21Nite";
		[_unit] call setLoadOut;
	};

/* Add specific loadout per role by assigning an item/asset to the right variable */

