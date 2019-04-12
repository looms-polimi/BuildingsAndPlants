within BuildingsAndPlants.Components.BaseComponents.HVAC.AirHandling;

model ControlledCooler_AlgQbal
  extends Interfaces.Air.PartialTwoPort_waxa;
  parameter Temperature Tstart = 273.15 + 20 "initial T";
  parameter Time TC = 4 "T control TC";
  parameter Real eta = 0.8 "efficiency";
  BuildingsAndPlants.Media.Substances.MoistAir airin;
  BuildingsAndPlants.Media.Substances.MoistAir air;
  Temperature T(start = Tstart) "controlled T";
  Power Qbal, Qcons_est;
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{-110, 48}, {-70, 88}}), iconTransformation(extent = {{-90, 68}, {-70, 88}})));
  Modelica.Blocks.Interfaces.RealInput Tsp annotation(
  Placement(transformation(extent = {{-110, 10}, {-70, 50}}), iconTransformation(extent = {{-90, 30}, {-70, 50}})));
equation
  assert(air_flange1.wa >= 0, "No flow reversal here");
  pa1 = pa2;
  wa1 + wa2 = 0;
  airin.p = air_flange1.pa;
  airin.h = inStream(air_flange1.ha);
  airin.X = inStream(air_flange1.xa);
  T + TC * der(T) = if ON and Tsp < airin.T then Tsp else airin.T;
  air.p = airin.p;
  air.X = airin.X;
  air.T = T;
  haout1 = air.h;
  haout2 = air.h;
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  // Algebraic balance for Qbal, sign convention s.t. + is cooling
  Qbal = -air_flange1.wa * (air.h - airin.h);
  Qcons_est = max(Qbal, 0) / eta;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 100}, {70, -58}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {170, 255, 255}), Text(extent = {{-28, 58}, {40, -16}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {170, 255, 255}, textString = "C")}));
end ControlledCooler_AlgQbal;
