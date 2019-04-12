within BuildingsAndPlants.Components.AggregateComponents.Envelope.Test;
model Test_walls
  Walls.ExtenallWall_NoOpenings_Homogeneous WE(lambda = 0.2) annotation(Placement(transformation(extent = {{40, -20}, {80, 20}})));
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15, Ta_Yex = 20) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume_closed Room(V = 20) annotation(Placement(transformation(extent = {{-8, -60}, {32, -20}})));
  Walls.InternalWall_NoOpenings_NonHomogeneous WI annotation(Placement(transformation(extent = {{-60, -20}, {-20, 20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 291.15) annotation(Placement(transformation(extent = {{-92, -10}, {-72, 10}})));
equation
  connect(WE.airInt, Room.heatPort) annotation(Line(points = {{42, 0}, {12, 0}, {12, -22}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Room.heatPort, WI.airSide2) annotation(Line(points = {{12, -22}, {12, 0}, {-22, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(fixedTemperature.port, WI.airSide1) annotation(Line(points = {{-72, 0}, {-58, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 3.2e+07, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end Test_walls;

