within BuildingsAndPlants.ABC;

model TestAirSourcepTphi
  AirSource_pTphi_prescribed air annotation(
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression p(y = 101325)  annotation(
    Placement(visible = true, transformation(origin = {-112, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression T(y = 273.15 + 20 + 10 * sin(time / 100))  annotation(
    Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression phi(y = 70)  annotation(
    Placement(visible = true, transformation(origin = {-106, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(phi.y, air.iphi) annotation(
    Line(points = {{-94, -20}, {-76, -20}, {-76, -8}, {-44, -8}, {-44, -8}}, color = {0, 0, 127}));
  connect(T.y, air.iT) annotation(
    Line(points = {{-97, 0}, {-44, 0}}, color = {0, 0, 127}));
  connect(p.y, air.iP) annotation(
    Line(points = {{-101, 20}, {-90, 20}, {-90, 8}, {-44, 8}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5205));
end TestAirSourcepTphi;