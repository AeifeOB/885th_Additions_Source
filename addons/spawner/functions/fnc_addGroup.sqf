#include "script_component.hpp"
/*//////////////////////////
Create a pad group with the given name.

Params: 
groupName <STRING>

Returns: 
groupName <STRING>

Example:
["Group 1"] call AIFE_spawner_fnc_addGroup;
//////////////////////////*/

params["_groupName"];

if (isNil "AIFE_spawner_padGroups") then {
	"GroupHash Variable Missing" remoteExec ["systemChat", 0];
	waitUntil {!isNil "AIFE_spawner_padGroups"};
};

private _groupExists = [GVAR(padGroups), _groupName] call CBA_fnc_hashHasKey;
if (_groupExists) exitWith {
	hint "Group Already Exists";
	_groupName;
};

_group = [] call CBA_fnc_hashCreate;
[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
publicVariable "AIFE_spawner_padGroups";
_groupName;
