#include "script_component.hpp"
/*
Terminal List:
	_name => [_object, _groupName, _vehicleList]
Pad List: 
	padName => [groupDisplayName, object]
Group List:
	groupDisplayName => [padName => [_object, _offset]]
*/
params ["_object"];

_terminalName = [_object] call FUNC(findTerminal);
_terminal = [GVAR(terminals), _terminalName] call CBA_fnc_hashGet;

_object = _terminal select 0;
_groupName = _terminal select 1;
_vehicleList = _terminal select 2;

_pads = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;
//_count = [_pads] call CBA_fnc_hashSize;

/*if (_count == 0) exitWith {
	systemChat "Add a pad to continue.";
};*/

["Spawn Vehicle", [
		[
			"LIST", 
			["Pads", "Select Spawn Location."],
			[
				[_pads] call CBA_fnc_hashValues,
				[_pads] call CBA_fnc_hashKeys,
				0
			],
			true
		],
		[
			"LIST", 
			["Vehicle", "Vehicle you'd like to spawn."], 
			[
				[_vehicleList] call CBA_fnc_hashValues,
				[_vehicleList] call CBA_fnc_hashKeys,
				0
			],
			true
		], 
		[
			"CHECKBOX", 
			["Add Crew", "Add default crew, minus the driver."], 
			false,
			true
		], 
		[
			"CHECKBOX", 
			["Clear Pad", "Delete any vehicles on the pad (does not remove people nor map objects)."], 
			false,
			true
		]
	],
	{
		_values = _this select 0;

		_pad = (_values select 0) select 0;
		_padOffset = (_values select 0) select 1;
		_padArray = [_pad, _padOffset];

		_vehicle = (_values select 1) select 0;
		_crew = _values select 2;
		_clear = _values select 3;

		[_padArray, _vehicle, _crew, _clear] spawn FUNC(SpawnVehicle);
	}
] call zen_dialog_fnc_create;
