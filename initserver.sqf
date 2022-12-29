private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;

/* Build de la zone */

	execVM "build.sqf"

/* Build de la zone */

/* Paramétrage des armes fixes */

	/* Alimentation manuelle des munitions */

		/*
		Réglages de ACE Crew Served Weapons :
			-> Advanced Assembly : true (autant aller jusqu'au bout du truc)
			-> Ammo handling : player only ou player and AI
		Penser également à paramétrer ACE Artillery / mk6 mortar :
			-> Allow mk6 computer : false (évidemment)
			-> Use ammuniation handling : true
		Pour bénéficier de CSW, il faut utiliser les armes CSW de l'arsenal !
		*/

		/*
		//Fonction pour créer et charger des caisses d'obus
		private _create_load_crate = {
			params ["_crateCls", "_customName", "_magCls", "_nbMag", "_ammoVeh", "_nb"];
			for "_i" from 1 to _nb do {
				private _crate = createVehicle [_crateCls, [0,0,0]];
				_crate setVariable ["ace_cargo_customName", _customName, true];
				[_crate, [[_magCls, _nbMag]]] call int_fnc_addCargo;
				[_crate, 1] call ace_cargo_fnc_setSize;
				[_crate, _ammoVeh, true] call ace_cargo_fnc_loadItem;
			};
		};

		//Appel de la fonction
		["Box_EAF_WpsSpecial_F", ">>HE<<", "ACE_1Rnd_82mm_Mo_HE", 32, ammo_veh, 6] call _create_load_crate;
		["Box_NATO_WpsSpecial_F", ">>Smoke<<", "ACE_1Rnd_82mm_Mo_Smoke", 16, ammo_veh, 3] call _create_load_crate;
		["Box_IND_WpsSpecial_F", ">>Flare<<", "ACE_1Rnd_82mm_Mo_Illum", 16, ammo_veh, 3] call _create_load_crate;
		["Box_T_NATO_WpsSpecial_F", ">>Laser Guided<<", "ACE_1Rnd_82mm_Mo_HE_LaserGuided", 16, ammo_veh, 2] call _create_load_crate; // Cette munition semble buggée :-(
		*/
	
	/* Alimentation manuelle des munitions */

	/* Rechargement des munitions via ACE Logistics */

		/*
		Réglages de ACE Crew Served Weapons :
			-> Ammo handling : disabled
		Réglages de ACE Artillery / mk6 mortar :
			-> Allow mk6 computer : false (évidemment)
			-> Use ammuniation handling : false
		Réglages de ACE Logistics / Rearm :
			-> Rearm amount : Entire Magazine
			-> Ammunition supply : Only specific Magazines
		Attention : il ne faut pas utiliser les CSW de l'arsenal, mais bien les armes vanilla !
		*/
/*
		//Chargement du véhicule
		private _veh = ammo_veh;
		//144 obus HE
		for "_i" from 1 to 18 do
		{  
			[_veh, "8Rnd_82mm_Mo_shells"] call ace_rearm_fnc_addMagazineToSupply;
		};
		//48 obus Fumigènes
		for "_i" from 1 to 6 do
		{  
			[_veh, "8Rnd_82mm_Mo_Smoke_white"] call ace_rearm_fnc_addMagazineToSupply;
		};
		//24 obus éclairants
		for "_i" from 1 to 3 do
		{  
			[_veh, "8Rnd_82mm_Mo_Flare_white"] call ace_rearm_fnc_addMagazineToSupply;
		};
		/*
		// Pour une raison inconnue, ces munitions n'apparaissent pas dans le menu ACE de rechargement...
		//16 obus Guidage Laser
		for "_i" from 1 to 2 do
		{  
			[_veh, "8Rnd_82mm_Mo_LG"] call ace_rearm_fnc_addMagazineToSupply;
		};
		//16 obus HE Guidage IR (non testés)
		for "_i" from 1 to 2 do
		{  
			[_veh, "8Rnd_82mm_Mo_guided"] call ace_rearm_fnc_addMagazineToSupply;
		};
		*/
/*
		//Paramétrage des mortiers. Pour pouvoir gérer leur chargement initial, il faut les créer et les charger "montés" dans le véhicule
		//Fonction pour créer et charger des caisses d'obus
		private _create_load_mortars = {
			params [
				"_mortarCls",
				"_ammoVeh",
				["_mortarLoadOut",[]]
			];
			private _mortar = createVehicle [_mortarCls, [0,0,0]];
			{_mortar removeMagazine _x} forEach magazines _mortar;
			private _nbMag = count _mortarLoadOut;

			if (_nbMag isNotEqualTo 0) then {
				private _i = 1;
				for "_i" from 1 to _nbMag do {
					for "_j" from 1 to (_mortarLoadOut#(_i-1)#1) do {
						_mortar addMagazineTurret [_mortarLoadOut#(_i-1)#0,[0],8];
					};
				};
			};			
			[_mortar, _ammoVeh, true] call ace_cargo_fnc_loadItem;
		};

		["B_G_Mortar_01_F", _veh, [["8Rnd_82mm_Mo_shells", 2]]] call _create_load_mortars;
		["B_G_Mortar_01_F", _veh, [["8Rnd_82mm_Mo_shells", 2]]] call _create_load_mortars;

		//On ajoute une M2...
		["CUP_B_M2StaticMG_GER_Fleck", _veh, true] call ace_cargo_fnc_loadItem;
		//...et des munitions pour la M2 dans le camion 
		for "_i" from 1 to 20 do
		{
			[_veh, "CUP_100Rnd_TE4_Red_Tracer_127x99_M"] call ace_rearm_fnc_addMagazineToSupply;
		};

	/* Rechargement des munitions via ACE Logistics */

/* Paramétrage des armes fixes */

/* Vehicle cargo */
	/*
	private _cargo_lr = [
		["Toolkit",2],
		["ACE_Wirecutter",2],
		["CUP_1rnd_HE_M203",10],
		["CUP_1rnd_HEDP_M203",10],
		["CUP_30rnd_556x45_Stanag",50],
		["CUP_20rnd_761x51_B_SCAR",10],
		["CUP_100rnd_TE4_LRT4_Red_Tracer_761x51_Belt_M",10],
		["CUP_launch_M136",3],
		["CUP_HandGrenade_M67",5],
		["SmokeShellRed",10],
		["SmokeShell",10],
		["ACRE_PRC148",2],
		["ACE_packingBandage",20],
		["ACE_elasticBandage",20],
		["ACE_fieldDressing",20],
		["ACE_quikclot",20],
		["ACE_salineIV_250",10],
		["ACE_salineIV_500",10],
		["ACE_salineIV",10],
		["ACE_morphine",30],
		["ACE_atropine",30],
		["ACE_tourniquet",10],
		["ACE_surgicalKit",1],
		["ACE_splint",20],
		["CUP_B_Kombat_Olive",3]
	];

	[landrover,_cargo_lr] call int_fnc_addCargo;
	[lav,_cargo_lr] call int_fnc_addCargo;

/* Vehicle cargo */

/* crates */

	/*
	_lat_loadout = [
		["CUP_launch_RPG7V", 2],
		["CUP_PG7VL_M", 10],
		["CUP_launch_M136",5],
		["CUP_B_RPGPack_Khaki", 2]
	];

	_mun_loadout = [
		["CUP_30Rnd_762x39_AK15_Tan_M", 50],
		["CUP_HandGrenade_RGD5",20],
		["SmokeShellRed",10],
		["CUP_100Rnd_TE4_Green_Tracer_556x45_M249",10],
		["ACE_packingBandage",50],
		["ACE_salineIV_500",5],
		["DemoCharge_Remote_Mag", 5],
		["SatchelCharge_Remote_Mag", 2],
		["CUP_B_MedicPack_ACU",2],
		["ACE_Clacker",5],
		["ACE_M26_Clacker",5],
		["ACE_HandFlare_White",5]
	];

	_hat_loadout = [
		["CUP_launch_Javelin",2],
		["CUP_launch_FIM92Stinger",2]
	];

	[crate_AT_1, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_1, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_2, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_2, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_3, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_3, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_4, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_4, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_5, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_5, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_6, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_6, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_7, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_7, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_8, _lat_loadout] call int_fnc_addCargo;
	[crate_mun_8, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_9, _hat_loadout] call int_fnc_addCargo;
	[crate_mun_9, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_10, _hat_loadout] call int_fnc_addCargo;
	[crate_mun_10, _mun_loadout] call int_fnc_addCargo;
	[crate_AT_11, _lat_loadout] call int_fnc_addCargo;
	[crate_AT_11, _hat_loadout] call int_fnc_addCargo;
	[crate_mun_11, _mun_loadout] call int_fnc_addCargo;

/* crates */