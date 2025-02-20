params["_pad", "_vehicle", "_hasCrew"];

systemChat format["Pad %1, Vehicle %2", _pad, _vehicle];

_blocked = false;
systemChat format ["Checking %1 area.", _pad];
_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,10,true];
_objects = nearestTerrainObjects [_pad, [], 10];
_objects deleteAt (_objects find _pad);
if (count _objects > 0) then {
	_blocked = true;
};
_vehicles = vehicles inAreaArray _trig;
if (count _vehicles > 0) then {
	hint _vehicles;
	_blocked = true;
};

if (!_blocked) then {
	_vehicleSpawned = _vehicle createVehicle getPosASL _pad;
	_position = getPosASL _pad;
	_position set [2, (getPosASL _pad select 2)];
	_vehicleSpawned setPosASL _position;
	if (_hasCrew) then {
		createVehicleCrew _vehicleSpawned;
		_vehicleSpawned deleteVehicleCrew driver _vehicleSpawned;
		count crew _vehicleSpawned;
	};
	break;
} else {
	systemChat format ["%1 Blocked.", _pad];
};
deleteVehicle _trig;