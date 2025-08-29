#include "script_component.hpp"
params ["_list"];

GVAR(vehicleList) = [_list] call FUNC(ParseVehicles);
publicVariable QGVAR(vehicleList);
