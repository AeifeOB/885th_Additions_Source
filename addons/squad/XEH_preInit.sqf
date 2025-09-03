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

if (isServer) then {};

// Visual Settings
GVAR(icon) = "z\AIFE\addons\squad\textures\MemberIcon.paa";
[
	"AIFE_squad_isActive", 
	"CHECKBOX", 
	["Active", "Enable or disable this feature."],
	["Aife's Squad Markers", "1. Mod"],
	[],
	0,
	{},
	true
] call CBA_fnc_addSetting;

if !(_hasCrows) then {
	diag_log "Crow's Electronic Warfare not found. It is required for the advanced Squad Radar Settings.";
	GVAR(jammable) = false;
} else {
	[
		"AIFE_squad_jammable", 
		"CHECKBOX", 
		["Jammable", "Allows radio jammers to block squad markers."],
		["Aife's Squad Markers", "1. Mod"],
		[],
		1,
		{},
		false
	] call CBA_fnc_addSetting;
};

if (!hasInterface) exitWith {};

[
	"AIFE_squad_scale", 
	"SLIDER", 
	["Icon Scale", "Scales the squad icon."],
	["Aife's Squad Markers", "2. Marker"],
	[0.01, 1.0, 0.5, 2],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_vertical_offset", 
	"SLIDER", 
	["Icon Vertical Offset", "Moves the squad icon up or down more than the default."],
	["Aife's Squad Markers", "2. Marker"],
	[-5.0, 5.0, 0.0, 2],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_text_scale", 
	"SLIDER", 
	["Text Scale", "Scales the text."],
	["Aife's Squad Markers", "2. Marker"],
	[1, 100, 20, 2],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_text_color", 
	"COLOR", 
	["Name Tag Color", "Color for ALL squad member names."],
	["Aife's Squad Markers", "2. Marker"],
	[1, 1, 1, 1],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_match_color", 
	"CHECKBOX", 
	["Match Team Color", "Override color selection for names and match team color."],
	["Aife's Squad Markers", "2. Marker"],
	[],
	2,
	{},
	false
] call CBA_fnc_addSetting;

[
	"AIFE_squad_maximum", 
	"SLIDER", 
	["Hide Name Maximum Distance", "Minimum distance that squad names hide themselves (in meters)."],
	["Aife's Squad Markers", "2. Marker"],
	[25, 1000, 150, 0],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_minimum", 
	"SLIDER", 
	["Hide Icon Minimum Distance", "Minimum distance that squad icons hide themselves (in meters)."],
	["Aife's Squad Markers", "2. Marker"],
	[0, 100, 10, 0],
	2,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_distance_height", 
	"CHECKBOX", 
	["Move Marker with Distance", "Increase marker height with distance."],
	["Aife's Squad Markers", "2. Marker"],
	[],
	2,
	{},
	false
] call CBA_fnc_addSetting;

if (is3DEN) exitWith {};
