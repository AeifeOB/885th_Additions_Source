#include "script_component.hpp"
/*
Checks to see if a pad area is clear.
TODO: Add settings for check area size.

Params:
pad <OBJECT>

Returns:
none

Example:
[<object>] call AIFE_spawner_fnc_CheckPad;
*/
params ["_pad"];

_clear = true;
_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,0,true,10];
_objects = nearestTerrainObjects [_pad, ["ALL"], 10];
_objects append ((31 allObjects 0) inAreaArray _trig);
_objects append ((31 allObjects 1) inAreaArray _trig);
_objects append ((31 allObjects 2) inAreaArray _trig);
_objects deleteAt (_objects find _pad);
_objects deleteAt (_objects find _trig);

// Ignore hidden objects
_visibleObjects = [];
{
	if (!isObjectHidden _x) then {
		_visibleObjects pushBack _x;
	};
} forEach _objects;
_objects = _visibleObjects;
systemChat str _objects;
if (count _objects > 0) then {
	hint str _objects;
	_clear = false;
};

_vehicles = vehicles inAreaArray _trig;
// Ignore hidden Vehicles
_visibleObjects = [];
{
	if (!isObjectHidden _x) then {
		_visibleObjects pushBack _x;
	};
} forEach _vehicles;
_vehicles = _visibleObjects;
systemChat str _vehicles;

if (count _vehicles > 0) then {
	hint str _vehicles;
	_clear = false;
};
deleteVehicle _trig;
_clear;
