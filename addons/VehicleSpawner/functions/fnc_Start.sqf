#include "../script_component.hpp"

AIFE_Spawner_pads = [] call CBA_fnc_hashCreate;
AIFE_Spawner_vehicleList = [] call CBA_fnc_hashCreate;

[
	"AIFE_Spawner_Vehicles_Setting", 
	"EDIT:MULTI", 
	["Vehicle List", "Set the list of vehicles [editor name, comma separated]."],
	["Aife's Vehicle Spawner", "Vehicles"],
	["[""apc_wheeled_03"",""apc_wheeled_02""]", {}, 5],
	false,
	{[_this] call AIFE_fnc_ParseVehicles;}
] call CBA_fnc_addSetting;

["Aife's Spawner", "Add Pad", {_this call AIFE_fnc_AddPad;}] call zen_custom_modules_fnc_register;
["Aife's Spawner", "Remove Pad", {_this call AIFE_fnc_RemovePad;}] call zen_custom_modules_fnc_register;

if (hasInterface) then {
	player addEventHandler ["PostInit", {
		["RefreshSpawner", ["server"]] call CBA_fnc_serverEvent;
	}];
};
if (isServer) then {
	AIFE_Spawner_PlayerAdded = ["RefreshSpawner", {
		publicVariable "AIFE_Spawner_pads";
		publicVariable "AIFE_Spawner_vehicleList";
	}] call CBA_fnc_addEventHandler;
};