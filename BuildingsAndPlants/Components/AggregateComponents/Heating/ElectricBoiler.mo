within BuildingsAndPlants.Components.AggregateComponents.Heating;
model ElectricBoiler
  parameter SI.Power Pnom = 500 "Nominal power consumption";
  parameter SI.Voltage Vnom = 220 "Nominal voltage";
  parameter Real Td = 273.15 + 50 "Desired temperature";
  parameter SI.Volume Vboiler = 0.1 "max contained water volume";
  parameter SI.Volume Vstart = 0.001 "initial water volume";
  Real Ec "Energy consuption in kWh";
  Interfaces.Thermal.HeatPort e annotation(
  Placement(transformation(extent = {{-10, 80}, {10, 100}})));
  Modelica.Blocks.Sources.Constant const(k = Td) annotation(
  Placement(transformation(extent = {{-112, -100}, {-98, -86}})));
  Modelica.Blocks.Math.Feedback f1 annotation(
  Placement(transformation(extent = {{-84, -102}, {-66, -84}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow = -1, uHigh = 1) annotation(
  Placement(transformation(extent = {{-48, -100}, {-34, -86}})));
  Modelica.Blocks.Sources.Constant const1(k = Vboiler * 1000) annotation(
  Placement(transformation(extent = {{-10, 14}, {-24, 28}})));
  Modelica.Blocks.Math.Feedback f2 annotation(
  Placement(transformation(extent = {{-32, 12}, {-50, 30}})));
  Modelica.Blocks.Logical.Hysteresis win(uLow = 0, uHigh = 1) annotation(
  Placement(transformation(extent = {{-60, 14}, {-74, 28}})));
  Modelica.Electrical.Analog.Basic.HeatingResistor heatingResistor(R_ref = Vnom ^ 2 / Pnom, useHeatPort = true) annotation(
  Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {60, 18})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {60, -18})));
  Components.BaseComponents.Water.Tanks.Tank_exchangingWall tank(V = Vboiler, Mm = 20, Vstart = Vstart, pin = 101325) annotation(
  Placement(transformation(extent = {{27, 36}, {-27, -36}}, rotation = 180, origin = {-137, -60})));
  Components.BaseComponents.Water.Pumps.WaterPump_Volumetric volumetricPump(qmax(displayUnit = "l/min") = 0.0003) annotation(
  Placement(transformation(extent = {{-6.5, -9.5}, {6.5, 9.5}}, rotation = -90, origin = {-180.5, 0.5})));
  Modelica.Blocks.Sources.Constant const2(k = 1) annotation(
  Placement(transformation(extent = {{-84, 36}, {-92, 44}})));
  Modelica.Blocks.Logical.Switch switch2 annotation(
  Placement(transformation(extent = {{-104, 14}, {-118, 28}})));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
  Placement(transformation(extent = {{-86, -4}, {-94, 4}})));
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{-60, -124}, {-36, -100}}), iconTransformation(extent = {{-80, 90}, {-62, 108}})));
  Modelica.Blocks.Logical.And and1 annotation(
  Placement(transformation(extent = {{-8, -106}, {12, -86}})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{76, 30}, {110, 64}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{110, -64}, {76, -30}})));
equation
  der(Ec) = (p.v - n.v) * p.i / (3600 * 1000);
  connect(const.y, f1.u1) annotation(
  Line(points = {{-97.3, -93}, {-82.2, -93}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f1.y, hysteresis.u) annotation(
  Line(points = {{-66.9, -93}, {-49.4, -93}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f2.y, win.u) annotation(
  Line(points = {{-49.1, 21}, {-58.6, 21}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f2.u1, const1.y) annotation(
  Line(points = {{-33.8, 21}, {-24.7, 21}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(win.y, switch2.u2) annotation(
  Line(points = {{-74.7, 21}, {-102.6, 21}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(switch2.y, volumetricPump.cmd) annotation(
  Line(points = {{-118.7, 21}, {-174.99, 21}, {-174.99, 3.88}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tank.oM, f2.u2) annotation(
  Line(points = {{-112.7, -42}, {-170, -42}, {-170, -14}, {-41, -14}, {-41, 13.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(const2.y, switch2.u1) annotation(
  Line(points = {{-92.4, 40}, {-98, 40}, {-98, 26.6}, {-102.6, 26.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(const3.y, switch2.u3) annotation(
  Line(points = {{-94.4, 0}, {-98, 0}, {-98, 15.4}, {-102.6, 15.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tank.wall, e) annotation(
  Line(points = {{-161.3, -78}, {2, -78}, {2, 40}, {38, 40}, {38, 90}, {0, 90}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(heatingResistor.heatPort, tank.fluid) annotation(
  Line(points = {{46, 18}, {20, 18}, {20, -74}, {-137.27, -74}, {-137.27, -74.4}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(tank.oT, f1.u2) annotation(
  Line(points = {{-112.7, -78}, {-170, -78}, {-170, -110}, {-75, -110}, {-75, -100.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heatingResistor.n, idealClosingSwitch.p) annotation(
  Line(points = {{60, 4}, {60, -8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(hysteresis.y, and1.u1) annotation(
  Line(points = {{-33.3, -93}, {-22, -93}, {-22, -96}, {-10, -96}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(ON, and1.u2) annotation(
  Line(points = {{-48, -112}, {-22, -112}, {-22, -104}, {-10, -104}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(and1.y, idealClosingSwitch.control) annotation(
  Line(points = {{13, -96}, {34, -96}, {34, -18}, {53, -18}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(volumetricPump.water_flange1, water_flange1) annotation(
  Line(points = {{-180.5, 5.7}, {-180, 5.7}, {-180, 60}, {-80, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.water_flange1, volumetricPump.water_flange2) annotation(
  Line(points = {{-158.6, -60}, {-180.5, -60}, {-180.5, -4.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.water_flange2, water_flange2) annotation(
  Line(points = {{-115.4, -60}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(heatingResistor.p, p) annotation(
  Line(points = {{60, 32}, {60, 46}, {93, 46}, {93, 47}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.n, n) annotation(
  Line(points = {{60, -28}, {60, -47}, {93, -47}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -120}, {200, 120}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -120}, {200, 120}}), graphics = {Text(extent = {{-68, -98}, {68, -66}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%ElectricBoiler"), Rectangle(extent = {{-60, 70}, {60, -50}}, lineColor = {175, 175, 175}, fillPattern = FillPattern.VerticalCylinder, fillColor = {175, 175, 175}), Line(points = {{40, 32}, {-40, 32}, {-40, 22}, {20, 22}, {20, 12}, {-40, 12}, {-40, 2}, {40, 2}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Ellipse(extent = {{-10, -38}, {10, -18}}, lineColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 127})}));
end ElectricBoiler;

