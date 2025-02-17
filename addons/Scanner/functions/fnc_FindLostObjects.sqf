_checkHash = {
	if (isNil (serverNamespace getVariable (_key))) then { 
		[AIFE_Scanner_markers, _key] call CBA_fnc_hashRem;
		publicVariable "AIFE_Scanner_markers";
	};
};
[AIFE_Scanner_markers, _checkHash] call CBA_fnc_hashEachPair;