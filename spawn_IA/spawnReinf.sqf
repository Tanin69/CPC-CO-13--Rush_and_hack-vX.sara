/* Very basic perpetual reinforcements */

//sleep 60;
sleep 180 + random 180;

private _grpDef = GROUPE_ENI_GRAND;
private _side = opfor;
private _spawn = "marker_spawn_ENI";
private _objectivePos = "marker_objectif_3";
private _grp = objNull;

//Paths for group progression
private _paths = [
	[getMarkerPos "mrkPath1_1", getMarkerPos "mrkPath1_2"],
	[getMarkerPos "mrkPath2_1", getMarkerPos "mrkPath2_2"],
	[getMarkerPos "mrkPath3_1", getMarkerPos "mrkPath3_2"],
	[getMarkerPos "mrkPath4_1", getMarkerPos "mrkPath4_2",getMarkerPos "mrkPath4_3"]
];

while {true} do {

	private _typeReinf = selectRandom ["inf", "para"];

	if (_typeReinf isEqualTo "inf") then {

		_grp = [(getMarkerPos _spawn), _side, selectRandom _grpDef] call GDC_fnc_lucySpawnGroupInf;
		private _grpPath = selectRandom _paths + [selectRandom[getMarkerPos "marker_objectif_1",getMarkerPos "marker_objectif_2",getMarkerPos "marker_objectif_3"]];

		[
			_grp,
			_grpPath,
			"true",
			[0,0,0],
			["FULL","AWARE","YELLOW"],
			"NO CHANGE",
			"SAD",
			["FULL","COMBAT","RED"],
			"NO CHANGE",
			"",
			0
		] call GDC_fnc_lucyReinforcement;
		
	} else {
		
		private _posParadrop = selectRandom ["mrkParadrop_1","mrkParadrop_2","mrkParadrop_3","mrkParadrop_4","mrkParadrop_5","mrkParadrop_6","mrkParadrop_8","mrkParadrop_9","mrkParadrop_10","mrkParadrop_11"];
		_grp = [
			getMarkerPos "mrkSpawnParadrop",
			getMarkerPos _posParadrop,
			getMarkerPos "mrkSpawnParadrop",
			opfor,
			["CUP_O_Mi8AMT_RU","CUP_O_RU_Pilot", 150],
			selectRandom _grpDef,
			"FULL"
		]  call GDC_fnc_lucySpawnGroupInfParadrop;
		
		_grp = _grp#0;
		[_grp,["marker_objectif_1","marker_objectif_2","marker_objectif_3","marker_extract"],["MOVE","NORMAL","AWARE","YELLOW","VEE"]] call GDC_fnc_lucyGroupRandomPatrol;
		
	};

	//sleep 10;
	sleep 180 + random 60;

};

