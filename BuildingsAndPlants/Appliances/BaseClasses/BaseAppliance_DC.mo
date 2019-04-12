within BuildingsAndPlants.Appliances.BaseClasses;
partial model BaseAppliance_DC
  Interfaces.Electrical.PosNegPins plug annotation(
  Placement(transformation(extent = {{-100, 80}, {-80, 100}}), iconTransformation(extent = {{-142, -98}, {-116, -62}})));
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{80, 80}, {100, 100}}), iconTransformation(extent = {{-40, 80}, {40, 100}})));
  Modelica.Blocks.Interfaces.RealOutput Pabs "Instantaneous power as output signal" annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-30, 94}), iconTransformation(extent = {{80, 40}, {100, 60}})));
  Components.BaseComponents.Electrical.DC.Pmeter PM annotation(
  Placement(transformation(extent = {{-70, 64}, {-50, 84}})));
equation
  connect(plug.p, PM.p1) annotation(
  Line(points = {{-90, 90}, {-80, 90}, {-80, 80}, {-69, 80}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(plug.n, PM.n1) annotation(
  Line(points = {{-90, 90}, {-80, 90}, {-80, 68}, {-69, 68}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PM.P, Pabs) annotation(
  Line(points = {{-63.9, 84.1}, {-63.9, 94}, {-30, 94}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-138, -100}, {-138, -60}, {-120, -60}, {-114, -70}, {-108, -76}, {-100, -76}, {-100, -84}, {-108, -84}, {-114, -90}, {-120, -100}, {-138, -100}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid)}));
end BaseAppliance_DC;

