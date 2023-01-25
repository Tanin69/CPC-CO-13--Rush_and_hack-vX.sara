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
		this setVariable ["loadout", "cc_sl"];

*** Le format du loadout est un tableau documenté à https://community.bistudio.com/wiki/Unit_Loadout_Array. Il peut être exporté par l'arsenal ACE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Armée de terre française */

hard_setLoadout = {

	params ["_unit"];
	_loadout = _unit getVariable ["loadout","fsl"];
	
	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "CUP_Famas_F1";	//weapon class name
		_pwMuzzleAtt      = "";	//muzzle attachment
		_pwPointer        = ""; //pointer
		_pwOptic          = "";	//optic
		_pwMagFirstAmmo   = ["CUP_25Rnd_556x45_Famas",25]; //loaded ammo for first muzzle : mag class name + ammo
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
		_handgun          = "CUP_hgun_Glock17_tan";
		_hgMuzzleAtt      = "";
		_hgPointer        = ""; 			 					
		_hgOptic          = "";
		_hgMagFirstAmmo   = ["CUP_17Rnd_9x19_glock17",17];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = selectRandom ["CUP_U_B_BDUv2_CEU","CUP_U_B_BDUv2_dirty_CEU","CUP_U_B_BDUv2_gloves_CEU","CUP_U_B_BDUv2_gloves_dirty_CEU","CUP_U_B_BDUv2_roll2_CEU","CUP_U_B_BDUv2_roll2_dirty_CEU","CUP_U_B_BDUv2_roll2_gloves_CEU","CUP_U_B_BDUv2_roll2_gloves_dirty_CEU","CUP_U_B_BDUv2_roll_CEU","CUP_U_B_BDUv2_roll_dirty_CEU","CUP_U_B_BDUv2_roll_gloves_CEU","CUP_U_B_BDUv2_roll_gloves_dirty_CEU"];; //uniform class name
		_itemsU           = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["ACE_CableTie",1],["SmokeShell",2,1]]; //uniform inventory
		//Vest configuration : same structure as uniform
		_vestCls          = "CUP_V_B_PASGT_CCE";
		_itemsV           = [["HandGrenade",2,1],["CUP_25Rnd_556x45_Famas",12,25]];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = selectRandom ["CUP_H_USArmy_Helmet_ECH2_GREEN","CUP_H_USArmy_Helmet_ECH1_GREEN"];
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

/* Helper private function to easy set loadout */
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
		_primaryWeapon="CUP_Famas_F1_Rail";
		_pwOptic="cup_optic_compm2_low";
		_headgear="CUP_H_USA_Cap_M81";
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_backpackCls="B_AssaultPack_wdl_F";
		_itemsB=[["CUP_H_USArmy_Helmet_ECH2_GREEN",1]];
		_binocCls= "CUP_Vector21Nite";
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_Famas_F1_Rail";
		_pwOptic="cup_optic_compm2_low";
		_headgear="CUP_H_USA_Cap_M81";
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_backpackCls="B_AssaultPack_wdl_F";
		_itemsB=[["CUP_H_USArmy_Helmet_ECH2_GREEN",1]];
		_binocCls= "CUP_Vector21Nite";
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];
		_primaryWeapon = "CUP_Famas_F1_Rail";
		_pwOptic = "cup_optic_compm2_low";
		_headgear="CUP_H_FR_PRR_BoonieWDL";
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_backpackCls="B_AssaultPack_wdl_F";
		_binocCls="Binocular";
		_itemsB=[["CUP_H_USArmy_Helmet_ECH2_GREEN",1]];
		_itemsU = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
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
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_backpackCls="B_Kitbag_sgg";
		_itemsB=[["ACE_surgicalKit",1],["ACE_splint",8],["ACE_salineIV",3],["ACE_salineIV_250",2],["ACE_salineIV_500",6],["ACE_tourniquet",4],["ACE_morphine",8],["ACE_epinephrine",6],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_elasticBandage",15],["ACE_quikclot",10]];
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_m249_pip3";
		_pwMagFirstAmmo=["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200];
		_itemsV=[["HandGrenade",2,1]];
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_backpackCls="B_AssaultPack_wdl_F";
		_itemsB=[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",4,200]];
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_FNMAG_RIS_modern";
		_pwMagFirstAmmo=["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",100];		
		_itemsV=[["HandGrenade",2,1]];
		_vestCls="CUP_V_B_PASGT_no_bags_CCE";
		_backpackCls="B_AssaultPack_wdl_F";
		_itemsB=[["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",4,100]];
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
		_secondaryWeapon="CUP_launch_Javelin";
		_swMagFirstAmmo=["CUP_Javelin_M",1];		
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];
		_backpackCls="B_AssaultPack_wdl_F";
		_itemsB=[["HandGrenade",6,1],["ACE_HandFlare_Green",6,1],["SmokeShell",4,1]];		
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];		
		_primaryWeapon="CUP_arifle_HK417_20_Scope";
		_pwOptic="CUP_optic_SB_11_4x20_PM";
		_pwMagFirstAmmo=["CUP_20Rnd_762x51_HK417",20];
		_itemsU=_itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1],["ACE_RangeCard",1]];
		_itemsV=[["HandGrenade",2,1],["CUP_20Rnd_762x51_HK417",8,20]];
		_binocCls="CUP_Vector21Nite";
		[_unit] call setLoadOut;
	};
	
	loadout_explo = //
	{
		params["_unit"];
		_backpackCls="B_Kitbag_sgg";
		_itemsB=[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_M26_Clacker",1],["CUP_PipeBomb_M",1,1],["APERSBoundingMine_Range_Mag",2,1],["APERSMine_Range_Mag",5,1]];
		[_unit] call setLoadOut;
	};


/* Add specific loadout per role by assigning an item/asset to the right variable */

