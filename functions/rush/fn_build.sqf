/* Build mission environnement */

private _spawnData = [];
private _objData = [];

buildOK = false; //for synchronisation with init.sqf

combatZone = "";
private _chosenCombatZone = ["CombatZone"] call BIS_fnc_getParamValue;

//Build combat zones array from config file
private _configArr = [];
private _configArrLong = "true" configClasses (missionConfigFile >> "CfgCombatZones");
{
	private _elArr = str(_x) splitString "/";
	private _el = _elArr #((count _elArr)-1);
	_configArr pushBack _el;	
} forEach _configArrLong;

switch (_chosenCombatZone) do {
	case 0: {combatZone = selectRandom _configArr};
	default {combatZone = _configArr#(_chosenCombatZone-1)};
};

/*Test only
combatZone = "Obregan";
*/
publicVariable "combatZone";

/* build objective */

	//Combat zone marker
	private _combatZoneMrk = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "combatZone");
	_combatZoneMrk = _combatZoneMrk#0;
	"marker_zone" setMarkerPos _combatZoneMrk;

	//Place the container and the computer - LARS spawn composition scripts : https://forums.bohemia.net/forums/topic/191902-eden-composition-spawning/
	/*Test only
	objectivePos = _objectivePos#2;
	*/
	private _objectivePos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "objectivePos");
	objectivePos = selectRandom _objectivePos;
	publicVariable "objectivePos";
	private _compReference = ["container_computer", [objectivePos#0,objectivePos#1,0],nil,objectivePos#2] call LARs_fnc_spawnComp;

	//Objectives markers
	private _objectiveIntelLvl = ["ObjectiveIntelLevel"] call BIS_fnc_getParamValue;
	switch (_objectiveIntelLvl) do {
		case 1: {
			private _mrkCenter =  [[[objectivePos, 150]],[]] call BIS_fnc_randomPos;
			systemChat str [objectivePos#0,objectivePos#1];
			systemChat str _mrkCenter;
			_mrk = createMarker ["marker_objectif_1",_mrkCenter];
			_mrk setMarkerShape "ELLIPSE";
			_mrk setMarkerSize [200,200];
			_mrk setMarkerColor "ColorOrange";
			_mrk setMarkerAlpha 1;
			for "_i" from 0 to (count _objectivePos) -2 do  {
				_mrk = createMarker ["marker_objectif_" + str(_i+2),[(_objectivePos#_i)#0,(_objectivePos#_i)#1]];
				_mrk setMarkerType "mil_unknown_noShadow";
				_mrk setMarkerAlpha 0;
			};
		};
		case 2: {
			for "_i" from 0 to (count _objectivePos) -1 do  {
				_mrk = createMarker ["marker_objectif_" + str(_i+1),[(_objectivePos#_i)#0,(_objectivePos#_i)#1]];
				_mrk setMarkerType "mil_unknown_noShadow";
				_mrk setMarkerColor "ColorOrange";
			};
		};
		case 3: {
			_mrk = createMarker ["marker_objectif_1",[objectivePos#0,objectivePos#1,0]];
			_mrk setMarkerType "mil_objective_noShadow";
			_mrk setMarkerColor "ColorOrange";
			for "_i" from 0 to (count _objectivePos) -2 do  {
				_mrk = createMarker ["marker_objectif_" + str(_i+2),[(_objectivePos#_i)#0,(_objectivePos#_i)#1]];
				_mrk setMarkerType "mil_unknown_noShadow";
				_mrk setMarkerAlpha 0;
			};
		};
	};
	
	//Add triggers for computer hacking management
	private _trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_trg setTriggerStatements [
		"this", 
		"if (!hackingDone) then {systemChat 'Les JOUEURS ont PRIS le contrôle de la zone du PC'};seizedByAMI=true;isHackable=true;publicVariable 'seizedByAMI';publicVariable 'isHackable';",
		"if (!hackingDone) then {systemChat 'Les JOUEURS ont PERDU le contrôle de la zone du PC'};seizedByAMI=false;isHackable=false;publicVariable 'seizedByAMI';;publicVariable 'isHackable';"
	];
	_trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["EAST SEIZED", "PRESENT", true];
	_trg setTriggerStatements [
		"this",
		"if (!hackingDone) then {'Les HOSTILES ont PRIS le contrôle de la zone du PC !' remoteExec ['systemChat']};seizedByENI=true;isHackable=false;publicVariable 'seizedbyENI';publicVariable 'isHackable';['ENI']spawn int_fnc_hackComputer;",
		"if (!hackingDone) then {'Les HOSTILES ont PERDU le contrôle de la zone du PC !' remoteExec ['systemChat']};seizedByENI=false;publicVariable 'seizedByENI';"
	];

	//Add heavy Weapon
	private _heavyWeaponPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "heavyWeaponPos");
	_heavyWeaponPos = _heavyWeaponPos#0;
	private _heavyWeaponCls = getText (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "heavyWeaponClassname");
	HeavyWeapon = createVehicle [_heavyWeaponCls, _heavyWeaponPos, [], 0, "NONE"];

/* build objective */

/* build player presence trigger */
	//This trigger ensures that the reinforcement timer is triggered only when players are close enough to the objective (300 m. from objective)
	_trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [300, 300, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	_trg setTriggerStatements ["this", "hint 'Player in area: reinforcement timer triggered';playerPresent=true;publicVariable 'playerPresent'",""];
/* build player presence trigger*/

/* build extraction point */

	private _extractPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Extraction" >> "extractionPos");
	_extractPos = selectRandom _extractPos;
	_compReference = ["extraction_position", [_extractPos#0,_extractPos#1,0],nil,0] call LARs_fnc_spawnComp;
	"marker_extract" setMarkerPos [_extractPos#0,_extractPos#1];
	
/* build extraction point */

/* build spawn points */

	//Randomly choose spawn point for players and AI
	/* Test only 
		private _iPlayers = "2";
		iAI = "1";
	*/
	private _iPlayers = selectRandom ["1","2"];
	iAI = "1";
	if (_iPlayers isEqualTo "1") then {
		iAI = "2"
	};
	publicVariable "iAI";

	//players spawn point (based on a composition)
	private _playerSpawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> ("SpawnPoint_" + _iPlayers) >> "spawnPos");
	_playerSpawnPos = _playerSpawnPos#0;
	_compReference = ["simple_checkpoint", [_playerSpawnPos#0,_playerSpawnPos#1,0],nil,_playerSpawnPos#2] call LARs_fnc_spawnComp;
	"marker_spawn_joueurs" setMarkerPos [_playerSpawnPos#0,_playerSpawnPos#1];
	//move players to spawn point
	private _allPlayers = playableUnits + switchableUnits;
	{_x allowdamage false;} forEach _allPlayers;
	{
		if (isPlayer _x) then {
			[_x, [_playerSpawnPos#0,_playerSpawnPos#1]] remoteExec ["setPos", _x];
		} else {
			_x setpos [_playerSpawnPos#0,_playerSpawnPos#1];
		}; 
	} forEach _allPlayers;
	//Create the trigger for AI rush to begin (condition : any human player outside the spawn area)
	_trg = createTrigger ["EmptyDetector", [_playerSpawnPos#0,_playerSpawnPos#1]];
	_trg setTriggerArea [20, 13, _playerSpawnPos#2, true];
	_trg setTriggerStatements ["time > 30 && count((allplayers - entities 'HeadlessClient_F') inAreaArray thisTrigger) < count(allplayers - entities 'HeadlessClient_F')", "goRush = true; timeGoRush = time; publicVariable 'goRush'; publicVariable 'timeGoRush'", ""];

	//AI spawn point
	private _AISpawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "spawnPos");
	_AISpawnPos = _AISpawnPos#0;
	"marker_spawn_AI" setMarkerPos [_AISpawnPos#0,_AISpawnPos#1];

	buildOK = true;
	publicVariable "buildOK";

	sleep 10;
	{_x allowdamage true} forEach _allPlayers;

/* build spawn points */