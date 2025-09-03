#include "script_component.hpp"

params ["_position", "_object"];
if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};
_name = [_object] call FUNC(findTerminal);

[GVAR(terminals), _name] call CBA_fnc_hashRem;
publicVariable QGVAR(terminals);
