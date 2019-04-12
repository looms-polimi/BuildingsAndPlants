within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model TransmissionLine
  Interfaces.Electrical.PositivePhasorPin p1 annotation(
  Placement(transformation(extent = {{-90, 30}, {-70, 50}}), iconTransformation(extent = {{-100, 50}, {-80, 70}})));
  Interfaces.Electrical.PositivePhasorPin p2 annotation(
  Placement(transformation(extent = {{70, 30}, {90, 50}}), iconTransformation(extent = {{80, 50}, {100, 70}})));
  Interfaces.Electrical.NegativePhasorPin n1 annotation(
  Placement(transformation(extent = {{-90, -50}, {-70, -30}}), iconTransformation(extent = {{-100, -70}, {-80, -50}})));
  Interfaces.Electrical.NegativePhasorPin n2 annotation(
  Placement(transformation(extent = {{70, -50}, {90, -30}}), iconTransformation(extent = {{80, -70}, {100, -50}})));
  Resistor res1(R = R) annotation(
  Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
  Inductor ind1(L = L / 2, fo = fo) annotation(
  Placement(transformation(extent = {{22, 30}, {42, 50}})));
  Resistor res2(R = R) annotation(
  Placement(transformation(extent = {{40, -50}, {20, -30}})));
  Inductor ind2(L = L / 2, fo = fo) annotation(
  Placement(transformation(extent = {{-20, -50}, {-40, -30}})));
  parameter Length l = 1000 "line length";
  parameter Length r = 0.002 "wire radius";
  parameter Length d = 0.1 "conductors distance";
  parameter Modelica.SIunits.Frequency fo = 50 "nominal f";
protected
  constant Resistivity ro = 1.68e-8 "copper";
  parameter Resistance R = ro * l / (pi * r ^ 2 / 4);
  parameter Inductance L = 4e-7 * log(d / (0.7788 * r));
equation
  connect(p1, res1.p) annotation(
  Line(points = {{-80, 40}, {-38, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(res1.n, ind1.p) annotation(
  Line(points = {{-22, 40}, {24, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ind1.n, p2) annotation(
  Line(points = {{40, 40}, {80, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(n1, ind2.n) annotation(
  Line(points = {{-80, -40}, {-38, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ind2.p, res2.n) annotation(
  Line(points = {{-22, -40}, {22, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(res2.p, n2) annotation(
  Line(points = {{38, -40}, {80, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 60}, {80, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-80, -60}, {80, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end TransmissionLine;

