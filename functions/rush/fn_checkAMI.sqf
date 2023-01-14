/* Timer basique pour mission de type rush */

private _AMITimer = ["AMIHackTimer"] call BIS_fnc_getParamValue;

duration = 0;
while {seizedByAMI && duration < _AMITimer } do {
	sleep 30;
	duration = duration + 30;
	[format ["Le hack du système est lancé depuis %1 secondes !", duration]] remoteExec ["systemChat"];
};
if (duration >= _AMITimer) then {
	isHackable= false;
	isNotHacked = false;
	publicVariable "isHackable";
	publicVariable "isNotHacked";
	"Vous êtes parvenus à récupérer les données. Cassez-vous de là !!!." remoteExec ["hint"];
};