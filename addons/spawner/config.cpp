#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = "Vehicle Spawner";
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules"};
		requiredVersion = 1.62;
		units[] = {
			"AIFE_VehicleTerminal"
		};
		weapons[] = {};
	};
};
class CfgEditorCategories
{
	class AifeLogistics 
	{
		displayName = "[AIFE] Logistics";
	};
};
class CfgEditorSubcategories
{
	class SubSpawner
	{
		displayName = "Vehicle Spawner";
	};
};
class CfgVehicles
{
	class RuggedTerminal_01_communications_F;
	class AIFE_VehicleTerminal : RuggedTerminal_01_communications_F 
	{
		class UserActions
		{
			class Spawner_Initiate 
			{
				userActionID = 51;
				displayName = "Initialize Spawner";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "!([this] call AIFE_spawner_fnc_terminalExists)";
				statement = "[getPosASL this, this] spawn AIFE_spawner_fnc_addTerminal;";
			};
			class Spawner_Request 
			{
				userActionID = 52;
				displayName = "Request Vehicle";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "([this] call AIFE_spawner_fnc_terminalExists)";
				statement = "[this] spawn AIFE_spawner_fnc_RequestVehicle;";
			};
			class Spawner_Store 
			{
				userActionID = 53;
				displayName = "Store Vehicle";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "([this] call AIFE_spawner_fnc_terminalExists)";
				statement = "[this] spawn AIFE_spawner_fnc_StoreVehicle;";
			};
		};
		ace_cargo_canLoad=0;
		ace_cargo_size=10;
		ace_dragging_canCarry=0;
		ace_dragging_canDrag=0;
		scope=2;
		scopeCurator=2;
		editorCategory="AifeLogistics";
		editorSubCategory="SubSpawner";
		displayName="Vehicle Spawn Terminal";
	};
};
#include "CfgEventhandlers.hpp"