/* Détection de la position des tirs de mortier */
	
	
	/*
	artyDetectDBG = false;
	
	// DBG 
	
		rdmVal3k = 0.05;
		rdmVal2k = 0.33;
		rdmVal1k = 0.5;

		ka3k = 0.05;
		ka2k = 0.2;
		ka1k = 0.3;

	// DBG 
*/

/*
	[
		"StaticMortar",
		"fired",
		{
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
			//private _groups = allGroups select {_x getVariable ["artyDetectGroup","Default"] isEqualTo "TRUE"};
			{
				private _distance = (leader _x) distance _unit;
				private _knowsAbout = _x knowsAbout _unit;

				//[format ["Fired EH heard by %1 | Distance:%2 | knowsAbout:%3", _x, _distance, _knowsAbout]] remoteExec ["systemChat"];
				
				//systemChat format ["Distance entre le mortier et le groupe %1: %2", _x, str _distance];
				switch true do {
					case (_distance >= 3000): {
						//1 chance sur 10 de détecter l'origine du tir
						if (random 1 < rdmVal3k) then {
							//La détection est très imprécise. On ajoute très peu au knowsAbout (genre 0.05) -> il faut 32 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
							_x reveal [_unit,(_knowsAbout + ka3k)];
							[format ["Fired EH heard by %1 | Distance:%2 (case 3k)| knowsAbout:%3", _x, _distance, _knowsAbout]] remoteExec ["systemChat"];
						}; 
					};
					case (_distance > 1000 && _distance < 3000): {
						//3 chances sur 10 de détecter l'origine du tir						
						if (random 1 < rdmVal2k) then {
							//La détection est peu précise. On ajoute peu au knowsAbout (genre 0.1) -> il faut 16 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
							_x reveal [_unit,(_knowsAbout + ka2k)];
							[format ["Fired EH heard by %1 | Distance:%2 (case 2k) | knowsAbout:%3", _x, _distance, _knowsAbout]] remoteExec ["systemChat"];
						};
					};
					case (_distance <= 1000): {
						//1 chance sur 2 de détecter l'origine du tir
						if (random 1 < rdmVal1k) then {
							//La détection est assez précise. On ajoute assez au knowsAbout (genre 0.2) -> il faut 8 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
							_x reveal [_unit,(_knowsAbout + ka1k)];
							[format ["Fired EH heard by %1 | Distance:%2 (case 1k)| knowsAbout:%3", _x, _distance, _knowsAbout]] remoteExec ["systemChat"];
						};
					};
				};

				if (artyDetectDBG) then {

					private _tgKnowledge = (leader _x) targetKnowledge _unit;
					private _estPos = (_tgKnowledge)#6;
					private _estError = (_tgKnowledge)#5;
					_knowsAbout = _x knowsAbout _unit;
					
					private _mk_zn = createMarker [(format ["mk_plutotarget_zn_%1",_estError]),_estPos];
					_mk_zn setMarkerShape "ELLIPSE";
					_mk_zn setMarkerSize [_estError,_estError];
					_mk_zn setMarkerAlpha 0.3;
					private _mk_pos = createMarker [(format ["mk_plutotarget_pos_%1",_estError]),_estPos];
					_mk_pos setMarkerType "Contact_dot1";
					_mk_pos setMarkerColor "ColorRed";
					_mk_pos setMarkerText str _knowsAbout;

					[format ["tgKL:%1", _tgKnowledge]] remoteExec ["systemChat"];

				};
								
			} //forEach _groups;
			forEach [artyDetectGroup];
		}

	] call CBA_fnc_addClassEventHandler;

/* Détection de la position des tirs de mortier */

[
	"StaticMortar",
	"fired",
	{
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		//private _groups = allGroups select {_x getVariable ["artyDetectGroup","Default"] isEqualTo "TRUE"};
		{
			private _distance = (leader _x) distance _unit;
			private _knowsAbout = (leader _x) knowsAbout _unit;
			systemChat format ["Distance entre le mortier et le groupe %1: %2", _x, str _distance];
			switch true do {
				case (_distance >= 5000): {
					//1 chance sur 10 de détecter l'origine du tir
					if (random 1 < 0.1) then {
						//La détection est très imprécise. On ajoute très peu au knowsAbout (genre 0.05) -> il faut 32 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
						_x reveal [_unit,(_knowsAbout + 0.05)];
					}; 
				};
				case (_distance > 1000 && _distance < 5000): {
					//3 chances sur 10 de détecter l'origine du tir
					if (random 1 < 0.5) then {
						//La détection est peu précise. On ajoute peu au knowsAbout (genre 0.1) -> il faut 16 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
						_x reveal [_unit,(_knowsAbout + 0.1)];
					};

				};
				case (_distance <= 1000): {
					//1 chance sur 2 de détecter l'origine du tir
					if (random 1 < 0.5) then {
						//La détection est assez précise. On ajoute assez au knowsAbout (genre 0.2) -> il faut 8 tirs avec détection réussie pour obtenir un knowsAbout de 1.6
						_x reveal [_unit,(_knowsAbout + 0.2)];
					};
				};
			};

			private _tgKnowledge = (leader _x) targetKnowledge _unit;
			private _estPos = (_tgKnowledge)#6;
			private _estError = (_tgKnowledge)#5;
			
			private _mk_zn = createMarkerLocal [(format ["mk_plutotarget_zn_%1",_estError]),_estPos];
			_mk_zn setMarkerShapeLocal "ELLIPSE";
			_mk_zn setMarkerSizeLocal [_estError,_estError];
			_mk_zn setMarkerAlphaLocal 0.3;
			private _mk_pos = createMarkerLocal [(format ["mk_plutotarget_pos_%1",_estError]),_estPos];
			_mk_pos setMarkerTypeLocal "Contact_dot1";
			_mk_pos setMarkerColorLocal "ColorRed";
			_mk_pos setMarkerTextLocal str [(leader _x) knowsAbout _unit];
			
			
		} //forEach _groups;
		forEach [artyDetectGroup];
	
		
	}

] call CBA_fnc_addClassEventHandler;