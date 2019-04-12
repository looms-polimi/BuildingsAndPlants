within BuildingsAndPlants.Components.AggregateComponents.Electrical;
model GenericOnOffDCload
  parameter SI.Power Pnom = 500 "Nominal power consumption";
  parameter Real D(min = 0, max = 100) = 20 "% Power dissipation";
  parameter SI.Voltage Vnom = 220 "Nominal voltage";
  Real Ec "Energy consumption";
  Interfaces.Thermal.HeatPort e annotation(
  Placement(transformation(extent = {{-10, 80}, {10, 100}})));
  Modelica.Blocks.Interfaces.BooleanInput on annotation(
  Placement(transformation(extent = {{-124, -20}, {-84, 20}})));
  Modelica.Electrical.Analog.Basic.HeatingResistor heatingResistor(R_ref = Vnom ^ 2 / Pnom, useHeatPort = false) annotation(
  Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {54, 12})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {54, -24})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{76, 30}, {110, 64}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{110, -64}, {76, -30}})));
equation
  e.Q_flow = -heatingResistor.LossPower * D / 100;
  der(Ec) = (p.v - n.v) * p.i / (1000 * 3600);
  connect(on, idealClosingSwitch.control) annotation(
  Line(points = {{-104, 0}, {0, 0}, {0, -24}, {47, -24}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(heatingResistor.n, idealClosingSwitch.p) annotation(
  Line(points = {{54, -2}, {54, -14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(heatingResistor.p, p) annotation(
  Line(points = {{54, 26}, {54, 47}, {93, 47}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.n, n) annotation(
  Line(points = {{54, -34}, {54, -47}, {93, -47}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Rectangle(extent = {{60, 70}, {-60, -50}}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-10, 30}, {10, -30}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}, origin = {0, -14}, rotation = 90), Polygon(points = {{-6, 48}, {0, 56}, {6, 48}, {-6, 48}}, lineColor = {127, 0, 0}, smooth = Smooth.None, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -60}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name"), Line(points = {{0, 48}, {0, 42}, {-6, 34}, {0, 26}, {6, 18}, {0, 10}, {-6, 2}, {0, -6}, {0, -14}}, color = {127, 0, 0}, smooth = Smooth.Bezier)}));
end GenericOnOffDCload;

