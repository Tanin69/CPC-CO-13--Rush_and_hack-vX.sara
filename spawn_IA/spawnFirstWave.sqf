/* Spawn first wave */

private _nbGroups = 2;
private _grpDef = GROUPE_ENI_GRAND;
private _side = opfor;
private _spawn = "marker_spawn_ENI";
private _objectivePos = objectivePos;
private _grp = objNull;
private _grpPath = [];

//Paths for group progression
private _paths = [
	[getMarkerPos "mrkPath1_1", getMarkerPos "mrkPath1_2"],
	[getMarkerPos "mrkPath2_1", getMarkerPos "mrkPath2_2"],
	[getMarkerPos "mrkPath3_1", getMarkerPos "mrkPath3_2"],
	[getMarkerPos "mrkPath4_1", getMarkerPos "mrkPath4_2",getMarkerPos "mrkPath4_3"]
];

private _reinfPath = {
	params ["_grp", "_grpPath"];

	[
		_grp,
		_grpPath,
		"goRush",
		[0,0,0],
		["NORMAL","AWARE","YELLOW"],
		"NO CHANGE",
		"SAD",
		["NORMAL","COMBAT","YELLOW"],
		"NO CHANGE",
		"",
		0
	] call GDC_fnc_lucyReinforcement;

};

//Spawn random groups
for "_i" from 1 to _nbGroups do {
	_grp = [(getMarkerPos _spawn), _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
	_grpPath = selectRandom _paths + [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]];
	[_grp, _grpPath] call _reinfPath;
};

//Spawn special task groups
//--group that rush to occupy the objective
_grp = [(getMarkerPos _spawn), _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [_objectivePos];
[_grp, _grpPath] call _reinfPath;

//--group that rush to take control of the heavy weapon
_grp = [(getMarkerPos _spawn), _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = selectRandom _paths + [(getPos HeavyWeapon)];
[_grp, _grpPath] call _reinfPath;

//--group with a marksman
_grpDef = GROUPE_ENI_PETIT#0;
_grp = [(getMarkerPos _spawn), _side, _grpDef] call GDC_fnc_lucySpawnGroupInf;
_grpPath = [getMarkerPos "mrkPath4_1", getMarkerPos "mrkPath4_2",selectRandom [getMarkerPos "mrkPos_1",getMarkerPos "mrkPos_2",getMarkerPos "mrkPos_3"]];
[_grp, _grpPath] call _reinfPath;

waitUntil {time > delayBeforeRush};
goRush = true;