#include "script_component.hpp"

params["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_findPad = {
	// Current result is saved in variable _x
	if (_value select 0 == _object) then {
		[GVAR(pads), _key] call CBA_fnc_hashRem;
		publicVariable QGVAR(pads);
	} else {
		hint "Pad not found."
	}
}; 

[GVAR(pads), _findPad] call CBA_fnc_hashEachPair;