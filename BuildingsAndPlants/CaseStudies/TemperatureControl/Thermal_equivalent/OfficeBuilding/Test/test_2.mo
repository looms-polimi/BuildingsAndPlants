within BuildingsAndPlants.CaseStudies.TemperatureControl.Thermal_equivalent.OfficeBuilding.Test;

model test_2
  BaseClasses.OfficeFloor officeFloor annotation(Placement(transformation(extent = {{-82, -52}, {120, 66}})));
  Modelica.Blocks.Sources.Sine Texternal1(freqHz = 1 / 86400, phase = -pi / 2, offset = 273.15 + 36, amplitude = 1) annotation(Placement(transformation(extent = {{-100, 54}, {-88, 66}})));
equation
  connect(Texternal1.y, officeFloor.Texternal) annotation(Line(points = {{-87.4, 60}, {-76, 60}, {-76, 39.45}, {-35.1071, 39.45}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test_2;
