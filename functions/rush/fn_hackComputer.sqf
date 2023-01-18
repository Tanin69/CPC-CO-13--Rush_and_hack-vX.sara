/* Timer basique pour mission de type rush */
params ["_by"];

private _hackingTimer = 0;
private _seizedBy = "";
private _strGoHacking = "";
private _strLostControl = "";
private _strHackingDone = "";

if (_by isEqualTo "AMI")  then {
	_hackingTimer = ["AMIHackTimer"] call BIS_fnc_getParamValue;
	_strGoHacking = "une unité amie !";
	_strLostControl = "Les joueurs ont perdu le contrôle de la zone du PC !";
	_strHackingDone = "Vous avez récupéré les données. Cassez-vous de là !";
} else {
	_hackingTimer = ["ENIHackTimer"] call BIS_fnc_getParamValue;
	_strGoHacking = "une unité ennemie !";
	_strLostControl = "Les ennemis ont perdu le contrôle de la zone du PC !";
	_strHackingDone = "Les ennemis ont détruit les données. Il ne vous reste plus qu'à sauver votre peau !";
};

private _endHackingTime = time + _hackingTimer;
private _hackingDuration = 0;
private _hackingOK = false;

if (hackingDone) exitWith {};

[format["Le hacking du système vient d'être lancé par %1!", _strGoHacking]] remoteExec ["hint"];

while {_endHackingTime > time} do {
	if (_by isEqualTo "AMI")  then {_seizedBy = seizedByAMI} else {_seizedBy = seizedByENI};
	if (!_seizedBy) exitwith {
		//_strLostControl remoteExec ['systemChat'];
		_hackingOk = false;
	};
	sleep 5;
	_hackingDuration = _hackingDuration + 5;
	[format ["Le hack est démarré depuis %1 secondes !", _hackingDuration]] remoteExec ["systemChat"];
	_hackingOk = true;
};
if (_hackingOK) then {
	_strHackingDone remoteExec ["hint"];
	isHackable = false;
	hackingDone = true;
	publicVariable "isHackable";
	publicVariable "hackingDone";
};

allPlayers