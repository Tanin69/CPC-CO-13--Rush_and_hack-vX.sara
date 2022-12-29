/*

Examples:
    (begin example)
	[
		"mrkSpawnAttack",
		["mrkObjective", "ASSAULT"],
		[["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_AT"],["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_2"]],
		opfor,
		[
			["mrkPath_1", "MOVE", "LIMITED", "STEALTH", "LINE", [0,0,0]],
			["mrkPath_2", "MOVE", "FULL", "CARELESS", "DIAMOND", [0,0,0]]			
		]
	] call fn_Lambs_Spawn_Attack_WP;
	(end)

*/

params [
	["_marker", "", [""]],
	["_objective", ["", "ASSAULT"], [[]], [2]], 
	["_group", [], [[]]],
	["_side", opfor],
	["_path", [[]], [[]]],
	["_debug", false]
];


private _pos = getMarkerPos _marker;
private _objectivePos = getMarkerPos (_objective#0);
private _objectiveMode = _objective#1;
//Debug variables
private _strDebug = "";
private _strMrkDebug = "";

//validate input values
if (_marker isEqualTo "") exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack_WP aborted. Spawn marker is an empty string: %1", _marker];
};
if ((_group isEqualTo []) || !(_group isEqualType [])) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack_WP aborted. Group composition is empty or not an array: %1", _group];
};
if !(_side in [west, blufor, east, opfor, resistance, independent, civilian, sideFriendly, sideEnemy]) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack_WP aborted. Side is not an accepted value: %1", _side];
};
if (_objectivePos isEqualTo [0,0,0]) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack_WP aborted. Objective marker name returned a wrong position: %1 > %2", _objective#0, _objectivePos]
};
if (!(_objectiveMode in ["ASSAULT", "RUSH", "CQB", "CREEP", "GARRISON"])) then {
	systemChat format ["fn_Lambs_Spawn_Attack_WP error. Requested attack mode: %1. Attack mode fall back to 'ASSAULT'", _objectiveMode];
	_objectiveMode = "ASSAULT";
};
//TODO : validate _path arg

//Spawn group with Lucy
private _grp = [_pos, _side, selectRandom _group] call GDC_fnc_lucySpawnGroupInf;
if (_debug) then {
	_marker setMarkerAlpha 1;
	_strMrkDebug = [_grp, "SPAWN"] joinString "|";
	_marker setMarkerText _strMrkDebug;
	systemChat format ["%1 spawné", _grp];
};

//Set waypoints path. _x#0: marker name, _x#1: wp type, _x#2: wp speed, _x#3: wp behavior, _x#4: wp formation, _x#5; timeout
{
	[
		_grp,
		getMarkerPos (_x#0),
		0,
		_x#1,
		_x#2,
		_x#3,
		"NO CHANGE",
		_x#4,
		10,
		_x#5
	] call GDC_fnc_lucyAddWaypoint;

	if (_debug) then {
		_x#0 setMarkerAlpha 1;
		_strMrkDebug = [_grp, "WP#" +  str _forEachIndex, _X#1, _x#2, _x#3, _x#4,_x#5] joinString "|";
		_x#0 setMarkerText _strMrkDebug;
	};

} forEach _path;
systemChat format ["%1:%2 waypoint(s) ajouté(s)", str _grp, str count (waypoints _grp)];

//Set the last waypoint statement with LAMBS task
private _statement = "";
if (_debug) then {
	_objective#0 setMarkerAlpha 1;
	_strMrkDebug = [_grp, _objectiveMode] joinString "|";
	_objective#0 setMarkerText _strMrkDebug;
	_strDebug = format ['%1 a reçu un ordre LAMBS %2', _grp, _objectiveMode];
};
switch (_objectiveMode) do {
	case "ASSAULT": {
		_statement = format ["[this] spawn {params ['_unit'];sleep 5;[_unit, %1, false, 50, 2, false] spawn lambs_wp_fnc_taskAssault; systemChat '%2';}", _objectivePos, _strDebug];
	};
	case "RUSH": {
		_statement = format ["[this] spawn {params ['_unit'];sleep 5;[_unit, 100, 15, [], %1, false] spawn lambs_wp_fnc_taskRush;systemChat '%2';}", _objectivePos, _strDebug];
	};
	case "CQB": {
		_statement = format ["[this] spawn {params ['_unit'];sleep 5;[_unit, %1, 50, 21, [], false] spawn lambs_wp_fnc_taskCQB;systemChat '%2';}", _objectivePos, _strDebug];
	};
	case "CREEP": {
		_statement = format ["[this] spawn {params ['_unit'];sleep 5;[_unit, 500, 15, [], %1, false] spawn lambs_wp_fnc_taskCreep;systemChat '%2';}", _objectivePos, _strDebug];
	};
	case "GARRISON": {
		_statement = format ["[this] spawn {params ['_unit'];sleep 5;[_unit, %1, 50, [], false, false, -2, true] spawn lambs_wp_fnc_taskGarrison;systemChat '%2';}", _objectivePos, _strDebug];
	};
};
private _lastWP = waypoints _grp select (count waypoints _grp -1);
_lastWP setWaypointStatements ["true", _statement];