within BuildingsAndPlants.CaseStudies.TemperatureControl.Test;

model test_2
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-26, -106}, {-14, -94}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-48, -82}, {-36, -70}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue(CSmax = 1000, Ti = 5682, K = 27450) annotation(Placement(transformation(extent = {{-76, -106}, {-36, -126}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue1(CSmax = 1000, Ti = 8268, K = 38816) annotation(Placement(transformation(extent = {{-74, -164}, {-34, -144}})));
  Electric_equivalent.Rooms.RoomsElectrical RoomsElectric(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-4, -160}, {152, -40}})));
  Modelica.Blocks.Sources.Constant Texternal1(k = 273.15 + 8) annotation(Placement(transformation(extent = {{-24, 134}, {-12, 146}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue2(Ti = 5682, K = 27450, CSmax = 1000) annotation(Placement(transformation(extent = {{-74, 112}, {-34, 92}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue3(Ti = 8268, K = 38816, CSmax = 1000) annotation(Placement(transformation(extent = {{-74, 56}, {-34, 76}})));
  Thermal_equivalent.Rooms.RoomsThermalSimplified RoomsThermalSimplified(Tstart = 273.15 + 0, wr = 0) annotation(Placement(transformation(extent = {{-202, -208}, {344, 394}})));
  Modelica.Blocks.Sources.CombiTimeTable Troom(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-160, 80}, {-140, 100}})));
  Modelica.Blocks.Sources.CombiTimeTable Troom5(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, table = [0, 20; 5 * 3600, 20; 8 * 3600, 25; 17 * 3600, 25; 18 * 3600, 22; 23 * 3600, 22; 24 * 3600, 20]) annotation(Placement(transformation(extent = {{-160, -140}, {-140, -120}})));
equation
  connect(Texternal.y, RoomsElectric.Texternal) annotation(Line(points = {{-13.4, -100}, {38.9, -100}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, RoomsElectric.Room1Noise) annotation(Line(points = {{-35.4, -76}, {0, -76}, {0, -70}, {38.9, -70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsElectric.Room2Noise, RoomsElectric.Room1Noise) annotation(Line(points = {{38.9, -83.2}, {0, -83.2}, {0, -70}, {38.9, -70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue.CS, RoomsElectric.heater1) annotation(Line(points = {{-40, -122}, {-2, -122}, {-2, -116.8}, {38.9, -116.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.CS, RoomsElectric.heater2) annotation(Line(points = {{-38, -148}, {-2, -148}, {-2, -130}, {38.9, -130}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsElectric.Troom2, aWPI_analogue1.PV) annotation(Line(points = {{110.66, -82}, {126, -82}, {126, -180}, {-80, -180}, {-80, -154}, {-70, -154}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsElectric.Troom1, aWPI_analogue.PV) annotation(Line(points = {{110.66, -70}, {126, -70}, {126, -40}, {-80, -40}, {-80, -116}, {-72, -116}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom.y[1], aWPI_analogue2.SP) annotation(Line(points = {{-139, 90}, {-110, 90}, {-110, 96}, {-70, 96}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue3.SP, aWPI_analogue2.SP) annotation(Line(points = {{-70, 72}, {-110, 72}, {-110, 96}, {-70, 96}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom5.y[1], aWPI_analogue.SP) annotation(Line(points = {{-139, -130}, {-112, -130}, {-112, -122}, {-72, -122}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.SP, aWPI_analogue.SP) annotation(Line(points = {{-70, -148}, {-112, -148}, {-112, -122}, {-72, -122}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal1.y, RoomsThermalSimplified.Texternal) annotation(Line(points={{-11.4,
          140},{14,140},{14,122.473},{32.0574,122.473}},                                                                                         color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsThermalSimplified.Troom1, aWPI_analogue2.PV) annotation(Line(points={{105.928,
          117.456},{130,117.456},{130,160},{-80,160},{-80,102},{-70,102}},                                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsThermalSimplified.Troom2, aWPI_analogue3.PV) annotation(Line(points={{105.928,
          68.5438},{132,68.5438},{132,40},{-80,40},{-80,66},{-70,66}},                                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsThermalSimplified.heater1, aWPI_analogue2.CS) annotation(Line(points={{32.0574,
          92.3729},{0,92.3729},{0,96},{-38,96}},                                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsThermalSimplified.heater2, aWPI_analogue3.CS) annotation(Line(points={{32.0574,
          63.5271},{0,63.5271},{0,72},{-38,72}},                                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -220}, {180, 220}}), graphics), Icon(coordinateSystem(extent = {{-180, -220}, {180, 220}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test_2;
