#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = QUOTE(COMPONENT);
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules", "crowsEW_spectrum"};
		requiredVersion = 1.62;
		units[] ={};
		weapons[] = {};
	};
};

#include "CfgEventhandlers.hpp"