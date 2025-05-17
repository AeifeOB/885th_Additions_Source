#include "script_component.hpp"

GVAR(frequencyDialog) = { 
	[
		"Scanner Settings", 
		[
			[
				"SLIDER", 
				"Frequency", 
				[30.0, 1090.0, GVAR(freq), 1]
			],
			[
				"SLIDER", 
				"Alternate Frequency", 
				[30.0, 1090.0, GVAR(altfreq), 1]
			], 
			[
				"CHECKBOX", 
				"Alternate Active", 
				GVAR(altActive)
			], 
			[
				"CHECKBOX", 
				["Civilian Signals Active", "Frequency 805.0"], 
				GVAR(civActive)
			]
		],
		{
			GVAR(freq) = (_this select 0) select 0;
			GVAR(altfreq) = (_this select 0) select 1;
			GVAR(altActive) = (_this select 0) select 2;
			GVAR(civActive) = (_this select 0) select 3;
		}
	] call zen_dialog_fnc_create;
};

GVAR(pingDialog) ={
	[
		"Search Settings", 
		[
			[
				"SLIDER", 
				"Minimum", 
				[30.000, 3001.999, 30.000, 1]
			],
			[
				"SLIDER", 
				"Maximum", 
				[30.0, 3001.9, 50.0, 1]
			]
		],
		{
			_minfreq = (_this select 0) select 0;
			_maxfreq = (_this select 0) select 1;
			[_minfreq, _maxfreq] call FUNC(scan);
		}
	] call zen_dialog_fnc_create;
};