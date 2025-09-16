#include "script_component.hpp"

params["_padArray", "_vehicle", "_hasCrew", "_clear"];

private _pad = _padArray select 0;
private _padOffset = _padArray select 1;

if (_clear) then {
	[_pad] call FUNC(ClearPad);
	sleep 1.5;
};
if ([_pad] call FUNC(CheckPad)) then {
	_vehicleSpawned = _vehicle createVehicle getPosASL _pad;
	_position = getPosASL _pad;
	_position set [2, (getPosASL _pad select 2) + _padOffset];
	_vehicleSpawned setPosASL _position;
	if (_hasCrew) then {
		createVehicleCrew _vehicleSpawned;
		_vehicleSpawned deleteVehicleCrew driver _vehicleSpawned;
		count crew _vehicleSpawned;
	};
	break;
} else {
	systemChat format ["Pad Blocked."];
};
