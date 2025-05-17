#include "script_component.hpp"

params ["_position","_object"];

["Create Pad", [
		[
			"EDIT", 
			"Display Name", 
			[
				"Pad", 
				{},
				1
			]
		],
		["SLIDER", "Z-Offset", [-5.0, 5.0, 1.0, 1]]
	],
	{
		params ["_dialogResult","_in"];
		_dialogResult params[
			"_name",
			"_offset"
		];
		_in params [
			"_position",
			"_object"
		];
		if (_object == objNull) exitWith {hint "Must be placed on an Object";};

		if ([GVAR(pads), _name] call CBA_fnc_hashHasKey) then {
			hint "Name is not unique.";
			_number = ([GVAR(pads)] call CBA_fnc_hashSize);
			_name = format ["%1 %2", _name, _number];
		};

		[GVAR(pads), _name, [_object, _offset]] call CBA_fnc_hashSet;
		publicVariable QGVAR(pads);
	}, {}, [_position, _object]
] call zen_dialog_fnc_create;