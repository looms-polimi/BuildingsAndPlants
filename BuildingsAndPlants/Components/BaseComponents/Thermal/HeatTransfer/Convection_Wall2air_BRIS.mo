within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Convection_Wall2air_BRIS
  // BRIS, Brown 1990
  parameter Length L = 5 "wall surface length";
  parameter Length H = 3 "wall surface height";
  parameter Real a = 3;
  parameter Real c = 0.1;
  parameter Real n = 0.4;
  Interfaces.Thermal.HeatPort wall annotation(
  Placement(transformation(extent = {{60, -40}, {100, 40}}, rotation = 0), iconTransformation(extent = {{60, -80}, {100, 80}})));
  Interfaces.Thermal.HeatPort air annotation(
  Placement(transformation(extent = {{-100, -40}, {-60, 40}}, rotation = 0), iconTransformation(extent = {{-100, -80}, {-60, 80}})));
protected
  Modelica.SIunits.Conversions.NonSIunits.Temperature_degC DT;
  CoefficientOfHeatTransfer g;
equation
  DT = air.T - wall.T;
  g = a + c * smooth(0, noEvent(abs(DT))) ^ n;
  wall.Q_flow + air.Q_flow = 0;
  air.Q_flow = g * L * H * DT;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 100}, {40, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{40, 100}, {60, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, 60}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, 0}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, -62}, rotation = 90)}), Diagram(graphics), DymolaStoredErrors);
end Convection_Wall2air_BRIS;
