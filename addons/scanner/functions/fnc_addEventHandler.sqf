#include "script_component.hpp"

GVAR(icon_drawEH) = addMissionEventHandler [
	"Draw3D", 
	{
		call FUNC(checkSignals);
	}
];