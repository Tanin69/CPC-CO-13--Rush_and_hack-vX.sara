/* Build mission environnement */

// mission data is a complex array that contains all mission data : objectives (#0), spawn point, paths, point of interest, etc. for one spawn point (#1), the same data for the second spawn point (#2) and extract point data (#3)
// mission data is now initialized from a config file
//TODO : replace the missionDataArray with variables

//missionData = [];
private _spawnData = [];
private _objData = [];
/*Test only
combatZone = "Obregan";
*/
combatZone = selectRandom ["Bagango","Yoro","Acorcha","Masbete","Obregan"];
publicVariable "combatZone";

/* build objective */

	//Combat zone marker
	private _combatZoneMrk = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "combatZone");
	_combatZoneMrk = _combatZoneMrk#0;
	"marker_zone" setMarkerPos _combatZoneMrk;

	//Objectives markers
	private _objectivePos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "objectivePos");
	for "_i" from 0 to (count _objectivePos) -1 do  {
		_mrk = createMarker ["marker_objectif_" + str(_i+1),[(_objectivePos#_i)#0,(_objectivePos#_i)#1]];
		_mrk setMarkerType "mil_unknown_noShadow";
		_mrk setMarkerColor "ColorOrange";
	};
	
	//Place the container and the computer - LARS spawn composition scripts : https://forums.bohemia.net/forums/topic/191902-eden-composition-spawning/
	/*Test only
	objectivePos = _objectivePos#2;
	*/
	objectivePos = selectRandom _objectivePos;
	publicVariable "objectivePos";
	private _compReference = ["container_computer", [objectivePos#0,objectivePos#1,0],nil,objectivePos#2] call LARs_fnc_spawnComp;

	//Add triggers for computer hacking management
	private _trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_trg setTriggerStatements ["this", "systemChat 'Les joueurs ont pris le contrôle de la zone du PC';seizedByAMI = true;isHackable = true;publicVariable 'seizedByAMI';publicVariable 'isHackable'", "systemChat 'Les joueurs ont perdu le contrôle de la zone du PC';seizedByAMI = false;isHackable = false;publicVariable 'seizedByAMI';publicVariable 'isHackable'"];
	_trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["EAST SEIZED", "PRESENT", true];
	_trg setTriggerStatements ["this", "'La zone du PC est contrôlée par les hostiles !' remoteExec ['systemChat'];seizedByENI = true;isHackable = false;publicVariable 'seizedByENI';publicVariable 'isHackable';[]spawn int_fnc_checkENI;", "'Les hostiles ont perdu le contrôle de la zone du PC !' remoteExec ['systemChat'];seizedByENI=false;isHackable = true;publicVariable 'seizedByENI';publicVariable 'isHackable'"];

	//Add heavy Weapon
	private _heavyWeaponPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "heavyWeaponPos");
	_heavyWeaponPos = _heavyWeaponPos#0;
	private _heavyWeaponCls = getText (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Objectives" >> "heavyWeaponClassname");
	HeavyWeapon = createVehicle [_heavyWeaponCls, _heavyWeaponPos, [], 0, "NONE"];

/* build objective */

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
	_trg setTriggerStatements ["time > 30 && count((allplayers - entities 'HeadlessClient_F') inAreaArray thisTrigger) < count(allplayers - entities 'HeadlessClient_F')", "goRush = true; publicVariable 'goRush';", ""];

	//AI spawn point
	private _AISpawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "spawnPos");
	_AISpawnPos = _AISpawnPos#0;
	"marker_spawn_AI" setMarkerPos [_AISpawnPos#0,_AISpawnPos#1];

	sleep 10;
	{_x allowdamage true} forEach _allPlayers;

/* build spawn points */