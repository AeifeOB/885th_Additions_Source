#include "script_component.hpp"
params ["_list"];
_list = parseSimpleArray _list;
GVAR(vehicleList) = [_list] call FUNC(ParseVehicles);
publicVariable QGVAR(vehicleList);
