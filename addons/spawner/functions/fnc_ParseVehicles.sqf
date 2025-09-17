#include "script_component.hpp"
/*
	Get list of vehicle classnames and display names as a list.

	Arguments:
	array <ARRAY>

	Return Value:
	Pairs of classnames and display names <ARRAY>

	Example:
	[["class_1", "class_2"]] call FUNC(ParseVehicles);
	
	TODO: Add Budgets
*/
params ["_array"];

_list = [] call CBA_fnc_hashCreate;
{
	_displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	if (!isNil("_displayName")) then {
		if ([_list, _displayName] call CBA_fnc_hashHasKey) then {
			hint format ["Duplicate Entry %1", _displayName];
			continue;
		};
		[_list, _displayName, [_x]] call CBA_fnc_hashSet;
	}
} forEach _array;
_list;
