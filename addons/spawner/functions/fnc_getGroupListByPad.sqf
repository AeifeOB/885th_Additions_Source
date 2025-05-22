#include "script_component.hpp"
/*
Pad List: 
	objectName_netId => [groupDisplayName, object]
Group List:
	groupDisplayName => [objectName_netId, [_object, _offset]]

*/
params ["_padName"];

//Get GroupName from PadList
_padList = GVAR(pads);

_groupName = ([_padList, _padName] call CBA_fnc_hashGet) select 0;
if (isNil _groupName) exitWith {systemChat "no pad found";};

_groupList = GVAR(padGroups);
_group = [_groupList, _groupName] call CBA_fnc_hashGet;

_group;