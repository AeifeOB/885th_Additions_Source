if (count AIFE_Spawner_pads == 0) then {
	hint "Add a pad to continue.";
};
["Store Vehicle", [
		[
			"LIST", 
			["Pads", "Select a Vehicle Pad."],
			[
				[AIFE_Spawner_pads] call CBA_fnc_hashValues,
				[AIFE_Spawner_pads] call CBA_fnc_hashKeys,
				0
			],
			true
		]
	],
	{
		_values = _this select 0;

		_pad = (_values select 0) select 0;

		[_pad] spawn AIFE_fnc_ClearPad;
	}
] call zen_dialog_fnc_create;