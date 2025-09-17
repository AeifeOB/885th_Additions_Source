#include "script_component.hpp"
/*
	Take terminal parameters and add them globally.

	Arguments:
	object <object>
	name <string>
	group <string>
	vehicleList <array>

	Return Value:
	Nil

	Example:
	[<object>, "Terminal", "Group 1", [["class_name", 0]]] call FUNC(assignTerminal);
*/
params["_object","_name","_group","_vehicleList"];

if (_object == objNull) exitWith {
	private _message = format ["No Object"];
	ERROR_WITH_TITLE("No Object Found",_message);
	[]
};

if ([GVAR(terminals), _name] call CBA_fnc_hashHasKey) then {
	_number = ([GVAR(terminals)] call CBA_fnc_hashSize);
	_name = format ["%1 %2", _name, _number];
	systemChat format ["Name is not unique. Changed to %1", _name];
};

[GVAR(terminals), _name, [_object, _group, _vehicleList]] call CBA_fnc_hashSet;
publicVariable QGVAR(terminals);
[_object] remoteExec ["AIFE_spawner_fnc_AddTerminalActions", 0, true];
