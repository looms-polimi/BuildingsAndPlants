within BuildingsAndPlants.Controllers.Blocks.Digital.BaseClasses;

partial model D_SISO_base
  outer Time Ts;
  discrete Real cs;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
  Placement(transformation(extent = {{-100, 60}, {-80, 80}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
  Placement(transformation(extent = {{-100, 20}, {-80, 40}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
  Placement(transformation(extent = {{80, 60}, {100, 80}}), iconTransformation(extent = {{60, 40}, {100, 80}})));
equation
  CS = cs;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {230, 230, 230})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end D_SISO_base;
