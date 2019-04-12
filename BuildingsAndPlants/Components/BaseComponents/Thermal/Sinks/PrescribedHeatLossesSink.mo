within BuildingsAndPlants.Components.BaseComponents.Thermal.Sinks;

model PrescribedHeatLossesSink
  Interfaces.Thermal.HeatPort port annotation(
  Placement(transformation(extent = {{-100, -20}, {-80, 0}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
equation
  port.T = 0;
  // Do-not-care value
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-48, 12}, {-48, -12}, {-4, -12}, {-4, -40}, {20, 0}, {-2, 40}, {-2, 12}, {-48, 12}}, lineColor = {255, 0, 0}, lineThickness = 0.5, fillPattern = FillPattern.VerticalCylinder, smooth = Smooth.None, fillColor = {255, 85, 85}), Polygon(points = {{36, 0}, {-16, 76}, {-16, 76}, {16, 66}, {44, 6}, {68, 60}, {96, 68}, {52, 0}, {94, -94}, {72, -84}, {72, -84}, {44, -10}, {18, -86}, {-10, -92}, {36, 0}}, lineColor = {100, 100, 100}, smooth = Smooth.None, fillPattern = FillPattern.Sphere, fillColor = {100, 100, 100}), Text(extent = {{-80, 60}, {-18, 18}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}, textString = "Pheats")}));
end PrescribedHeatLossesSink;
