private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbMrk;

/* Build de la zone */

	execVM "build.sqf"

/* Build de la zone */