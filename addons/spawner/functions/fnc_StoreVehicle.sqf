#include "script_component.hpp"

params ["_object"];

_terminalName = [_object] call FUNC(findTerminal);
_terminal = [GVAR(terminals), _terminalName] call CBA_fnc_hashGet;
_groupName = _terminal select 1;
_pads = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;

if (count _pads == 0) exitWith {
	systemChat "Add a pad to continue.";
};

["Store Vehicle", [
		[
			"LIST", 
			["Pads", "Select a Vehicle Pad."],
			[
				[_pads] call CBA_fnc_hashValues,
				[_pads] call CBA_fnc_hashKeys,
				0
			],
			true
		]
	],
	{
		_values = _this select 0;

		_pad = (_values select 0) select 0;
		_padOffset = (_values select 0) select 1;

		[_pad, _padOffset] spawn FUNC(ClearPad);
	}
] call zen_dialog_fnc_create;
