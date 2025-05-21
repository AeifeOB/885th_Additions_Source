#include "script_component.hpp"

params ["_object"];
_groupHash = GVAR(padGroups);
_displayNames = [];
_lists = [];
_breakdown = {
	_displayNames append _key;
	_lists append _value;
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
				_lists,
				0,
				4
			]
		]
	],
	{
		params ["_dialogResult","_in"];
		_dialogResult params[
			"_name",
			"_list"
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

		_pads = [] call CBA_fnc_hashCreate;
		_vehicleList = [_list] call FUNC(ParseVehicles);

		[GVAR(terminals), _name, [_object, _pads, _vehicleList]] call CBA_fnc_hashSet;
		publicVariable QGVAR(terminals);
	}, {}, [_object]
] call zen_dialog_fnc_create;