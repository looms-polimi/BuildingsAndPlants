within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.BaseClasses;

partial model BaseExternalDoor_Opening

  //Interfaces.Air.MoistAirFlange_wawvQd airInt annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}}), iconTransformation(extent = {{-120, -20}, {-80, 20}})));
  Modelica.Blocks.Interfaces.RealInput opening01 annotation(
  Placement(transformation(extent = {{-100, 60}, {-60, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-10, 80})));
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
    Placement(transformation(extent={{-106,16},{-86,36}}),
        iconTransformation(extent={{-106,16},{-86,36}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              vapour
    annotation (
    Placement(transformation(extent={{-104,-40},{-84,-20}}),
        iconTransformation(extent={{-104,-40},{-84,-20}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort
                              diffuse
    annotation (
    Placement(transformation(extent={{-100,-10},{-80,10}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 100}, {-30, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-46, 60}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-46, 0}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-46, -60}, rotation = 90), Rectangle(extent = {{-40, -100}, {20, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 200, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag), Text(extent = {{-34, -60}, {-16, -102}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "1"), Text(extent = {{-2, -58}, {18, -104}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "2"), Rectangle(extent = {{-40, 62}, {20, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {100, 100, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-22, 62}, {2, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {150, 100, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {4, -34}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {4, 32}, rotation = 90), Rectangle(extent = {{20, 100}, {100, -98}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{44, -54}, {64, -56}, {62, -38}, {60, -46}, {34, -20}, {44, -18}, {24, -16}, {26, -36}, {28, -26}, {54, -52}, {44, -54}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{20, -60}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward), Text(extent = {{44, -74}, {76, -90}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "Gnd"), Polygon(points = {{44, 50}, {64, 52}, {62, 34}, {60, 42}, {34, 16}, {44, 14}, {24, 12}, {26, 32}, {28, 22}, {54, 48}, {44, 50}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-24, 16}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-24, 16}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {70, 0}, rotation = 90), Text(extent = {{64, 44}, {98, 28}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "Sky"), Text(extent = {{70, -10}, {100, -24}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "Amb"), Ellipse(extent = {{68, 64}, {88, 44}}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Text(extent = {{58, 100}, {98, 70}}, lineColor = {255, 0, 0}, textString = "AS")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end BaseExternalDoor_Opening;
