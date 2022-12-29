/* Build mission environnement */

//Place the container and the computer - LARS spawn composition scripts : https://forums.bohemia.net/forums/topic/191902-eden-composition-spawning/
objectivePos = selectRandom [[13761.2,12849,0],[13745.6,12727.8,0],[13702.3,12737.4,0]];
publicVariable "objectivePos";

private _compReference = ["container_computer", [objectivePos#0,objectivePos#1,0]] call LARs_fnc_spawnComp;

//Add triggers for hacking management
private _trg = createTrigger ["EmptyDetector", objectivePos];
_trg setTriggerArea [20, 20, 0, false, 0];
_trg setTriggerActivation ["WEST SEIZED", "PRESENT", true];
_trg setTriggerStatements ["this", "systemChat 'Les joueurs ont pris le contrôle de la zone du PC';seizedByAMI = true;isHackable = true;publicVariable 'seizedByAMI';publicVariable 'isHackable'", "systemChat 'Les joueurs ont perdu le contrôle de la zone du PC';seizedByAMI = false;isHackable = false;publicVariable 'seizedByAMI';publicVariable 'isHackable'"];

_trg = createTrigger ["EmptyDetector", objectivePos];
_trg setTriggerArea [20, 20, 0, false, 0];
_trg setTriggerActivation ["EAST SEIZED", "PRESENT", true];
_trg setTriggerStatements ["this", "'La zone du PC est contrôlée par les hostiles !' remoteExec ['systemChat'];seizedByENI = true;isHackable = false;publicVariable 'seizedByENI';publicVariable 'isHackable';execVM 'functions\misc\fn_checkENI.sqf';", "'Les hostiles ont perdu le contrôle de la zone du PC !' remoteExec ['systemChat'];seizedByENI=false;isHackable = true;publicVariable 'seizedByENI';publicVariable 'isHackable'"];