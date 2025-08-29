#include "script_component.hpp"
#include "XEH_PREP.hpp"

ADDON = true;

// check for zen 
private _hasZen = isClass (configFile >> "CfgPatches" >> "zen_custom_modules");
private _hasCrows = isClass (configFile >> "CfgPatches" >> "crowsEW_main");
if !(_hasZen) exitWith
{
	diag_log "******CBA and/or ZEN not detected. They are required.";
};
if !(_hasCrows) exitWith 
{
	diag_log "Crow's Electronic Warfare not found. It is required for the scanner.";
};

// Sensor states
GVAR(mainActive) = false;
GVAR(altActive) = false;
GVAR(civActive) = false;

// Frequency Settings
GVAR(freq) = 520.0;
GVAR(altfreq) = 100.0;
GVAR(publicfreq) = 805.0;
GVAR(minfreq) = 30.0;
GVAR(maxfreq) = 300.0;

// Visual Settings
GVAR(icon) = "z\AIFE\addons\scanner\textures\markerIcon.paa";

[
	"AIFE_scanner_isActive", 
	"CHECKBOX", 
	["Active", "Enable or disable this feature."],
	["Aife's Signal Scanner", "1. Mod"],
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_scale", 
	"SLIDER", 
	["Icon Scale", "Scales the icon."],
	["Aife's Signal Scanner", "2. Scanner"],
	[0.01, 0.5, 0.1, 2],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_text_scale", 
	"SLIDER", 
	["Text Scale", "Scales the text."],
	["Aife's Signal Scanner", "2. Scanner"],
	[1, 100, 50, 2],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_minimum", 
	"SLIDER", 
	["Hide Icon Distance", "Minimum distance that the icon hides itself at (in meters)."],
	["Aife's Signal Scanner", "2. Scanner"],
	[0, 100, 10, 0],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_rotationRate", 
	"SLIDER", 
	["Rotation Rate", "Rate that scanner icons rotate (cosmetic)."],
	["Aife's Signal Scanner", "2. Scanner"],
	[-100, 100, 50, 0],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_colorOne", 
	"COLOR", 
	["Channel One Color", "Color for primary scanner frequency."],
	["Aife's Signal Scanner", "2. Scanner"],
	[0, 0, 1, 1],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_colorTwo", 
	"COLOR", 
	["Channel Two Color", "Color for alternate scanner frequency."],
	["Aife's Signal Scanner", "2. Scanner"],
	[1, 0, 0, 1],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_scanner_colorThree", 
	"COLOR", 
	["Public Signal Color", "Color for civilian scanner frequencies."],
	["Aife's Signal Scanner", "2. Scanner"],
	[1, 1, 0, 1],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"Aife's Scanner", 
	"ActiveScan", 
	[
		"Active Scan Toggle", 
		"Toggles the Active Scanning function."
	], 
	{
		if (GVAR(mainActive)) then {
			call FUNC(removeEventHandler);
		} else {
			call FUNC(addEventHandler);
		};
		GVAR(mainActive) = !GVAR(mainActive);
	}, 
	"", 
	[DIK_INSERT, [false, false, false]]
] call CBA_fnc_addKeybind;

[
	"Aife's Scanner", 
	"FrequencyChange", 
	[
		"Open Frequency Dialog", 
		"Open a dialog to change scanner frequency."
	], 
	GVAR(frequencyDialog), 
	"", 
	[DIK_INSERT, [true, false, false]]
] call CBA_fnc_addKeybind;

[
	"Aife's Scanner", 
	"Search", 
	[
		"Search Scanner", 
		"Broad-spectrum scan checks all frequencies in a range."
	], 
	GVAR(pingDialog),
	"",
	[DIK_INSERT, [false, true, false]]
] call CBA_fnc_addKeybind;

[
	"Aife's Scanner", 
	"AlternateActive", 
	["Alternate Active Toggle", "Toggle the alternate frequency."], 
	{
		GVAR(altActive) = !GVAR(altActive);
	}, 
	""
] call CBA_fnc_addKeybind;

[
	"Aife's Scanner", 
	"CivilianActive", 
	["Civilian Active Toggle", "Toggle the civilian frequency."], 
	{
		GVAR(civActive) = !GVAR(civActive);
	}, 
	""
] call CBA_fnc_addKeybind;
