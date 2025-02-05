if (!AIFE_Scanner_isActive) exitWith{};

AIFE_Scanner_SignalDraw = addMissionEventHandler ["Draw3D", {call AIFE_fnc_drawIcon;}];