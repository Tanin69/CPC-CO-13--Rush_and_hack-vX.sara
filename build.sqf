/* Build mission environnement */

//_mission data is a complex array that contains all mission data : objectives (#0), spawn point, paths, point of interest, etc. for one spawn point (#1), the same data for the second spawn point (#2) and extract point data (#3)
missionData = [
	[[13761.2,12849,0],[13745.6,12727.8,0],[13702.3,12737.4,0]], //Objective data : possible positions for objective to be spawned
	[ //Spawn point #1 data 
		[13144.9,13414.6,200], //spawn point position (#2 is direction)
		[ //paths for groups to rush the combat zone
			[[13246.9,12881.6],[13587.1,12807.1]],
			[[13629.7,13126.3],[13766.3,13057.9]],
			[[13335.5,13257.1],[13612,12835.8]],
			[[13378.3,13382],[13818.6,13122.6],[13930.2,12887.7]]
		],
		[ //points of interest
			[13990.5,13064.4],
			[14009.1,12890.4],
			[13700,13022.7]
		], 
		[16000,16009.8], //paradrop heli spawn point
		[ //possible paradrop positions
			[13804.3,13110.5],
			[14016.8,12925.4],
			[13965.2,12703.8],
			[13871.1,12514],
			[14029.4,12698.7],
			[13807.3,12445.9],
			[14075.7,12582.7],
			[14217.5,12676.3],
			[14190.8,12520],
			[14036.5,12499.6],
			[14030.4,12775.9]
		]
	],
	[ //Spawn point #2 data, same structure as #1
		[14334.3,11947.5,300], //spawn point position
		[ //paths for groups to rush the combat zone
			[[13954.6,12265.3],[13748.1,12479.3]],
			[[14167.1,12218.3],[13998.6,12468.7]],
			[[14212.5,12262.8],[13953,12672.6]],
			[[13775.4,12173.3],[13450.6,12570.9],[13567.5,12733.3]]
		],
		[ //points of interest
			[13804.7,12483.4],
			[13980.5,12729.1],
			[14000.6,12989.6]
		],
		[16000,16009.8], //paradrop heli spawn point
		[ //possible paradrop positions
			[13804.3,13110.5],
			[14016.8,12925.4],
			[13965.2,12703.8],
			[13871.1,12514],
			[14029.4,12698.7],
			[13807.3,12445.9],
			[14075.7,12582.7],
			[14217.5,12676.3],
			[14190.8,12520],
			[14036.5,12499.6],
			[14030.4,12775.9]
		]
	],
	[ //extract point data
		[14181,12589.8],
		[14199.2,12494.3],
		[14270.3,12715.2],
		[13264.7,12881.6]
	]
];

publicVariable "missionData"; //We need to broadcast the missionData array because units are spawned on the HC

//Randomly choose between spawn point for players and AI
iPlayers = selectRandom [1,2];
iAI = 0;
if (iPlayers isEqualTo 1) then {
	iAI = 2
} else {
	iAI = 1
};

publicVariable "iAI";

/* build objective */

	private _objectivePos = missionData#0;

	//place visual markers
	for "_i" from 0 to (count _objectivePos) -1 do  {
		_mrk = createMarker ["marker_objectif_" + str(_i+1),[(_objectivePos#_i)#0,(_objectivePos#_i)#1]];
		_mrk setMarkerType "mil_unknown_noShadow";
		_mrk setMarkerColor "ColorOrange";
	};
	
	//Place the container and the computer - LARS spawn composition scripts : https://forums.bohemia.net/forums/topic/191902-eden-composition-spawning/
	objectivePos = selectRandom _objectivePos;
	publicVariable "objectivePos";

	private _compReference = ["container_computer", [objectivePos#0,objectivePos#1,0]] call LARs_fnc_spawnComp;

	//Add triggers for hacking management
	private _trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_trg setTriggerStatements ["this", "systemChat 'Les joueurs ont pris le contrôle de la zone du PC';seizedByAMI = true;isHackable = true;publicVariable 'seizedByAMI';publicVariable 'isHackable'", "systemChat 'Les joueurs ont perdu le contrôle de la zone du PC';seizedByAMI = false;isHackable = false;publicVariable 'seizedByAMI';publicVariable 'isHackable'"];

	_trg = createTrigger ["EmptyDetector", objectivePos];
	_trg setTriggerArea [20, 20, 0, false, 0];
	_trg setTriggerActivation ["EAST SEIZED", "PRESENT", true];
	_trg setTriggerStatements ["this", "'La zone du PC est contrôlée par les hostiles !' remoteExec ['systemChat'];seizedByENI = true;isHackable = false;publicVariable 'seizedByENI';publicVariable 'isHackable';execVM 'functions\misc\fn_checkENI.sqf';", "'Les hostiles ont perdu le contrôle de la zone du PC !' remoteExec ['systemChat'];seizedByENI=false;isHackable = true;publicVariable 'seizedByENI';publicVariable 'isHackable'"];

/* build objective */

/* build extraction point */

	private _extractPos = selectRandom (missionData#3);
	_compReference = ["extraction_position", [_extractPos#0,_extractPos#1,0],nil,0] call LARs_fnc_spawnComp;
	"marker_extract" setMarkerPos [_extractPos#0,_extractPos#1];

/* build extraction point */

/* build spawn points */

	//The possible spawn positions and direction in #2
	//private _spawnPosDir = (_missionData#2)#0;
	
	//players spawn point (based on a composition)
	private _playerSpawnPos = (missionData#iPlayers)#0;
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
	private _AISpawnPos = (missionData#iAI)#0;
	"marker_spawn_AI" setMarkerPos [_AISpawnPos#0,_AISpawnPos#1];

	sleep 10;
	{_x allowdamage true} forEach _allPlayers;

/* build spawn points */