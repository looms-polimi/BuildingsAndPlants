within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.PI_Rooms;
model Step1
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-96, -6}, {-84, 6}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-98, 16}, {-82, 32}})));
  Modelica.Blocks.Sources.Step Pheater1(height = 100, offset = 300, startTime = 6e6) annotation(Placement(transformation(extent = {{-96, -30}, {-84, -18}})));
  Modelica.Blocks.Sources.Constant Pheater2(k = 200) annotation(Placement(transformation(extent = {{-72, -50}, {-60, -38}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 5682, k = 0.0207) annotation(Placement(transformation(extent = {{-40, -78}, {-26, -64}})));
  Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{20, -82}, {40, -62}})));
  Modelica.Blocks.Sources.Constant offset(k = 22.613) annotation(Placement(transformation(extent = {{-40, -98}, {-30, -88}})));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(extent = {{-64, -78}, {-50, -64}})));
  Modelica.Blocks.Sources.Constant offset1(k = 300) annotation(Placement(transformation(extent = {{-96, -94}, {-86, -84}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-82, -60}, {74, 60}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{64, -82}, {84, -62}})));
equation
  connect(firstOrder.y, add.u1) annotation(Line(points = {{-25.3, -71}, {6, -71}, {6, -66}, {18, -66}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(offset.y, add.u2) annotation(Line(points = {{-29.5, -93}, {-2, -93}, {-2, -78}, {18, -78}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(offset1.y, add1.u2) annotation(Line(points = {{-85.5, -89}, {-75.75, -89}, {-75.75, -75.2}, {-65.4, -75.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(firstOrder.u, add1.y) annotation(Line(points = {{-41.4, -71}, {-49.3, -71}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-81.2, 24}, {-62, 24}, {-62, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{-39.1, 16.8}, {-62, 16.8}, {-62, 30}, {-39.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-83.4, 0}, {-39.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater1.y, rooms.heater1) annotation(Line(points = {{-83.4, -24}, {-62, -24}, {-62, -16.8}, {-39.1, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater2.y, rooms.heater2) annotation(Line(points = {{-59.4, -44}, {-50, -44}, {-50, -30}, {-39.1, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add1.u1, rooms.heater1) annotation(Line(points = {{-65.4, -66.8}, {-78, -66.8}, {-78, -24}, {-62, -24}, {-62, -16.8}, {-39.1, -16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add.y, y) annotation(Line(points = {{41, -72}, {74, -72}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 1e+008), __Dymola_experimentSetupOutput(equdistant = false, events = false), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Step1;

