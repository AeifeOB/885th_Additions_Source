#include "script_component.hpp"
/*//////////////////////////
Add Pad to Group list

Params: 
padName <STRING>
offset <FLOAT>
object <OBJECT>
groupName <STRING>

Returns: 
Group Name<STRING>

Example:
["Pad 1", 1, <object>, "Group 1"] call AIFE_spawner_fnc_addPadToGroup;

NOTES:
	Pad Hash Layout:
		padName => [groupDisplayName, object]
	Group Hash Layout:
		groupDisplayName => [padName => [_object, _offset]]
//////////////////////////*/
params ["_padName", "_offset", "_object", "_groupName"];

_groupList = GVAR(padGroups);
_group = [_groupList, _groupName] call CBA_fnc_hashGet;

_padInfo = [_object, _offset];

[_group, _padName, _padInfo] call CBA_fnc_hashSet;
[_groupList, _groupName, _group] call CBA_fnc_hashSet;
GVAR(padGroups) = _groupList;
publicVariable QGVAR(padGroups);
