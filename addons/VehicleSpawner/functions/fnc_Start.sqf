#include "../script_component.hpp"

AIFE_Spawner_pads = [] call CBA_fnc_hashCreate;
AIFE_Spawner_vehicleList = [] call CBA_fnc_hashCreate;

[
	"AIFE_Spawner_Vehicles_Setting", 
	"EDITBOX", 
	["Vehicle List", "Set the list of vehicles [editor name, comma separated]."],
	["Aife's Zeus Tools", "Vehicle Spawner"],
	"apc_wheeled_03,apc_wheeled_02",
	false,
	{AIFE_fnc_ParseVehicles = (_this);}
] call CBA_fnc_addSetting;

["Aife's Spawner", "Add Pad", {_this call AIFE_fnc_AddPad;}] call zen_custom_modules_fnc_register;
["Aife's Spawner", "Remove Pad", {_this call AIFE_fnc_RemovePad;}] call zen_custom_modules_fnc_register;

if (hasInterface) then {
	player addEventHandler ["PostInit", {
		["Refresh", ["server"]] call CBA_fnc_serverEvent;
	}];
};
if (isServer) then {
	AIFE_Scanner_PlayerAdded = ["Refresh", {
		publicVariable "AIFE_Spawner_pads";
		publicVariable "AIFE_Spawner_vehicleList";
	}] call CBA_fnc_addEventHandler;
};