within BuildingsAndPlants.Appliances.Accessories;
model MicrowaveOven
  parameter Real T(min = 100, max = 250) = 200 "?C Cooking temperature";
  parameter SI.Power Pnom = 1600 "Nominal power consumption";
  parameter SI.Voltage Vnom = 220 "Nominal voltage";
  parameter SI.Volume Vo = 0.2 "Oven internal volume";
  SI.ThermalConductance G;
  SI.Temp_K Ta;
  SI.Temp_K Tae;
  Real Eel "Electrical consumption";
  Modelica.Blocks.Interfaces.BooleanInput open annotation(
  Placement(transformation(extent = {{-120, 10}, {-80, 50}})));
  Modelica.Blocks.Interfaces.BooleanInput on annotation(
  Placement(transformation(extent = {{-120, -30}, {-80, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
  Placement(transformation(extent = {{-68, 52}, {-52, 68}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow = -10, uHigh = 10) annotation(
  Placement(transformation(extent = {{-42, 54}, {-30, 66}})));
  Modelica.Blocks.Logical.And and1 annotation(
  Placement(transformation(extent = {{-12, 44}, {0, 56}})));
  Modelica.Blocks.Logical.And and2 annotation(
  Placement(transformation(extent = {{22, 44}, {34, 56}})));
  Modelica.Blocks.Logical.Not not1 annotation(
  Placement(transformation(extent = {{-42, 24}, {-30, 36}})));
  Modelica.Blocks.Sources.Constant const(k = T) annotation(
  Placement(transformation(extent = {{-92, 54}, {-80, 66}})));
  Interfaces.Thermal.HeatPort e annotation(
  Placement(transformation(extent = {{-10, 80}, {10, 100}}), iconTransformation(extent = {{-20, 54}, {22, 90}})));
  Modelica.Electrical.Analog.Basic.HeatingResistor heatingResistor(R_ref = Vnom ^ 2 / Pnom, useHeatPort = false) annotation(
  Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {56, 14})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {56, -22})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{76, 30}, {110, 64}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{110, -64}, {76, -30}})));
equation
  G = if open then 1000 else 0.5;
  feedback.u2 = Ta - 273.15;
  1008 * Vo * der(Ta) = heatingResistor.LossPower + e.Q_flow;
  e.Q_flow = 10 * (e.T - Tae);
  e.Q_flow = G * (Tae - Ta);
  der(Eel) = (p.v - n.v) * p.i / 1000 / 3600;
  connect(const.y, feedback.u1) annotation(
  Line(points = {{-79.4, 60}, {-66.4, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(feedback.y, hysteresis.u) annotation(
  Line(points = {{-52.8, 60}, {-43.2, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(hysteresis.y, and1.u1) annotation(
  Line(points = {{-29.4, 60}, {-24, 60}, {-24, 50}, {-13.2, 50}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(not1.y, and1.u2) annotation(
  Line(points = {{-29.4, 30}, {-26, 30}, {-26, 45.2}, {-13.2, 45.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(open, not1.u) annotation(
  Line(points = {{-100, 30}, {-43.2, 30}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(and1.y, and2.u1) annotation(
  Line(points = {{0.6, 50}, {20.8, 50}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(and2.u2, on) annotation(
  Line(points = {{20.8, 45.2}, {6, 45.2}, {6, -10}, {-100, -10}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(heatingResistor.n, idealClosingSwitch.p) annotation(
  Line(points = {{56, -1.77636e-015}, {56, -12}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(and2.y, idealClosingSwitch.control) annotation(
  Line(points = {{34.6, 50}, {38, 50}, {38, -22}, {49, -22}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(heatingResistor.p, p) annotation(
  Line(points = {{56, 28}, {56, 47}, {93, 47}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.n, n) annotation(
  Line(points = {{56, -32}, {56, -47}, {93, -47}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-100, -100}, {100, -60}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name"), Rectangle(extent = {{-82, 54}, {76, -62}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Solid), Rectangle(extent = {{52, 38}, {70, 18}}, lineColor = {215, 215, 215}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder), Ellipse(extent = {{54, -40}, {66, -28}}, lineColor = {215, 215, 215}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{54, -22}, {66, -10}}, lineColor = {215, 215, 215}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{54, -4}, {66, 8}}, lineColor = {215, 215, 215}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-66, 38}, {46, -44}}, lineColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {170, 255, 255})}));
end MicrowaveOven;

