params ["_player","_didJIP"];

// Variables pour les loadouts
playerUnit = _player;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _didJIP;	// boolean (true ou false). True = le joueur se connecte en cours de partie.

private _playersFaction = ["PlayersFaction"] call BIS_fnc_getParamValue;
private _playersLoadout = "";
switch (_playersFaction) do {
	case 1: {_playersLoadout = "BAF"};
	case 2: {_playersLoadout = "KSK"};
	case 3: {_playersLoadout = "FR"};
	case 4: {_playersLoadout = "CZ_SpecOp"};
};

call compile preprocessFileLineNumbers ("loadout\loadout_" + _playersLoadout + ".sqf");

if !(isNil {_player getVariable "loadout"}) then // La variable loadout doit être placée dans l'éditeur [init de l'unité] => this setVariable ["loadout", "aaf_sl"];
{
	if (isNil {_player getVariable "loadout_done"}) then // loadout_done inexistant, on lance la function loadout
	{
		[_player] call hard_setLoadout;
		_player setVariable ["loadout_done", true, true]; // loadout_done permet de vérifier si le loadout a été fait afin d'éviter les doublons en cas de déco / reco.
	};
};

_player action ["WeaponOnBack", _player]; // pour que le joueur ait l'arme baissée

if !(isMultiplayer) then
{
	{
		if !(isNil {_x getVariable "loadout"}) then 
		{
			if (isNil {_x getVariable "loadout_done"}) then 
			{
				[_x] call hard_setLoadout;
				_x setVariable ["loadout_done", true, true];
			};
		};
	} foreach allUnits;
};

player allowdamage false;

waitUntil {time > 1};
if ((uniform _player) == "") then {
[_player] call hard_setLoadout;
_player setVariable ["loadout_done", true, true];
_player action ["WeaponOnBack", _player];
};

waitUntil {time > 10};
player allowdamage true;