#include "script_component.hpp"
class CfgPatches
{
	class Scanner
	{
		name = "Scanner";
		author = "AifeSupport";
		url = "https://github.com/AeifeOB/885th_Additions_Source";
		requiredAddons[] = {"CBA_main", "zen_custom_modules"};
		requiredVersion = 1.62;
		units[] ={};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class 885_Functions
	{
		tag = "BPD"
		class Scanner {
			class ScannerStart
			{
				file = "885_Scanner\functions\fn_start.sqf";
				preInit = 1;
			};
		};
	};
};
#include "CfgEventhandlers.hpp"