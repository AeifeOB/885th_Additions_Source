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

[
	"AIFE_squad_scale", 
	"SLIDER", 
	["Icon Scale", "Scales the squad icon."],
	["Aife's Squad Markers", "2. Marker"],
	[0.01, 1.0, 0.5, 2],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_text_scale", 
	"SLIDER", 
	["Text Scale", "Scales the text."],
	["Aife's Squad Markers", "2. Marker"],
	[1, 100, 20, 2],
	false,
	{}
] call CBA_fnc_addSetting;

[
	"AIFE_squad_minimum", 
	"SLIDER", 
	["Hide Icon Distance", "Minimum distance that squad icons hides themselves (in meters)."],
	["Aife's Squad Markers", "2. Marker"],
	[0, 100, 10, 0],
	false,
	{}
] call CBA_fnc_addSetting;

if !(_hasCrows) then {
	diag_log "Crow's Electronic Warfare not found. It is required for the advanced Squad Radar Settings.";
	GVAR(jammable) = false;
} else {
	[
		"AIFE_squad_jammable", 
		"CHECKBOX", 
		["Jammable", "Allows radio jammers to block squad markers."],
		["Aife's Squad Markers", "3. E-War"],
		[],
		1,
		{},
		false
	] call CBA_fnc_addSetting;
};
if (GVAR(isActive)) then {
	call FUNC(init);
};
