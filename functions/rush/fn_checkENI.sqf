/* Timer basique pour mission de type rush */

private _ENITimer = ["ENIHackTimer"] call BIS_fnc_getParamValue;

duration = 0;
while {isNotHacked && seizedByENI && duration < _ENITimer } do {
	sleep 30;
	duration = duration + 30;
	[format ["Les ennemis tentent de détruire les données depuis %1 secondes !", duration]] remoteExec ["systemChat"];
};
if (duration >= _ENITimer) then {
	isHackable= false;
	publicVariable "isHackable";
	"L'ennemi est parvenu à détruire les données. Echec mission : procédez à l'extraction." remoteExec ["hint"];
};