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

		// // Description base classes (for more information see below):
		class ModuleDescription
		{
			class Anything;
		};
	};
	
	class GVAR(moduleSpawnPad): Module_F
	{
		scope = 2;
		displayName = "Spawn Pad";
		icon = "\A3\ui_f\data\map\markers\nato\respawn_motor_ca.paa";
		vehicleClass = "Modules";
		category = "Aife's Spawner";
		function = QFUNC(addPad);
		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 1;
		is3DEN = 0;

		class Attributes: AttributesBase 
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			// class Units: Units{};

			// Module-specific arguments:
			class PadName: Edit
			{
				property = QGVAR(addPad_name);
				displayName = "Pad Name";	// Argument label
				tooltip = "Unique name for this Spawn Pad.";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "Pad";
				// Default attribute value. Warning: This is an expression, and its returned value will be used (50 in this case).
			};
			class PadGroup: Combo
			{
				property = QGVAR(addPad_group);
				displayName = "Pad Group";	// Argument label
				tooltip = "Which group owns this pad?";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "Pad Group";
				// Default attribute value. Warning: This is an expression, and its returned value will be used (50 in this case).
			};	
			class PadOffset: Edit
			{
				property = QGVAR(addPad_offset);
				displayName = "Pad Offset";	// Argument label
				tooltip = "Vertical spawn position offset.";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0";
				// Default attribute value. Warning: This is an expression, and its returned value will be used (50 in this case).
			};
			class ModuleDescription: ModuleDescription {};
		};

		class ModuleDescription: ModuleDescription 
		{
			description = "Sync'd object is added to pad groups with a unique name. If you don't sync an object an invisible helipad will be spawned. The vertical offset sets the height the vehicle is spawned, to prevent clipping.";	// Short description, will be formatted as structured text
			sync[] = { "AnyStaticObject" };

			class AnyStaticObject
			{
				description[] = {
					"Sync to any prop to use as a Pad."
				};
			};
		};
	};

	class GVAR(moduleSpawner): Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Add Spawner";				// Name displayed in the menu
		icon = ;	// Map icon. Delete this entry to use the default icon.
		vehicleClass = "Modules";
		category = "Aife's Spawner";
		function = QFUNC(addTerminal);	// Name of function triggered once conditions are met
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 2;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes: AttributesBase 
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			// class Units: Units{};

			// Module-specific arguments:
			class TerminalName: Edit
			{
				property = QGVAR(addTerminal_name);												// Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
				displayName = "Terminal Name";	// Argument label
				tooltip = "Unique name for this terminal.";			// Tooltip description
				typeName = "STRING";																// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "Spawn Terminal";																// Default attribute value. Warning: This is an expression, and its returned value will be used (50 in this case).
			};	

			class ModuleDescription: ModuleDescription {};
		};

		class ModuleDescription: ModuleDescription 
		{
			description = "Creates a spawn terminal.";	// Short description, will be formatted as structured text
			sync[] = { "AnyStaticObject" };

			class AnyStaticObject
			{
				description[] = {
					"Sync to any prop to use as a terminal."
				};
			};
		};
	};
};