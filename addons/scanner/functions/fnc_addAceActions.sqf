#include "script_component.hpp"

_insertChildren = {
    params ["_target", "_player", "_params"];
    diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
	private _childCondition ={
		!GVAR(mainActive)
	};
	private _childStatement = {
		call FUNC(addEventHandler);
		GVAR(mainActive) = !GVAR(mainActive);
	};
	private _action = [
		"ActivateSensors", 
		"Activate Sensors", 
		"", 
		_childStatement, 
		_childCondition
	] call ace_interact_menu_fnc_createAction;

	_actions pushBack [_action, [], _target]; 

	_childCondition = {
		GVAR(mainActive)
	};
	_childStatement = {
		call FUNC(removeEventHandler);
		GVAR(mainActive) = !GVAR(mainActive);
	};
	_action = [
		"DeactivateSensors", 
		"Deactivate Sensors", 
		"", 
		_childStatement, 
		_childCondition
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
	
	_action = [
		"ActivateSearch", 
		"Search Spectrum", 
		"", 
		GVAR(pingDialog), 
		{true}
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];

	_action = [
		"ToggleAlternate", 
		"Toggle Alternate", 
		"", 
		{GVAR(altActive) = !GVAR(altActive);}, 
		{true}
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];

	_action = [
		"ToggleCivilian", 
		"Toggle Civilian", 
		"", 
		{GVAR(civActive) = !GVAR(civActive);}, 
		{true}
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];

	_actions;
};

_parentAction = [
	"ConfigSensors", 
	"Sensors", 
	"", 
	GVAR(frequencyDialog), 
	{true},
	_insertChildren
] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions"], _parentAction, true] call ace_interact_menu_fnc_addActionToClass;
