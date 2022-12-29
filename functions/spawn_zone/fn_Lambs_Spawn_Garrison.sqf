/*
Function: fn_Lambs_Spawn_Garrison

Description:
	Spawn garrison groups in an area, depending on marker names in a named area. Uses lambs_wp_fnc_taskGarrison function

Parameters:
	_zone - zone to defend, as an area marker name [STRING]
	_group - group composition, array of arrays of unit class names [ARRAY of ARRAYs]
	_side - optional default opfor, group side [SIDE]
	_radius - optional default 50, range of area to garrison [NUMBER]
	_exitCondition - optional default 3 (FiredNear), exit condition that break a unit free. See Lambs Danger documentation [NUMBER]
	_patrol - optional default false, sub group patrols the area [BOOL]
	
Returns:
	created groups [ARRAY] if the function is CALLed (and not SPAWNed)

Examples:
    (begin example)
	[
		"GarrisonZone_1",
		[["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_AT"],["CPC_LAT_I_PIC_soldier_2", "CPC_LAT_I_PIC_soldier_2"]],
		opfor,
		20,
		0,
		false
	] call fn_Lambs_Spawn_Garrison;
    (end)

Author:
	tanin69
*/

params [
	"_zone",
	"_group",
	["_side",opfor],
	["_radius", 40],
	["_exitCondition", 3],
	["_patrol", false]
];

private _mrkGn = "mrkGn" + _zone;
private _tbMrkGn = allMapMarkers select {[_mrkGn, _x, true] call BIS_fnc_inString};
private _tbGroups = [];

{
	private _pos = getMarkerPos _x;
	_grp = [_pos, _side, selectRandom _group] call GDC_fnc_lucySpawnGroupInf;
	_tbGroups pushBack _grp;
	[_grp, nil, _radius, nil, true, false, _exitCondition, _patrol] call lambs_wp_fnc_taskGarrison;
} forEach _tbMrkGn;

systemChat str _tbGroups;

_tbGroups