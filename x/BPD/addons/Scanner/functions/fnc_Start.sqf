#include "../script_component.hpp"

AIFE_Scanner_isActive = false;
AIFE_Scanner_markers = [] call CBA_fnc_hashCreate;
AIFE_Scanner_freq = 186.00;

private _id = ["AIFE_AddMarker", {
	//params _unit, _freq, _range 
	_unit = _this select 0;
	_freq = _this select 1;
	_range = _this select 2;
	[AIFE_Scanner_markers, _unit, [_freq, _range]] call CBA_fnc_hashSet;
}] call CBA_fnc_addEventHandler;

private _id = ["AIFE_RemoveMarker", {
	//params _unit 
	_unit = _this select 0;
	[AIFE_Scanner_markers, _unit] call CBA_hashHasKey;
	[AIFE_Scanner_markers, _unit] call CBA_fnc_hashRem;
}] call CBA_fnc_addEventHandler;

["Aife's Scanner", "ActiveScan", ["Active Scan Toggle", "Toggles the Active Scanning function."], {
	AIFE_Scanner_isActive = !AIFE_Scanner_isActive;
}, "", [DIK_INSERT, [false, false, false]]] call CBA_fnc_addKeybind;

["Aife's Scanner", "FrequencyChange", ["Open Frequency Dialog", "Open a dialog to change scanner frequency."], {
	["Scanner Frequency", [["SLIDER", "Frequency", [100.00, 799.99, 186.00, 2]]], {
		AIFE_Scanner_freq = (_this select 0) select 0;
	}] call zen_dialog_fnc_create;
}, "", [DIK_INSERT, [true, false, false]]] call CBA_fnc_addKeybind;

["Aife's Zeus", "Create Scanner Target", {_this call AIFE_fnc_CreateTarget;}] call zen_custom_modules_fnc_register;
["Aife's Zeus", "Remove Scanner Target", {_this call AIFE_fnc_RemoveTarget;}] call zen_custom_modules_fnc_register;