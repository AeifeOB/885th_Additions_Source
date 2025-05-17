#include "script_component.hpp"

if (count GVAR(pads) == 0) then {
	hint "Add a pad to continue.";
};
["Store Vehicle", [
		[
			"LIST", 
			["Pads", "Select a Vehicle Pad."],
			[
				[GVAR(pads)] call CBA_fnc_hashValues,
				[GVAR(pads)] call CBA_fnc_hashKeys,
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