within BuildingsAndPlants.Components.BaseComponents.Water.Valves;
model WaterValve_LinChar
  import BuildingsAndPlants.Functions.*;
  extends Interfaces.Water.PartialTwoPort_water;
  parameter Real cvmax = 0.01 "kg/s/sqrt(Pa)";
  parameter Time T = 1 "positioner TC";
  parameter Real xstart = 0 "initial position";
  Real x(start = xstart, fixed = true);
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
  Placement(transformation(extent = {{-60, 50}, {-20, 90}}), iconTransformation(extent = {{-60, 50}, {-20, 90}})));
equation
  // dynamic aperture
  x + T * der(x) = cmd;
  // no mass storage inside the valve
  w1 + w2 = 0;
  // relationship between pressure drop and mass flow rate
  w1 = if p1 >= p2 then cvmax * x * sqrtReg(p1 - p2,1e5) else -cvmax * x * sqrtReg(p2 - p1,1e5);
  // energy conservation
  hout1 = inStream(water_flange2.h);
  hout2 = inStream(water_flange1.h);
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Polygon(points = {{-70, 30}, {-2, 0}, {-70, -32}, {-70, 30}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{70, 30}, {2, 0}, {70, -32}, {70, 30}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-20, 78}, {20, 62}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-2, 62}, {2, -2}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Polygon(points = {{-64, 6}, {-64, -4}, {-42, -4}, {-42, -10}, {-22, 2}, {-42, 12}, {-42, 6}, {-64, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
end WaterValve_LinChar;

