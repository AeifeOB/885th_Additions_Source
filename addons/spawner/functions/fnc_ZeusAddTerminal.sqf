#include "script_component.hpp"
/*
Create a terminal on an object via zeus module.

Params:
position <ARRAY>
object <OBJECT>

Returns:
none

Example:
[[0,0,0], <object>] call AIFE_spawner_fnc_ZeusAddTerminal;
*/
params ["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_groupHash = GVAR(padGroups);

if ([_groupHash] call CBA_fnc_hashSize == 0) then {
	hint "Please add pads first.";
};

_displayNames = [];
_lists = [];
_breakdown = {
	_displayNames pushBack _key;
	_lists pushBack _value;
};
[_groupHash, _breakdown] call CBA_fnc_hashEachPair;

private _config = missionConfigFile >> "AIFE_Spawner_Presets";

if (!isClass _config) then {
	_config = configFile >> "AIFE_Spawner_Presets";
};
private _presetDisplay = [];
private _presetValue = [];
{
	_presetDisplay pushBack getText(_x >> "displayName");
	_presetValue pushBack configName _x;
} forEach ("true" configClasses _config);

["Create Spawn Terminal", [
		[
			"EDIT", 
			"Display Name", 
			[
				"Spawn Terminal", 
				{},
				1
			]
		],
		[
			"EDIT", 
			"Vehicle List", 
			[
				GVAR(defaultVehicleList), 
				{},
				1
			]
		],
		[
			"LIST",
			"Vehicle Preset",
			[
				_presetValue,
				_presetDisplay,
				0,
				4
			]
		],
		[
			"LIST",
			"Group",
			[
				_displayNames,
				_displayNames,
				0,
				4
			]
		]
	],
	{
		params ["_dialogResult","_in"];

		_dialogResult params[
			"_name",
			"_vehicleList",
			"_preset",
			"_groupName"
		];

		_in params [
			"_object"
		];
		if (_object == objNull) exitWith {hint "Must be placed on an Object";};

		if ([GVAR(terminals), _name] call CBA_fnc_hashHasKey) then {
			_number = ([GVAR(terminals)] call CBA_fnc_hashSize);
			_name = format ["%1 %2", _name, _number];
			systemChat format ["Name is not unique. Updated to %1", _name];
		};
		// If there's text in the custom list
		if (count _vehicleList > 2) then {
			_vehicleList = parseSimpleArray _vehicleList;
			_vehicleList = [_vehicleList] call FUNC(ParseVehicles);
		};

		// If there's no custom list vehicles, use the preset
		if ([_vehicleList] call CBA_fnc_hashSize < 1) then {
			_vehicleList = [_preset] call FUNC(getVehicleList);
			
			// Remove costs until budgets are added.
			_newList = [];
			{
				_newList pushBack (_x select 0);			
			} forEach _vehicleList;
			_vehicleList = _newList;
			
			_vehicleList = [_vehicleList] call FUNC(ParseVehicles);
		};
		[GVAR(terminals), _name, [_object, _groupName, _vehicleList]] call CBA_fnc_hashSet;
		publicVariable QGVAR(terminals);
		[_object] remoteExec ["AIFE_spawner_fnc_AddTerminalActions", 0, true];
	}, {}, [_object]
] call zen_dialog_fnc_create;
