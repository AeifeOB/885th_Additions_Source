#include "script_component.hpp"
/*
Group List:
	groupDisplayName => [objectName_netId => [_object, _offset]]

*/
params ["_groupName"];

_emptyGroup = call CBA_fnc_hashCreate;
[GVAR(padGroups), _groupName, _emptyGroup] call CBA_fnc_hashSet;
publicVariable QGVAR(padGroups);