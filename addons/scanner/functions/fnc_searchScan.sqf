params = ["_min", "_max"];

private _camPos = positionCameraToWorld [0,0,0];
{
	private _unit = _x select 0; 
	private _freq = _x select 1;
	private _range = _x select 2; 

	private _inRange = _min < _freq && _freq < _max;
	if (!_inRange) then {continue;};

	private _dist = _camPos distance _unit;
	if (_dist > _range) then {continue;};
	
	private _color = AIFE_Scanner_colorOne;

	private _txt = ""; 
	if (_dist > 10) then {
		_txt = format["(F: %1, %2 m)", _freq, round(_dist)]; 
	};

	private _iconSize = if (_dist > AIFE_Scanner_minimum) then {
		10 * AIFE_Scanner_scale;
	} else {
		0;
	};
	private _textSize = AIFE_Scanner_text_scale / 1000;

	private _pos = ASLToAGL getPosASLVisual _unit;
	if (_unit isKindOf "CAManBase") then {
		private _zOffset = (_pos select 2) + 1;
		_pos = [_pos select 0, _pos select 1, _zOffset];
	};
	drawIcon3D [
		"\Aifes_Zeus_Tools\addons\Scanner\textures\markerIcon.paa", 
		_color, 
		_pos, 
		_iconSize,
		_iconSize,
		(time * AIFE_Scanner_rotationRate) % 360, 
		_txt, 
		1, 
		_textSize, 
		"RobotoCondensedBold", 
		"center", 
		true,
		0,
		-5
	];
} forEach crowsEW_spectrum_beacons;