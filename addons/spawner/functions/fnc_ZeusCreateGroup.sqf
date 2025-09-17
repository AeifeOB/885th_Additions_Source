#include "script_component.hpp"
/*//////////////////////////
Create a group from a dialog box then add pad and group to lists.
Used by ZeusModule

Params: 
padName <STRING>
offset <FLOAT>
object <OBJECT>

Returns: 
Group Name<STRING>

Example:
["Group 1", 1, <object>] call AIFE_spawner_fnc_ZeusCreateGroup;

NOTES:
	Group Hash Layout:
		groupDisplayName => [padName => [_object, _offset]]
//////////////////////////*/

params["_name", "_offset", "_object"];
_groupName = ["Create Group", 
	[
		[
			"EDIT", 
			"Group Name",
			[
				"Group", 
				{},
				1
			]
		]
	], 
	{
		params ["_dialogResult","_in"];
		_dialogResult params[
			"_groupName"
		];
		_in params [
			"_name", 
			"_offset", 
			"_object"
		];

		_groupName = [_groupName] call FUNC(addGroup);
		_name = [_name, _object, _groupName] call FUNC(addPad);
		[_name, [_object, _offset], _groupName] call FUNC(addPadToGroup);
	},
	{

	},
	[
		_name, 
		_offset, 
		_object
	]
] call zen_dialog_fnc_create;

_groupName;
