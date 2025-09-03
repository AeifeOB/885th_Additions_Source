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
	case "YELLOW": {_color = [1,0.9,0,1];};
	default {_color = [1,1,1,0.8];};
};

private _pos = ASLToAGL getPosASLVisual _unit;
private _heightChange = [0, (_dist / 10)] select GVAR(distance_height);
private _zOffset = (_pos select 2) + 2.25 + GVAR(vertical_offset) + _heightChange;

if (_unit isKindOf "CAManBase") then {
	_pos = [_pos select 0, _pos select 1, _zOffset];
};

private _txt = name _unit;
private _textSize = GVAR(text_scale) / 1000;
private _textColor = [GVAR(text_color), _color] select GVAR(match_color);

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
if (_dist >= GVAR(maximum)) exitWith{};
drawIcon3D [
	"", 
	_textColor, 
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
