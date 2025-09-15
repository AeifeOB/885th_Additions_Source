#include "script_component.hpp"

ADDON = true;

// check for zen 
private _hasZen = isClass (configFile >> "CfgPatches" >> "zen_custom_modules");
private _hasCrows = isClass (configFile >> "CfgPatches" >> "crowsEW_main");
if !(_hasZen) exitWith
{
	diag_log "******CBA and/or ZEN not detected. They are required.";
};
if !(_hasCrows) exitWith {
	diag_log "Crow's Electronic Warfare not found. It is required.";
};

if (!isServer) then {
	call FUNC(init);
};
