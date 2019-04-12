within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.PI_Rooms;
model Step2
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-96, -6}, {-84, 6}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-98, 16}, {-82, 32}})));
  Modelica.Blocks.Sources.Constant Pheater1(k = 300) annotation(Placement(transformation(extent = {{-96, -30}, {-84, -18}})));
  Modelica.Blocks.Sources.Step Pheater2(offset = 200, height = 100, startTime = 6e6) annotation(Placement(transformation(extent = {{-96, -54}, {-84, -42}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k = 0.0213, T = 8268) annotation(Placement(transformation(extent = {{-16, -80}, {-2, -66}})));
  Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{44, -84}, {64, -64}})));
  Modelica.Blocks.Sources.Constant offset(k = 21.0024) annotation(Placement(transformation(extent = {{-16, -100}, {-6, -90}})));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(extent = {{-40, -80}, {-26, -66}})));
  Modelica.Blocks.Sources.Constant offset1(k = 200) annotation(Placement(transformation(extent = {{-72, -96}, {-62, -86}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-82, -60}, {74, 60}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{76, -84}, {96, -64}})));
equation
  connect(offset.y, add.u2) annotation(Line(points = {{-5.5, -95}, {22, -95}, {22, -80}, {42, -80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(offset1.y, add1.u2) annotation(Line(points = {{-61.5, -91}, {-51.75, -91}, {-51.75, -77.2}, {-41.4, -77.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(firstOrder.u, add1.y) annotation(Line(points = {{-17.4, -73}, {-25.3, -73}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-81.2, 24}, {-62, 24}, {-62, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{-39.1, 16.8}, {-62, 16.8}, {-62, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-83.4, 0}, {-39.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater1.y, rooms.heater1) annotation(Line(points = {{-83.4, -24}, {-62, -24}, {-62, -16.8}, {-39.1, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater2.y, rooms.heater2) annotation(Line(points = {{-83.4, -48}, {-62, -48}, {-62, -30}, {-39.1, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add1.u1, rooms.heater2) annotation(Line(points = {{-41.4, -68.8}, {-62, -68.8}, {-62, -30}, {-39.1, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(firstOrder.y, add.u1) annotation(Line(points = {{-1.3, -73}, {19.35, -73}, {19.35, -68}, {42, -68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add.y, y) annotation(Line(points = {{65, -74}, {86, -74}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Step2;

