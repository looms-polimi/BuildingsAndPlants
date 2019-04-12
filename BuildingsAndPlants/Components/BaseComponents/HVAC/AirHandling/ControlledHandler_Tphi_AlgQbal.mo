within BuildingsAndPlants.Components.BaseComponents.HVAC.AirHandling;

model ControlledHandler_Tphi_AlgQbal
  extends Interfaces.Air.PartialTwoPort_waxa;
  parameter Temperature Tstart = 273.15 + 20 "initial T";
  parameter Real phistart = 0.1 "initial T";
  parameter Time TC = 4 "T control TC";
  parameter Real eta = 0.8 "efficiency";
  BuildingsAndPlants.Media.Substances.MoistAir airin;
  BuildingsAndPlants.Media.Substances.MoistAir air;
  Temperature T(start = Tstart) "controlled T";
  Real phi(start = phistart);
  Power Qbal, Qcons_est;
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{-110, 48}, {-70, 88}}), iconTransformation(extent = {{-90, 68}, {-70, 88}})));
  Modelica.Blocks.Interfaces.RealInput Tsp annotation(
  Placement(transformation(extent = {{-110, 10}, {-70, 50}}), iconTransformation(extent = {{-90, 30}, {-70, 50}})));
  Modelica.Blocks.Interfaces.RealInput phisp annotation(
  Placement(transformation(extent = {{-108, -62}, {-68, -22}}), iconTransformation(extent = {{-90, -50}, {-70, -30}})));
equation
  assert(air_flange1.wa >= 0, "No flow reversal here");
  pa1 = pa2;
  wa1 + wa2 = 0;
  airin.p = air_flange1.pa;
  airin.h = inStream(air_flange1.ha);
  airin.X = inStream(air_flange1.xa);
  T + TC * der(T) = if ON then Tsp else airin.T;
  phi + TC * der(phi) = if ON then phisp else airin.phi;
  air.p = airin.p;
  air.phi = phi;
  air.T = T;
  haout1 = air.h;
  haout2 = air.h;
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  // Algebraic balance for Qbal, sign convention s.t. + is heating
  Qbal = air_flange1.wa * (air.h - airin.h);
  Qcons_est = abs(Qbal) / eta;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 100}, {70, -58}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {170, 255, 255}), Text(extent = {{-36, 62}, {46, -18}}, lineColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {170, 255, 255}, textString = "hdr")}));
end ControlledHandler_Tphi_AlgQbal;
