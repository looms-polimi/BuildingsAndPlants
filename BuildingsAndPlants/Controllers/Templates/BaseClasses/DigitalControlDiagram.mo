within BuildingsAndPlants.Controllers.Templates.BaseClasses;

model DigitalControlDiagram
  inner Time Ts = settings.Ts;
  Settings.DigitalControlSettings settings annotation(
  Placement(transformation(extent = {{-200, 120}, {-180, 140}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25.0), Rectangle(extent = {{-70, 70}, {70, -70}}, lineColor = {0, 0, 0}), Text(extent = {{-16, 22}, {26, -26}}, lineColor = {255, 0, 255}, textString = "D")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -140}, {200, 140}})));
end DigitalControlDiagram;
