params["_position", "_object"];

if (_object == objNull) exitWith {
	hint "Must be placed on an object.";
};

_findPad = {
	// Current result is saved in variable _x
	if (_value select 0 == _object) then {
		[AIFE_Spawner_pads, _key] call CBA_fnc_hashRem;
		publicVariable "AIFE_Spawner_pads";
	} else {
		hint "Pad not found."
	}
}; 

[AIFE_Spawner_pads, _findPad] call CBA_fnc_hashEachPair;