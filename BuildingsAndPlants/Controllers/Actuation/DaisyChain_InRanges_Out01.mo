within BuildingsAndPlants.Controllers.Actuation;

model DaisyChain_InRanges_Out01
  parameter Real CSiRB[:] = {0.1, 0.3, 0.5, 1, 3} "Input range boundaries";
  Modelica.Blocks.Interfaces.RealInput CSi annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -18}, {-60, 22}})));
  Modelica.Blocks.Interfaces.RealOutput CSo[n] annotation(
  Placement(transformation(extent = {{60, -18}, {100, 22}}, rotation = 0), iconTransformation(extent = {{60, -20}, {100, 20}})));
protected
  parameter Integer n = size(CSiRB, 1) - 1;
equation
  for i in 1:n loop
    CSo[i] = BuildingsAndPlants.Functions.range_conv_linear(CSi, CSiRB[i], CSiRB[i + 1], 0, 1);
  end for;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-74, 90}, {76, -86}}, lineColor = {0, 0, 0}, textString = "DC
InRanges")}));
end DaisyChain_InRanges_Out01;
