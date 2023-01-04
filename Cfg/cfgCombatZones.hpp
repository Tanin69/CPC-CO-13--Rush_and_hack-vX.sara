class CfgCombatZones
{
	//Name of the combat zone
	class Bagango
	{
		//Objective data
		class Objectives
		{
			//Possible positions for the objective to be spawned
			objectivePos[] = {
				{13761.2,12849,0},
				{13745.6,12727.8,0},
				{13702.3,12737.4,0}
			};
			heavyWeaponClassname = "CUP_B_M113A3_GER";
			heavyWeaponPos[] = {{13709.9,12760.7,-0.00499916}};
			combatZone[] = {{13738.1,12760.3}};
		};
		//Extraction point data
		class Extraction
		{
			//Possible positions for the extraction point
			extractionPos[] = {
				{14181,12589.8},
				{14199.2,12494.3},
				{14270.3,12715.2},
				{13264.7,12881.6}
			};
		};
		//All data for spawn positions
		class SpawnPoints
		{
			//All data for this precise spawn position
			class SpawnPoint_1
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{13144.9,13414.6,200}};				
				//Various paths for IA progression to objective
				paths[] = {
					{{13246.9,12881.6},{13587.1,12807.1}},
					{{13629.7,13126.3},{13766.3,13057.9}},
					{{13335.5,13257.1},{13612,12835.8}},
					{{13378.3,13382},{13818.6,13122.6},{13930.2,12887.7}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{13990.5,13064.4},
					{14009.1,12890.4},
					{13700,13022.7}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{16000,16009.8}};
				//Possible paradrop positions
				paradropPos[] = {
					{13804.3,13110.5},
					{14016.8,12925.4},
					{13965.2,12703.8},
					{13871.1,12514},
					{14029.4,12698.7},
					{13807.3,12445.9},
					{14075.7,12582.7},
					{14217.5,12676.3},
					{14190.8,12520},
					{14036.5,12499.6},
					{14030.4,12775.9}
				};
			};
			class SpawnPoint_2
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{14334.3,11947.5,300}};
				//Various paths for IA progression to objective
				paths[] = {
					{{13954.6,12265.3},{13748.1,12479.3}},
					{{14167.1,12218.3},{13998.6,12468.7}},
					{{14212.5,12262.8},{13953,12672.6}},
					{{13775.4,12173.3},{13450.6,12570.9},{13567.5,12733.3}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{13804.7,12483.4},
					{13980.5,12729.1},
					{14000.6,12989.6}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{16000,16009.8}};
				//Possible paradrop positions
				paradropPos[] = {
					{13804.3,13110.5},
					{14016.8,12925.4},
					{13965.2,12703.8},
					{13871.1,12514},
					{14029.4,12698.7},
					{13807.3,12445.9},
					{14075.7,12582.7},
					{14217.5,12676.3},
					{14190.8,12520},
					{14036.5,12499.6},
					{14030.4,12775.9}
				};				
			};
		};
	};
	class Yoro
	{
		//Objective data
		class Objectives
		{
			//Possible positions for the objective to be spawned
			objectivePos[] = {
				{9836.7,8695.29,53.9765},
				{9755.76,8639.73,151.005},
				{9728.35,8713.82,35.9836}
			};
			heavyWeaponPos[] = {{9786.18,8704.79,3.9368}};
			heavyWeaponClassname = "CUP_O_KORD_high_RU_M_MSV";
			combatZone[] = {{9776.36,8691.76}};			
		};
		//Extraction point data
		class Extraction
		{
			//Possible positions for the extraction point
			extractionPos[] = {
				{10158.9,8355.14},
				{9800.05,8962.49},
				{9606.81,9384.8},
				{10306.3,8581.95}
			};
		};
		//All data for spawn positions
		class SpawnPoints
		{
			//All data for this precise spawn position
			class SpawnPoint_1 //North position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{10133.8,9144.5,77}};
				//Various paths for IA progression to objective
				paths[] = {
					{{9996.89,9134.67},{9788.8,8942.58},{9738.63,8812.46}},
					{{10159.9,9016.54},{10066.7,8939.47},{10003.3,8880.92},{9900.56,8805.63}},
					{{10339.1,8877.33},{10206.5,8719.6},{10050.5,8630.57},{9877.26,8583.97}}				
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{9403.46,8658.05},
					{9991.37,8867.64,0}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{8438.61,11631.8}};
				//Possible paradrop positions
				paradropPos[] = {
					{9706.59,9247.26},
					{9319.05,8956.65},
					{10037,8310.75},
					{10070.5,8991.63}
				};
			};
			class SpawnPoint_2 //South position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{9150.87,8326.12,180}}; //180
				//Various paths for IA progression to objective
				paths[] = {
					{{9319.91,8440.3},{9316.58,8591.83}},
					{{9368.9,8290.93},{9710.32,8305.04},{9850.73,8459.19}},
					{{9319.91,8440.3},{9316.58,8591.83},{9456.39,8805.14}},
					{{9348.88,8330.23},{9502.94,8471.13},{9638.89,8549.26}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{9403.46,8658.05}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{16000,16009.8}};
				//Possible paradrop positions
				paradropPos[] = {
					{9765.25,8362.22},
					{10133.5,8317.68},
					{9739.56,8909.44},
					{9450.11,8756.15}
				};				
			};
		};
	};
	class Acorcha
	{
		//Objective data
		class Objectives
		{
			//Possible positions for the objective to be spawned
			objectivePos[] = {
				{10401.4,6125.35,180}, //[10401.4,6125.35,63.3411,271]
				{10416.2,6170.95,90}, //[10416.2,6170.95,62.4818,0]
				{10366.3,6129.96,82} //[10366.3,6129.96,63.9374,82]
			};
			heavyWeaponPos[] = {{10403.5,6173.04,0}};
			heavyWeaponClassname = "CUP_O_BTR90_RU";
			combatZone[] = {{10383.9,6145.22}};			
		};
		//Extraction point data
		class Extraction
		{
			//Possible positions for the extraction point
			extractionPos[] = {
				{10191.4,6403.72},
				{10617.8,6249.32},
				{10028,5986.65}
			};
		};
		//All data for spawn positions
		class SpawnPoints
		{
			//All data for this precise spawn position
			class SpawnPoint_1 //East position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{11260.3,6123.03,350}}; //270
				//Various paths for IA progression to objective
				paths[] = {
					{{11161.9,6151.44},{10663.2,6229.79}},
					{{11161.9,6151.44},{10823.1,5926.94},{10331.7,5942.82}},
					{{11161.9,6151.44},{10997.8,6295.45},{10687.5,6444.76},{10435.5,6386.52}},				
					{{11161.9,6151.44},{10513.9,6088.95}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{10631.3,6296.52},
					{10648.6,6666.96}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{10287.8,4147.87}};
				//Possible paradrop positions
				paradropPos[] = {
					{10417.2,5881.91},
					{10053.1,6075.33},
					{10179.6,6460.98},
					{10749.2,6118.32}

				};
			};
			class SpawnPoint_2 //South position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{9502,6209.31,0}}; //180
				//Various paths for IA progression to objective
				paths[] = {
					{{9627.28,6246.99},{9745.08,6287.34}},
					{{9575.94,6096.55},{9957.61,5841.99},{10338.5,5961.39}},
					{{9575.94,6096.55},{10040,5982.88}},
					{{10075.8,6157.2},{10298.3,6137.14}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{10648.6,6666.96},
					{9893.53,5826.71}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{10287.8,4147.87}};
				//Possible paradrop positions
				paradropPos[] = {
					{10417.2,5881.91},
					{10053.1,6075.33},
					{10179.6,6460.98},
					{10749.2,6118.32}
				};				
			};
		};
	};
	class Masbete
	{
		//Objective data
		class Objectives
		{
			//Possible positions for the objective to be spawned
			objectivePos[] = {
				{17398.3,14093.4,0}, //[17398.3,14093.4,13.0763,3.00003]
				{17358.3,14239.6,330}, //[17358.3,14239.6,13.455,241]
				{17209.2,14177.2,130} //[17209.2,14177.2,13.5497,130.984]
			};
			heavyWeaponPos[] = {{17267.9,14231.6,0}};
			heavyWeaponClassname = "CUP_O_BRDM2_RUS";
			combatZone[] = {{17267.9,14231.6}};			
		};
		//Extraction point data
		class Extraction
		{
			//Possible positions for the extraction point
			extractionPos[] = {
				{17446.8,13730.6},
				{17820.2,14478.6},
				{16805.9,14517.7},
				{17059,13835.5}
			};
		};
		//All data for spawn positions
		class SpawnPoints
		{
			//All data for this precise spawn position
			class SpawnPoint_1 //East position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{18075.6,14455.5,340}}; // 340, 260, 160, 70
				//Various paths for IA progression to objective
				paths[] = {
					{{17996.9,14452},{17724.2,14068.6}},
					{{17996.9,14452},{17724.2,14068.6},{17486.2,13966.2}},
					{{17996.9,14452},{17714.5,14232},{17480.7,14191.8}},				
					{{17823.9,14501.8},{17414.2,14392.5}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{17466.8,13950.7},
					{17495.1,14154.5},
					{17154.4,13865.8}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{19537.8,12558.9}};
				//Possible paradrop positions
				paradropPos[] = {
					{17473.8,13736},
					{16934.1,14268.8},
					{17649.6,14094.4},
					{17511.2,14324.2}
				};
			};
			class SpawnPoint_2 //South position
			{
				//Spawn position : beware ! third array element is for the composition direction !
				spawnPos[] = {{16559.6,13749.3,20}};
				//Various paths for IA progression to objective
				paths[] = {
					{{16695.9,13779.9},{16832.1,13950.3}},
					{{16695.9,13779.9},{17095.1,13836.8}},
					{{16695.9,13779.9},{16922.1,13990.4},{17120,14122.7}},
					{{16695.9,13779.9},{16857,14175.9},{16858.4,14341.4},{16958.3,14409.2},{17139.4,14363.5}}
				};
				//Interesting positions for AI, for example to put a marksman
				pointsOfInterest[] = {
					{16702.3,14353.9},
					{16999.4,13957.8}
				};
				//Spawn position for helicopter that will grop paratroopers reinforcement
				heliSpawnPos[] = {{19537.8,12558.9}};
				//Possible paradrop positions
				paradropPos[] = {
					{17473.8,13736},
					{16934.1,14268.8},
					{17649.6,14094.4},
					{17511.2,14324.2}
				};				
			};
		};
	};
	class Obregan
	{
		class Objectives
		{
			objectivePos[] = {{14667.7,10756.9,39.5},{14305.1,10925.5,35.375},{14427.2,10797.4,16.0581}};
			heavyWeaponClassname = "CUP_B_M113A3_GER";
			heavyWeaponPos[] = {{14442.6,10887.5,24.0537}};
			combatZone[] = {{14399.7,10833.7,-2.64063}};
		};
		class Extraction
		{
			extractionPos[] = {{14718.7,10742.2,36.5063},{14391.7,11129.4,37.9307},{14298.5,10450.3,35.5541}};
		};
		class SpawnPoints
		{
			class SpawnPoint_1
			{
				spawnPos[] = {{14630.5,11621.9,80}};
				paths[] = {{{14601.7,11474.7,44.4915},{14494,11328.5,41.788},{14412.3,11032.4,46.316}},{{14728,11204.8,50.9845},{14745.5,10961.6,50.4808}},{{14649.7,11460.7,46.7962},{14610.5,11231.6,48.3688},{14541.9,11055.3,46.622}}};
				pointsOfInterest[] = {{14592,10988.5,52.9984}};
				heliSpawnPos[] = {{12374.3,10612.2,0}};
				paradropPos[] = {{14418.9,11216.2,43.9629},{14697.6,10945.3,49.6226},{14221.8,10802.7,37.2269},{14734.6,10662.3,49.3746}};
			};
			class SpawnPoint_2
			{
				spawnPos[] = {{14098.9,10054.3,120}};
				paths[] = {{{14218.4,10343.6,45.6116},{14558.2,10459.8,63.4855},{14651.8,10650.3,50.9638}},{{14185.7,10345.9,44.0691},{14111.9,10568.6,20.4476},{14109.7,10930.1,35.6069}},{{14279.3,10325.3,51.0012},{14388.4,10578.4,49.5388},{14414.5,10698.2,43.8784}}};
				pointsOfInterest[] = {{14251.3,10695.2,37.6214},{14448.3,10614.4,53.9367}};
				heliSpawnPos[] = {{12373.4,10587,0}};
				paradropPos[] = {{14143.3,10851.5,36.5132},{14190.2,11087.9,39.3214},{14569.1,10495.7,52.2864},{14820.6,10717.8,56.7034}};
			};
		};
	};
};

