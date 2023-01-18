//masquage des marqueurs spawn_zone et de build pour rush_and_hack
private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;
_tbMrk = allMapMarkers select {["rah", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;


/* Friendly AI loadout */
	private _friendlyAI = (switchableUnits + playableUnits) - allPlayers - entities 'HeadlessClient_F';
	{[_x,false] call int_fnc_initLoadout} forEach _friendlyAI;
/* Friendly AI loadout */

/* Build de la zone */
	[]spawn int_fnc_build;
/* Build de la zone */