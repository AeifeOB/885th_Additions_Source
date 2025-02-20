params ["_text"];
hint _text;
private _array = parseSimpleArray _text;
AIFE_Spawner_vehicleList = [] call CBA_fnc_hashCreate;
{
	_displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	if (!isNil("_displayName")) then {
		if ([AIFE_Spawner_vehicleList, _displayName] call CBA_fnc_hashHasKey) then {
			hint format ["Duplicate Entry %1", _displayName];
			continue;
		};
		[AIFE_Spawner_vehicleList, _displayName, [_x]] call CBA_fnc_hashSet;
	}
} forEach _array;
publicVariable "AIFE_Spawner_vehicleList";