_checkHash = {
	if (isNil (missionNamespace getVariable (_key))) then { 
		systemChat format[
			"Attached Unit %1 Removed - deleting...",
			_key
		];
		[AIFE_Scanner_markers, _key] call CBA_fnc_hashRem;
	};
};
if (isServer) then {
	[AIFE_Scanner_markers, _checkHash] call CBA_fnc_hashEachPair;
};