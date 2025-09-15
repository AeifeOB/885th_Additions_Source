#include "script_component.hpp"
/*
	Take terminal parameters and add them globally.

	Arguments:
	0: Object <object>
	1: Name <string>
	2: Group <string>
	3: VehicleList <array>

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
	hint "Name is not unique.";
	_number = ([GVAR(terminals)] call CBA_fnc_hashSize);
	_name = format ["%1 %2", _name, _number];
};
hint str _group;
systemChat str _vehicleList;

[GVAR(terminals), _name, [_object, _group, _vehicleList]] call CBA_fnc_hashSet;
publicVariable QGVAR(terminals);
[_object] remoteExec ["AIFE_spawner_fnc_AddTerminalActions", 0, true];