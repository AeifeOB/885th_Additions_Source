#include "script_component.hpp"

params ["_position","_object"];
_displayNames = [];
_lists = [];
_breakdown = {
	_displayNames pushBack _key;
};
[GVAR(padGroups), _breakdown] call CBA_fnc_hashEachPair;
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
		if ([_object] call FUNC(findPadByObject) != "") exitWith {hint "This is already a pad"};
		
		if (_groupName != "CreateNewGroup") then {
			_group = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;
			[_name, _offset, _object, _groupName] call FUNC(createPad);
		} else {
			[_name, _offset, _object] call FUNC(createGroup);
		};
		
	}, {}, [_position, _object]
] call zen_dialog_fnc_create;