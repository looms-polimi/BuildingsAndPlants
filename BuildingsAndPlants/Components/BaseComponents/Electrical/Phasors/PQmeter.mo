within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;

model PQmeter
  Interfaces.Electrical.PositivePhasorPin p1 annotation(
  Placement(transformation(extent = {{-90, 30}, {-70, 50}}), iconTransformation(extent = {{-100, 50}, {-80, 70}})));
  Interfaces.Electrical.PositivePhasorPin p2 annotation(
  Placement(transformation(extent = {{70, 30}, {90, 50}}), iconTransformation(extent = {{80, 50}, {100, 70}})));
  Interfaces.Electrical.NegativePhasorPin n1 annotation(
  Placement(transformation(extent = {{-90, -50}, {-70, -30}}), iconTransformation(extent = {{-100, -70}, {-80, -50}})));
  Interfaces.Electrical.NegativePhasorPin n2 annotation(
  Placement(transformation(extent = {{70, -50}, {90, -30}}), iconTransformation(extent = {{80, -70}, {100, -50}})));
  Modelica.Blocks.Interfaces.RealOutput P annotation(
  Placement(transformation(extent = {{12, 64}, {32, 84}}), iconTransformation(extent = {{-21, -21}, {21, 21}}, rotation = 90, origin = {-39, 101})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation(
  Placement(transformation(extent = {{12, 42}, {32, 62}}), iconTransformation(extent = {{-21, -21}, {21, 21}}, rotation = 90, origin = {39, 101})));
protected
  Voltage Vre, Vim;
  Current Ire, Iim;
equation
  Vre = p1.vre - n1.vre;
  Vim = p1.vim - n1.vim;
  Ire = p1.ire;
  Iim = p1.iim;
  P = Vre * Ire + Vim * Iim;
  Q = Vim * Ire - Vre * Iim;
  connect(p1, p2) annotation(
  Line(points = {{-80, 40}, {80, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(n1, n2) annotation(
  Line(points = {{-80, -40}, {80, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 80}, {70, -80}}, lineColor = {0, 0, 100}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Line(points = {{-80, 60}, {-70, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-80, -60}, {-70, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, 60}, {80, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, -60}, {80, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Polygon(points = {{-40, 20}, {0, 20}, {0, 40}, {40, 0}, {0, -40}, {0, -18}, {-40, -18}, {-40, 20}}, lineColor = {0, 0, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {200, 200, 255}), Text(extent = {{-52, 72}, {-20, 34}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "P"), Text(extent = {{26, 72}, {58, 34}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "Q")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PQmeter;
