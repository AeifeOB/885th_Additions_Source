#include "script_component.hpp"

_pads = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;

if (count _pads == 0) exitWith {
	systemChat "Add a pad to continue.";
};

["Store Vehicle", [
		[
			"LIST", 
			["Pads", "Select a Vehicle Pad."],
			[
				[GVAR(_pads)] call CBA_fnc_hashValues,
				[GVAR(_pads)] call CBA_fnc_hashKeys,
				0
			],
			true
		]
	],
	{
		_values = _this select 0;

		_pad = (_values select 0) select 0;

		[_pad] spawn FUNC(ClearPad);
	}
] call zen_dialog_fnc_create;