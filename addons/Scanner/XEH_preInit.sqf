#include "script_component.hpp"
#include "XEH_PREP.hpp"

ADDON = true;

// Sensor states
GVAR(isActive) = false;
GVAR(altActive) = false;
GVAR(civActive) = false;

// Frequency Settings
GVAR(freq) = 520.0;
GVAR(altfreq) = 100.0;
GVAR(publicfreq) = 805.0;
GVAR(minfreq) = 30.0;
GVAR(maxfreq) = 300.0;

// Visual Settings
GVAR(scale) = 0.1;
GVAR(minimum) = 10;
GVAR(colorOne) = [0,0,1,1];
GVAR(colorTwo) = [1,0,0,1];
GVAR(colorThree) = [1,1,0,1];
GVAR(rotationRate) = 50;
GVAR(icon) = "z\AIFE\addons\scanner\textures\markerIcon.paa";
call FUNC(createDialogs);
call FUNC(addAceActions);
[
	"Aife's Scanner", 
	"ActiveScan", 
	[
		"Active Scan Toggle", 
		"Toggles the Active Scanning function."
	], 
	{
		if (GVAR(isActive)) then {
			call FUNC(removeEventHandler);
		} else {
			call FUNC(addEventHandler);
		};
		GVAR(isActive) = !GVAR(isActive);
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
	{hint "Not Implemented."},//GVAR(pingDialog), 
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

[
	"AIFE_Scanner_Scale_Setting", 
	"SLIDER", 
	["Icon Scale", "Scales the icon."],
	["Aife's Zeus Tools", "Scanner"],
	[0.01, 0.5, 0.1, 2],
	false,
	{ GVAR(scale) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_Text_Scale_Setting", 
	"SLIDER", 
	["Text Scale", "Scales the text."],
	["Aife's Zeus Tools", "Scanner"],
	[1, 100, 50, 2],
	false,
	{ GVAR(text_scale) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_Minimum_Setting", 
	"SLIDER", 
	["Hide Icon Distance", "Minimum distance that the icon hides itself at (in meters)."],
	["Aife's Zeus Tools", "Scanner"],
	[0, 100, 10, 0],
	false,
	{ GVAR(minimum) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_Rotation_Setting", 
	"SLIDER", 
	["Rotation Rate", "Rate that scanner icons rotate (cosmetic)."],
	["Aife's Zeus Tools", "Scanner"],
	[-100, 100, 50, 0],
	false,
	{ GVAR(rotationRate) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorOne_Setting", 
	"COLOR", 
	["Channel One Color", "Color for primary scanner frequency."],
	["Aife's Zeus Tools", "Scanner"],
	[0, 0, 1, 1],
	false,
	{ GVAR(colorOne) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorTwo_Setting", 
	"COLOR", 
	["Channel Two Color", "Color for alternate scanner frequency."],
	["Aife's Zeus Tools", "Scanner"],
	[1, 0, 0, 1],
	false,
	{ GVAR(colorTwo) = (_this); }
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorThree_Setting", 
	"COLOR", 
	["Public Signal Color", "Color for civilian scanner frequencies."],
	["Aife's Zeus Tools", "Scanner"],
	[1, 1, 0, 1],
	false,
	{ GVAR(colorThree) = (_this); }
] call CBA_fnc_addSetting;

