#include "script_component.hpp"
/*
Checks to see if a pad area is clear.
TODO: Add settings for check area size.

Params:
pad <OBJECT>
offset <FLOAT>

Returns:
none

Example:
[<object>, 5] call AIFE_spawner_fnc_CheckPad;
*/
params ["_pad", "_offset"];

_clear = true; 
_position = getPosASL _pad;
_position set [2, (getPosASL _pad select 2) + _offset];
_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,0,true,20];
_objects = nearestTerrainObjects [_pad, [""], 20];
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

if (count _vehicles > 0) then {
	hint str _vehicles;
	_clear = false;
};
deleteVehicle _trig;
_clear;
