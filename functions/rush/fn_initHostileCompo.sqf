/* Hostile IA faction and group definition */

//Faction unit types
	private _fsl_ENI_1    	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "fsl_1");
	private _fsl_ENI_2       = getText (missionConfigFile >> "factions" >> hostileFaction >> "fsl_2");
	private _fsl_ENI_3       = getText (missionConfigFile >> "factions" >> hostileFaction >> "fsl_3");
	private _lat_ENI    	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "lat");
	private _at_ENI			 = getText (missionConfigFile >> "factions" >> hostileFaction >> "at");
	private _lmg_ENI    	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "lmg");
	private _mg_ENI     	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "mg");
	private _mark_ENI        = getText (missionConfigFile >> "factions" >> hostileFaction >> "mark");
	private _gl_ENI     	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "gl");
	private _tl_ENI     	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "tl");
	private _sl_ENI     	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "sl");
	private _medic_ENI     	 = getText (missionConfigFile >> "factions" >> hostileFaction >> "medic");

/*******************************************/
/*             IA GROUP DEF                */
/*******************************************/

	//3 ou 4 PAX
	GRP_ENI_4 = [
		[_tl_ENI,_fsl_ENI_1,_mark_ENI,_fsl_ENI_3],
		[_tl_ENI,_fsl_ENI_1,_mg_ENI,_gl_ENI],
		[_tl_ENI,_fsl_ENI_2,_lat_ENI,_fsl_ENI_3],
		[_tl_ENI,_fsl_ENI_2,_lat_ENI,_lmg_ENI]
	];

	//6 PAX
	GRP_ENI_6 = [
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_lat_ENI,_mg_ENI],
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_gl_ENI,_lmg_ENI],
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_medic_ENI,_mg_ENI,_at_ENI],
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_medic_ENI,_lmg_ENI,_lat_ENI]
	];

	//8 PAX
	GRP_ENI_8 = [
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_gl_ENI,_mg_ENI,_at_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_lat_ENI,_lmg_ENI,_at_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_medic_ENI,_mg_ENI,_lmg_ENI,_lat_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_medic_ENI,_gl_ENI,_mg_ENI,_lat_ENI]
	];
	