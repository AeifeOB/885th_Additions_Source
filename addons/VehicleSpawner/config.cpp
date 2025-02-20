#include "script_component.hpp"

class CfgPatches
{
	class Spawner
	{
		name = "Vehicle Spawner";
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules"};
		requiredVersion = 1.62;
		units[] = {
			"VehicleTerminal",
			"SpawnPad_Hidden",
			"SpawnPad"
		};
		weapons[] = {};
	};
};
class CfgFunctions
{
	class Aife_Functions
	{
		tag = "AIFE";
		class VehicleSpawner {
			class SpawnerStart
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_Start.sqf";
				postInit = 1;
			};
			class RequestVehicle
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_RequestVehicle.sqf";
			};
			class ClearPad
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_ClearPad.sqf";
			};
			class AddPad
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_AddPad.sqf";
			};
			class RemovePad
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_RemovePad.sqf";
			};
			class SpawnVehicle 
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_SpawnVehicle.sqf";
			};
			class AddVehicle
			{
				file="\Aifes_Zeus_Tools\addons\VehicleSpawner\functions\fnc_AddVehicle.sqf";
				postInit = 1;
			};
		};
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
	class SubStatics
	{
		displayName = "Infrastructure";
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
				statement = "call AIFE_Spawner_fnc_RequestVehicle;";
			};
		};
		ace_cargo_canLoad=0;
		ace_cargo_size=10;
		ace_dragging_canCarry=0;
		ace_dragging_canDrag=0;
		scope=2;
		scopeCurator=2;
		editorCategory="AifeLogistics";
		editorSubCategory="SubStatics";
		displayName="Vehicle Spawn Terminal";
	};
	class Land_HelipadEmpty_F;
	class Land_HelipadCircle_F;
	class SpawnPad_Hidden : Land_HelipadEmpty_F {
		class EventHandlers
		{
			init = "params ['_entity']; [_entity] call AIFE_fnc_addPad;";
		};
		ace_cargo_canLoad=0;
		ace_cargo_size=10;
		ace_dragging_canCarry=0;
		ace_dragging_canDrag=0;
		scope=2;
		scopeCurator=2;
		editorCategory="AifeLogistics";
		editorSubCategory="SubStatics";
		displayName="Hidden Spawn Pad";
	};
	class SpawnPad : Land_HelipadCircle_F {
		class EventHandlers
		{
			init = "params ['_entity']; [_entity] call AIFE_fnc_addPad;";
		};
		ace_cargo_canLoad=0;
		ace_cargo_size=10;
		ace_dragging_canCarry=0;
		ace_dragging_canDrag=0;
		scope=2;
		scopeCurator=2;
		editorCategory="AifeLogistics";
		editorSubCategory="SubStatics";
		displayName="Spawn Pad";
	};
};
#include "CfgEventhandlers.hpp"