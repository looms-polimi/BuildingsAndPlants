within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.BaseClasses;
partial model BaseInternalDoor_Opening

  //Interfaces.Air.MoistAirFlange_wawvQd airSide1 annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}}), iconTransformation(extent = {{-110, -20}, {-70, 20}})));
  Modelica.Blocks.Interfaces.RealInput opening01 annotation(
  Placement(transformation(extent = {{-100, 60}, {-60, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80})));
  //Interfaces.Air.MoistAirFlange_wawvQd airSide2 annotation(Placement(transformation(extent = {{80, -10}, {100, 10}}), iconTransformation(extent = {{70, -20}, {110, 20}})));
  parameter SI.Length L = 1 "door width";
  parameter SI.Length H = 2 "door height";
  parameter SI.Length s = 0.04 "door thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 800 "door material density";
  parameter SI.SpecificHeatCapacity cp = 480 "door material cp";
  parameter SI.ThermalConductivity lambda = 0.8 "door material thermal cond";
  parameter Integer n = 4 "number of door layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
public
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart
                                              dryair
    annotation (
    Placement(transformation(extent={{-104,14},{-84,34}}),
        iconTransformation(extent={{-104,16},{-84,36}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              vapour
    annotation (
    Placement(transformation(extent={{-102,-40},{-82,-20}}),
        iconTransformation(extent={{-102,-38},{-82,-18}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort
                              diffuse
    annotation (
    Placement(transformation(extent={{-100,-12},{-80,8}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart
                                              Bdryair
    annotation (
    Placement(transformation(extent={{80,16},{100,36}}),
        iconTransformation(extent={{80,16},{100,36}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              Bvapour
    annotation (
    Placement(transformation(extent={{80,-38},{100,-18}}),
        iconTransformation(extent={{80,-38},{100,-18}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort
                              Bdiffuse
    annotation (
    Placement(transformation(extent={{80,-10},{100,10}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 100}, {-30, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, 60}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, 0}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, -60}, rotation = 90), Rectangle(extent = {{30, 100}, {80, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, 60}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, 0}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, -60}, rotation = 90), Rectangle(extent = {{-30, -100}, {30, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 200, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag), Text(extent = {{-24, -60}, {-6, -102}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "1"), Text(extent = {{8, -58}, {28, -104}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "2"), Rectangle(extent = {{-30, 62}, {30, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {100, 100, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-12, 62}, {12, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {150, 100, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {14, -34}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {14, 32}, rotation = 90)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end BaseInternalDoor_Opening;

