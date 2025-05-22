#include "script_component.hpp"
/*
Pad List: 
	padName => [groupDisplayName, object]
Group List:
	groupDisplayName => [padName => [_object, _offset]]
*/
params["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_padName = [_object] call FUNC(findPadByObject);
_groupName = ([GVAR(pads), _padName] call CBA_fnc_hashGet) select 0;
_group = [GVAR(padGroups), _groupName] call CBA_fnc_hashGet;

[_group, _padName] call CBA_fnc_hashRem;
[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
publicVariable QGVAR(padGroups);

[GVAR(pads), _padName] call CBA_fnc_hashRem;
publicVariable QGVAR(pads);