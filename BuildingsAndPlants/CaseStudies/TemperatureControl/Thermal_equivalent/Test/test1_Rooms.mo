within BuildingsAndPlants.CaseStudies.TemperatureControl.Thermal_equivalent.Test;

model test1_Rooms "Differences between wall with or without layer"
  RoomsWithLayeredWall.RoomsThermal RoomsThermal annotation(Placement(transformation(extent = {{-94, -98}, {100, 172}})));
  Rooms.RoomsThermalSimplified RoomsThermalSimplified annotation(Placement(transformation(extent = {{-92, -172}, {102, 98}})));
  Modelica.Blocks.Sources.Constant Text(k = 273.15 + 18) annotation(Placement(transformation(extent = {{-50, 54}, {-40, 64}})));
  Modelica.Blocks.Sources.Constant Text1(k = 273.15 + 18) annotation(Placement(transformation(extent = {{-38, -28}, {-28, -18}})));
  Modelica.Blocks.Sources.Step Heater1(startTime = 6e6, offset = 300, height = 100) annotation(Placement(transformation(extent = {{-78, 30}, {-68, 40}})));
  Modelica.Blocks.Sources.Constant Heater2(k = 200) annotation(Placement(transformation(extent = {{-78, 12}, {-68, 22}})));
  Modelica.Blocks.Sources.Constant Heater4(k = 200) annotation(Placement(transformation(extent = {{-76, -60}, {-66, -50}})));
  Modelica.Blocks.Sources.Step Heater3(startTime = 6e6, height = 100, offset = 300) annotation(Placement(transformation(extent = {{-76, -38}, {-66, -28}})));
equation
  connect(RoomsThermalSimplified.Texternal, Text1.y) annotation(Line(points = {{-8.83676, -23.7813}, {-18, -23.7813}, {-18, -23}, {-27.5, -23}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsThermal.Texternal, Text.y) annotation(Line(points = {{-10.8368, 50.2188}, {-20, 50.2188}, {-20, 59}, {-39.5, 59}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Heater1.y, RoomsThermal.heater1) annotation(Line(points = {{-67.5, 35}, {-39.75, 35}, {-39.75, 36.7188}, {-10.8368, 36.7188}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Heater2.y, RoomsThermal.heater2) annotation(Line(points = {{-67.5, 17}, {-40.75, 17}, {-40.75, 23.7813}, {-10.8368, 23.7813}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Heater3.y, RoomsThermalSimplified.heater1) annotation(Line(points = {{-65.5, -33}, {-37.75, -33}, {-37.75, -37.2813}, {-8.83676, -37.2813}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Heater4.y, RoomsThermalSimplified.heater2) annotation(Line(points = {{-65.5, -55}, {-37.75, -55}, {-37.75, -50.2188}, {-8.83676, -50.2188}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 1e+007), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test1_Rooms;
