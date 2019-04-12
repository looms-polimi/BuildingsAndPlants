within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.BaseClasses;
partial model BaseInternalWindow_Opening

  //Interfaces.Air.MoistAirFlange_wawvQd airSide1 annotation(Placement(transformation(extent = {{-100, -10}, {-80, 10}}), iconTransformation(extent = {{-110, -20}, {-70, 20}})));
  Modelica.Blocks.Interfaces.RealInput opening01 annotation(
  Placement(transformation(extent = {{-100, 60}, {-60, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80})));
  //Interfaces.Air.MoistAirFlange_wawvQd airSide2 annotation(Placement(transformation(extent = {{80, -10}, {100, 10}}), iconTransformation(extent = {{70, -20}, {110, 20}})));
public
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart
                                              dryair
    annotation (
    Placement(transformation(extent={{-106,12},{-86,32}}),
        iconTransformation(extent={{-106,14},{-86,34}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              vapour
    annotation (
    Placement(transformation(extent={{-104,-36},{-84,-16}})));
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
    Placement(transformation(extent={{80,-40},{100,-20}}),
        iconTransformation(extent={{80,-40},{100,-20}})));
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
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "2"), Rectangle(extent = {{-30, 80}, {30, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {150, 100, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-10, 60}, {10, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end BaseInternalWindow_Opening;

