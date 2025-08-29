#include "script_component.hpp"
params [
	"_unit"
];
private _activeJammers = _unit getVariable ["crowsEW_spectrum_activeJammingObjects", []];
private _jamCount = count _activeJammers;

_jamCount > 0;
