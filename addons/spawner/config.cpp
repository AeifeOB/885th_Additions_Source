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
			"VehicleTerminal"
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
	class VehicleTerminal : RuggedTerminal_01_communications_F 
	{
		class UserActions
		{
			class Spawner_Access 
			{
				userActionID = 50;
				displayName = "Spawn Vehicle";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "true";
				statement = "[] spawn AIFE_spawner_fnc_RequestVehicle;";
			};
			class Spawner_Clear 
			{
				userActionID = 50;
				displayName = "Store Vehicle";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "true";
				statement = "[] spawn AIFE_spawner_fnc_StoreVehicle;";
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