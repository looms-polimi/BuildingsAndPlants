within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.LQ_Rooms;

model LQ_withNoise
  parameter Real Klq[2, 5] = 1e5 * [9.9993, 0.0004, 0.0000, 0.0001, 0.0003; 0.0001, 0.0000, 0.0004, 9.9993, 0.0003];
  Base_Classes.LQ_Base lQ_Base(K = Klq) annotation(Placement(transformation(extent = {{-142, -70}, {-62, 20}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-30, -64}, {118, 64}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-58, -40}, {-48, -30}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-58, -20}, {-48, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Troom(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-178, -30}, {-158, -10}})));
  Modelica.Blocks.Sources.Sine Texternal(freqHz = 1 / 86400, phase = -pi / 2, offset = 8, amplitude = 3) annotation(Placement(transformation(extent = {{-50, -2}, {-38, 10}})));
  Modelica.Blocks.Sources.Trapezoid noise(period = 3600 * 24, rising = 300, falling = 300, startTime = 6e5, width = 720, amplitude = 250) annotation(Placement(transformation(extent = {{-50, 28}, {-38, 40}})));
  Modelica.Blocks.Sources.Trapezoid noise1(period(displayUnit = "h") = 3600 * 24, rising = 300, falling = 300, startTime = 1e6, width = 720, amplitude = 300) annotation(Placement(transformation(extent = {{-70, 14}, {-58, 26}})));
equation
  connect(rooms.TWall2, lQ_Base.Vc) annotation(Line(points = {{78.78, -32}, {84, -32}, {84, -70}, {-138, -70}, {-138, -56.5}, {-126, -56.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TWall1, lQ_Base.Vb) annotation(Line(points = {{78.78, -19.2}, {92, -19.2}, {92, -74}, {-142, -74}, {-142, -47.5}, {-126, -47.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TinsideWall, lQ_Base.Ve) annotation(Line(points = {{78.78, -6.4}, {100, -6.4}, {100, -80}, {-148, -80}, {-148, -38.5}, {-126, -38.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, lQ_Base.Vd) annotation(Line(points = {{78.78, 19.2}, {92, 19.2}, {92, 52}, {-140, 52}, {-140, -2.5}, {-126, -2.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u1, limiter1.u) annotation(Line(points = {{-77.2, -16}, {-68, -16}, {-68, -15}, {-59, -15}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter1.y, rooms.heater1) annotation(Line(points = {{-47.5, -15}, {-20.75, -15}, {-20.75, -17.92}, {10.7, -17.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter2.y, rooms.heater2) annotation(Line(points = {{-47.5, -35}, {-20.75, -35}, {-20.75, -32}, {10.7, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u2, limiter2.u) annotation(Line(points = {{-77.2, -34}, {-68, -34}, {-68, -35}, {-59, -35}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, lQ_Base.Va) annotation(Line(points = {{78.78, 32}, {84, 32}, {84, 50}, {-136, 50}, {-136, 6.5}, {-126, 6.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom.y[1], lQ_Base.Vref1) annotation(Line(points = {{-157, -20}, {-144, -20}, {-144, -16}, {-126, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.Vref2, lQ_Base.Vref1) annotation(Line(points = {{-126, -25}, {-144, -25}, {-144, -16}, {-126, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-37.4, 4}, {-20, 4}, {-20, 0}, {10.7, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-37.4, 34}, {-20, 34}, {-20, 32}, {10.7, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise1.y, rooms.Room2Noise) annotation(Line(points = {{-57.4, 20}, {-20, 20}, {-20, 17.92}, {10.7, 17.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -100}, {180, 100}}), graphics), Icon(coordinateSystem(extent = {{-180, -100}, {180, 100}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end LQ_withNoise;
