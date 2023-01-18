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

/* Global variables initialization */
	isHackable = false;
	hackingDone = false;
	seizedByENI = false;
	seizedByAMI = false;
	goRush = false;
/* Global variables initialization */

/* ENI groups def */
	hostileFaction = ["ENIFaction"] call BIS_fnc_getParamValue;
	hostileFaction = str(hostileFaction);
//	systemChat hostileFaction;
	[] call int_fnc_initHostileCompo;
/* ENI groups def */

waituntil {!(isNil "buildOk")}; //We have to wait initServer.sqf execution because we need 'computer' to be spawned (build.sqf executed by initServer.sqf)

//Add ACE action on the computer to hack (computer is dynamically created by build.sqf !)
private _action_hack_computer = [
	"HackSystem",
	"Hacker le système",
	"",
	{
		isHackable = false;
		publicVariable "isHackable";
		["AMI"] spawn int_fnc_hackComputer;
	},
	{isHackable && (!hackingDone)}
] call ace_interact_menu_fnc_createAction;

[computer, 0, ["ACE_MainActions"], _action_hack_computer] call ace_interact_menu_fnc_addActionToObject;

//Add action to the end flag (extraction point)
endFlag addAction
[
	"Fin de partie",
	{["MyEnding", true, 3] remoteExec ["BIS_fnc_endMission", 0, true]},
	nil,
	1.5,
	true,
	true,
	"",
	"count (units player inAreaArray [position _target,20,20]) isEqualTo (count units player)", // _target, _this, _originalTarget
	50,
	false,
	"",
	""
];

//Launch the party !
if (is3DENPreview) then {
	[] spawn int_fnc_spawnFirstWave;
	[] spawn int_fnc_spawnReinf;
} else {
	if !(hasInterface or isServer) then {
		[] spawn int_fnc_spawnFirstWave;
		[] spawn int_fnc_spawnReinf;
	};
};
