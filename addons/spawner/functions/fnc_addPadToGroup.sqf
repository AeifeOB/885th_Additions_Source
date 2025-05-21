#include "script_component.hpp"
/*
Pad List: 
	padName => [groupDisplayName, object]
Group List:
	groupDisplayName => [padName => [_object, _offset]]
	Param:
	_pad => [padName, [_object, _offset]]
*/
params ["_pad", "_groupName"];

// Get ALL Lists
_padList = GVAR(pads);
_groupList = GVAR(padGroups);
_group = FUNC(getGroupListByPad);

// Add _pad to both lists
_padName = _pad select 0;
_padInfo = _pad select 1;
_padObject = _padInfo select 0;

[_padList, _padName, [_groupName, _padObject]] call CBA_fnc_hashSet;
GVAR(pads) = _padList;
publicVariable QGVAR(pads);
[_group, _padName, _padInfo] call CBA_fnc_hashSet;
[_groupList, _groupName, _group] call CBA_fnc_hashSet;
GVAR(padGroups) = _groupList;
publicVariable QGVAR(padGroups);