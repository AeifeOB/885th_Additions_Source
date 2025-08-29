#include "script_component.hpp"
/*
Group List:
	groupDisplayName => [padName => [_object, _offset]]
*/
params["_name", "_offset", "_object", "_groupName"];

_nameExists = [GVAR(pads), _name] call CBA_fnc_hashHasKey;
			
if (_nameExists) then {
	hint "Name is not unique.";
	_number = netId _object;
	_name = format ["%1 %2", _name, _number];
};
[_name, [_object, _offset], _groupName] call FUNC(addPadToGroup);
