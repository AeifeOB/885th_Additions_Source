#include "script_component.hpp"
/*
	Get list of vehicle classnames and costs.

	Arguments:
	0: Name <string>

	Return Value:
	Pairs of classnames and costs <ARRAY>

	Example:
	["vanilla"] call AIFE_spawner_fnc_getVehicleList;
*/

params ["_name"];

private _config = missionConfigFile >> "AIFE_Spawner_Presets" >> _name;

if (!isClass _config) then {
	_config = configFile >> "AIFE_Spawner_Presets" >> _name;
};
if (!isClass _config) exitWith {
	private _message = format ["Could not find %1", _name];
	ERROR_WITH_TITLE("Vehicle Preset not found",_message);
	[]
};

private _vehicles = getArray(_config >> "objects");
// Attempt to filter bad input
_vehicles = _vehicles select {
    if ((_x isEqualTypeParams ["", 0]) || {_x isEqualTypeParams ["", 0, ""]}) then {
        _x params [["_classname", "#", [""]], ["_cost", -1, [0]]];
        if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
            true
        } else {
            ERROR_2("Preset [%1] - Classname [%2] does not exist",_name,_classname);
            false
        };
    } else {
        ERROR_2("Preset [%1] - Bad data [%2] in objects array %2",_name,_x);
        false
    };
};

_vehicles
