within BuildingsAndPlants.Components.AggregateComponents.Heating;
model WaterCoilWithWall
  parameter Integer nLumps = 2 "number of lumps";
  parameter SI.Length Ltube = 30 "tube length";
  parameter SI.Length Dtube = 0.05 "tube inner diameter";
  parameter SI.Length Dz = 0 "height diff (out-in)";
  parameter Real Cftube = 1e-6 "tube friction coefficient";
  parameter SI.CoefficientOfHeatTransfer gammaTubeMetal = 5 "heat transfer coefficient";
  parameter SI.Mass Mmetal = 10 "metal mass";
  parameter SI.SpecificHeatCapacity cpMetal = 500 "metal specific heat";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial metal and fluid temp";
  parameter SI.CoefficientOfHeatTransfer gammaMetalExternal = 5 "heat transfer coefficient";
  parameter SI.Area STube = pi * Dtube * Ltube "total surf tube";
  BaseComponents.Thermal.HeatTransfer.Convection_SV convVec2Sca(n = nLumps, gamma = gammaTubeMetal, S = STube) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {-20, 0})));
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{80, -20}, {100, 20}}), iconTransformation(extent = {{70, -60}, {100, 60}})));
  BaseComponents.Thermal.Capacities.MassT massT(Tstart = Tstart, M = Mmetal, cp = cpMetal) annotation(
  Placement(transformation(extent = {{-10, 60}, {30, 100}})));
  BaseComponents.Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN(n = nLumps, Ltube = Ltube, Dtube = Dtube, Dz = Dz, Cftube = Cftube, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {-60, 0})));
  BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca(S = STube, gamma = gammaMetalExternal) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {40, 0})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
equation
  connect(convVec2Sca.ss, convSca2Sca.ss1) annotation(
  Line(points = {{-8, -1.9984e-15}, {28, -1.9984e-15}, {28, 1.77636e-15}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca.ss2, heatPort) annotation(
  Line(points = {{52, 8.88178e-16}, {90, 8.88178e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(massT.surf, convSca2Sca.ss1) annotation(
  Line(points = {{10, 64}, {10, 0}, {28, -1.9984e-15}, {28, 1.77636e-15}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.heatPort, convVec2Sca.vs) annotation(
  Line(points = {{-50, -0.2}, {-44, -0.2}, {-44, 2.22045e-15}, {-32, 2.22045e-15}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange1, water_flange1) annotation(
  Line(points = {{-60, 16}, {-60, 16}, {-80, 16}, {-80, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange2, water_flange2) annotation(
  Line(points = {{-60, -16}, {-60, -16}, {-78, -16}, {-78, -16}, {-80, -16}, {-80, -60}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-30, 10}, {-10, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{-30, -20}, {-10, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Polygon(points = {{-20, 40}, {-20, 20}, {62, 50}, {60, 70}, {-20, 40}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Ellipse(extent = {{-30, 40}, {-10, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{50, 70}, {70, 50}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-66, 70}, {60, 50}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-20, 10}, {-20, -10}, {62, 20}, {60, 40}, {-20, 10}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Polygon(points = {{-20, -20}, {-20, -40}, {62, -10}, {60, 10}, {-20, -20}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Polygon(points = {{-20, -50}, {-20, -70}, {62, -40}, {60, -20}, {-20, -50}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Ellipse(extent = {{50, 40}, {70, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{50, 10}, {70, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{50, -20}, {70, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{50, -50}, {70, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-20, 40}, {60, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-20, 10}, {60, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-20, -20}, {60, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-76, -50}, {-22, -70}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {100, 100, 100}), Ellipse(extent = {{-30, -50}, {-10, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-22, -50}, {58, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder)}));
end WaterCoilWithWall;

