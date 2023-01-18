this addAction [
	"Fin de partie",
	{["MyEnding", true, 3] remoteExec ["BIS_fnc_endMission", 0, true]},
	nil,
	1.5,
	nil,
	nil,
	"",
	"count (units player inAreaArray [position _target,50,50]) isEqualTo (count units player)"]