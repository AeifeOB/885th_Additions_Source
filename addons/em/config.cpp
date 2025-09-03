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
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class EditShort;
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};
		// Description base classes (for more information see below):
		class ModuleDescription
		{
		};
	};
	class ACE_Module;
	class AIFE_em_modulePads: Module_F
	{
		scope=2;
		displayName="Spawn Pad Groups";
		icon="";
		vehicleClass="Modules";
		category="AIFE_modules";
		function="AIFE_em_fnc_createPadGroup";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=1;
		is3DEN=0;
		class Attributes: AttributesBase 
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			class Units: Units{};

			// Module-specific arguments:
			class GroupName: Edit
			{
				property = QGVAR(addPad_groupName);
				displayName = "Group Name";
				tooltip = "Unique name for this group of spawn pads.";
				typeName = "STRING";
				defaultValue = "";
			};
			class Name: Edit
			{
				property = QGVAR(addPad_name);
				displayName = "Pad Names";	// Argument label
				tooltip = "Name each pad, in quotes, separated by commas. This assigns names in the order pads are sync'd";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "";
			};
			class PadOffset: Edit
			{
				property = QGVAR(addPad_offset);
				displayName = "Pad Offset";	// Argument label
				tooltip = "Vertical spawn position offset.";
				typeName = "NUMBER";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = 0;
			};
			class ModuleDescription: ModuleDescription {};
		};
		class ModuleDescription: ModuleDescription 
		{
			description = "Sync'd object is added as a spawn pad with a unique name. If you don't sync an object an invisible helipad will be spawned.<br />The vertical offset sets the height the vehicle is spawned, to prevent clipping.";	// Short description, will be formatted as structured text
			sync[] = { "AnyStaticObject" };

			class AnyStaticObject
			{
				description[] = {
					"Sync to any prop to use as a Pad."
				};
			};
		};
	};
};
