#include "script_component.hpp"
/*//////////////////////////
Check that name is unique, then add it to pad list.

Params: 
padName <STRING>
object <OBJECT>
groupName <STRING>

Returns: 
Group Name<STRING>

Example:
["Pad 1", 1, <object>, "Group 1"] call AIFE_spawner_fnc_addPad;

Returns:
name <STRING> after updat
NOTES:
	Pad Hash Layout:
		padName => [groupDisplayName, object]
	Group Hash Layout:
		groupDisplayName => [padName => [_object, _offset]]
//////////////////////////*/

params["_name", "_object", "_groupName"];

_padList = GVAR(pads);
_nameExists = [_padList, _name] call CBA_fnc_hashHasKey;

if (_nameExists) then {
	_number = netId _object;
	_name = format ["%1 %2", _name, _number];
	systemChat format ["Name is not unique. Changed to %1", _name];
};

[_padList, _name, [_groupName, _object]] call CBA_fnc_hashSet;
GVAR(pads) = _padList;
publicVariable QGVAR(pads);

_object addEventHandler ["Deleted", {
	params ["_entity"];
	[getPos _entity, _entity] call FUNC(ZeusRemovePad);
}];

_name;
