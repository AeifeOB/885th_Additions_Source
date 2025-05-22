#include "script_component.hpp"
/*
Pad List: 
	objectName_netId => [groupDisplayName, object]
Group List:
	groupDisplayName => [objectName_netId, [_object, _offset]]
Terminal List:
	_name => [_object, _groupName, _vehicleList]
*/
params ["_object"];

_terminalName = false;
_terminalSearch = {
	//_key = terminalName
	//_value = [_object, _groupName, _vehicleList]
	if (_value select 0 == _object) then {
		_terminalName = _key;
		break;
	};
};
[ GVAR(terminals), _terminalSearch] call CBA_fnc_hashEachPair;

_terminalName;