#include "script_component.hpp"
/*//////////////////////////
Create a pad from a dialog box.
Used by ZeusModule

Params: 
padName <STRING>
offset <FLOAT>
object <OBJECT>

Returns: 
Group Name<STRING>

Example:
["Group 1", 1, <object>] call AIFE_spawner_fnc_ZeusAddPad;

NOTES:
	Group Hash Layout:
		groupDisplayName => [padName => [_object, _offset]]
//////////////////////////*/

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
		
		if (_groupName == "CreateNewGroup") then {
			[_name, _offset, _object] call FUNC(ZeusCreateGroup);
		} else {
			_group = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;
			_name = [_name, _object, _groupName] call FUNC(addPad);
			[_name, _offset, _object, _groupName] call FUNC(addPadToGroup);
		};
	}, {}, [_position, _object]
] call zen_dialog_fnc_create;
