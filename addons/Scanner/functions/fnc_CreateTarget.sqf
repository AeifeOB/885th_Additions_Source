params["_position", "_object"];

if (_object == objNull) exitWith {
		hint "Must be placed on an object.";
};
["Create Marker", [
		["SLIDER", "Frequency", [100, 800, 186.0, 1]], 
		["SLIDER:RADIUS", "Range", [1, 1000, 50, 0, _object, [1,1,0,1]]]
	], {
			params ["_dialogResult","_in"];
			_dialogResult params[
				"_freq",
				"_range"
			];
			_in params [
				"_position",
				"_object"
			];
			if (_object == objNull) exitWith {hint "Must be placed on an Object";};
			_objName = format["AIFE_Scanner_%1", netId _object];
			[AIFE_Scanner_markers, _objName, [_freq, _range, _object]] call CBA_fnc_hashSet;
			publicVariable "AIFE_Scanner_markers";
		}, {}, [_position, _object]
] call zen_dialog_fnc_create;