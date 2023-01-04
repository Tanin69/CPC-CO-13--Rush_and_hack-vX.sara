private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;
_tbMrk = allMapMarkers select {["rah", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;

/* Build de la zone */

	[]spawn int_fnc_build;

/* Build de la zone */