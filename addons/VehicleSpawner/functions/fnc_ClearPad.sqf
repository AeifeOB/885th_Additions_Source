params["_pad"];

_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,10,true];


_vehicles = vehicles inAreaArray _trig;
{
	deleteVehicle _x;
} foreach _vehicles;
deleteVehicle _trig;
true;