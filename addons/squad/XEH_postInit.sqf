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

if (isServer) then {
};
// if not a player we don't do anything
if (!hasInterface) exitWith {}; 
if (is3DEN) exitWith {};

if (GVAR(isActive)) then {
	call FUNC(init);
};
