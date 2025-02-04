class CfgPatches
{
	class 885_Scanner
	{
		requiredAddons[] = {"CBA_A3", "zen_custom_modules"};
		requiredVersion = 1.62;
		units[] ={};
		weapons[] = {};
		author = "AifeSupport";
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