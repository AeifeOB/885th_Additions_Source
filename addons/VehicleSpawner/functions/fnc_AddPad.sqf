params ["_object"];

 if (isNil "pads") then {
	pads = [];
}; 

_number = (count pads);
pads pushBack [];
_name = format["Pad %1", _number];
_variable = format["pad_%1", _number];
missionNamespace setVariable [_variable, _object];

pads set [_number, [_name, _variable]];