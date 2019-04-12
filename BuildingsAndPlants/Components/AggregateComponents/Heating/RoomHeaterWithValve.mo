within BuildingsAndPlants.Components.AggregateComponents.Heating;
model RoomHeaterWithValve
  parameter Integer nLumps = 2 "number of lumps";
  parameter SI.Length Ltube = 30 "tube length";
  parameter SI.Length Dtube = 0.05 "tube inner diameter";
  parameter SI.Length Dz = 0 "height diff (out-in)";
  parameter Real Cftube = 1e-6 "tube friction coefficient";
  parameter SI.Mass Mmetal = 10;
  parameter SI.SpecificHeatCapacity cpMetal = 500;
  parameter SI.Temperature Tstart = 273.15 + 25 "initial metal and fluid temp";
  parameter Real cvmaxValve = 0.01 "kg/s/sqrt(Pa)";
  parameter SI.Time TpValve = 1 "positioner TC";
  parameter SI.CoefficientOfHeatTransfer gammaTubeMetal = 5 "heat transfer coefficient";
  parameter SI.Area STube = pi * Dtube * Ltube "total surf, both sides";
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{84, -20}, {100, 20}}), iconTransformation(extent = {{80, -20}, {100, 20}})));
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
  Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = -90, origin = {-70, 90}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-50, 90})));
  RoomHeater roomHeater(nLumps = nLumps, Ltube = Ltube, Dtube = Dtube, Dz = Dz, Cftube = Cftube, Mmetal = Mmetal, cpMetal = cpMetal, Tstart = Tstart, STube = STube, gammaTubeMetal = gammaTubeMetal) annotation(
  Placement(transformation(extent = {{-6, -36}, {56, 34}})));
  BaseComponents.Water.Valves.WaterValve3Ways_LinChar valve3WaysLinChar annotation(
  Placement(transformation(extent = {{-48, 46}, {-20, 74}})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
equation
  connect(roomHeater.heatPort, heatPort) annotation(
  Line(points = {{52.9, -0.3}, {70.45, -0.3}, {70.45, 0}, {92, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(cmd, valve3WaysLinChar.cmd) annotation(
  Line(points = {{-70, 90}, {-70, 69.52}, {-39.6, 69.52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(valve3WaysLinChar.water_flange1, water_flange1) annotation(
  Line(points = {{-45.2, 60}, {-80, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valve3WaysLinChar.water_flange3, roomHeater.water_flange1) annotation(
  Line(points = {{-34, 48.8}, {-34, 20}, {0.2, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valve3WaysLinChar.water_flange2, water_flange2) annotation(
  Line(points = {{-22.8, 60}, {-12, 60}, {-12, -60}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(roomHeater.water_flange2, water_flange2) annotation(
  Line(points = {{0.51, -22}, {-32, -22}, {-32, -60}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, -56}, {84, -64}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-70, 64}, {84, 56}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-22, 80}, {-10, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-4, 80}, {8, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{14, 80}, {26, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{32, 80}, {44, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{50, 80}, {62, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{68, 80}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{-60, 70}, {-40, 50}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-60, 80}, {-40, 70}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-52, 50}, {-48, -56}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.VerticalCylinder)}));
end RoomHeaterWithValve;

