within BuildingsAndPlants.Appliances.BaseClasses;

partial model BaseAppliance_AC
  Interfaces.Electrical.PosNegPhasorPins plug annotation(
  Placement(transformation(extent = {{-100, 80}, {-80, 100}}), iconTransformation(extent = {{-142, -98}, {-116, -62}})));
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{80, 80}, {100, 100}}), iconTransformation(extent = {{-40, 80}, {40, 100}})));
  Modelica.Blocks.Interfaces.RealOutput Pabs "Instantaneous power as output signal" annotation(
  Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {-10, 94}), iconTransformation(extent = {{80, 40}, {100, 60}})));
  Modelica.Blocks.Interfaces.RealOutput Qabs "Instantaneous power as output signal" annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-30, 88}), iconTransformation(extent = {{80, 0}, {100, 20}})));
  Components.BaseComponents.Electrical.Phasors.PQmeter PQM annotation(
  Placement(transformation(extent = {{-70, 64}, {-50, 84}})));
equation
  connect(PQM.p1, plug.p) annotation(
  Line(points = {{-69, 80}, {-80, 80}, {-80, 90}, {-90, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQM.n1, plug.n) annotation(
  Line(points = {{-69, 68}, {-80, 68}, {-80, 90}, {-90, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Pabs, PQM.P) annotation(
  Line(points = {{-10, 94}, {-63.9, 94}, {-63.9, 84.1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PQM.Q, Qabs) annotation(
  Line(points = {{-56.1, 84.1}, {-56.1, 88}, {-30, 88}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-138, -100}, {-138, -60}, {-120, -60}, {-114, -70}, {-108, -76}, {-100, -76}, {-100, -84}, {-108, -84}, {-114, -90}, {-120, -100}, {-138, -100}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid)}));
end BaseAppliance_AC;
