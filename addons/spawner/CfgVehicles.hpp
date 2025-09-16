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
		class ModuleDescription;
	};
	class ACE_Module: Module_F {};
	class AIFE_spawner_modulePads: Module_F
	{
		scope=2;
		displayName="Spawn Pad Group";
		icon="\A3\ui_f\data\map\markers\nato\c_air.paa";
		vehicleClass="Modules";
		category="AIFE_modules";
		function="AIFE_spawner_fnc_ModuleCreatePadGroup";
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
				defaultValue = "[]";
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
	
	class RuggedTerminal_01_communications_F;
	class AIFE_VehicleTerminal : RuggedTerminal_01_communications_F 
	{
		class UserActions
		{
			class Spawner_Initiate 
			{
				userActionID = 51;
				displayName = "Initialize Spawner";
				radius = 5;
				priority = 1;
				onlyForPlayer = 1;
				position = "laptop_lid";
				condition = "!([this] call AIFE_spawner_fnc_terminalExists)";
				statement = "[getPosASL this, this] spawn AIFE_spawner_fnc_ZeusAddTerminal;";
			};
		};
		ace_cargo_canLoad=0;
		ace_cargo_size=10;
		ace_dragging_canCarry=0;
		ace_dragging_canDrag=0;
		scope=2;
		scopeCurator=2;
		editorCategory="AifeLogistics";
		editorSubCategory="SubSpawner";
		displayName="Vehicle Spawn Terminal";
	};

	class AIFE_spawner_terminalModule: ACE_Module
	{
		author = "AifeSupport";
		scope=2;
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=1;
		is3DEN=0;
		category="AIFE_modules";
		displayName="Spawn Terminal";
		icon="\A3\ui_f\data\map\markers\nato\respawn_plane_ca.paa";
		vehicleClass="Modules";
		function="AIFE_spawner_fnc_ModuleCreateTerminal";
		class Attributes: AttributesBase 
		{
			class Units: Units{};
			class TerminalName: Edit
			{
				property = QGVAR(terminalModule_Name);
				displayName = "Terminal Name";
				tooltip = "Unique name for this Terminal.";
				typeName = "STRING";
				defaultValue = "";
			};
			class PadGroup: Edit
			{
				property = QGVAR(terminalModule_Group);
				displayName = "Pad Group";	// Argument label
				tooltip = "Pad Group name that this terminal spawns on.";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "";
			};
			class Preset: Default
			{
				property = QGVAR(terminalModule_Preset);
				control = QGVAR(presetSelection);
				displayName = "Vehicle List";	// Argument label
				tooltip = "List of vehicles to spawn";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = 0;
			};
			class CustomList: Edit
			{
				property = QGVAR(terminalModule_CustomList);
				displayName = "Custom Vehicle List";	// Argument label
				tooltip = "List vehicle classnames in quotes. This will override the preset selection.";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "[]";
			};

			class ModuleDescription: ModuleDescription {};
		};
		class ModuleDescription: ModuleDescription 
		{
			description = "Creates a Spawn Terminal on the sync'd object (or spawns a default object).";	// Short description, will be formatted as structured text
			sync[] = { "AnyStaticObject" };

			class AnyStaticObject
			{
				description[] = {
					"Sync to any prop to use as a Terminal."
				};
			};
		};
	};
};