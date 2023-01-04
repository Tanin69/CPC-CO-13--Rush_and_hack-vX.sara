/* Generate a config text from markers */

/* HOW TO
1- Generate the set of markers with fn_createMarkerSet
2- Place the markers, if needed, add some by copying relevant ones (waypoints, extraction position, paradrop positions, etc.)
3- Create the config file from markers with the present function : the config file will be copied to the clipboard
*/

#define TAB  "	"

params ["_areaName"];

if (isNil "_areaName") exitWith {systemChat "Le nom de la zone est un paramètre obligatoire : traitement interrompu."};
if (_areaName isEqualTo "") exitWith {systemChat "Le nom de la zone ne peut pas être vide : traitement interrompu."};

//We use "almost" the same marker names as in createMarkerSet functions... (see _WPSpawn1Markers for example)
private _prefix = "rah";
private _prefixArea = _prefix + "_" + _areaName;
private _areaMarker = _prefix + "_" + _areaName + "_combatZone";
private _objectiveMarkers = _prefixArea + "_obj";
private _heavyWeaponMarker = _prefixArea + "_heavyWeapon";
private _extractMarkers = _prefixArea + "_Extract_";
private _prefixSpawn1 = _prefixArea + "_Spawn1";
private _prefixSpawn2 = _prefixArea + "_Spawn2";
private _spawn1Marker = _prefixSpawn1 + "_Pos";
private _spawn2Marker = _prefixSpawn2 + "_Pos";
private _WPSpawn1Markers = _prefixSpawn1 + "_WP_";
private _WPSpawn2Markers = _prefixSpawn2 + "_WP_";
private _POISpawn1Markers = _prefixSpawn1 + "_POI_";
private _POISpawn2Markers = _prefixSpawn2 + "_POI_";
private _heliSpawn1Marker = _prefixSpawn1 + "_HeliSpawnPos";
private _heliSpawn2Marker =  _prefixSpawn2 + "_HeliSpawnPos";
private _paradropSpawn1Markers = _prefixSpawn1 + "_paradrop_";
private _paradropSpawn2Markers = _prefixSpawn2 + "_paradrop_";

private _hwClass = "CUP_B_M113A3_GER";

//helper functions
private _openClass = {
	params ["_name", ["_level",1]];
	private _indent = "";
	for "_i" from 1 to _level do {
		_indent = _indent + TAB;
	};
	_str = _indent + "class " + _name + endl + _indent + "{" + endl;
	systemChat _str;
	_str
};
private _closeClass = {
	params [["_level",0]];
	private _indent = "";
	for "_i" from 1 to _level do {
		_indent = _indent + TAB;
	};
	_str = _indent + "};" + endl;
	_str
};
private _openAttrib = {
	params ["_name",["_level",3]];
	private _indent = "";
	for "_i" from 1 to _level do {
		_indent = _indent + TAB;
	};
	_str = _indent + _name + " = {";
	_str
};
private _closeAttrib = {
	_str = "};" + endl;
	_str
};
private _createAttrib = {
	params ["_array","_filter","_name",["_level",3]];
	private _obj = _array select {[_filter, _x, true] call BIS_fnc_inString};
	private _str = "";	
	//write attrib opening string
	_str = [_name,_level] call _openAttrib;	
	{
		private _pos = _x get3DENAttribute "position";
		_pos = str(_pos#0);
		_pos = [_pos, "[", "{"] call int_fnc_replaceInString;
		_pos = [_pos, "]", "}"] call int_fnc_replaceInString;
		_str = _str + _pos;
		//We add the 
		if (_forEachIndex < (count _obj)-1) then {_str = _str + ","};
	} forEach _obj;
	//write attrib ending string
	_str = _str + ([] call _closeAttrib);
	_str
};

//Enumarate all markers with the right prefix
private _tbMrk = all3DENEntities#5;
private _tbMrkRah = _tbMrk select {[_prefixArea, _x, true] call BIS_fnc_inString};

if (count _tbMrkRah isEqualTo 0) exitWith {systemChat "Aucun marqueur correspondant trouvé : traitement interrompu."};

/*generate config*/

//open root class
private _config = [_areaName] call _openClass;

//open sub class Objectives
_config = _config + (["Objectives",2] call _openClass);
//build attribute objectivePos[]
_config = _config + ([_tbMrkRah,_objectiveMarkers,"objectivePos[]",3] call _createAttrib);
//build heavy weapon attribute, harcoded
_config = _config + TAB + TAB + TAB + "heavyWeaponClassname = " + str(_hwClass) + ";" + endl;
//build attribute heavyWeaponPos[]
_config = _config + ([_tbMrkRah,_heavyWeaponMarker,"heavyWeaponPos[]",3] call _createAttrib);
//build attribute combatZone[]
_config = _config + ([_tbMrkRah,_areaMarker,"combatZone[]",3] call _createAttrib);
//-close sub class
_config = _config + ([2] call _closeClass);

//Build sub class extraction
_config = _config + (["Extraction",2] call _openClass);
_config = _config + ([_tbMrkRah,_extractMarkers,"extractionPos[]",3] call _createAttrib);
_config = _config + ([2] call _closeClass);

//Build sub class spawnPoints
_config = _config + (["SpawnPoints",2] call _openClass);
_config = _config + (["SpawnPoint_1",3] call _openClass);
_config = _config + ([_tbMrkRah,_spawn1Marker,"spawnPos[]",4] call _createAttrib);

//It's a little more complicated for paths because of multiple nested arrays
_config = _config + (["paths[]",4] call _openAttrib);
for "_i" from 1 to 5 do {
	//Create paths for waypoint with the right patern
	private _path = _tbMrkRah select {[_WPSpawn1Markers+str(_i), _x, true] call BIS_fnc_inString};
	private _str = "";
	if ((count _path) isNotEqualTo 0) then {
		_config = _config + "{";
		{
			private _pos = _x get3DENAttribute "position";
			_pos = str(_pos#0);
			_pos = [_pos, "[", "{"] call int_fnc_replaceInString;
			_pos = [_pos, "]", "}"] call int_fnc_replaceInString;
			_str = _str + _pos;
			if (_forEachIndex < (count _path)-1) then {_str = _str + ","};
		} forEach _path;
		_config = _config + _str + "},";
	};
};
_config = _config trim [",", 2];
_config = _config + ([] call _closeAttrib);

_config = _config + ([_tbMrkRah,_POISpawn1Markers,"pointsOfInterest[]",4] call _createAttrib);
_config = _config + ([_tbMrkRah,_heliSpawn1Marker,"heliSpawnPos[]",4] call _createAttrib);
_config = _config + ([_tbMrkRah,_paradropSpawn1Markers,"paradropPos[]",4] call _createAttrib);
_config = _config + ([3] call _closeClass);
_config = _config + (["SpawnPoint_2",3] call _openClass);
_config = _config + ([_tbMrkRah,_spawn2Marker,"spawnPos[]",4] call _createAttrib);
//It's a little more complicated for paths because of multiple nested arrays
_config = _config + (["paths[]",4] call _openAttrib);
for "_i" from 1 to 5 do {
	//Create paths for waypoint with the right patern
	private _path = _tbMrkRah select {[_WPSpawn2Markers+str(_i), _x, true] call BIS_fnc_inString};
	private _str = "";
	if ((count _path) isNotEqualTo 0) then {
		_config = _config + "{";
		{
			private _pos = _x get3DENAttribute "position";
			_pos = str(_pos#0);
			_pos = [_pos, "[", "{"] call int_fnc_replaceInString;
			_pos = [_pos, "]", "}"] call int_fnc_replaceInString;
			_str = _str + _pos;
			if (_forEachIndex < (count _path)-1) then {_str = _str + ","};
		} forEach _path;
		_config = _config + _str + "},";
	};
};
_config = _config trim [",", 2];
_config = _config + ([] call _closeAttrib);
_config = _config + ([_tbMrkRah,_POISpawn2Markers,"pointsOfInterest[]",4] call _createAttrib);
_config = _config + ([_tbMrkRah,_heliSpawn2Marker,"heliSpawnPos[]",4] call _createAttrib);
_config = _config + ([_tbMrkRah,_paradropSpawn2Markers,"paradropPos[]",4] call _createAttrib);
_config = _config + ([3] call _closeClass);
_config = _config + ([2] call _closeClass);

//close root class
_config = _config + ([1] call _closeClass);

//Copy the generated config to clipboard
copyToClipboard _config;


