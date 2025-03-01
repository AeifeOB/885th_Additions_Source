if (count AIFE_Spawner_pads == 0) exitWith {
	systemChat "Add a pad to continue.";
};
["Spawn Vehicle", [
		[
			"LIST", 
			["Pads", "Select Spawn Location."],
			[
				[AIFE_Spawner_pads] call CBA_fnc_hashValues,
				[AIFE_Spawner_pads] call CBA_fnc_hashKeys,
				0
			],
			true
		],
		[
			"LIST", 
			["Vehicle", "Vehicle you'd like to spawn."], 
			[
				[AIFE_Spawner_vehicleList] call CBA_fnc_hashValues,
				[AIFE_Spawner_vehicleList] call CBA_fnc_hashKeys,
				0
			],
			true
		], 
		[
			"CHECKBOX", 
			["Add Crew", "Add default crew, minus the driver."], 
			false,
			true
		], 
		[
			"CHECKBOX", 
			["Clear Pad", "Delete any vehicles on the pad (does not remove people nor map objects)."], 
			false,
			true
		]
	],
	{
		_values = _this select 0;

		_pad = (_values select 0) select 0;
		_padOffset = (_values select 0) select 1;
		_padArray = [_pad, _padOffset];

		_vehicle = (_values select 1) select 0;
		_crew = _values select 2;
		_clear = _values select 3;

		[_padArray, _vehicle, _crew, _clear] spawn AIFE_fnc_SpawnVehicle;
	}
] call zen_dialog_fnc_create;