class params
{
	class CombatZone
	{
		title = "Choix de la zone de combat";
		texts[] = {"Aléatoire (défaut)", "Acorcha (désert)", "Bagango (carrière)", "Masbete (urbain)", "Obregan (urbain)", "Yoro (urbain)", "Eponia (urbain)", "Pesto (forêt)", "Benoma (forêt clairsemée)", "Tres Vales (vallée boisée et encaissée)"};
		values[] = {0,1,2,3,4,5,6,7,8,9};
		default = 0;
	};
	class ENIFaction
	{
		title = "Choix de la faction ennemie";
		texts[] = {"Czech Republic", "British Armed Forces", "Russes MSV", "Sahrani Army"};
		values[] = {0,1,2,3};
		default = 2;
	};
	class PlayersFaction
	{
		title = "Choix de la faction des joueurs";
		texts[] = {"British Armed Forces", "KSK", "Armée française", "Czech Spec Ops"};
		values[] = {1,2,3,4};
		default = 1;
	};	
	class BalanceOfPower
	{
		title = "Rapport de force initial";
		texts[] = {"~1vs2","~1vs4 (défaut)","~1vs6","~1vs8"};
		values[] = {2,4,6,8};
		default = 4;
	};
	class Reinforcements
	{
		title = "Renforts";
		texts[] = {"Peu (toutes les 7 à 10 minutes)","Normalement (défaut - toutes les 5 à 8 minutes)","Beaucoup (toutes les 3 à 6 minutes)", "Aléatoire"};
		values[] = {0,1,2,9};
		default = 1;		
	};
	class AIBoost
	{
		title = "IA survitaminées (VCom)";
		texts[] = {"Non","Oui (défaut)"};
		values[] = {0,1};
		default = 1;
	};
	class ENIHackTimer
	{
		title = "Durée du hack ENI";
		texts[] = {"5 min (Cours, Forest !)";"10 min (Y'a pas le feu au lac)";"20 min (La vengeance est un plat qui se mange froid)"};
		values[] = {300,600,1200};
		default = 600;
	};
	class AMIHackTimer
	{
		title = "Durée du hack AMI";
		texts[] = {"5 min (Prends l'oseille et tire-toi)";"10 min (Tu reprendras bien un verre ?)";"20 min (Fort Alamo)"};
		values[] = {300,600,1200};
		default = 600;
	};
	class DelayBeforeRush
	{
		title = "Délai avant rush des hostiles";
		texts[] = {"Aucun (défaut)","5 min","10 min","15 min","20 min","Aléatoire (entre 0 et 10 minutes)"};
		values[] = {0,300,600,900,1200,1};
		default = 0;
	};	
};