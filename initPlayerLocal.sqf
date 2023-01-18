/* 
	from cash-cache/harballer script
*/

params ["_player","_didJIP"];

[_player,_didJip] call int_fnc_initLoadout;

//Lance le briefing
execVM "briefing.sqf";

[] call GDC_fnc_inventoryBriefing_v2; // lancement du script qui affiche le loadout lors du briefing.
[] call GDC_fnc_rosterBriefing; // lancement du script qui affiche le roster lors du briefing.