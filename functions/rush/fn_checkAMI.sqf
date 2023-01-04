/* Timer basique pour mission de type rush */

duration = 0;
while {seizedByAMI && duration < 600 } do {
	sleep 30;
	duration = duration + 30;
	[format ["Le hack du système est lancé depuis %1 secondes !", duration]] remoteExec ["systemChat"];
};
if (duration >= 600) then {
	isHackable= false;
	"Vous êtes parvenus à récupérer les données. Cassez-vous de là !!!." remoteExec ["hint"];
};