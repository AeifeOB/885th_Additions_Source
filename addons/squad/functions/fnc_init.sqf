#include "script_component.hpp"

GVAR(icon_drawEH) = addMissionEventHandler [
	"Draw3D", 
	{
		if (GVAR(jammable) && player call FUNC(isJammed)) then {
			continue;
		} else {
			{
				_dist = positionCameraToWorld [0,0,0] distance2D _x;
				_isJammed = false;
				if (GVAR(jammable) && _x call FUNC(isJammed)) then {
					_isJammed = true;
				};
				if (alive _x && !_isJammed) then {
					[_dist,_x] call FUNC(drawSignalIcon);
				}
			} forEach (units group player) - [player];
		};
	}
];
systemChat "Initiated";