params ["_pad"];

_clear = true;
_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,10,true];
_objects = nearestTerrainObjects [_pad, [], 10];
_objects deleteAt (_objects find _pad);
if (count _objects > 0) then {
	hint str _objects;
	_clear = false;
};
_vehicles = vehicles inAreaArray _trig;
if (count _vehicles > 0) then {
	hint str _vehicles;
	_clear = false;
};
deleteVehicle _trig;
_clear;