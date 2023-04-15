// List of combat zones for mission parameters. Be careful ! Combat zones must be in the same order as in cfgCombatZones.hpp

class CombatZone
{
	title = "Choix de la zone de combat";
	texts[] = {"Aléatoire (défaut)", "Bagango (carrière)", "Yoro (urbain)", "Acorcha (désert)", "Masbete (urbain)", "Obregan (urbain)", "Eponia (urbain)", "Pesto (forêt)", "Benoma (forêt clairsemée)", "Tres Vales (vallée boisée et encaissée)", "Passo Epone (plateau étroit sur flanc de montagne)", "Corazol (plages et ports)"};
	values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
	default = 0;
};