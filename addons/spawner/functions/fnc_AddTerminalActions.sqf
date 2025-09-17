#include "script_component.hpp"
/*
Add Actions to the Terminal after it's created
(also adds the deleted EH)

Params:
object <OBJECT>

Returns:
none

Example:
[_object] call AIFE_spawner_fnc_AddTerminalActions;
*/
params ["_object"];

_object addAction
[
	"Request Vehicle",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		[_target] spawn AIFE_spawner_fnc_RequestVehicle;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_object addAction
[
	"Store Vehicle",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		[_target] spawn AIFE_spawner_fnc_StoreVehicle;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_object addEventHandler ["Deleted", {
	params ["_entity"];
	[getPos _entity, _entity] call FUNC(ZeusRemoveTerminal);
}];
