# README

## What is "Rush and hack"

TODO

## Changelog

### v5, 14/01/2023

#### Changed

* Number of enemy AI is dynamically balanced according to the exact number of players and friendly AI (at the start of the mission) and the difficulty settings
* Added two heavy gunners -> 15 possible slots

#### Fixed

* Enemies can't no longer access the computer after players hack it
* All unused files and scripts removed

#### Added

* New mission param - players can choose the combat zone or leave it random
* New mission param - customizable difficulty levels : balance of power, reinforcements, VCom (or not VCom) and timers for the hacking (enemies and players)
* New mission param - customizable enemy faction (4 factions at the moment)
* New mission param - customizable player faction (4 factions at the moment)
* New mission param - customizable delay before enemy rush

### v4, 04/01/2023

#### Changed

* Large groups have less probability to have a grenadier (VCom is very aggressive with grenades)
* Path for ENI marksman group is more consistent
* Timer for reinforcements waits one player to move outside spawn area (same as AI rush)
* rush&hack functions are now precompiled

#### Fixed

#### Added

* Marker based system to automagically generate configuration for a new combat zone
* New combat area "Obregan"

### v3, 02/01/2023

#### Fixed

* Correction for "GETIN NEAR" order for one of the special task group

#### Added

* Combat zones are now confugurable to easyly add new ones. 3 new combat zones added. Combat Zone is randomly chosen in the configured ones.

### v2, 31/12/2022

#### Changed

* AI rush starts as soon as a human player leave the delimited area at the spawn position
* More AI, more reinforcements
* Rudimentary implementation of dynamic balancing according to the number of players (friendly AI + humans)

#### Fixed

* It is no more possible to download data after their destruction

#### Added

* Spawn point randomly chosen from the two possible spawn positions
* Extraction position randomly chosen from several positions

### v1, 29/12/2022

Initial release

## Backlog

### Next release

* players are able to choose ENI and players faction in a set of preconfigured factions

### Not planned
