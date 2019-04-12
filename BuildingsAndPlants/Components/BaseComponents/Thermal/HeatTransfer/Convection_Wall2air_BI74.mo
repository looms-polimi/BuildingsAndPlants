within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Convection_Wall2air_BI74
  // Brown & Isfalt, 1974
  parameter Length L = 5 "wall surface length";
  parameter Length H = 3 "wall surface height";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  Interfaces.Thermal.HeatPort wall annotation(
  Placement(transformation(extent = {{60, -40}, {100, 40}}, rotation = 0), iconTransformation(extent = {{60, -80}, {100, 80}})));
  Interfaces.Thermal.HeatPort air annotation(
  Placement(transformation(extent = {{-100, -40}, {-60, 40}}, rotation = 0), iconTransformation(extent = {{-100, -80}, {-60, 80}})));
protected
  Modelica.SIunits.Conversions.NonSIunits.Temperature_degC DT;
  CoefficientOfHeatTransfer g;
equation
  DT = air.T - wall.T;
  if vertical then
    g = smooth(0, noEvent(if DT <= 0.0 then 0.55 else 0.55 + 1.4 * DT ^ 2));
  else
    g = smooth(0, noEvent(if DT <= 0.0 then 0.55 else 0.55 + 1.6 * DT ^ 2));
  end if;
  wall.Q_flow + air.Q_flow = 0;
  air.Q_flow = g * L * H * DT;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 100}, {40, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, 60}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, 0}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {0, -62}, rotation = 90), Rectangle(extent = {{40, 100}, {60, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid)}), Diagram(graphics), DymolaStoredErrors);
end Convection_Wall2air_BI74;
