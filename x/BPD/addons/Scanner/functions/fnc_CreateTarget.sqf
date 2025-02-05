params["_position", "_object"];

if (_object == objNull) exitWith {
		hint "Must be placed on an object.";
};
["Create Marker", [
		["SLIDER", "Frequency", [100, 800, 186.00, 2]], 
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
			systemChat format["%1, %2 %3",_freq,_range, _object];
			[AIFE_Scanner_markers, _object, [_freq, _range]] call CBA_fnc_hashSet;
		}, {}, [_position, _object]
] call zen_dialog_fnc_create;