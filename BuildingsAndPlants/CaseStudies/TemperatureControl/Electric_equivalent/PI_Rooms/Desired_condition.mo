within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.PI_Rooms;

model Desired_condition
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-82, -60}, {74, 60}})));
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-96, -6}, {-84, 6}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-98, 16}, {-82, 32}})));
  Modelica.Blocks.Sources.Constant Pheater1(k = 300) annotation(Placement(transformation(extent = {{-96, -30}, {-84, -18}})));
  Modelica.Blocks.Sources.Constant Pheater2(k = 200) annotation(Placement(transformation(extent = {{-96, -54}, {-84, -42}})));
equation
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-81.2, 24}, {-60, 24}, {-60, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{-39.1, 16.8}, {-60, 16.8}, {-60, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater1.y, rooms.heater1) annotation(Line(points = {{-83.4, -24}, {-70, -24}, {-70, -16.8}, {-39.1, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-83.4, 0}, {-39.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater2.y, rooms.heater2) annotation(Line(points = {{-83.4, -48}, {-64, -48}, {-64, -30}, {-39.1, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 1e+007), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end Desired_condition;
