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
				postInit = 1;
			};
			class Scan
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_Scan.sqf";
			};
			class CreateTarget
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_CreateTarget.sqf";
			};
			class RemoveTarget
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_RemoveTarget.sqf";
			};
			class drawIcon 
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_drawIcon.sqf";
			};
			class FindLostObjects
			{
				file="\Aifes_Zeus_Tools\addons\Scanner\functions\fnc_FindLostObjects.sqf";
			};
		};
	};
};
class CfgWeapons {
	class CBA_MiscItem;
	class trackingFob: CBA_MiscItem {
		author = "AifeSupport";
		scope = 2;
		displayName = "[AIFE] Tracking Fob";
		descriptionShort = "Sensor Fob that can be attached to people and objects to broadcast a signal.";
		ACE_attachable = "attachable_trackingFob";
	};
};
class CfgVehicles {
	class ACE_IR_Strobe_Effect;
	class separateIR_Base : ACE_IR_Strobe_Effect{};
	class attachable_trackingFob: separateIR_Base {
		author = "AifeSupport";
		scope = 2;
		displayName = "[AIFE] Tracking Fob";
	};
};
#include "CfgEventhandlers.hpp"