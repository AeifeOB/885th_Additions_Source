#include "script_component.hpp"
/*/////////////////////////////////
Author: AifeSupport

module to create a vehicle spawn pad
////////////////////////////////*/
systemChat "Add Pad";

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
	private _object = objNull;
	if (count _units < 1) then {
		// no obj selected 
		private _posAGL = ASLToAGL getPosASL _logic;
		private _helipad = createVehicle ["Land_HelipadEmpty_F", _posAGL, [], 0, "NONE"];

		// set zeus editable 
		["zen_common_addObjects", [[_helipad], objNull]] call CBA_fnc_serverEvent;
		_object = _helipad;
	} else
	{
		_object = _units;
	};

	private _name = _logic getVariable ["Name",0];
	private _offset = _logic getVariable ["PadOffset",0];
	private _groupName = _logic getVariable ["GName",0];
	if (_object call AIFE_spawner_fnc_findPadByObject != "") exitWith {hint "This is already a pad"};

	_groupExists = [AIFE_spawner_padGroups, _groupName] call CBA_fnc_hashHasKey;
	if (!_groupExists) then {
		[_groupName] call FUNC(createPadGroup);
	};
	[_name, _offset, _object, _groupName] call AIFE_spawner_fnc_createPad;
};
