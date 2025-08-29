#include "script_component.hpp"

params ["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_groupHash = GVAR(padGroups);

if ([_groupHash] call CBA_fnc_hashSize == 0) then {
	hint "Please add pads first.";
};

_displayNames = [];
_lists = [];
_breakdown = {
	_displayNames pushBack _key;
	_lists pushBack _value;
};
[_groupHash, _breakdown] call CBA_fnc_hashEachPair;

["Create Spawn Terminal", [
		[
			"EDIT", 
			"Display Name", 
			[
				"Spawn Terminal", 
				{},
				1
			]
		],
		[
			"EDIT", 
			"Vehicle List", 
			[
				GVAR(defaultVehicleList), 
				{},
				1
			]
		],
		[
			"LIST",
			"Group",
			[
				_displayNames,
				_displayNames,
				0,
				4
			]
		]
	],
	{
		params ["_dialogResult","_in"];

		_dialogResult params[
			"_name",
			"_list",
			"_groupName"
		];

		_in params [
			"_object"
		];
		if (_object == objNull) exitWith {hint "Must be placed on an Object";};

		if ([GVAR(terminals), _name] call CBA_fnc_hashHasKey) then {
			hint "Name is not unique.";
			_number = ([GVAR(terminals)] call CBA_fnc_hashSize);
			_name = format ["%1 %2", _name, _number];
		};
		
		_vehicleList = [_list] call FUNC(ParseVehicles);

		[GVAR(terminals), _name, [_object, _groupName, _vehicleList]] call CBA_fnc_hashSet;
		publicVariable QGVAR(terminals);
		[_object] remoteExec ["AIFE_spawner_fnc_AddTerminalActions", 0, true];
	}, {}, [_object]
] call zen_dialog_fnc_create;
