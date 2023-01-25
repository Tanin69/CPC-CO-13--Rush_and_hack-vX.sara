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

/* Czech Spec Ops */

hard_setLoadout = {

	params ["_unit"];
	_loadout = _unit getVariable ["loadout","fsl"];

	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "CUP_CZ_BREN2_556_14";	//weapon class name
		_pwMuzzleAtt      = "";	//muzzle attachment
		_pwPointer        = "acc_pointer_IR"; //pointer
		_pwOptic          = "";	//optic
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
		_handgun="CUP_hgun_Phantom_Flashlight";
		_hgMuzzleAtt="";
		_hgPointer="CUP_acc_CZ_M3X";
		_hgOptic="";
		_hgMagFirstAmmo=["CUP_18Rnd_9x19_Phantom",18];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = selectRandom ["CUP_U_B_CZ_WDL_Kneepads","CUP_U_B_CZ_WDL_Kneepads_Gloves","CUP_U_B_CZ_WDL_NoKneepads","CUP_U_B_CZ_WDL_Tshirt","CUP_U_B_CZ_WDL_Kneepads_Gloves"]; //uniform class name
		_itemsU           = [["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_EarPlugs",1],["ACE_tourniquet",1],["ACE_splint",1],["ACE_morphine",1]]; //uniform inventory
		//Vest configuration : same structure as uniform
		_vestCls          = "CUP_V_CZ_NPP2006_ok_black";
		_itemsV           = [["CUP_18Rnd_9x19_Phantom",4,18],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["CUP_30Rnd_556x45_Stanag",10,30]];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = selectRandom ["CUP_H_CZ_Helmet04","CUP_H_CZ_Helmet03"];
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
		_items            = ["ItemMap","","","ItemCompass","ItemWatch"];
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
		_unit setUnitLoadout _loArray;
	};
/* Helper private function to esay set loadout */
/* Add specific loadout per role by assigning an item/asset to the right variable */

	loadout_off = //
	{
		params["_unit"];
		_primaryWeapon="CUP_CZ_BREN2_556_11";
		_pwOptic="CUP_optic_AIMM_ZDDOT_BLK";		
		_itemsU  = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_vestCls = "CUP_V_CZ_NPP2006_co_vz95";
		_itemsV  = [["CUP_18Rnd_9x19_Phantom",4,18],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",5,30]];
		_binocCls= "CUP_Vector21Nite";
		_backpackCls="CUP_B_ACRScout_m95_CZ805B";
		_itemsB=[["CUP_30Rnd_556x45_Stanag",6,30],["CUP_H_CZ_Helmet04",1]];
		_headgear="CUP_H_CZ_Hat01";		
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_CZ_BREN2_556_11";
		_pwOptic="CUP_optic_AIMM_ZDDOT_BLK";		
		_itemsU  = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1]];
		_vestCls = "CUP_V_CZ_NPP2006_co_vz95";
		_itemsV  = [["CUP_18Rnd_9x19_Phantom",4,18],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",5,30]];
		_binocCls= "CUP_Vector21Nite";
		_backpackCls="CUP_B_ACRScout_m95_CZ805B";
		_itemsB=[["CUP_30Rnd_556x45_Stanag",6,30],["CUP_H_CZ_Helmet04",1]];
		_headgear="CUP_H_CZ_Cap_rgr";
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_CZ_BREN2_556_11_GL_AIMMZDDot_Laser";
		_pwOptic="CUP_optic_AIMM_ZDDOT_BLK";
		_pwMagSecondAmmo=["CUP_1Rnd_HE_M203",1];		
		_itemsU  = _itemsU + [["ACRE_PRC148",1]];
		_vestCls = "CUP_V_CZ_NPP2006_co_vz95";
		_itemsV=[["ACRE_PRC343",1],["CUP_30Rnd_556x45_Stanag",6,30],["16Rnd_9x21_Mag",3,17],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1]];
		_binocCls= "Binocular";
		_backpackCls="CUP_B_ACRScout_m95_CZ805B";
		_itemsB=[["CUP_30Rnd_556x45_Stanag",6,30],["CUP_H_CZ_Helmet04",1],["CUP_1Rnd_HE_M203",10,1]];
		_headgear="CUP_H_CZ_Hat03";		
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
		_backpackCls="B_ViperHarness_blk_F";
		_itemsB=[["ACE_surgicalKit",1],["ACE_splint",8],["ACE_salineIV",3],["ACE_salineIV_250",2],["ACE_salineIV_500",6],["ACE_tourniquet",4],["ACE_morphine",8],["ACE_epinephrine",6],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_elasticBandage",15],["ACE_quikclot",10]];
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];
		_pwMagFirstAmmo=["CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_ar15",100];
		_itemsV=[["CUP_18Rnd_9x19_Phantom",4,18],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_ar15",4,100]];		
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];
		_primaryWeapon="CUP_lmg_M60E4";
		_pwMagFirstAmmo=["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100];
		_itemsV=[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",3,100],["SmokeShellRed",1,1]];
		_backpackCls="CUP_B_ACRPara_m95_M60";
		_itemsB=[["ACE_fieldDressing",4],["ACRE_PRC343",1],["ACE_EarPlugs",1],["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",3,100]];		
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
		_secondaryWeapon="CUP_launch_MAAWS_Scope";
		_swOptic="CUP_optic_MAAWS_Scope";
		_swMagFirstAmmo=["CUP_MAAWS_HEAT_M",1];
		_backpackCls="CUP_B_ACRScout_m95_MAAWS";
		_itemsB=[["CUP_MAAWS_HEDP_M",1,1]];		
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];
		_primaryWeapon="CUP_CZ_BREN2_556_11_GL_ZDDot_Laser";
		_pwOptic="CUP_optic_ZDDot";
		_pwMagSecondAmmo=["CUP_1Rnd_HEDP_M203",1];
		_itemsV=[["CUP_30Rnd_556x45_Stanag",6,30],["16Rnd_9x21_Mag",3,17],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1]];
		_backpackCls="CUP_B_ACRScout_m95_CZ805B";
		_itemsB=[["CUP_30Rnd_556x45_Stanag",4,30],["CUP_1Rnd_HEDP_M203",10]];		
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];
		_primaryWeapon="CUP_arifle_HK417_20";
		_pwPointer="acc_pointer_IR";
		_pwOptic="optic_DMS";
		_pwMagFirstAmmo=["CUP_20Rnd_762x51_HK417",20];
		_itemsU  = _itemsU + [["ACRE_PRC148",1],["ACE_MicroDAGR",1],["ACE_RangeCard",1]];
		_itemsV=[["CUP_18Rnd_9x19_Phantom",4,18],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["CUP_20Rnd_TE1_Green_Tracer_762x51_HK417",2,20],["CUP_20Rnd_762x51_HK417",5,20],["ACE_RangeCard",1]];		
		[_unit] call setLoadOut;
	};

	loadout_explo = //
	{
		params["_unit"];
		_backpackCls="CUP_B_ACRPara_m95_Explosives";
		_itemsB=[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_M26_Clacker",1],["CUP_PipeBomb_M",1,1],["APERSBoundingMine_Range_Mag",2,1],["APERSMine_Range_Mag",5,1]];
		[_unit] call setLoadOut;
	};


/* Add specific loadout per role by assigning an item/asset to the right variable */

