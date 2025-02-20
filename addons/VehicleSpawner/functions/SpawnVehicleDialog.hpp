#include "defines.hpp"
class VehicleSpawnDialog {
	idd = 3234;
	access = 0;
	movingEnable = true;
	onLoad="uiNamespace setVariable ['885SpawnerUI',_this select 0];";
	onUnload = "";
	enableSimulation = true;
	colorBackground[] = {1,1,1,1};
	class ControlsBackground {
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class Controls {
		class padSelectText: RscText
		{
			idc = 1000;
			text = "Select Pad:";
			colorText[] = {1,1,1,1};
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class padSelector: RscCombo
		{
			onLoad = "_padList = pads;"
			idc = 2100;
			colorText[] = {1,1,1,1};
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class vehicleSelectText: RscText
		{
			idc = 1001;
			text = "Select Vehicle:";
			colorText[] = {1,1,1,1};
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class vehicleSelector: RscCombo
		{
			idc = 2101;
			colorText[] = {1,1,1,1};
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class padMapFrame: RscMapControl
		{
			idc = 1801;
			access = 0;
			type = 101;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
		};
		/*class vehicleRemainingLabel: RscText
		{
			idc = 1003;
			text = "Remaining Stock:";
			colorText[] = {1,1,1,1};
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class vehicleRemainingText: RscText
		{
			idc = 1802;
			text = "";
			colorText[] = {1,1,1,1};
			x = 32 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};*/
		class addCrewCheck : RscCheckBox
		{
			idc = 2102;
			type = CT_CHECKBOXES;
			style = ST_CENTER;
			colorText[] = {1,1,1,1};
			colorTextSelect[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.5};
			colorSelectedBg[] = {1, 1, 1, 0.5};
			sizeEx = 0.04;
			font = "RobotoCondensed";
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;

			columns = 1;
			rows = 1;
			strings[] = {"Add Crew"};
			checked_strings[] = {"[Add Crew]"};
			values[] = {true};
			tooltips[] = {"Add crew to the spawned vehicle, except the driver seat."};
		};
		class ClearButton: RscButton
		{
			idc = 3;
			text = "Clear Pad";
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			action = "lbCurSel padSelector;";
			onButtonClick = "[lbCurSel padSelector] spawn BPD_fnc_clearPad;";
		};
		class SubmitButton: RscButton
		{
			idc = 1;
			text = "Spawn";
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0.5,0.1,1};
			action = "lbCurSel padSelector; lbCurSel vehicleSelector; ctrlChecked addCrewCheck;";
			onButtonClick = "[lbCurSel padSelector, lbCurSel vehicleSelector, ctrlChecked addCrewCheck] spawn BPD_fnc_spawnVehicle;";
		};
		class CancelButton: RscButton
		{
			idc = 2;
			text = "Cancel";
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,1};
			action = "closeDialog 2;";
		};
	};
};