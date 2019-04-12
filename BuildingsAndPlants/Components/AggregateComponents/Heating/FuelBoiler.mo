within BuildingsAndPlants.Components.AggregateComponents.Heating;
model FuelBoiler
  parameter Real Td = 273.15 + 50 "Desired temperature";
  parameter SI.Volume Vboiler = 0.1 "max contained water volume";
  parameter SI.Volume Vstart = 0.001 "initial water volume";
  parameter SI.Power Qmax = 20000 "Max thermal power of heater";
  Interfaces.Thermal.HeatPort e annotation(
  Placement(transformation(extent = {{-10, 94}, {10, 114}})));
  Modelica.Blocks.Sources.Constant const(k = Td) annotation(
  Placement(transformation(extent = {{22, -72}, {36, -58}})));
  Modelica.Blocks.Math.Feedback f1 annotation(
  Placement(transformation(extent = {{44, -56}, {62, -74}})));
  Modelica.Blocks.Sources.Constant const1(k = Vboiler * 1000) annotation(
  Placement(transformation(extent = {{184, 64}, {170, 78}})));
  Modelica.Blocks.Math.Feedback f2 annotation(
  Placement(transformation(extent = {{156, 62}, {138, 80}})));
  Modelica.Blocks.Logical.Hysteresis win(uLow = 0, uHigh = 1) annotation(
  Placement(transformation(extent = {{124, 64}, {110, 78}})));
  Components.BaseComponents.Water.Tanks.Tank_exchangingWall tank(V = Vboiler, Mm = 20, Vstart = Vstart, pin = 101325) annotation(
  Placement(transformation(extent = {{28, 36}, {-28, -36}}, rotation = 180, origin = {16, 0})));
  Components.BaseComponents.Water.Pumps.WaterPump_Volumetric volumetricPump(qmax(displayUnit = "l/min") = 0.0003) annotation(
  Placement(transformation(extent = {{-6.5, -9.5}, {6.5, 9.5}}, rotation = -90, origin = {-40.5, 50.5})));
  Modelica.Blocks.Sources.Constant const2(k = 1) annotation(
  Placement(transformation(extent = {{96, 82}, {88, 90}})));
  Modelica.Blocks.Logical.Switch switch2 annotation(
  Placement(transformation(extent = {{62, 64}, {48, 78}})));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
  Placement(transformation(extent = {{98, 52}, {90, 60}})));
  Modelica.Blocks.Math.Gain gain(k = 10000) annotation(
  Placement(transformation(extent = {{70, -72}, {84, -58}})));
  Modelica.Blocks.Nonlinear.Limiter gain1(uMax = Qmax, uMin = 0) annotation(
  Placement(transformation(extent = {{96, -72}, {110, -58}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
  Placement(transformation(extent = {{-11, -11}, {11, 11}}, rotation = 90, origin = {185, -57})));
  Modelica.Blocks.Logical.Switch switch1 annotation(
  Placement(transformation(extent = {{144, -82}, {162, -64}})));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation(
  Placement(transformation(extent = {{86, -116}, {100, -102}})));
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{80, -102}, {106, -76}}), iconTransformation(extent = {{-74, 90}, {-54, 110}})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-100, -20}, {-80, 0}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{60, -20}, {80, 0}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Interfaces.Water.WaterFlange water_flange3 annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -80}), iconTransformation(extent = {{-20, -21}, {20, 21}}, rotation = 90, origin = {-1, -74})));
equation
  connect(const.y, f1.u1) annotation(
  Line(points = {{36.7, -65}, {45.8, -65}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f2.y, win.u) annotation(
  Line(points = {{138.9, 71}, {125.4, 71}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f2.u1, const1.y) annotation(
  Line(points = {{154.2, 71}, {169.3, 71}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(win.y, switch2.u2) annotation(
  Line(points = {{109.3, 71}, {63.4, 71}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(const2.y, switch2.u1) annotation(
  Line(points = {{87.6, 86}, {80, 86}, {80, 76.6}, {63.4, 76.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(const3.y, switch2.u3) annotation(
  Line(points = {{89.6, 56}, {82, 56}, {82, 65.4}, {63.4, 65.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, gain1.u) annotation(
  Line(points = {{84.7, -65}, {94.6, -65}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f1.y, gain.u) annotation(
  Line(points = {{61.1, -65}, {68.6, -65}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(e, e) annotation(
  Line(points = {{0, 104}, {0, 104}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.oM, f2.u2) annotation(
  Line(points = {{41.2, 18}, {146, 18}, {146, 38}, {147, 38}, {147, 63.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tank.oT, f1.u2) annotation(
  Line(points = {{41.2, -18}, {52, -18}, {52, -54}, {52, -58}, {52, -57.8}, {53, -57.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(switch2.y, volumetricPump.cmd) annotation(
  Line(points = {{47.3, 71}, {-34.99, 71}, {-34.99, 53.88}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(switch1.y, prescribedHeatFlow.Q_flow) annotation(
  Line(points = {{162.9, -73}, {166, -73}, {166, -68}, {185, -68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain1.y, switch1.u1) annotation(
  Line(points = {{110.7, -65}, {120, -65}, {120, -65.8}, {142.2, -65.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(prescribedHeatFlow.port, tank.fluid) annotation(
  Line(points = {{185, -46}, {186, -46}, {186, -40}, {15.72, -40}, {15.72, -14.4}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(const4.y, switch1.u3) annotation(
  Line(points = {{100.7, -109}, {132, -109}, {132, -80.2}, {142.2, -80.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ON, switch1.u2) annotation(
  Line(points = {{93, -89}, {122, -89}, {122, -73}, {142.2, -73}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(e, tank.wall) annotation(
  Line(points = {{8.88178e-16, 104}, {8.88178e-16, 54}, {-26, 54}, {-26, -18}, {-9.2, -18}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump.water_flange1, water_flange1) annotation(
  Line(points = {{-40.5, 55.7}, {-40.5, 80}, {-60, 80}, {-60, -10}, {-90, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.water_flange2, water_flange2) annotation(
  Line(points = {{38.4, -2.66454e-015}, {54, -2.66454e-015}, {54, -10}, {70, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(water_flange3, volumetricPump.water_flange2) annotation(
  Line(points = {{0, -80}, {-40.5, -80}, {-40.5, 45.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.water_flange1, volumetricPump.water_flange2) annotation(
  Line(points = {{-6.4, 0}, {-40.5, 0}, {-40.5, 45.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -120}, {200, 120}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -120}, {200, 120}}), graphics = {Text(extent = {{-98, -128}, {102, -88}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name"), Rectangle(extent = {{-60, 70}, {60, -50}}, lineColor = {175, 175, 175}, fillPattern = FillPattern.VerticalCylinder, fillColor = {175, 175, 175}), Line(points = {{40, 32}, {-40, 32}, {-40, 22}, {20, 22}, {20, 12}, {-40, 12}, {-40, 2}, {40, 2}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Ellipse(extent = {{-10, -38}, {10, -18}}, lineColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 127}), Text(extent = {{-116, 42}, {-66, 12}}, lineColor = {0, 0, 0}, textString = "IN"), Text(extent = {{26, -56}, {94, -92}}, lineColor = {0, 0, 0}, textString = "RECYCLE"), Text(extent = {{68, 44}, {118, 14}}, lineColor = {0, 0, 0}, textString = "OUT")}));
end FuelBoiler;

