#include "script_component.hpp"
/*
	Get list of vehicle classnames and display names as a list.

	Arguments:
	0: Text <string>

	Return Value:
	Pairs of classnames and display names <ARRAY>

	Example:
	["class_1", "class_2"] call FUNC(ParseVehicles);
	
	TODO: Add Budgets
*/
params ["_text"];
private _array = [];
if (typeName _text != "ARRAY") then {
	_array = parseSimpleArray _text;
} else {
	_array = _text;
};
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
