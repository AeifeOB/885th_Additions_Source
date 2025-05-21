#include "script_component.hpp"

params ["_position","_object"];
_groupHash = GVAR(padGroups);
_displayNames = [];
_lists = [];
_breakdown = {
	_displayNames pushBack _key;
};
[_groupHash, _breakdown] call CBA_fnc_hashEachPair;
_displayNames pushBack "CreateNewGroup";
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
		["SLIDER", "Z-Offset", [-5.0, 5.0, 1.0, 1]],
		[
			"LIST",
			"Group",
			[
				_displayNames,
				_displayNames
			]
		]
	],
	{
		params ["_dialogResult","_in"];
		_dialogResult params[
			"_name",
			"_offset",
			"_groupName"
		];
		_in params [
			"_position",
			"_object"
		];
		if (_object == objNull) exitWith {hint "Must be placed on an Object";};

		if ([_groupHash, _groupName] call CBA_fnc_hashHasKey) then {
			_group = [_groupHash, _groupName] call CBA_fnc_hashGet;
		} else {
			_groupName = call FUNC(createGroup);
			_groupHash = GVAR(padGroups);
			_group = [_groupHash, _groupName] call CBA_fnc_hashGet;
		};
		_nameCheck = [GVAR(pads), _name] call CBA_fnc_hasGet;
		if (!isNil _nameCheck) then {
			hint "Name is not unique.";
			_number = netId _object;
			_name = format ["%1 %2", _name, _number];
		};
		[_name, [_object, _offset], _groupName] call FUNC(addPadToGroup);
	}, {}, [_position, _object]
] call zen_dialog_fnc_create;