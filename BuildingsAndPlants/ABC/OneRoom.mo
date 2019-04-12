within BuildingsAndPlants.ABC;

model OneRoom
  BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.0025)  annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSrc(X0 = 0.0025)  annotation(
    Placement(visible = true, transformation(origin = {-136, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qa(y = 100 / 3600)  annotation(
    Placement(visible = true, transformation(origin = {-134, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8)  annotation(
    Placement(visible = true, transformation(origin = {-70,-10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12)  annotation(
    Placement(visible = true, transformation(origin = {14, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-18, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Te(T = 291.15)  annotation(
    Placement(visible = true, transformation(origin = {54, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), s = 0.005)  annotation(
    Placement(visible = true, transformation(origin = {-22, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {12, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {-52, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
    Placement(visible = true, transformation(origin = {70, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9))  annotation(
    Placement(visible = true, transformation(origin = {110, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9))  annotation(
    Placement(visible = true, transformation(origin = {110, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression rad(y = 400 + 300 * sin(0.00001 * time))  annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Te.port, window2ext.ss2) annotation(
    Line(points = {{44, 50}, {32, 50}, {32, -40}, {18, -40}}, color = {191, 0, 0}));
  connect(window.airSide2, window2ext.ss1) annotation(
    Line(points = {{-13, -40}, {6, -40}}, color = {255, 0, 0}));
  connect(radFracWall.u, radFracWindow.u) annotation(
    Line(points = {{122, 18}, {140, 18}, {140, -20}, {122, -20}, {122, -20}}, color = {0, 0, 127}));
  connect(rad.y, radFracWall.u) annotation(
    Line(points = {{122, 60}, {140, 60}, {140, 18}, {122, 18}, {122, 18}}, color = {0, 0, 127}));
  connect(rad2window.Q_flow, radFracWindow.y) annotation(
    Line(points = {{80, -20}, {99, -20}}, color = {0, 0, 127}));
  connect(rad2window.port, window.airSide2) annotation(
    Line(points = {{60, -20}, {-4, -20}, {-4, -40}, {-12, -40}}, color = {191, 0, 0}));
  connect(rad2wall.Q_flow, radFracWall.y) annotation(
    Line(points = {{80, 18}, {100, 18}, {100, 18}, {98, 18}}, color = {0, 0, 127}));
  connect(rad2wall.port, wall.side2) annotation(
    Line(points = {{60, 18}, {29, 18}, {29, 18}, {-2, 18}, {-2, 50}, {-10, 50}, {-10, 50}, {-10, 50}, {-10, 50}}, color = {191, 0, 0}));
  connect(wall2ext.ss2, Te.port) annotation(
    Line(points = {{20, 50}, {32, 50}, {32, 50}, {44, 50}, {44, 50}, {44, 50}, {44, 50}, {44, 50}}, color = {255, 0, 0}));
  connect(wall.side2, wall2ext.ss1) annotation(
    Line(points = {{-10, 50}, {8, 50}}, color = {255, 0, 0}));
  connect(room2wall.ss2, wall.side1) annotation(
    Line(points = {{-70, -4}, {-70, 50}, {-28, 50}}, color = {255, 0, 0}));
  connect(room2window.ss2, window.airSide1) annotation(
    Line(points = {{-46, -40}, {-31, -40}}, color = {255, 0, 0}));
  connect(room2window.ss1, Room.heatPort) annotation(
    Line(points = {{-58, -40}, {-70, -40}, {-70, -60}, {-70, -60}}, color = {255, 0, 0}));
  connect(qa.y, fan.iq) annotation(
    Line(points = {{-123, -34}, {-109, -34}, {-109, -66}, {-110, -66}}, color = {0, 0, 127}));
  connect(Room.air_flange2, airSink.air_flange) annotation(
    Line(points = {{-62, -70}, {-39, -70}}, color = {0, 100, 150}));
  connect(airSrc.air_flange, fan.air_flange1) annotation(
    Line(points = {{-127, -70}, {-122, -70}, {-122, -70}, {-117, -70}, {-117, -70}, {-119, -70}}, color = {0, 100, 150}));
  connect(fan.air_flange2, Room.air_flange1) annotation(
    Line(points = {{-102, -70}, {-78, -70}}, color = {0, 100, 150}));
  connect(Room.heatPort, room2wall.ss1) annotation(
    Line(points = {{-70, -61}, {-70, -16}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 172.8));
end OneRoom;