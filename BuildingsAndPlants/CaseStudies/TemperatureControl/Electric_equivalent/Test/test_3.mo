within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.Test;

model test_3
  parameter Real Klq[2, 5] = 1e5 * [9.9993, 0.0004, 0.0000, 0.0001, 0.0003; 0.0001, 0.0000, 0.0004, 9.9993, 0.0003];
  Real Ec(start = 0) "Total energy consuption with IMC";
  Real Ec1(start = 0) "Total energy consuption with LQ";
  Modelica.Blocks.Sources.Sine Texternal(freqHz = 1 / 86400, phase = -pi / 2, offset = 8, amplitude = 3) annotation(Placement(transformation(extent = {{-32, 94}, {-20, 106}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue(CSmax = 1000, CSmin = 0, Ti = 5682, K = 27450) annotation(Placement(transformation(extent = {{-82, 96}, {-42, 76}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue1(CSmax = 1000, CSmin = 0, Ti = 8268, K = 38816) annotation(Placement(transformation(extent = {{-82, 50}, {-42, 70}})));
  Modelica.Blocks.Sources.Trapezoid noise(period = 3600 * 24, rising = 300, falling = 300, startTime = 6e5, width = 720, amplitude = 250) annotation(Placement(transformation(extent = {{-84, 132}, {-72, 144}})));
  Modelica.Blocks.Sources.Trapezoid noise1(period(displayUnit = "h") = 3600 * 24, rising = 300, falling = 300, startTime = 1e6, width = 720, amplitude = 300) annotation(Placement(transformation(extent = {{-84, 104}, {-72, 116}})));
  Modelica.Blocks.Sources.CombiTimeTable Troom(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-164, 56}, {-144, 76}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-6, 40}, {150, 160}})));
  LQ_Rooms.Base_Classes.LQ_Base lQ_Base(K = Klq) annotation(Placement(transformation(extent = {{-120, -152}, {-40, -62}})));
  Rooms.RoomsElectrical rooms1(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-8, -146}, {140, -18}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-36, -122}, {-26, -112}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-36, -102}, {-26, -92}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Troom1(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-156, -112}, {-136, -92}})));
  Modelica.Blocks.Sources.Sine Texternal1(freqHz = 1 / 86400, phase = -pi / 2, offset = 8, amplitude = 3) annotation(Placement(transformation(extent = {{-28, -84}, {-16, -72}})));
  Modelica.Blocks.Sources.Trapezoid noise2(period = 3600 * 24, rising = 300, falling = 300, startTime = 6e5, width = 720, amplitude = 250) annotation(Placement(transformation(extent = {{-28, -54}, {-16, -42}})));
  Modelica.Blocks.Sources.Trapezoid noise3(period(displayUnit = "h") = 3600 * 24, rising = 300, falling = 300, startTime = 1e6, width = 720, amplitude = 300) annotation(Placement(transformation(extent = {{-48, -68}, {-36, -56}})));
equation
  if time < 1382400 then
    der(Ec) = 0;
    der(Ec1) = 0;
  elseif time > 1468800 then
    der(Ec) = 0;
    der(Ec1) = 0;
  else
    der(Ec) = (rooms.heater1 + rooms.heater2) / 1000 / 3600;
    der(Ec1) = (rooms.heater1 + rooms.heater2) / 1000 / 3600;
  end if;
  connect(Troom.y[1], aWPI_analogue.SP) annotation(Line(points = {{-143, 66}, {-112, 66}, {-112, 80}, {-78, 80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.SP, aWPI_analogue.SP) annotation(Line(points = {{-78, 66}, {-112, 66}, {-112, 80}, {-78, 80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-71.4, 138}, {-18, 138}, {-18, 130}, {36.9, 130}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise1.y, rooms.Room2Noise) annotation(Line(points = {{-71.4, 110}, {-18, 110}, {-18, 116.8}, {36.9, 116.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-19.4, 100}, {36.9, 100}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue.CS, rooms.heater1) annotation(Line(points = {{-46, 80}, {-6, 80}, {-6, 83.2}, {36.9, 83.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.CS, rooms.heater2) annotation(Line(points = {{-46, 66}, {-6, 66}, {-6, 70}, {36.9, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, aWPI_analogue1.PV) annotation(Line(points = {{108.66, 118}, {120, 118}, {120, 20}, {-100, 20}, {-100, 60}, {-78, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, aWPI_analogue.PV) annotation(Line(points = {{108.66, 130}, {120, 130}, {120, 160}, {-100, 160}, {-100, 86}, {-78, 86}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.TWall2, lQ_Base.Vc) annotation(Line(points = {{100.78, -114}, {106, -114}, {106, -152}, {-116, -152}, {-116, -138.5}, {-104, -138.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.TWall1, lQ_Base.Vb) annotation(Line(points = {{100.78, -101.2}, {114, -101.2}, {114, -156}, {-120, -156}, {-120, -129.5}, {-104, -129.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.TinsideWall, lQ_Base.Ve) annotation(Line(points = {{100.78, -88.4}, {122, -88.4}, {122, -162}, {-126, -162}, {-126, -120.5}, {-104, -120.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.Troom2, lQ_Base.Vd) annotation(Line(points = {{100.78, -62.8}, {114, -62.8}, {114, -30}, {-118, -30}, {-118, -84.5}, {-104, -84.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u1, limiter1.u) annotation(Line(points = {{-55.2, -98}, {-46, -98}, {-46, -97}, {-37, -97}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter1.y, rooms1.heater1) annotation(Line(points = {{-25.5, -97}, {1.25, -97}, {1.25, -99.92}, {32.7, -99.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter2.y, rooms1.heater2) annotation(Line(points = {{-25.5, -117}, {1.25, -117}, {1.25, -114}, {32.7, -114}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u2, limiter2.u) annotation(Line(points = {{-55.2, -116}, {-46, -116}, {-46, -117}, {-37, -117}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.Troom1, lQ_Base.Va) annotation(Line(points = {{100.78, -50}, {106, -50}, {106, -32}, {-114, -32}, {-114, -75.5}, {-104, -75.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom1.y[1], lQ_Base.Vref1) annotation(Line(points = {{-135, -102}, {-122, -102}, {-122, -98}, {-104, -98}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.Vref2, lQ_Base.Vref1) annotation(Line(points = {{-104, -107}, {-122, -107}, {-122, -98}, {-104, -98}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal1.y, rooms1.Texternal) annotation(Line(points = {{-15.4, -78}, {2, -78}, {2, -82}, {32.7, -82}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise2.y, rooms1.Room1Noise) annotation(Line(points = {{-15.4, -48}, {2, -48}, {2, -50}, {32.7, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise3.y, rooms1.Room2Noise) annotation(Line(points = {{-35.4, -62}, {2, -62}, {2, -64.08}, {32.7, -64.08}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-180, -180}, {180, 180}})), Icon(coordinateSystem(extent = {{-180, -180}, {180, 180}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test_3;
