within BuildingsAndPlants.Controllers.Actuation;
model SplitRange_01
  parameter Real DeadZone(final min = 1e-6, final max = 1 - 1e-6) = 0.1;
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -18}, {-60, 22}})));
  Modelica.Blocks.Interfaces.RealOutput CSo01_pos annotation(
  Placement(transformation(extent = {{60, 42}, {100, 82}}, rotation = 0), iconTransformation(extent = {{60, 40}, {100, 80}})));
  Modelica.Blocks.Interfaces.RealOutput CSo01_neg annotation(
  Placement(transformation(extent = {{60, -80}, {100, -40}}, rotation = 0), iconTransformation(extent = {{60, -78}, {100, -38}})));
  // POS solve([a*dz+b=0,a*1+b=1],[a,b]);
  // NEG solve([-a*dz+b=0,-a*1+b=1],[a,b]);
protected
  parameter Real a = 1 / (DeadZone - 1);
  parameter Real b = DeadZone / (DeadZone - 1);
equation
  CSo01_pos = max(0, min(1, (-a * CSi01) + b));
  CSo01_neg = max(0, min(1, a * CSi01 + b));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-68, 64}, {50, -62}}, lineColor = {0, 0, 0}, textString = "SR
01"), Text(extent = {{36, 80}, {60, 50}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {248, 248, 248}, textString = "+"), Text(extent = {{26, -40}, {70, -68}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {248, 248, 248}, textString = "-")}));
end SplitRange_01;

