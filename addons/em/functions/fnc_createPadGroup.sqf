#include "script_component.hpp"
/*/////////////////////////////////
Author: AifeSupport

create a vehicle spawn pad group
////////////////////////////////*/

_group = [] call CBA_fnc_hashCreate;
[AIFE_spawner_padGroups, _groupName, _group] call CBA_fnc_hashSet;
publicVariable "AIFE_spawner_padGroups";
