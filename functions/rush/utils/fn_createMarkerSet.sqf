/* Create 3den markers to build a new combat area */

params [["_areaName","newArea"]];

private _prefix = "rah";
private _prefixArea = _prefix + "_" + _areaName;
private _areaMarker = _prefix + "_" + _areaName + "_combatZone";
private _objectiveMarkers = _prefixArea + "_obj";
private _heavyWeaponMarker = _prefixArea + "_heavyWeapon";
private _extractMarkers = _prefixArea + "_Extract_1";
private _prefixSpawn1 = _prefixArea + "_Spawn1";
private _prefixSpawn2 = _prefixArea + "_Spawn2";
private _spawn1Marker = _prefixSpawn1 + "_Pos";
private _spawn2Marker = _prefixSpawn2 + "_Pos";
private _WPSpawn1Markers = _prefixSpawn1 + "_WP_";
private _WPSpawn2Markers = _prefixSpawn2 + "_WP_";
private _POISpawn1Markers = _prefixSpawn1 + "_POI_1";
private _POISpawn2Markers = _prefixSpawn2 + "_POI_1";
private _heliSpawn1Marker = _prefixSpawn1 + "_HeliSpawnPos";
private _heliSpawn2Marker =  _prefixSpawn2 + "_HeliSpawnPos";
private _paradropSpawn1Markers = _prefixSpawn1 + "_paradrop_1";
private _paradropSpawn2Markers = _prefixSpawn2 + "_paradrop_1";

//Create a layer to store markers
private _3Layer = -1 add3DENLayer "R&H_" + _areaName;

//Create the area marker
private _3Mrk = create3DENEntity ["Marker", "", [800,19720,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["markerType",1];
_3Mrk set3DENAttribute ["size2",[750,750]];
_3Mrk set3DENAttribute ["brush","SolidBorder"];
_3Mrk set3DENAttribute ["baseColor","ColorRed"];
_3Mrk set3DENAttribute ["markerName",_areaMarker];


//Create 3 objective markers
for "_i" from 1 to 3 do {
	_3Mrk = create3DENEntity ["Marker","mil_unknown_noShadow", [770+(_i*100),19720,0]];
	_3Mrk set3DENLayer _3Layer;
	_3Mrk set3DENAttribute ["baseColor","ColorRed"];
	_3Mrk set3DENAttribute ["markerName",_objectiveMarkers + "_" + str(_i)];
};

//Create Heavy Weapon marker
_3Mrk = create3DENEntity ["Marker","o_armor", [740,19720,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorRed"];
_3Mrk set3DENAttribute ["markerName",_heavyWeaponMarker];

//Create Extraction marker
_3Mrk = create3DENEntity ["Marker","mil_end_noShadow", [740,19520,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorRed"];
_3Mrk set3DENAttribute ["markerName",_extractMarkers];

//Create Spawn position markers
_3Mrk = create3DENEntity ["Marker","mil_start_noShadow", [840,19520,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorBlack"];
_3Mrk set3DENAttribute ["markerName",_spawn1Marker];
_3Mrk = create3DENEntity ["Marker","mil_start_noShadow", [940,19520,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorWhite"];
_3Mrk set3DENAttribute ["markerName",_spawn2Marker];

//Create waypoint paths markers
for "_i" from 1 to 5 do {
	_3Mrk = create3DENEntity ["Marker","waypoint", [840,19520 - (_i*50),0]];
	_3Mrk set3DENLayer _3Layer;
	_3Mrk set3DENAttribute ["baseColor","ColorBlack"];
	_3Mrk set3DENAttribute ["markerName", _WPSpawn1Markers + str(_i)+ "_1"];
};
for "_i" from 1 to 5 do {
	_3Mrk = create3DENEntity ["Marker","waypoint", [940,19520 - (_i*50),0]];
	_3Mrk set3DENLayer _3Layer;
	_3Mrk set3DENAttribute ["baseColor","ColorWhite"];
	_3Mrk set3DENAttribute ["markerName", _WPSpawn2Markers + str(_i)+ "_1"];
};

//Create point of interest markers
_3Mrk = create3DENEntity ["Marker","loc_move", [840,19220,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorBlack"];
_3Mrk set3DENAttribute ["markerName",_POISpawn1Markers];
_3Mrk = create3DENEntity ["Marker","loc_move", [940,19220,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorWhite"];
_3Mrk set3DENAttribute ["markerName",_POISpawn2Markers];

//Create Heli spawn position marker
_3Mrk = create3DENEntity ["Marker","respawn_air", [840,19170,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorBlack"];
_3Mrk set3DENAttribute ["markerName",_heliSpawn1Marker];
_3Mrk = create3DENEntity ["Marker","respawn_air", [940,19170,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorWhite"];
_3Mrk set3DENAttribute ["markerName",_heliSpawn2Marker];

//Create Heli paradrop position markers
_3Mrk = create3DENEntity ["Marker","loc_heli",[840,19120,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorBlack"];
_3Mrk set3DENAttribute ["markerName",_paradropSpawn1Markers];
_3Mrk = create3DENEntity ["Marker","loc_heli",[940,19120,0]];
_3Mrk set3DENLayer _3Layer;
_3Mrk set3DENAttribute ["baseColor","ColorWhite"];
_3Mrk set3DENAttribute ["markerName",_paradropSpawn2Markers];