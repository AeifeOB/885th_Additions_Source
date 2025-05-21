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

	// Helping pages 
	// https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes:_Controls#Slider
	// https://community.bistudio.com/wiki/Modules 
	// https://github.com/acemod/ACE3/blob/62055d2605839c1254a75c33eacaecef0d414873/addons/fortify/CfgVehicles.hpp 

	class GVAR(moduleSpawner): Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Add Spawner";				// Name displayed in the menu
		icon = QPATHTOEF(zeus,data\spectrum_signal.paa);	// Map icon. Delete this entry to use the default icon.
		vehicleClass = "Modules";
		category = "Aife's Spawner";
		function = QFUNC(addTerminal);	// Name of function triggered once conditions are met
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		// curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

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