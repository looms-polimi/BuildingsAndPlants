within BuildingsAndPlants.ABC;

model sensor_Tphi
  BuildingsAndPlants.Media.Substances.MoistAir air;
  Interfaces.Air.MoistAirFlange_waxa airSense annotation(
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -2.88658e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput T annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput phi annotation(
    Placement(visible = true, transformation(origin = {22, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  airSense.wa = 0;
  airSense.xa = inStream(airSense.xa);
  airSense.ha = inStream(airSense.ha);
  air.p = airSense.pa;
  air.X = inStream(airSense.xa);
  air.h = inStream(airSense.ha);
  T = air.T;
  phi = air.phi;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Ellipse(origin = {0, -1}, lineColor = {0, 170, 255}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Sphere, extent = {{-100, 101}, {100, -99}}, endAngle = 360), Text(origin = {23, -2}, extent = {{-87, 78}, {33, -58}}, textString = "sens\nT phi")}));
end sensor_Tphi;