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
		units[] = {};
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
	
};
#include "CfgEventhandlers.hpp"