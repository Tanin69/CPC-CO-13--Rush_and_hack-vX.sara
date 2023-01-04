[] spawn VCM_fnc_VcomInit;
[2,"marker_spawn_AI",true,600.0,false,3600.0,true,true,"COLONEL"] call GDC_fnc_lucyInit;

//Lance le briefing
execVM "briefing.sqf";

/* Initialisation des variables globales */

	isHackable = false;
	seizedByENI = false;
	goRush = false;

/* Initialisation des variables globales */

/* groups def */

	private _fsl_ENI_1    = "CUP_O_RU_Soldier_M_EMR_V2";
	private _fsl_ENI_2    = "CUP_O_RU_Soldier_Saiga_M_EMR_V2";
	private _fsl_ENI_3    = "CUP_O_RU_Soldier_Lite_M_EMR_V2";
	private _lat_ENI      = "CUP_O_RU_Soldier_LAT_M_EMR_V2";
	private _at_ENI       = "CUP_O_RU_Soldier_AT_M_EMR_V2";
	private _lmg_ENI      = "CUP_O_RU_Soldier_AR_M_EMR_V2";
	private _mg_ENI       = "CUP_O_RU_Soldier_MG_M_EMR_V2";
	private _gl_ENI       = "CUP_O_RU_Soldier_GL_M_EMR_V2";
	private _mark_ENI     = "CUP_O_RU_Soldier_Marksman_M_EMR_V2";
	private _tl_ENI       = "CUP_O_RU_Soldier_TL_M_EMR_V2";
	private _sl_ENI       = "CUP_O_RU_Soldier_SL_M_EMR_V2";
	private _medic_ENI    = "CUP_O_RU_Soldier_Medic_M_EMR_V2";

	//3 ou 4 PAX
	GROUPE_ENI_PETIT = [
		[_tl_ENI,_fsl_ENI_1,_mark_ENI],
		[_tl_ENI,_fsl_ENI_2,_fsl_ENI_3],
		[_tl_ENI,_lmg_ENI,_fsl_ENI_2],
		[_tl_ENI,_fsl_ENI_1,_mg_ENI,_gl_ENI],
		[_tl_ENI,_fsl_ENI_2,_lat_ENI,_fsl_ENI_3],
		[_tl_ENI,_fsl_ENI_2,_lat_ENI,_lmg_ENI],
		[_tl_ENI,_fsl_ENI_1,_gl_ENI,_lmg_ENI]
	];

	//5 ou 6 PAX
	GROUPE_ENI_MOYEN = [
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_lat_ENI],
		[_tl_ENI,_fsl_ENI_1,_gl_ENI,_lmg_ENI,_lat_ENI],
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_gl_ENI,_mg_ENI,_at_ENI],
		[_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_gl_ENI,_lmg_ENI,_lat_ENI]
	];

	//7 ou 8 PAX
	GROUPE_ENI_GRAND = [
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_gl_ENI,_mg_ENI,_at_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_lat_ENI,_lmg_ENI,_lat_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_2,_fsl_ENI_3,_mg_ENI,_lmg_ENI,_lat_ENI],
		[_sl_ENI,_tl_ENI,_fsl_ENI_1,_fsl_ENI_1,_gl_ENI,_mark_ENI,_mg_ENI,_lat_ENI]
	];
	
/* groups def */

buildOk = false;

waituntil {time > 0}; //We have to wait initServer.sqf execution because we need 'computer' to be spawned (build.sqf executed by initServer.sqf)

//Add ACE action on the computer to hack (computer is dynamically created by build.sqf !)
private _action_hack_computer = [
	"HackSystem",
	"Hacker le système",
	"",
	{
		["Hacking du système lancé !"] remoteExec ["hint"];
		[] spawn int_fnc_checkAMI;
	},
	{isHackable}
] call ace_interact_menu_fnc_createAction;

[computer, 0, ["ACE_MainActions"], _action_hack_computer] call ace_interact_menu_fnc_addActionToObject;

if (is3DENPreview) then {

/* Spawn des groupes ENI */
	
	//execVM "functions\rush\fn_spawnFirstWave.sqf";
	[] spawn int_fnc_spawnFirstWave;
	//execVM "functions\rush\fn_spawnReinf.sqf";
	[] spawn int_fnc_spawnReinf;

/* Spawn des groupes ENI */

	
} else {
	if !(hasInterface or isServer) then {

		/* Spawn des groupes ENI */
			//execVM "functions\rush\fn_spawnFirstWave.sqf";
			[] spawn int_fnc_spawnFirstWave;
			//execVM "functions\rush\fn_spawnReinf.sqf";
			[] spawn int_fnc_spawnReinf;
		/* Spawn des groupes ENI */
	
	};
};