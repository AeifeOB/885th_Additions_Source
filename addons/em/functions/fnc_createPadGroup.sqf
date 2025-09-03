#include "script_component.hpp"
/*/////////////////////////////////
Author: AifeSupport

create a vehicle spawn pad group
////////////////////////////////*/
systemChat "Group";

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
		private _helipad = createVehicle ["Land_HelipadEmpty_F", _posAGL, [], 0, "NONE"];

		// set zeus editable 
		["zen_common_addObjects", [[_helipad], objNull]] call CBA_fnc_serverEvent;
		_objects = [_helipad];
	} else
	{
		_objects = _units;
	};

	private _names = _logic getVariable ["Name",0];
	private _offset = _logic getVariable ["PadOffset",0];
	private _groupName = _logic getVariable ["GroupName",0];
	// Create group
	_groupExists = [AIFE_spawner_padGroups, _groupName] call CBA_fnc_hashHasKey;
	if (!_groupExists) then {
		[_groupName] call FUNC(addGroup);
		systemChat str AIFE_spawner_padGroups;
	};
	// Parse Pad Names
	_names = "["+_names+"]";
	_padNames = parseSimpleArray _names;
	// Create Pads with Offsets
	{
		if (_x call AIFE_spawner_fnc_findPadByObject != "") 
		exitWith {
			["This is already a pad"] remoteExec ["systemchat", 0, false];
		};
		_name = _padNames param [_forEachIndex];
		if (isNil "_name") then {
			_name = "Pad";
		};
		
		[_name, _offset, _x, _groupName] call AIFE_spawner_fnc_createPad;
	} forEach _objects;

	
};
