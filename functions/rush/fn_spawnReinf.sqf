/* Very basic perpetual reinforcements */

//Wait for some players to walk out of the spawn area
waituntil {goRush};

//Delay before rush (player choice)
//_delayBeforeRush = 60;
private _delayBeforeRush = ["DelayBeforeRush"] call BIS_fnc_getParamValue;
waituntil { !(isNil "goRush") && !(isNil "timeGoRush") && {(time > (timeGoRush + _delayBeforeRush))}};

private _grpDef = grpDef;
private _ENIside = opfor;
private _AMIside = west;
private _objectivePos = objectivePos;
private _grp = objNull;
private _spawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "spawnPos");
_spawnPos = _spawnPos#0;
private _paths = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "paths");

/* Difficulty management */
	//Reinforcements balance : few=every 5 min + random 3 min | medium= every 3 minutes + random 3 minutes | much= every 2 minutes + random 3 minutes
	private _reinfBaseFreq = "180";
	private _reinfAddFreq = "180";
	private _reinfFreq = ["Reinforcements"] call BIS_fnc_getParamValue;
	if (_reinfFreq isEqualTo 9) then {_reinfFreq = selectRandom [0,1,2]};
	switch (_reinfFreq) do {
		case 0:{_reinfBaseFreq = 420;_reinfAddFreq=180};
		case 1:{_reinfBaseFreq = 300;_reinfAddFreq=180};
		case 2:{_reinfBaseFreq = 180;_reinfAddFreq=180};
	};
	//Group size is balanced in spawnFisrtWave.sqf script, nb of groups as follow
	private _nbJoueurs = playersNumber _AMISide;
	private _nbGroups = round (_nbJoueurs/3);
/* Difficulty management */

//sleep 60;
sleep (600 + random 120);

while {true} do {

	for "_i" from 1 to _nbGroups do {

		private _typeReinf = selectRandom ["inf", "para"];

		if (_typeReinf isEqualTo "inf") then {

			_grp = [_spawnPos, _ENIside, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
			private _grpPath = selectRandom _paths + [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]];

			[
				_grp,
				_grpPath,
				"true",
				[0,0,0],
				["FULL","AWARE","YELLOW"],
				"NO CHANGE",
				"SAD",
				["FULL","COMBAT","RED"],
				"NO CHANGE",
				"",
				0
			] call GDC_fnc_lucyReinforcement;
			
		} else {
			
			private _paradropPos = selectRandom (getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "paradropPos"));
			private _heliSpawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "heliSpawnPos");
			_heliSpawnPos = _heliSpawnPos#0;
			_grp = [
				_heliSpawnPos,
				_paradropPos,
				_heliSpawnPos,
				opfor,
				["CUP_O_Mi8AMT_RU","CUP_O_RU_Pilot", 150],
				selectRandom _grpDef,
				"FULL"
			]  call GDC_fnc_lucySpawnGroupInfParadrop;
			_grp = _grp#0;
			//groups will patrol between random objective and random extraction point
			private _rdmExtract = selectRandom (getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "Extraction" >> "extractionPos"));
			_grpPath = [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]] + [_rdmExtract];
			[_grp,_grpPath,["MOVE","NORMAL","AWARE","YELLOW","VEE"]] call GDC_fnc_lucyGroupRandomPatrol;
		};
	};
	//sleep 10;
	sleep (_reinfBaseFreq + random _reinfAddFreq);

};

