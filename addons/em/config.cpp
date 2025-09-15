#include "script_component.hpp"
#include "CfgEventhandlers.hpp"

class CfgPatches
{
	class ADDON
	{
		name = "Aife's Editor Modules";
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules", "crowsEW_main", "crowsEW_spectrum", "AIFE_spawner"};
		requiredVersion = 2.02;
		units[] = {
			"AIFE_em_modulePads",
			"AIFE_em_moduleTerminal",
			"AIFE_em_moduleVehicleList",
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
