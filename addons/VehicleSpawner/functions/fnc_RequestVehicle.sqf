params["_pads","_vehicles"];
/*
private _dialog = (uiNamespace getVariable "885SpawnerUI");
_dialog = createDialog "VehicleSpawnDialog";
if (!_dialog) then { hint "Dialog could not be opened!" };
waitUntil {!isNull (findDisplay 3234)};

lbClear 2100;
{
	_index = lbAdd [2100, _x select 0];
	_data = lbSetData [2100, _index, _x select 1];
} forEach _pads;
lbClear 2101;
{
	_index = lbAdd [2101, _x select 0];
	_data = lbSetData [2101, _index, _x select 1];
} forEach _vehicles;
*/
["Spawn Vehicle", [
		[
			"LIST", 
			["Pads", "Select Spawn Location."],
			[
				["AIFE_Spawner_pads"] call CBA_fnc_hashValues,
				["AIFE_Spawner_pads"] call CBA_fnc_hashKeys,
				0
			],
			true
		],
		[
			"LIST", 
			["Vehicle", "Vehicle you'd like to spawn."], 
			[
				["AIFE_Spawner_vehicleList"] call CBA_fnc_hashValues,
				["AIFE_Spawner_vehicleList"] call CBA_fnc_hashKeys,
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
			["Clear Pad", "Delete any objects on the pad (does not remove people)."], 
			false,
			true
		]
	],
	{
		_values = _this select 0;

		_pad = _values select 0;
		_vehicle = _values select 1;
		_crew = _values select 2;
		_clear = _values select 3;

		if (_clear) then {
			[_pad] call AIFE_fnc_ClearPad;
		};
		[_pad, _vehicle, _crew] call AIFE_fnc_SpawnVehicle;
	}
] call zen_dialog_fnc_create;