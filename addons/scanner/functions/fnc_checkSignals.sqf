#include "script_component.hpp"

if (!GVAR(isActive)) exitWith{};
if (!GVAR(mainActive)) exitWith{};
if (GVAR(jammable) && player call FUNC(isJammed)) exitWith {};

// cam position
private _camPos = positionCameraToWorld [0,0,0];
private _beacons = crowsEW_spectrum_beacons;
{
	private _unit = _x select 0; 
	private _freq = _x select 1;
	private _range = _x select 2; 

	private _dist = _camPos distance _unit;
	if (_dist > _range) then {continue;};
	if (GVAR(jammable) && _unit call FUNC(isJammed)) then {
		continue;
	};
	private _color = [0,0,0];
	switch (floor(10 * _freq)/10) do {
		case GVAR(freq): {
			_color = GVAR(colorOne);
		};
		case GVAR(altfreq): {
			if (!GVAR(altActive)) then {continue;};
			_color = GVAR(colorTwo);
		};
		case GVAR(publicfreq): {
			if (!GVAR(civActive)) then {continue;};
			_color = GVAR(colorThree);
		};
		default {
			continue;
		};
	};
	
	private _txt = "";
	if (_dist > 10) then {
		_txt = format["( %1 m )", round(_dist)]; 
	};

	[_dist, _unit, _color, _txt] call FUNC(drawSignalIcon);	
} forEach _beacons;
