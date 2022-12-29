/*
Function: fn_Lambs_Spawn_Patrol

Description:
	Spawn patrol groups in an area, depending on marker names in a named area. Uses lambs_wp_fnc_taskPatrol function

Parameters:
	_zone - zone to patrol, as an area marker name [STRING]
	_group - group composition, array of arrays of unit class names [ARRAY of ARRAYs]
	_side - optional default opfor, group side [SIDE]
	_patrolNumber - optional default [1,2] number of groups in area to patrol [ARRAY]
	_range - optional default 200, range of area to patrol around the group spawn position [NUMBER]
	_patrolPattern - optional default true, dynamic (random) patrol waypoints [BOOL]
	_dynReinforcements - optional default true, patrols wil  react to enemy known presence [BOOL]
	
Returns:
	created groups [ARRAY] if the function is CALLed (and not SPAWNed)

Examples:
    (begin example)
	[
		"PatrolZone_1",
		[["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_AT"],["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_2"]],
		opfor,
		[2,4],
		500,
		false,
		false
	] call fn_Lambs_Spawn_Garrison;
	(end)

Author:
	tanin69
*/

params [
	"_zone",
	"_group",
	["_side", opfor],
	["_patrolNumber", [1,2]],
	["_range", 200],
	["_patrolPattern", true],
	["_dynReinforcements", true]
];

//private _mrkZn = "mrkZn" + _zone;
private _mrkSn = "mrkPl" + _zone;
private _tbMrkSn = allMapMarkers select {[_mrkSn, _x, true] call BIS_fnc_inString};
private _nbPat = selectRandom _patrolNumber; 
private _spawn = [];
private _grp = [];
private _tbGroups = [];

for "_i" from 1 to _nbPat do {
	_spawn = selectRandom  _tbMrkSn;
	_grp = [(getMarkerPos _spawn), _side, selectRandom _group] call GDC_fnc_lucySpawnGroupInf;
	_tbGroups pushBack _grp;
	[_grp, nil, _range, nil, nil, nil, _patrolPattern, _dynReinforcements] call lambs_wp_fnc_taskPatrol;
};

_tbGroups