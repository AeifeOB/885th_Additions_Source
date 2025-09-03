#include "script_component.hpp"

params [
	"_dist",
	"_unit",
	"_color",
	"_txt"
];

private _iconSize = if (_dist > GVAR(minimum)) then {
	10 * GVAR(scale);
} else {
	0;
};
private _textSize = GVAR(text_scale) / 1000;

private _pos = ASLToAGL getPosASLVisual _unit;
if (_unit isKindOf "CAManBase") then {
	private _zOffset = (_pos select 2) + 1;
	_pos = [_pos select 0, _pos select 1, _zOffset];
};

drawIcon3D [
	GVAR(icon), 
	_color, 
	_pos, 
	_iconSize,
	_iconSize,
	(time * GVAR(rotationRate)) % 360, 
	_txt, 
	1, 
	_textSize, 
	"RobotoCondensedBold", 
	"center", 
	true,
	0,
	0
];
