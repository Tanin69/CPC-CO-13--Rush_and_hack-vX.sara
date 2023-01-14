/*
	What we do from here :
	- Init VCom (optional) and Lucy
	- Define all *global* variables, even if they are updated somewhere else
	- Define ENI group composition (should be replaced later)
	- Create ACE action on the computer (UI -> need to be executed on every clients).
	- Launch ENI AI on local computer (eden test scenario) or headless client
*/

private _AIBoost =["AIBoost"] call BIS_fnc_getParamValue;
switch (_AIBoost) do {
	case 0: {};
	case 1: {[] spawn VCM_fnc_VcomInit};
};

[2,"marker_spawn_AI",true,600.0,false,3600.0,true,true,"COLONEL"] call GDC_fnc_lucyInit;



//Lance le briefing
execVM "briefing.sqf";

/* Global variables initialization */
	isHackable = false;
	isNotHacked = true;
	seizedByENI = false;
	goRush = false;
/* Global variables initialization */

/* ENI groups def */
	hostileFaction = ["ENIFaction"] call BIS_fnc_getParamValue;
	hostileFaction = str(hostileFaction);
//	systemChat hostileFaction;
	[] call int_fnc_initHostileCompo;
/* ENI groups def */

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
	{isHackable && isNotHacked}
] call ace_interact_menu_fnc_createAction;

[computer, 0, ["ACE_MainActions"], _action_hack_computer] call ace_interact_menu_fnc_addActionToObject;

if (is3DENPreview) then {
	[] spawn int_fnc_spawnFirstWave;
	[] spawn int_fnc_spawnReinf;
} else {
	if !(hasInterface or isServer) then {
		[] spawn int_fnc_spawnFirstWave;
		[] spawn int_fnc_spawnReinf;
	};
};
