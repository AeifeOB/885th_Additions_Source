params ["_text"];
hint _text;
private _array = parseSimpleArray _text;

{
	// Current result is saved in variable _x
	if (_displayName = getText (configFile >> "CfgVehicles" > _x >> "displayName")) then {
		if ([AIFE_Spawner_vehicleList, _displayName] call CBA_fnc_hashHasKey) then {
			hint format ["Duplicate Entry %1", _displayName];
			continue;
		};
		[AIFE_Spawner_vehicleList, _displayName, [_x]] call CBA_fnc_hashSet;
	}
} forEach _array;
publicVariable "AIFE_Spawner_vehicleList";