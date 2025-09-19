#include "script_component.hpp"
/*
Remove Vehicles on a pad.
TODO: Add vehicle worth to the budget. Non-list vehicles give based on mass.

Params:
pad <OBJECT>
offset <FLOAT>

Returns:
none

Example:
[<object>, 5.0] call AIFE_spawner_fnc_ClearPad;
*/
params["_pad", "_offset"];

_position = getPosASL _pad;
_position set [2, (getPosASL _pad select 2) + _offset];
_trig = createTrigger ["EmptyDetector", _position];
_trig setTriggerArea [10,10,0,true,20];


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
