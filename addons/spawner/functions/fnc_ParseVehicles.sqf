#include "script_component.hpp"
params ["_text"];

private _array = parseSimpleArray _text;
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