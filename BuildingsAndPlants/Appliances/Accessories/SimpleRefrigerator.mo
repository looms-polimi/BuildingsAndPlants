within BuildingsAndPlants.Appliances.Accessories;
model SimpleRefrigerator
  parameter SI.Power Pnom = 90 "Compressor power";
  parameter SI.Voltage Vnom = 220 "Nominal voltage";
  parameter SI.Volume Vi = 0.3 "Refrigerator internal capacity";
  parameter Real Td(min = 2, max = 6) = 4 "?C Desired refrigerator temperature";
  Real Eel "Electrical consumption";
  BaseClasses.Refrigerator_powers Powers annotation(
  Placement(transformation(extent = {{-44, -48}, {36, 52}})));
  Interfaces.Thermal.HeatPort ef annotation(
  Placement(transformation(extent = {{-60, 80}, {-40, 100}})));
  Interfaces.Thermal.HeatPort er annotation(
  Placement(transformation(extent = {{40, 80}, {60, 100}})));
  Modelica.Blocks.Interfaces.BooleanInput open annotation(
  Placement(transformation(extent = {{-120, 20}, {-80, 60}})));
  Modelica.Blocks.Interfaces.BooleanInput on annotation(
  Placement(transformation(extent = {{-120, -60}, {-80, -20}})));
  Modelica.Blocks.Logical.And and1 annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-28, -72})));
  Modelica.Blocks.Math.Feedback feedback annotation(
  Placement(transformation(extent = {{52, -82}, {32, -102}})));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
  Placement(transformation(extent = {{24, -98}, {12, -86}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow = -1, uHigh = 1) annotation(
  Placement(transformation(extent = {{2, -98}, {-10, -86}})));
  Modelica.Blocks.Sources.Constant const(k = Td) annotation(
  Placement(transformation(extent = {{98, -98}, {86, -86}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin annotation(
  Placement(transformation(extent = {{74, -98}, {62, -86}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{76, 30}, {110, 64}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{110, -64}, {76, -30}})));
equation
  der(Eel) = (p.v - n.v) * p.i / 1000 / 3600;
  connect(ef, Powers.ef) annotation(
  Line(points = {{-50, 90}, {-50, 68}, {-16, 68}, {-16, 47}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(er, Powers.er) annotation(
  Line(points = {{50, 90}, {50, 68}, {16, 68}, {16, 47}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(open, Powers.open) annotation(
  Line(points = {{-100, 40}, {-60, 40}, {-60, 2}, {-41.6, 2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(on, and1.u1) annotation(
  Line(points = {{-100, -40}, {-60, -40}, {-60, -96}, {-28, -96}, {-28, -84}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(and1.y, Powers.ON) annotation(
  Line(points = {{-28, -61}, {-28, -48}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(and1.u2, hysteresis.y) annotation(
  Line(points = {{-20, -84}, {-20, -92}, {-10.6, -92}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(gain.y, hysteresis.u) annotation(
  Line(points = {{11.4, -92}, {3.2, -92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.u, feedback.y) annotation(
  Line(points = {{25.2, -92}, {33, -92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Powers.T, feedback.u2) annotation(
  Line(points = {{20, -47}, {20, -70}, {42, -70}, {42, -84}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(feedback.u1, toKelvin.Kelvin) annotation(
  Line(points = {{50, -92}, {61.4, -92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(toKelvin.Celsius, const.y) annotation(
  Line(points = {{75.2, -92}, {85.4, -92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Powers.p, p) annotation(
  Line(points = {{33.2, 25.5}, {60, 25.5}, {60, 47}, {93, 47}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Powers.n, n) annotation(
  Line(points = {{33.2, -21.5}, {60, -21.5}, {60, -47}, {93, -47}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.VerticalCylinder, fillColor = {255, 255, 255}), Line(points = {{0, 30}, {0, -10}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-18, 20}, {18, 0}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-18, 0}, {18, 20}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Polygon(points = {{56, 48}, {48, 48}, {48, 8}, {56, 8}, {56, 48}}, lineColor = {0, 0, 255}, smooth = Smooth.Bezier, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-96, -74}, {104, -34}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name")}));
end SimpleRefrigerator;

