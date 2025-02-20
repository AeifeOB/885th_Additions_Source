params["_padIndex", "_vehicleIndex", "_hasCrew"];

_dialog = findDisplay 3234;
_padControl = _dialog displayCtrl 2100;
_vehicleControl = _dialog displayCtrl 2101;
_crewControl = _dialog displayCtrl 2102;

for [{private _i = 0}, {_i < lbSize _padControl}, {_i = _i + 1}] do {
	if (_padControl lbIsSelected _i) then {
		_padIndex = _i;
		break;
	};
};
if (isNil "_padIndex") exitWith{ systemChat "No Pad Selected."};
for [{private _i = 0}, {_i < lbSize _vehicleControl}, {_i = _i + 1}] do {
	if (_vehicleControl lbIsSelected _i) then {
		_vehicleIndex = _i;
		break;
	};
};
if (isNil "_vehicleIndex") exitWith{ systemChat "No Vehicle Selected."};
_hasCrew = ctrlChecked _crewControl;

systemChat format["Pad %1, Vehicle %2", _padIndex, _vehicleIndex];

_pad = (pads select _padIndex);
_padName = _pad select 0;
_pad = missionNamespace getVariable (_pad select 1);
_vehicle = (vehicleList select _vehicleIndex);
_vehicleName = _vehicle select 0;
_vehicle = _vehicle select 1;

systemChat format["Pad %1, Vehicle %2", _padName, _vehicleName];  

_blocked = false;
systemChat format ["Checking %1 area.", _padName];
_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,10,true];
_objects = nearestTerrainObjects [_pad, [], 10];
_objects deleteAt (_objects find _pad);
if (count _objects > 0) then {
	_blocked = true;
};
_vehicles = vehicles inAreaArray _trig;
if (count _vehicles > 0) then {
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
	systemChat format ["%1 Blocked.", _padName];
};
deleteVehicle _trig;