#include "script_component.hpp"
/*
Pad List: 
	objectName_netId => [groupDisplayName, object]
Group List:
	groupDisplayName => [objectName_netId, [_object, _offset]]

*/
params ["_object"];

//Get GroupName and PadName from PadList
_padList = GVAR(pads);
_padName = "";
_padSearch = {
	//_key = padName
	//_value = [groupDisplayName, object]
	if (_value select 1 == _object) then {
		_padName = _key;
		break;
	};
};
[_padList, _padSearch] call CBA_fnc_hashEachPair;

_padName;