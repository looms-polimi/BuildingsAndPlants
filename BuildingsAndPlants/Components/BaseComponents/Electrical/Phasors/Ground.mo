within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model Ground
  Interfaces.Electrical.PositivePhasorPin p annotation(
  Placement(transformation(extent = {{-20, 60}, {20, 100}}), iconTransformation(extent = {{-20, 60}, {20, 100}})));
equation
  p.vre = 0;
  p.vim = 0;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-8, 66}, {8, -22}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}), Rectangle(extent = {{-60, 0}, {62, -22}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255})}));
end Ground;

