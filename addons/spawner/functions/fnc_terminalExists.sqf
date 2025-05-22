#include "script_component.hpp"

params ["_object"];
systemChat "Checking";
_terminalExists = false;
_terminalName = [_object] call FUNC(findTerminal);
_terminalExists = [GVAR(terminals), _terminalName] call CBA_fnc_hashHasKey;

_terminalExists;