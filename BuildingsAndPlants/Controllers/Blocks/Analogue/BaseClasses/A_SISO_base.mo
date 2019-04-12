within BuildingsAndPlants.Controllers.Blocks.Analogue.BaseClasses;

partial model A_SISO_base
  Modelica.Blocks.Interfaces.RealInput SP annotation(
  Placement(transformation(extent = {{-100, 60}, {-80, 80}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
  Placement(transformation(extent = {{-100, 20}, {-80, 40}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
  Placement(transformation(extent = {{80, 60}, {100, 80}}), iconTransformation(extent = {{60, 40}, {100, 80}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {200, 230, 255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end A_SISO_base;
