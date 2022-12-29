/* Timer basique pour mission de type rush */

duration = 0;
while {seizedByENI && duration < 300 } do {
	sleep 30;
	duration = duration + 30;
	[format ["Les ennemis tentent de détruire les données depuis %1 secondes !", duration]] remoteExec ["systemChat"];
};
if (duration >= 300) then {
	isHackable= false;
	"L'ennemi est parvenu à détruire les données. Echec mission : procédez à l'extraction." remoteExec ["hint"];
};