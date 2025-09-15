#include "script_component.hpp"
/*//////////////////////////
Create a pad group with the given name.

Returns: boolean
//////////////////////////*/

params["_groupName"];
if (isNil "AIFE_spawner_padGroups") then {
	"Variable Missing" remoteExec ["systemChat", 0];
	waitUntil {!isNil "AIFE_spawner_padGroups"};
};
_group = [] call CBA_fnc_hashCreate;
[GVAR(padGroups), _groupName, _group] call CBA_fnc_hashSet;
publicVariable "AIFE_spawner_padGroups";

_groupExists = [GVAR(padGroups), _groupName] call CBA_fnc_hashHasKey;
