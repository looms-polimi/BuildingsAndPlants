within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;

model Switch
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Time TC = 0.001 "Time constant";
  parameter Resistance Ron = 1e-6;
  parameter Conductance Goff = 1e-6;
  Conductance G;
  Modelica.Blocks.Interfaces.BooleanInput close annotation(
  Placement(transformation(extent = {{-148, 46}, {-108, 86}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80})));
initial equation
  G = if close then 1 / Ron else Goff;
equation
  G + TC * der(G) = if close then 1 / Ron else Goff;
  Ire = G * Vre;
  Iim = G * Vim;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 0}, {-30, 0}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-24, 36}, {28, 0}, {60, 0}}, color = {0, 0, 0}, smooth = Smooth.None), Ellipse(extent = {{-34, 2}, {-30, -2}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}), Ellipse(extent = {{-26, 38}, {-22, 34}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}), Ellipse(extent = {{26, 2}, {30, -2}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255})}));
end Switch;
