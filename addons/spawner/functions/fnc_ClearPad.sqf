#include "script_component.hpp"
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
