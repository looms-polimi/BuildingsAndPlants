within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.LQ_Rooms;

model LQ
  parameter Real Klq[2, 5] = 1e5 * [9.9993, 0.0004, 0.0000, 0.0001, 0.0003; 0.0001, 0.0000, 0.0004, 9.9993, 0.0003];
  Base_Classes.LQ_Base lQ_Base(K = Klq) annotation(Placement(transformation(extent = {{-142, -70}, {-62, 20}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-30, -64}, {118, 64}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-58, -40}, {-48, -30}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-58, -20}, {-48, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-64, 20}, {-54, 30}})));
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-46, 0}, {-36, 10}})));
  Modelica.Blocks.Sources.Constant Troom1(k = 22) annotation(Placement(transformation(extent = {{-180, -14}, {-160, 6}})));
  Modelica.Blocks.Sources.Constant Troom2(k = 20) annotation(Placement(transformation(extent = {{-180, -44}, {-160, -24}})));
equation
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{10.7, 17.92}, {-18, 17.92}, {-18, 32}, {10.7, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TWall2, lQ_Base.Vc) annotation(Line(points = {{78.78, -32}, {84, -32}, {84, -70}, {-138, -70}, {-138, -56.5}, {-126, -56.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TWall1, lQ_Base.Vb) annotation(Line(points = {{78.78, -19.2}, {92, -19.2}, {92, -74}, {-142, -74}, {-142, -47.5}, {-126, -47.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TinsideWall, lQ_Base.Ve) annotation(Line(points = {{78.78, -6.4}, {100, -6.4}, {100, -80}, {-148, -80}, {-148, -38.5}, {-126, -38.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, lQ_Base.Vd) annotation(Line(points = {{78.78, 19.2}, {92, 19.2}, {92, 52}, {-140, 52}, {-140, -2.5}, {-126, -2.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u1, limiter1.u) annotation(Line(points = {{-77.2, -16}, {-68, -16}, {-68, -15}, {-59, -15}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter1.y, rooms.heater1) annotation(Line(points = {{-47.5, -15}, {-20.75, -15}, {-20.75, -17.92}, {10.7, -17.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter2.y, rooms.heater2) annotation(Line(points = {{-47.5, -35}, {-20.75, -35}, {-20.75, -32}, {10.7, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u2, limiter2.u) annotation(Line(points = {{-77.2, -34}, {-68, -34}, {-68, -35}, {-59, -35}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, lQ_Base.Va) annotation(Line(points = {{78.78, 32}, {84, 32}, {84, 50}, {-136, 50}, {-136, 6.5}, {-126, 6.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-53.5, 25}, {-18, 25}, {-18, 32}, {10.7, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-35.5, 5}, {-18.75, 5}, {-18.75, 0}, {10.7, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom1.y, lQ_Base.Vref1) annotation(Line(points = {{-159, -4}, {-144.5, -4}, {-144.5, -16}, {-126, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom2.y, lQ_Base.Vref2) annotation(Line(points = {{-159, -34}, {-144, -34}, {-144, -25}, {-126, -25}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -100}, {180, 100}}), graphics), Icon(coordinateSystem(extent = {{-180, -100}, {180, 100}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end LQ;
