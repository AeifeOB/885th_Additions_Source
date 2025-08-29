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
GVAR(scale) = 0.1;
GVAR(text_scale) = 0.1;
GVAR(minimum) = 0;
GVAR(jammable) = true;
GVAR(isActive) = true;
GVAR(icon) = "z\AIFE\addons\squad\textures\MemberIcon.paa";
[
	"AIFE_Squad_Active", 
	"CHECKBOX", 
	["Active", "Enable or disable this feature."],
	["Aife's Squad Markers", "1. Mod"],
	true,
	0,
	{ GVAR(isActive) = (_this); },
	true
] call CBA_fnc_addSetting;

[
	"AIFE_Squad_Scale_Setting", 
	"SLIDER", 
	["Icon Scale", "Scales the squad icon."],
	["Aife's Squad Markers", "2. Marker"],
	[0.01, 1.0, 0.5, 2],
	false,
	{ GVAR(scale) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Squad_Text_Scale_Setting", 
	"SLIDER", 
	["Text Scale", "Scales the text."],
	["Aife's Squad Markers", "2. Marker"],
	[1, 100, 20, 2],
	false,
	{ GVAR(text_scale) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Squad_Minimum_Setting", 
	"SLIDER", 
	["Hide Icon Distance", "Minimum distance that squad icons hides themselves (in meters)."],
	["Aife's Squad Markers", "2. Marker"],
	[0, 100, 10, 0],
	false,
	{ GVAR(minimum) = (_this); }
] call CBA_fnc_addSetting;

if !(_hasCrows) then {
	diag_log "Crow's Electronic Warfare not found. It is required for the advanced Squad Radar Settings.";
	GVAR(jammable) = false;
} else {
	[
		"AIFE_Squad_Jamming_Setting", 
		"CHECKBOX", 
		["Jammable", "Allows radio jammers to block squad markers."],
		["Aife's Squad Markers", "3. E-War"],
		true,
		1,
		{ GVAR(jammable) = (_this); },
		false
	] call CBA_fnc_addSetting;
};
if (GVAR(isActive)) then {
	call FUNC(init);
};
