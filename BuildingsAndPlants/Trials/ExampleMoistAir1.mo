within BuildingsAndPlants.Trials;

model ExampleMoistAir1
  Media.Substances.MoistAir air;
equation
  air.p = 101325;
  air.T = 273.15 + 20;
  air.phi = 0.5;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ExampleMoistAir1;