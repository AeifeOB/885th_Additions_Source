#include "script_component.hpp"

params [
	"_dist",
	"_unit"
];

private _iconSize = GVAR(scale);
private _color = [1,1,1,0.5];
switch(assignedTeam _unit) do {
	case "MAIN": {_color = [1,1,1,0.8];};
	case "RED": {_color = [1,0,0,0.8];};
	case "GREEN": {_color = [0,1,0,0.8];};
	case "BLUE": {_color = [0,0,1,0.8];};
	case "YELLOW": {_color = [1,1,0,0.8];};
	default {_color = [1,1,1,0.8];};
};

private _pos = ASLToAGL getPosASLVisual _unit;
if (_unit isKindOf "CAManBase") then {
	private _zOffset = (_pos select 2) + 2.25;
	_pos = [_pos select 0, _pos select 1, _zOffset];
};

private _txt = name _unit;
private _textSize = GVAR(text_scale) / 1000;

drawIcon3D [
	GVAR(icon), 
	_color, 
	_pos, 
	_iconSize,
	_iconSize,
	0, 
	"", 
	1, 
	_textSize, 
	"RobotoCondensedBold", 
	"center", 
	false,
	0,
	0
];

drawIcon3D [
	"", 
	[1,1,1,1], 
	_pos, 
	_iconSize,
	_iconSize,
	0, 
	_txt, 
	1, 
	_textSize, 
	"RobotoCondensedBold", 
	"center", 
	false,
	0,
	0
];
