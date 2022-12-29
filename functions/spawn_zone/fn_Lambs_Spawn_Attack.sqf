/*
Function: fn_Lambs_Spawn_Attack

Description:
	Spawn attack groups from marker names. Uses Lambs task attack functions

Parameters:
	_markers - markers where to spawn groups [ARRAY of STRING]
	_objective - marker name for the zone to attack [STRING]
	_group - group composition, array of arrays of unit class names [ARRAY of ARRAYs]
	_side - optional default opfor, group side [SIDE]
	_mode - optional default ASSAULT, attack mode. Possible values are "ASSAULT", "RUSH", "CQB" [STRING]
	
Returns:
	created groups [ARRAY] if the function is CALLed (and not SPAWNed)

Examples:
    (begin example)
	[
		["mrkSpawnAttack_1", "mrkSpawnAttack_2", "mrkSpawnAttack_3"],
		"marker_objective",
		[["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_AT"],["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_2"]],
		opfor,
		"CQB"
	] call fn_Lambs_Spawn_Attack;
	(end)

Author:
	tanin69
*/

params [
	["_markers", [], [[]]],
	["_objective", "", [""]], 
	["_group", [], [[]]],
	["_side", opfor],
	["_mode", "ASSAULT", [""]]
];

//validate input values
if ((_markers isEqualTo []) || !(_markers isEqualType [])) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack aborted. Spawn marker(s) empty or not an array: %1", _markers];
};
if ((_group isEqualTo []) || !(_group isEqualType [])) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack aborted. Group compostion is empty or not an array: %1", _group];
};
if !(_side in [west, blufor, east, opfor, resistance, independent, civilian, sideFriendly, sideEnemy]) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack_WP aborted. Side is not an accepted value: %1", _side];
};
private _objectivePos = getMarkerPos _objective; 
if (_objectivePos isEqualTo [0,0,0]) exitWith {
	systemChat format ["fn_Lambs_Spawn_Attack aborted. Objective marker name returned a wrong position: %1 > %2", _objective, _objectivePos]
};
if (!(_mode isEqualTo "ASSAULT") && (!(_mode isEqualTo "RUSH")) && !(_mode isEqualTo "CQB")) then {
	systemChat format ["fn_Lambs_Spawn_Attack error. Requested attack mode: %1. Attack mode fall back to 'ASSAULT'", _mode];
	_mode = "ASSAULT";
};

private _tbGroups = [];

{
	private _pos = getMarkerPos _x;
	_grp = [_pos, _side, selectRandom _group] call GDC_fnc_lucySpawnGroupInf;
	_tbGroups pushBack _grp;
	
	switch (_mode) do {
		case "ASSAULT": {
			[_grp, _objectivePos, false, 50, 2, false] spawn lambs_wp_fnc_taskAssault;
		};
		case "RUSH": {
			[_grp, 100, 15, [], _objectivePos, false] spawn lambs_wp_fnc_taskRush;
		};
		case "CQB": {
			[_grp, _objectivePos, 50, 21, [], false] spawn lambs_wp_fnc_taskCQB;
		};
	};
	
} forEach _markers;

_tbGroups