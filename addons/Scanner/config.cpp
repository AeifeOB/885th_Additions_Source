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
	class Aife_Functions
	{
		tag = "AIFE";
		class ScannerHUD {
			class Start
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_Start.sqf";
				recompile = 1;
				postInit = 1;
			};
			class Scan
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_Scan.sqf";
				recompile = 1;
			};
			class CreateTarget
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_CreateTarget.sqf";
				recompile = 1;
			};
			class RemoveTarget
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_RemoveTarget.sqf";
				recompile = 1;
			};
			class drawIcon 
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_drawIcon.sqf";
				recompile = 1;
			};
			class FindLostObjects
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_FindLostObjects.sqf";
				postInit = 1;
			};
		};
	};
};
#include "CfgEventhandlers.hpp"