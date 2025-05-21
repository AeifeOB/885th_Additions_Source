#include "script_component.hpp"

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
		_group = call CBA_fnc_hashCreate;
		[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
		publicVariable QGVAR(padGroups);
		_groupName;
	},{},[]
] call zen_dialog_fnc_create;

_groupName;