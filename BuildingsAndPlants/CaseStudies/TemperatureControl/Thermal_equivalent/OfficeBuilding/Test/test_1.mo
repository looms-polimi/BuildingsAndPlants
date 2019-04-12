within BuildingsAndPlants.CaseStudies.TemperatureControl.Thermal_equivalent.OfficeBuilding.Test;

model test_1
  Modelica.Blocks.Sources.Constant Noise(k = 0) "Noise due to People and PC inside the room" annotation(Placement(transformation(extent = {{-176, 22}, {-164, 34}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature fixedTemperature annotation(Placement(transformation(extent = {{-208, 70}, {-196, 82}})));
  BaseClasses.OfficeRoom rooom(n1 = 4, n2 = 4, n3 = 4, n4 = 4, nf = 4, nc = 4, Ti = 140, K = -3.5) annotation(Placement(transformation(extent = {{-166, -68}, {-62, 58}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature fixedTemperature1 annotation(Placement(transformation(extent = {{-206, -84}, {-194, -72}})));
  Modelica.Blocks.Sources.Constant T(k = 273.15 + 26) annotation(Placement(transformation(extent = {{-232, -84}, {-220, -72}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca4(gamma = 3.5, S = 25) annotation(Placement(transformation(extent = {{-178, -38}, {-168, -32}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca5(gamma = 3.5, S = 25) annotation(Placement(transformation(extent = {{-158, -38}, {-148, -32}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca3(S = 15, gamma = 3.5) annotation(Placement(transformation(extent = {{-120, -48}, {-110, -42}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca1(S = 15, gamma = 3.5) annotation(Placement(transformation(extent = {{-5, -3}, {5, 3}}, rotation = 90, origin = {-75, -5})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca11(S = 15) annotation(Placement(transformation(extent = {{-5, -3}, {5, 3}}, rotation = 90, origin = {-157, -5})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca12(S = 15) annotation(Placement(transformation(extent = {{-120, 34}, {-110, 40}})));
  Modelica.Blocks.Sources.Trapezoid Temp1(amplitude = -1, width(displayUnit = "h") = 43200, startTime = 86400, rising(displayUnit = "h") = 7200, falling(displayUnit = "h") = 7200, period = 3600 * 24, offset = 24) annotation(Placement(transformation(extent = {{-212, 42}, {-200, 54}})));
  Modelica.Blocks.Sources.Sine Texternal(freqHz = 1 / 86400, phase = -pi / 2, amplitude = 4, offset = 273.15 + 36) annotation(Placement(transformation(extent = {{-234, 70}, {-222, 82}})));
  Modelica.Blocks.Sources.Constant Noise2(k = 0) "Noise due to People and PC inside the room" annotation(Placement(transformation(extent = {{86, 14}, {98, 26}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature fixedTemperature4 annotation(Placement(transformation(extent = {{56, 74}, {68, 86}})));
  Modelica.Blocks.Sources.Constant Text2(k = 273.15 + 36) annotation(Placement(transformation(extent = {{30, 74}, {42, 86}})));
  BaseClasses.OfficeRoom Corridor(n1 = 4, n2 = 4, n3 = 4, n4 = 4, nf = 4, nc = 4, A24 = 20 * 3, Af = 20 * 5, Ac = 20 * 5, Vroom = 20 * 5 * 3, K = -11.2) annotation(Placement(transformation(extent = {{98, -64}, {202, 62}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature fixedTemperature5 annotation(Placement(transformation(extent = {{58, -80}, {70, -68}})));
  Modelica.Blocks.Sources.Constant Tinside2(k = 273.15 + 26) annotation(Placement(transformation(extent = {{32, -80}, {44, -68}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca13(gamma = 3.5, S = 100) annotation(Placement(transformation(extent = {{86, -34}, {96, -28}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca14(gamma = 3.5, S = 100) annotation(Placement(transformation(extent = {{106, -34}, {116, -28}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca15(gamma = 3.5, S = 20 * 3) annotation(Placement(transformation(extent = {{144, -44}, {154, -38}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca16(S = 15, gamma = 5) annotation(Placement(transformation(extent = {{-5, -3}, {5, 3}}, rotation = 90, origin = {191, -3})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca17(S = 15) annotation(Placement(transformation(extent = {{-5, -3}, {5, 3}}, rotation = 90, origin = {107, -1})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca18(gamma = 3.5, S = 20 * 3) annotation(Placement(transformation(extent = {{144, 38}, {154, 44}})));
  Modelica.Blocks.Sources.Trapezoid Temp2(amplitude = -1, width(displayUnit = "h") = 43200, startTime = 86400, rising(displayUnit = "h") = 7200, falling(displayUnit = "h") = 7200, period = 3600 * 24, offset = 24) annotation(Placement(transformation(extent = {{86, 44}, {98, 56}})));
equation
  connect(Noise.y, rooom.Noise) annotation(Line(points = {{-163.4, 28}, {-156, 28}, {-156, 5.5}, {-139.133, 5.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooom.Texternal, fixedTemperature.port) annotation(Line(points = {{-140.433, 16}, {-144, 16}, {-144, 76}, {-196, 76}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(fixedTemperature1.T, T.y) annotation(Line(points = {{-207.2, -78}, {-219.4, -78}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooom.Floor, convSca2Sca4.ss1) annotation(Line(points = {{-122.233, -13.925}, {-130, -13.925}, {-130, -22}, {-173, -22}, {-173, -33.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(rooom.Ceiling, convSca2Sca5.ss1) annotation(Line(points = {{-106.633, -13.925}, {-112, -13.925}, {-112, -28}, {-153, -28}, {-153, -33.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(rooom.Wall1, convSca2Sca11.ss2) annotation(Line(points = {{-140.433, -5}, {-143.217, -5}, {-143.217, -5}, {-155.2, -5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca11.ss1, fixedTemperature.port) annotation(Line(points = {{-158.8, -5}, {-184, -5}, {-184, 76}, {-196, 76}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca12.ss1, fixedTemperature.port) annotation(Line(points = {{-115, 38.8}, {-115, 76}, {-196, 76}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca12.ss2, rooom.Wall2) annotation(Line(points = {{-115, 35.2}, {-115, 32.05}, {-114.217, 32.05}, {-114.217, 27.2875}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca1.ss1, rooom.Wall3) annotation(Line(points = {{-76.8, -5}, {-81.95, -5}, {-81.95, -5}, {-87.5667, -5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(rooom.Wall4, convSca2Sca3.ss1) annotation(Line(points = {{-114.217, -36.7625}, {-114.217, -40.381}, {-115, -40.381}, {-115, -43.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca3.ss2, fixedTemperature1.port) annotation(Line(points = {{-115, -46.8}, {-115, -78}, {-194, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca5.ss2, fixedTemperature1.port) annotation(Line(points = {{-153, -36.8}, {-153, -78}, {-194, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca4.ss2, fixedTemperature1.port) annotation(Line(points = {{-173, -36.8}, {-173, -78}, {-194, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca1.ss2, fixedTemperature1.port) annotation(Line(points = {{-73.2, -5}, {-68, -5}, {-68, -78}, {-194, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Temp1.y, rooom.DesiredTemperature) annotation(Line(points = {{-199.4, 48}, {-178, 48}, {-178, 52}, {-150, 52}, {-150, 9.7}, {-139.133, 9.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fixedTemperature.T, Texternal.y) annotation(Line(points = {{-209.2, 76}, {-221.4, 76}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fixedTemperature4.T, Text2.y) annotation(Line(points = {{54.8, 80}, {42.6, 80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Noise2.y, Corridor.Noise) annotation(Line(points = {{98.6, 20}, {108, 20}, {108, 9.5}, {124.867, 9.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Corridor.Texternal, fixedTemperature4.port) annotation(Line(points = {{123.567, 20}, {120, 20}, {120, 80}, {68, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(fixedTemperature5.T, Tinside2.y) annotation(Line(points = {{56.8, -74}, {44.6, -74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Corridor.Floor, convSca2Sca13.ss1) annotation(Line(points = {{141.767, -9.925}, {134, -9.925}, {134, -18}, {91, -18}, {91, -29.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Corridor.Ceiling, convSca2Sca14.ss1) annotation(Line(points = {{157.367, -9.925}, {152, -9.925}, {152, -24}, {111, -24}, {111, -29.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Corridor.Wall1, convSca2Sca17.ss2) annotation(Line(points = {{123.567, -1}, {120.783, -1}, {120.783, -1}, {108.8, -1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca17.ss1, fixedTemperature4.port) annotation(Line(points = {{105.2, -1}, {80, -1}, {80, 80}, {68, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca18.ss2, Corridor.Wall2) annotation(Line(points = {{149, 39.2}, {149, 36.05}, {149.783, 36.05}, {149.783, 31.2875}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca16.ss1, Corridor.Wall3) annotation(Line(points = {{189.2, -3}, {182.05, -3}, {182.05, -1}, {176.433, -1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Corridor.Wall4, convSca2Sca15.ss1) annotation(Line(points = {{149.783, -32.7625}, {149.783, -36.381}, {149, -36.381}, {149, -39.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca15.ss2, fixedTemperature5.port) annotation(Line(points = {{149, -42.8}, {149, -74}, {70, -74}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca14.ss2, fixedTemperature5.port) annotation(Line(points = {{111, -32.8}, {111, -74}, {70, -74}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca13.ss2, fixedTemperature5.port) annotation(Line(points = {{91, -32.8}, {91, -74}, {70, -74}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca16.ss2, fixedTemperature4.port) annotation(Line(points = {{192.8, -3}, {204, -3}, {204, 80}, {68, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca18.ss1, fixedTemperature5.port) annotation(Line(points = {{149, 42.8}, {149, 50}, {228, 50}, {228, -74}, {70, -74}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Temp2.y, Corridor.DesiredTemperature) annotation(Line(points = {{98.6, 50}, {114, 50}, {114, 13.7}, {124.867, 13.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-260, -100}, {260, 100}}), graphics), Icon(coordinateSystem(extent = {{-260, -100}, {260, 100}})));
end test_1;
