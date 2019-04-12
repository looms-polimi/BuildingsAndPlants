within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.PI_Rooms;

model IMC_withNoise
  Modelica.Blocks.Sources.Sine Texternal(freqHz = 1 / 86400, phase = -pi / 2, offset = 8, amplitude = 3) annotation(Placement(transformation(extent = {{-32, -6}, {-20, 6}})));
  Controllers.Blocks.Analogue.AWPI_1dof AWPI_analogue1(CSmax = 1000, CSmin = 0, Ti = 5682, K = 27450) annotation(Placement(transformation(extent = {{-82, -4}, {-42, -24}})));
  Controllers.Blocks.Analogue.AWPI_1dof AWPI_analogue2(CSmax = 1000, CSmin = 0, Ti = 8268, K = 38816) annotation(Placement(transformation(extent = {{-82, -50}, {-42, -30}})));
  Modelica.Blocks.Sources.Trapezoid noise1(period = 3600 * 24, rising = 300, falling = 300, startTime = 6e5, width = 720, amplitude = 250) annotation(Placement(transformation(extent = {{-84, 32}, {-72, 44}})));
  Modelica.Blocks.Sources.Trapezoid noise2(period(displayUnit = "h") = 3600 * 24, rising = 300, falling = 300, startTime = 1e6, width = 720, amplitude = 300) annotation(Placement(transformation(extent = {{-84, 4}, {-72, 16}})));
  Modelica.Blocks.Sources.CombiTimeTable Troom(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-164, -44}, {-144, -24}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-6, -60}, {150, 60}})));
equation
  connect(Troom.y[1], AWPI_analogue1.SP) annotation(Line(points = {{-143, -34}, {-112, -34}, {-112, -20}, {-78, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(AWPI_analogue2.SP, AWPI_analogue1.SP) annotation(Line(points = {{-78, -34}, {-112, -34}, {-112, -20}, {-78, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise1.y, rooms.Room1Noise) annotation(Line(points = {{-71.4, 38}, {-18, 38}, {-18, 30}, {36.9, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise2.y, rooms.Room2Noise) annotation(Line(points = {{-71.4, 10}, {-18, 10}, {-18, 16.8}, {36.9, 16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-19.4, 0}, {36.9, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(AWPI_analogue1.CS, rooms.heater1) annotation(Line(points = {{-46, -20}, {-6, -20}, {-6, -16.8}, {36.9, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(AWPI_analogue2.CS, rooms.heater2) annotation(Line(points = {{-46, -34}, {-6, -34}, {-6, -30}, {36.9, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, AWPI_analogue2.PV) annotation(Line(points = {{108.66, 18}, {120, 18}, {120, -80}, {-100, -80}, {-100, -40}, {-78, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, AWPI_analogue1.PV) annotation(Line(points = {{108.66, 30}, {120, 30}, {120, 60}, {-100, 60}, {-100, -14}, {-78, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -100}, {180, 100}}), graphics), Icon(coordinateSystem(extent = {{-180, -100}, {180, 100}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end IMC_withNoise;
