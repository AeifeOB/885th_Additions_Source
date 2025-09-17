#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = "Vehicle Spawner";
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules"};
		requiredVersion = 2.02;
		units[] = {
			"AIFE_VehicleTerminal"
		};
		weapons[] = {};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class AIFE_modules: NO_CATEGORY
	{
		displayName="Aife's Modules";
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
#include "Cfg3DEN.hpp"
#include "AIFE_Spawner_Presets.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventhandlers.hpp"
