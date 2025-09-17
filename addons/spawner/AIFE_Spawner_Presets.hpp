/*
	Extend this list by adding your own AIFE_Spawner_Presets file using this format
	Readable displayName
	list of object class names, with a cost (not yet implemented).

	Add the following line to your config.cpp
	#include "AIFE_Spawner_Presets.hpp"
*/
class AIFE_Spawner_Presets {
	class vanilla {
		displayName = "Vanilla";
		objects[] = {
			{"B_APC_Wheeled_01_cannon_F", 0},
			{"B_Heli_Light_01_dynamicLoadout_F", 0},
			{"B_Heli_Transport_01_F", 0}
		};
	};
};
