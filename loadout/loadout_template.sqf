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

/* British Armed Forces CUP */

hard_setLoadout = {

	params ["_unit"];
	_loadout = _unit getVariable ["loadout","fsl"];
	
	/* Change here for common loadout */
		//Primary weapon configuration
		_primaryWeapon    = "";	//weapon class name
		_pwMuzzleAtt      = "";	//muzzle attachment
		_pwPointer        = ""; //pointer
		_pwOptic          = "";	//optic
		_pwMagFirstAmmo   = []; //loaded ammo for first muzzle : mag class name + ammo
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
		_handgun          = "";
		_hgMuzzleAtt      = "";
		_hgPointer        = ""; 			 					
		_hgOptic          = "";
		_hgMagFirstAmmo   = [];
		_hgMagSecondAmmo  = [];
		_hgBipod          = "";
		//Uniform configuration
		_uniformCls       = []; //uniform class name
		_itemsU           = []; //uniform inventory
		//Vest configuration : same structure as uniform
		_vestCls          = "";
		_itemsV           = [];
		//Backpack configuration : same structure as uniform
		_backpackCls      = "";
		_itemsB           = [];
		//Other configuration
		_headgear         = "";
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
		_items            = [];
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
		[_unit] call setLoadOut;
	};

	loadout_sl = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_tl = //
	{
		params["_unit"];		
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
		[_unit] call setLoadOut;
	};

	loadout_ar = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_mg = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_lat = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_at = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_gl = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_tp = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

	loadout_explo = //
	{
		params["_unit"];		
		[_unit] call setLoadOut;
	};

/* Add specific loadout per role by assigning an item/asset to the right variable */

