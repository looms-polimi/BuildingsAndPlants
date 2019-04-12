within BuildingsAndPlants.Components.AggregateComponents.Heating;
model RoomHeater
  parameter Integer nLumps = 2 "number of lumps";
  parameter SI.Length Ltube = 30 "tube length";
  parameter SI.Length Dtube = 0.05 "tube inner diameter";
  parameter SI.Length Dz = 0 "height diff (out-in)";
  parameter Real Cftube = 1e-6 "tube friction coefficient";
  parameter SI.Mass Mmetal = 10 "metal mass";
  parameter SI.SpecificHeatCapacity cpMetal = 500 "metal specific heat";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial metal and fluid temp";
  parameter SI.Area STube = pi * Dtube * Ltube "total surf, both sides";
  parameter SI.CoefficientOfHeatTransfer gammaTubeMetal = 5 "heat transfer coefficient";
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{80, -18}, {100, 22}}), iconTransformation(extent = {{80, -18}, {100, 22}})));
  BaseComponents.Thermal.Capacities.MassT massT(Tstart = Tstart, M = Mmetal, cp = cpMetal) annotation(
  Placement(transformation(extent = {{46, 66}, {80, 102}})));
  BaseComponents.Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN(n = nLumps, Ltube = Ltube, Dtube = Dtube, Dz = Dz, Cftube = Cftube, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-45, -32}, {45, 32}}, rotation = -90, origin = {-36, 1})));
  BaseComponents.Thermal.HeatTransfer.Convection_SV convVec2Sca1(n = nLumps, S = STube, gamma = gammaTubeMetal) annotation(
  Placement(transformation(extent = {{-43, -18}, {43, 18}}, rotation = -90, origin = {26, 3})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
equation
  connect(pipeExchangingN.heatPort, convVec2Sca1.vs) annotation(
  Line(points = {{-20, 0.55}, {-4.24, 0.55}, {-4.24, 3}, {15.2, 3}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convVec2Sca1.ss, heatPort) annotation(
  Line(points = {{36.8, 3}, {61.4, 3}, {61.4, 2}, {90, 2}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(massT.surf, heatPort) annotation(
  Line(points = {{63, 69.6}, {63, 2}, {90, 2}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(water_flange1, pipeExchangingN.water_flange1) annotation(
  Line(points = {{-80, 60}, {-36, 60}, {-36, 37}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange2, water_flange2) annotation(
  Line(points = {{-36, -35}, {-36, -60}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, -56}, {84, -64}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-70, 64}, {84, 56}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-22, 80}, {-10, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-4, 80}, {8, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{14, 80}, {26, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{32, 80}, {44, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{50, 80}, {62, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{68, 80}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Sphere)}));
end RoomHeater;

