/* Briefing au format sqf */

//Crédits
player createDiaryRecord ["Diary", ["Crédits", "

<font color='#ff0505'>Rush-and-hack</font color><br/><br/>

Auteur : tanin69<br/><br/>

Lucy et VCom (or not VCom)<br/><br/>

Repo github : https://github.com/Tanin69/CPC-CO-15-Rush_and_hack-vX.sara

"]];


//Fin de mission
player createDiaryRecord ["Diary", ["Conditions de victoire", "

> <font color='#00ff65'>Ils ont pris la patée</font color> : vous avez téléchargé les données et vous avez réussi à extraire au moins un personnel<br/><br/>

> <font color='#ffa500'>Vous ferez mieux la prochaine fois</font color> : vous n'avez pas téléchargé les données, mais vous avez réussi à extraire votre équipe.<br/><br/>

> <font color='#ff0505'>La honte est sur vous</font color> : vous n'avez pas téléchargé les données et vous êtes tous morts.<br/><br/>

"]];

//Intel
player createDiaryRecord ["Diary", ["Intel", "

> Il y a une arme lourde abandonnée sur la zone. Les ennemis chercheront probablement à s'en emparer.<br/><br/>

> Les ennemis savent où se trouve le PC à hacker : ils tenteront probablement de prendre le contrôle de cette zone rapidement.<br/><br/>

> La position du PC est plus ou moins connue (selon les paramètres de mission)

"]];

//Mission
player createDiaryRecord ["Diary", ["Mission", "

Récupérer les données et vous extraire.<br/><br/>

> Les données sont dans un PC, lui-même enfermé dans un container vert.<br/><br/>

> Pour déclencher le téléchargement (interaction ACE), vous devez contrôler la zone du PC dans un rayon de 20 mètres. Vous devez maintenir ce contrôle pendant 10 minutes. Toute perte de contrôle de cette zone annule et réinitialise le téléchargement.<br/><br/>

> Une fois les données téléchargées, vous devez rejoindre le <marker name='marker_extract'>point d'extraction</marker>.<br/><br/>

Si la faction ennemie prend le contrôle de la zone PC et la tient pendant un certain temps (selon les paramètres de mission) continu, elle aura réussi à détruire les données. Dans ce cas, pour éviter une déroute complète, extrayez-vous au plus vite pour préserver vos effectifs.

"]];

//Situation
player createDiaryRecord ["Diary", ["Situation", "

Le temps pour arriver sur la zone est approximativement le même pour vous et les ennemis, soit environ 5 minutes de course.<br/><br/>

Les ennemis rushent dès qu'un joueur huimain sort de la zone de spawn, avec un délai supplémentaire (ou pas)selon les paramètres de mission.

"]]; 

//Contexte
player createDiaryRecord ["Diary", ["Contexte", "

Un violent accrochage a eu lieu <marker name='marker_zone'>sur cette zone</marker>. Il ne reste plus personne sur place. La faction ennemie a laissé de précieuses données sur zone.<br/><br/>

Vous êtes insérés dans <marker name='marker_spawn_joueurs'>un avant-poste</marker> non loin de la zone de combat.<br/><br/>

Des renforts ennemis partent <marker name ='marker_spawn_AI'>de cette position</marker> et rushent sur la zone pour détruire les données afin qu'elles ne tombent pas entre vos mains.<br/><br/>

Faction jouée : Voir les paramètres<br/>
Faction ENI : Voir les paramètres<br/>

"]];