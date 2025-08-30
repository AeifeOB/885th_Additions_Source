#include "script_component.hpp"
params [
	"_unit"
];
_return = false;

private _nearestJammer = [objNull];
private _distJammer = -1;
private _distRad = -1;
{
	_y params ["_jamObj", "_radFalloff", "_radEffective", "_enabled", "_capabilities"];

	// if disabled, skip the jammer 
	if (!_enabled) then {continue};

	// get current dist 
	private _dist = _unit distance _jamObj;

	// if distance to object is bigger than radius of effective + falloff, continue 
	if (_dist > (_radFalloff + _radEffective)) then {continue;};

	// we are now within influence area, if this jammer is closer than previous jammers, we save it
	if (_distJammer == -1 || _distJammer > _dist) then {
		_distJammer = _dist;
		_nearestJammer = _y;
	};
} forEach crowsEW_main_jamMap;


private _nearestJammerObject = (_nearestJammer select 0);

if (isNull _nearestJammerObject) then {
	_return = false;
} else {
	// check for jammer capabilities and counteract signals accordingly
	private _radFalloff = _nearestJammer select 1;
	private _radEffective = _nearestJammer select 2;

	_return = [false, true] select (_distJammer <= _radEffective);
};

_return;
