within BuildingsAndPlants.CaseStudies.LabForSeminars;

model ExampleElec1
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-54, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1 annotation(
    Placement(visible = true, transformation(origin = {-140, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(
    Placement(visible = true, transformation(origin = {-116, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-132, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end ExampleElec1;