#include "script_component.hpp"
/*/////////////////////////////////
Author: AifeSupport

create a vehicle spawn terminal
////////////////////////////////*/

_logic = param[
	0,
	objNull,
	[objNull]
];

// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [
	1,
	[],
	[[]]
];

// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
_activated = param [
	2,
	true,
	[true]
];

if (_activated) then {
	private _objects = [];
	if (count _units < 1) then {
		// no obj selected 
		private _posAGL = ASLToAGL getPosASL _logic;
		private _terminal = createVehicle ["AIFE_VehicleTerminal", _posAGL, [], 0, "NONE"];

		// set zeus editable 
		["zen_common_addObjects", [[_terminal], objNull]] call CBA_fnc_serverEvent;
		_objects = [_terminal];
	} else
	{
		_objects = _units;
	};
	private _objects = _objects select 0;

	private _name = _logic getVariable ["TerminalName",0];
	private _group = _logic getVariable ["PadGroup",0];
	private _preset = _logic getVariable ["Preset",0];
	private _vehicleList = _logic getVariable ["CustomList",0];
	
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
	[_objects, _name, _group, _vehicleList] call FUNC(assignTerminal);
};
