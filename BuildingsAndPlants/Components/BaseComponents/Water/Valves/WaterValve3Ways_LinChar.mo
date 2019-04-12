within BuildingsAndPlants.Components.BaseComponents.Water.Valves;

model WaterValve3Ways_LinChar
  parameter Real cvmax = 0.01 "kg/s/sqrt(Pa)";
  parameter Time Tc = 1 "positioner TC";
  parameter Real xstart = 0 "initial position";
  WaterValve_LinChar valveLinChar1(cvmax = cvmax, xstart = 1 - xstart, T = Tc) annotation(
  Placement(transformation(extent = {{24, -16}, {58, 16}})));
  Modelica.Blocks.Interfaces.RealInput cmd "0=i->1,1=i->2" annotation(
  Placement(transformation(extent = {{-60, 48}, {-20, 88}}), iconTransformation(extent = {{-60, 48}, {-20, 88}})));
  Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
  Placement(transformation(extent = {{34, 64}, {54, 84}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
  Placement(transformation(extent = {{-16, 78}, {0, 94}})));
  WaterValve_LinChar valveLinChar2(cvmax = cvmax, xstart = xstart, T = Tc) annotation(
  Placement(transformation(extent = {{-46, -52}, {-12, -20}})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-100, -20}, {-80, 0}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{60, -20}, {80, 0}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Interfaces.Water.WaterFlange water_flange3 annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -80}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {0, -80})));
equation
  connect(const.y, add.u1) annotation(
  Line(points = {{0.8, 86}, {16, 86}, {16, 80}, {32, 80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(cmd, add.u2) annotation(
  Line(points = {{-40, 68}, {32, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add.y, valveLinChar1.cmd) annotation(
  Line(points = {{55, 74}, {60, 74}, {60, 34}, {20, 34}, {20, 11.2}, {34.2, 11.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(valveLinChar2.cmd, add.u2) annotation(
  Line(points = {{-35.8, -24.8}, {-48, -24.8}, {-48, 40}, {-10, 40}, {-10, 68}, {32, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(valveLinChar2.water_flange2, water_flange3) annotation(
  Line(points = {{-15.4, -36}, {0, -36}, {0, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valveLinChar1.water_flange2, water_flange2) annotation(
  Line(points = {{54.6, 0}, {62, 0}, {62, -10}, {70, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valveLinChar1.water_flange1, water_flange1) annotation(
  Line(points = {{27.4, 0}, {-60, 0}, {-60, -10}, {-90, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valveLinChar2.water_flange1, water_flange1) annotation(
  Line(points = {{-42.6, -36}, {-60, -36}, {-60, -10}, {-90, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-70, 30}, {-2, 0}, {-70, -32}, {-70, 30}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{70, 30}, {2, 0}, {70, -32}, {70, 30}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid, extent = {{2, -32}, {60, 26}}), Rectangle(extent = {{-2, 62}, {2, -2}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Polygon(points = {{-64, 6}, {-64, -4}, {-42, -4}, {-42, -10}, {-22, 2}, {-42, 12}, {-42, 6}, {-64, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-20, 78}, {20, 62}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Polygon(points = {{-34, 31}, {35, 2.06582e-015}, {-34, -31}, {-34, 31}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid, extent = {{2, -32}, {60, 26}}, origin = {0, -37}, rotation = 90)}));
end WaterValve3Ways_LinChar;
