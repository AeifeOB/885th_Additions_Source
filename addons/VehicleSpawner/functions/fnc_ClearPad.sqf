params["_padIndex"];

_dialog = findDisplay 3234;
_padControl = _dialog displayCtrl 2100;

for [{private _i = 0}, {_i < lbSize _padControl}, {_i = _i + 1}] do {
	if (_padControl lbIsSelected _i) then {
		_padIndex = _i;
		break;
	};
};
if (isNil "_padIndex") exitWith{ systemChat "No Pad Selected."};
_pad = pads select _padIndex;
_pad = missionNamespace getVariable (_pad select 1);

_trig = createTrigger ["EmptyDetector", getPos _pad];
_trig setTriggerArea [10,10,10,true];

_vehicles = vehicles inAreaArray _trig;
{
	deleteVehicle _x;
} foreach _vehicles;