params["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_objName = format["AIFE_Scanner_%1", netId _object];

if ([AIFE_Scanner_markers, _objName] call CBA_fnc_hashHasKey) then {
	[AIFE_Scanner_markers, _objName] call CBA_fnc_hashRem;
} else {
	hint "No Signal Found.";
}