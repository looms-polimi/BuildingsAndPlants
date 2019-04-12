within BuildingsAndPlants.Components.BaseComponents.Water.Pumps;

model WaterPump_Centrifugal
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter Pressure DP0 = 5000 "DP at w=0, cmd=1";
  parameter Real DP1 = 200 "pressure decr. ratio, cmd=1 Pa/(kg/s)^2";
  parameter Time T = 0.5 "pump TC";
  parameter Real cmdstart = 0;
  Real x(start = cmdstart);
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
  Placement(transformation(extent = {{-68, 46}, {-26, 88}}), iconTransformation(extent = {{-68, 42}, {-36, 74}})));
equation
  // no mass storage inside the pump
  w1 + w2 = 0;
  // command dynamics
  x + T * der(x) = cmd;
  // pressure drop
  p2 - p1 = DP0 * x - DP1 * x * w1*noEvent(abs(w1));
  water.p = 0.5 * (p1 + p2);
  // mean fluid pressure
  // energy conservation
  hout1 = inStream(water_flange2.h);
  hout2 = inStream(water_flange1.h);
  // enthalpy boundary condition
  hout1 = water.h;
  annotation(
  Icon(graphics = {Ellipse(extent = {{-70, 68}, {70, -72}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-66, 8}, {-50, 30}, {-34, 46}, {-16, 54}, {4, 56}, {18, 54}, {32, 44}, {38, 48}, {54, 16}, {22, 32}, {28, 38}, {14, 44}, {2, 46}, {-12, 42}, {-28, 34}, {-42, 22}, {-50, 10}, {-54, 0}, {-66, 8}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
end WaterPump_Centrifugal;
