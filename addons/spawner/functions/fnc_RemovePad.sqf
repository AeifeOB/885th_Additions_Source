#include "script_component.hpp"

params["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_padName = [_object] call FUNC(findPadByObject);
_group = [_padName] call FUNC(getGroupListByPad);
_groupName = ([_padList, _padName] call CBA_fnc_hashGet) select 0;

[GVAR(pads), _padName] call CBA_fnc_hashRem;
publicVariable QGVAR(pads);

[_group, _padName] call CBA_fnc_hashRem;
[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
publicVariable QGVAR(padGroups);