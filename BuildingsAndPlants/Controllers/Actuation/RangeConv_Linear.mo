within BuildingsAndPlants.Controllers.Actuation;
model RangeConv_Linear
  parameter Real CSimin = 0.1;
  parameter Real CSimax = 0.9;
  parameter Real CSomin = 0;
  parameter Real CSomax = 1;
  Modelica.Blocks.Interfaces.RealInput CSi annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -18}, {-60, 22}})));
  Modelica.Blocks.Interfaces.RealOutput CSo annotation(
  Placement(transformation(extent = {{60, -18}, {100, 22}}, rotation = 0), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  CSo = Functions.range_conv_linear(CSi, CSimin, CSimax, CSomin, CSomax);
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-64, 70}, {70, -70}}, lineColor = {0, 0, 0}, textString = "RC
linear")}));
end RangeConv_Linear;

