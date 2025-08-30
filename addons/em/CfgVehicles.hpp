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
	class AIFE_em_modulePad: Module_F
	{
		author = "AifeSupport";
		scope = 2;
		displayName = "Spawn Pad";
		icon = "\A3\ui_f\data\map\markers\nato\respawn_motor_ca.paa";
		category = "AIFE_modules";
		vehicleClass="Modules";
		function = QFUNC(addPad);
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 1;
		is3DEN = 1;
		/*class Attributes: AttributesBase 
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present):
			// class Units: Units{};

			// Module-specific arguments:
			class Name: Edit
			{
				property = QGVAR(addPad_name);
				displayName = "Pad Name";	// Argument label
				tooltip = "Unique name for this Spawn Pad.";
				typeName = "STRING";
				// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "Pad";
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
		};*/
	};
};
