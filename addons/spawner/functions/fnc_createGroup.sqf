#include "script_component.hpp"
/*
Group List:
	groupDisplayName => [padName => [_object, _offset]]
*/
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

		_groupExists = [GVAR(padGroups), _groupName] call CBA_fnc_hashHasKey;
		if (_groupExists) then {
			hint "Group Already Exists";
		} else {
			_group = [] call CBA_fnc_hashCreate;
			[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
			publicVariable QGVAR(padGroups);
		};
		
		_nameExists = [GVAR(pads), _name] call CBA_fnc_hashHasKey;
		if (_nameExists) then {
			hint "Name is not unique.";
			_number = netId _object;
			_name = format ["%1 %2", _name, _number];
		};
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