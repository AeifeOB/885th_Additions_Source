// cam position
private _camPos = positionCameraToWorld [0,0,0];
_loop = {
	_unit = _key; 
	private _dist = _camPos distance _unit;
	
	_freq = _value select 0; 
	if (_freq != AIFE_Scanner_freq) then {continue;};
	_range = _value select 1;
	private _txt = ""; 
	if (_dist > 10) then {
		_txt = format["(%1 m)",round(_dist)]; 
	};

	private _pos = ASLToAGL getPosASLVisual _unit;
	drawIcon3D ["\A3\ui_f\data\map\markers\military\triangle_CA.paa", [1,0,0,1], _pos, 0, 0, 0, _txt, 1, 0.03];
};
[AIFE_Scanner_markers, _loop] call CBA_fnc_hashEachPair;