within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.PI_Rooms;

model IMC
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-32, -6}, {-20, 6}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-54, 18}, {-42, 30}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue(CSmax = 1000, Ti = 5682, K = 27450) annotation(Placement(transformation(extent = {{-82, -6}, {-42, -26}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue1(CSmax = 1000, Ti = 8268, K = 38816) annotation(Placement(transformation(extent = {{-80, -64}, {-40, -44}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-10, -60}, {146, 60}})));
  Modelica.Blocks.Sources.Constant Troom1(k = 22) annotation(Placement(transformation(extent = {{-160, -18}, {-140, 2}})));
  Modelica.Blocks.Sources.Constant Troom2(k = 22) annotation(Placement(transformation(extent = {{-160, -52}, {-140, -32}})));
equation
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-19.4, 0}, {32.9, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-41.4, 24}, {-6, 24}, {-6, 30}, {32.9, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{32.9, 16.8}, {-6, 16.8}, {-6, 30}, {32.9, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue.CS, rooms.heater1) annotation(Line(points = {{-46, -22}, {-8, -22}, {-8, -16.8}, {32.9, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.CS, rooms.heater2) annotation(Line(points = {{-44, -48}, {-8, -48}, {-8, -30}, {32.9, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, aWPI_analogue1.PV) annotation(Line(points = {{104.66, 18}, {120, 18}, {120, -80}, {-86, -80}, {-86, -54}, {-76, -54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, aWPI_analogue.PV) annotation(Line(points = {{104.66, 30}, {120, 30}, {120, 60}, {-86, 60}, {-86, -16}, {-78, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom1.y, aWPI_analogue.SP) annotation(Line(points = {{-139, -8}, {-108, -8}, {-108, -22}, {-78, -22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom2.y, aWPI_analogue1.SP) annotation(Line(points = {{-139, -42}, {-106, -42}, {-106, -48}, {-76, -48}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -100}, {180, 100}}), graphics), Icon(coordinateSystem(extent = {{-180, -100}, {180, 100}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end IMC;
