#include "../script_component.hpp"

AIFE_Scanner_isActive = false;
AIFE_Scanner_altActive = false;
AIFE_Scanner_civActive = false;
AIFE_Scanner_markers = [] call CBA_fnc_hashCreate;
AIFE_Scanner_freq = 186.0;
AIFE_Scanner_altfreq = 100.0;
AIFE_Scanner_publicfreq = 800.0;
AIFE_Scanner_scale = 0.1;
AIFE_Scanner_minimum = 10;
AIFE_Scanner_colorOne = [0,0,1,1];
AIFE_Scanner_colorTwo = [1,0,0,1];
AIFE_Scanner_colorThree = [1,1,0,1];
AIFE_Scanner_rotationRate = 50;


["Aife's Scanner", "ActiveScan", ["Active Scan Toggle", "Toggles the Active Scanning function."], {
	call AIFE_fnc_Scan;
}, "", [DIK_INSERT, [false, false, false]]] call CBA_fnc_addKeybind;

["Aife's Scanner", "Ping", ["Scanner Ping", "Broad-spectrum scan shows all signals for a brief moment."], {
	//call AIFE_fnc_ping;
}, "", [DIK_INSERT, [false, true, false]]] call CBA_fnc_addKeybind;

["Aife's Scanner", "FrequencyChange", ["Open Frequency Dialog", "Open a dialog to change scanner frequency."], {
	["Scanner Settings", [
		[
			"SLIDER", 
			"Frequency", 
			[100.0, 799.9, 186.0, 1]
		],
		[
			"SLIDER", 
			"Alternate Frequency", 
			[100.0, 799.9, 100.0, 1]
		], 
		[
			"CHECKBOX", 
			"Alternate Active", 
			false
		], 
		[
			"CHECKBOX", 
			"Civilian Signals Active", 
			false
		]
	],
	{
		AIFE_Scanner_freq = (_this select 0) select 0;
		AIFE_Scanner_altfreq = (_this select 0) select 1;
		AIFE_Scanner_altActive = (_this select 0) select 2;
		AIFE_Scanner_civActive = (_this select 0) select 3;
	}
	] call zen_dialog_fnc_create;
}, "", [DIK_INSERT, [true, false, false]]] call CBA_fnc_addKeybind;

[
	"AIFE_Scanner_Scale_Setting", 
	"SLIDER", 
	["Icon Scale", "Scales the icon (along with distance)."],
	["Aife's Zeus Tools", "Scanner"],
	[0.01, 0.5, 0.1, 2],
	false,
	{AIFE_Scanner_scale = (_this);}
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_Minimum_Setting", 
	"SLIDER", 
	["Hide Icon Distance", "Minimum distance that the icon hide itself at (in meters)."],
	["Aife's Zeus Tools", "Scanner"],
	[0, 100, 10, 0],
	false,
	{AIFE_Scanner_minimum = (_this);}
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_Rotation_Setting", 
	"SLIDER", 
	["Rotation Rate", "Rate that scanner icons rotate (cosmetic)."],
	["Aife's Zeus Tools", "Scanner"],
	[-100, 100, 50, 0],
	false,
	{AIFE_Scanner_rotationRate = (_this);}
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorOne_Setting", 
	"COLOR", 
	["Channel One Color", "Color for primary scanner frequency."],
	["Aife's Zeus Tools", "Scanner"],
	[0, 0, 1, 1],
	false,
	{AIFE_Scanner_colorOne = (_this);}
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorTwo_Setting", 
	"COLOR", 
	["Channel Two Color", "Color for alternate scanner frequency."],
	["Aife's Zeus Tools", "Scanner"],
	[1, 0, 0, 1],
	false,
	{AIFE_Scanner_colorTwo = (_this);}
] call CBA_fnc_addSetting;

[
	"AIFE_Scanner_ColorThree_Setting", 
	"COLOR", 
	["Public Signal Color", "Color for civilian scanner frequencies."],
	["Aife's Zeus Tools", "Scanner"],
	[1, 1, 0, 1],
	false,
	{AIFE_Scanner_colorThree = (_this);}
] call CBA_fnc_addSetting;


["Aife's Zeus", "Create Scanner Target", {_this remoteExecCall ["AIFE_fnc_CreateTarget"];}] call zen_custom_modules_fnc_register;
["Aife's Zeus", "Remove Scanner Target", {_this remoteExecCall ["AIFE_fnc_RemoveTarget"];}] call zen_custom_modules_fnc_register;

AIFE_Scanner_SignalDraw = addMissionEventHandler ["Draw3D", {call AIFE_fnc_drawIcon;}];
AIFE_Scanner_AttachedFob = ["ace_attach_attached", {
	params ["_attachedObject", "_itemClassname", "_temporary"];
	[getPosASL _attachedObject, _attachedObject] remoteExecCall ["AIFE_fnc_CreateTarget"];
}] call CBA_fnc_addEventHandler;
AIFE_Scanner_AetachedFob = ["ace_attach_detaching", {
	params ["_attachedObject", "_itemClassname", "_temporary"];
	[getPosASL _attachedObject, _attachedObject] remoteExecCall ["AIFE_fnc_RemoveTarget"];
}] call CBA_fnc_addEventHandler;