/* Spawn first wave */

private _nbGroups = 2;
private _grpDef = GROUPE_ENI_GRAND;
private _side = opfor;
private _spawnPos = (missionData#iAI)#0;
private _objectivePos = objectivePos;
private _grp = objNull;
private _grpPath = [];

private _nbJoueurs = playersNumber west;

switch (true) do {
	case (_nbJoueurs <= 6): {
		_nbGroups = 2;
	};
	case (_nbJoueurs > 6 && _nbJoueurs <=9): {
		_nbGroups = 4;
	};
	case (_nbJoueurs > 9): {
		_nbGroups = 6;
	};
};

//Paths for group progression
private _paths = (missionData#iAI)#1;

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

//Spawn random groups
for "_i" from 1 to _nbGroups do {
	_grp = [_spawnPos, _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
	_grpPath = selectRandom _paths + [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]];
	[_grp, _grpPath] call _reinfPath;
};

//Spawn special task groups
//--group that rush to occupy the objective
_grp = [_spawnPos, _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [_objectivePos];
[_grp, _grpPath] call _reinfPath;

//--group that rush to take control of the heavy weapon
_grp = [_spawnPos, _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [getPos (HeavyWeapon)];
[_grp, _grpPath,"GETIN NEAREST"] call _reinfPath;

//--group with a marksman : go on one point of interest position
_grpDef = GROUPE_ENI_PETIT#0;
_grp = [_spawnPos, _side, _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpDest = [selectRandom (missionData#iAI#2)];
_grpPath = selectRandom _paths + _grpDest;
[_grp, _grpPath] call _reinfPath;
