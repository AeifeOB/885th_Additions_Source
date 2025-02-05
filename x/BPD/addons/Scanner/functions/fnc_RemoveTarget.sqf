params["_position", "_object"];

if (_object == objNull) exitWith {
	systemChat "Must be placed on an object.";
};


// broadcast event to all clients
["RemoveMarker", [_object]] call CBA_fnc_globalEventJIP;