if (!AIFE_Scanner_isActive) exitWith{};
// cam position
private _camPos = positionCameraToWorld [0,0,0];
_loop = {
	_unit = missionNamespace getVariable (_key); 
	private _dist = _camPos distance _unit;
	private _range = _value select 1;
	if (_dist > _range) then {continue;};

	private _freq = _value select 0;
	private _color = [0,0,0];
	switch (_freq) do {
		case AIFE_Scanner_freq: {
			_color = AIFE_Scanner_colorOne;
		};
		case AIFE_Scanner_altfreq: {
			if (!AIFE_Scanner_altActive) then {continue;};
			_color = AIFE_Scanner_colorTwo;
		};
		case AIFE_Scanner_publicfreq: {
			if (!AIFE_Scanner_civActive) then {continue;};
			_color = AIFE_Scanner_colorThree;
		};
		default {
			continue;
		};
	};

	private _txt = ""; 
	if (_dist > 10) then {
		_txt = format["(%1 m)",round(_dist)]; 
	};

	private _iconSize = if (_dist > AIFE_Scanner_minimum) then {
		10 * AIFE_Scanner_scale;
	} else {
		0;
	};

	private _pos = ASLToAGL getPosASLVisual _unit;
	private _zOffset = (_pos select 2) + 1;
	_pos = [_pos select 0, _pos select 1, _zOffset];
	drawIcon3D [
		"\Aifes_Zeus_Tools\addons\Scanner\textures\markerIcon.paa", 
		_color, 
		_pos, 
		_iconSize,
		_iconSize,
		(time * AIFE_Scanner_rotationRate) % 360, 
		_txt, 
		1, 
		0.05, 
		"RobotoCondensedBold", 
		"left", 
		true,
		1,
		1
	];
};
[AIFE_Scanner_markers, _loop] call CBA_fnc_hashEachPair;