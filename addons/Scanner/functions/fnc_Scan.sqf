#include "script_component.hpp"

params ["_min", "_max"];

private _camPos = positionCameraToWorld [0,0,0];
private _signals = [];
private _beacons = crowsEW_spectrum_beacons;
{
	private _unit = _x select 0; 
	private _freq = _x select 1;
	private _range = _x select 2; 

	private _inRange = _min < _freq && _freq < _max;
	if (!_inRange) then {continue;};

	private _dist = _camPos distance _unit;
	if (_dist > _range) then {continue;};

	_signals pushBack [
		_freq,
		_dist
	];
} forEach _beacons;

_frequencies = [];
_displays = [];
{
	_frequencies pushBack (_x select 0);
	_displays pushBack format ["%1 mHz at %2 m", _x select 0, _x select 1];
} forEach _signals;

[
	"Search Results", 
	[
		[
			"LIST", 
			[
				"Signals in Range", 
				"Will set your primary frequency to your selection."
			], 
			[_frequencies,
			_displays]
		]
	],
	{
		AIFE_scanner_freq = (_this select 0) select 0;
	}
] call zen_dialog_fnc_create;