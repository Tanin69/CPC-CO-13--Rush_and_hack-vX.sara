/* Spawn first wave */

private _ENISide = opfor;
private _AMISide = west;
private _spawnPos = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "spawnPos");
_spawnPos = _spawnPos#0;
private _objectivePos = objectivePos;
private _grp = objNull;
private _grpPath = [];

/* Difficulty management */
	//Initial balance of power : very easy=1vs2 | easy=1vs4 | medium=1vs6 | hard=1vs8
	private _nbJoueurs = playersNumber _AMISide;
	_grpDef = GRP_ENI_6;
	private _nbGroups = _nbJoueurs;
	private _initBoP = ["BalanceOfPower"] call BIS_fnc_getParamValue;
	switch (_initBoP) do {
		case 2: {
			_grpDef = GRP_ENI_4;
			_nbGroups = round((_nbJoueurs*2)/4)};
		case 4: {_grpDef = GRP_ENI_4;};
		case 6: {_grpDef = GRP_ENI_6;};
		case 8: {_grpDef = GRP_ENI_8;};
	};
	grpDef = _grpDef;
/* Difficulty management */

//Delay before rush (player choice)
//_delayBeforeRush = 60;
private _delayBeforeRush = ["DelayBeforeRush"] call BIS_fnc_getParamValue;
waituntil { !(isNil "goRush") && !(isNil "timeGoRush") && {(time > (timeGoRush + _delayBeforeRush))}};

private _reinfPath = {
	params ["_grp", "_grpPath",["_lastWPType","SAD"],["_code",""]];

	[
		_grp,
		_grpPath,
		"goRush",
		[0,0,0],
		["NORMAL","AWARE","YELLOW"],
		"NO CHANGE",
		_lastWPType,
		["NORMAL","COMBAT","YELLOW"],
		"NO CHANGE",
		_code,
		0
	] call GDC_fnc_lucyReinforcement;

};

//Paths for group progression
private _paths = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "paths");

//Spawn random groups
for "_i" from 1 to (_nbGroups-2) do {
	_grp = [_spawnPos, _ENIside, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
	_grpPath = selectRandom _paths + [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]];
	[_grp, _grpPath] call _reinfPath;
};

//Spawn special task groups
//--group that rush to occupy the objective
_grp = [_spawnPos, _ENIside, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [_objectivePos];
[_grp, _grpPath] call _reinfPath;

//--group that rush to take control of the heavy weapon
_grp = [_spawnPos, _ENIside, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [getPos (HeavyWeapon)];
[_grp, _grpPath,"GETIN NEAREST"] call _reinfPath;

//--group with a marksman : go on one point of interest position
_grpDef = GRP_ENI_4#0;
_grp = [_spawnPos, _ENIside, _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpDest = getArray (missionConfigFile >> "cfgCombatZones" >> combatZone >> "SpawnPoints" >> "SpawnPoint_" + iAI >> "pointsOfInterest");
_grpDest = selectRandom _grpDest;
_grpPath = (_paths#0) + [_grpDest];
[_grp, _grpPath] call _reinfPath;
