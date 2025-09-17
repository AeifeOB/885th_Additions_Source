#include "script_component.hpp"
/*
Remove Vehicles on a pad.
TODO: Add vehicle worth to the budget. Non-list vehicles give based on mass.

Params:
pad <OBJECT>

Returns:
none

Example:
[<object>] call AIFE_spawner_fnc_ClearPad;
*/
params["_pad"];

_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,0,true,10];


_vehicles = vehicles inAreaArray _trig;
// Ignore hidden Vehicles
{
	if (isObjectHidden _x) then {
		continue;
	};
	//TODO add vehicle to budget
	deleteVehicle _x;
} forEach _vehicles;

deleteVehicle _trig;
true;
