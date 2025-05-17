#include "../script_component.hpp"

GVAR(pads) = [] call CBA_fnc_hashCreate;
GVAR(vehicleList) = [] call CBA_fnc_hashCreate;

[
	"AIFE_Spawner_Vehicles_Setting", 
	"EDITBOX", 
	["Vehicle List", "Set the list of vehicles [editor name, comma separated]."],
	["Aife's Vehicle Spawner", "Vehicles"],
	"[""apc_wheeled_03"",""apc_wheeled_02""]",
	1,
	{
		params ["_value"];
		if (isServer || !isMultiplayer) then {
			[_value] call FUNC(ParseVehicles);
		};
	},
	false
] call CBA_fnc_addSetting;

["Aife's Spawner", "Add Pad", {_this call FUNC(AddPad);}] call zen_custom_modules_fnc_register;
["Aife's Spawner", "Remove Pad", {_this call FUNC(RemovePad);}] call zen_custom_modules_fnc_register;

if (hasInterface) then {
	player addEventHandler ["Respawn", {
		["RefreshSpawner", ["server"]] call CBA_fnc_serverEvent;
	}];
};

if (isServer) then {
	["RefreshSpawner", {
		publicVariable QGVAR(pads);
		publicVariable QGVAR(vehicleList);
	}] call CBA_fnc_addEventHandler;
};
systemChat "Vehicle Spawner Started."