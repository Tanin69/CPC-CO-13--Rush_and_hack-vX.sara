/* Very basic perpetual reinforcements */

waituntil {goRush};

//sleep 60;
sleep 300 + random 120;

private _grpDef = GROUPE_ENI_GRAND;
private _side = opfor;
private _spawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "spawnPos");
_spawnPos = _spawnPos#0;
private _objectivePos = objectivePos;
private _grp = objNull;

//Paths for group progression
private _paths = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "paths");

while {true} do {

	private _typeReinf = selectRandom ["inf", "para"];

	if (_typeReinf isEqualTo "inf") then {

		_grp = [_spawnPos, _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
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

	//sleep 10;
	sleep 180 + random 60;

};

