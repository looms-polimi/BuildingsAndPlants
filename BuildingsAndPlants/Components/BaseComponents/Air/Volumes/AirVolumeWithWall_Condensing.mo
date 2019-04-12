within BuildingsAndPlants.Components.BaseComponents.Air.Volumes;
model AirVolumeWithWall_Condensing
  extends Interfaces.Air.PartialTwoPort_waxa;
  BuildingsAndPlants.Media.Substances.MoistAir air;
  BuildingsAndPlants.Media.Substances.MoistAir wallsat;
  parameter Volume V = 0.001 "volume";
  parameter Pressure Pstart = 101325 "Initial moist air pressure";
  parameter Temperature Tstart = 273.15 + 20 "Initial moist air temperature";
  parameter MassFraction Xstart = 0.001 "Initial absolute umidity [kg_H20/kg_DA]";
  parameter HeatCapacity Cw = 50 "wall heat capacity";
  parameter ThermalConductance Gaw = 100 "air-wall thermal conductance";
  Mass Ma "Total dry air mass";
  Mass Mv "Total vapour mass";
  Energy Ea "Energy of the moist air";
  Pressure p(start = Pstart) "Pressure of the air";
  Temperature Tw "Wall temperature";
  MassFlowRate wc "Condensed water mass flow rate";
  HeatFlowRate Qawsens "Condensation sensible heat";
  HeatFlowRate Qawlat "Condenstion latent heat";
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
initial equation
  air.T = Tstart;
  air.X = Xstart;
equation
  // No pressure drop
  pa1 = air.p;
  pa2 = air.p;
  air.p = p;
  // Masses and energy
  Ma + Mv = V * air.d;
  Mv = Ma * air.X;
  Ea = Ma * (air.h - air.p / air.d);
  // Balances
  der(Ma) = wa1 + wa2;
  der(Mv) = wa1 * actualStream(air_flange1.xa) + wa2 * actualStream(air_flange2.xa) - wc;
  der(Ea) = wa1 * actualStream(air_flange1.ha) + wa2 * actualStream(air_flange2.ha) - Qawsens - Qawlat;
  Cw * der(Tw) = Qawsens + Qawlat + heatPort.Q_flow;
  // Wallsat air conditions
  wallsat.p = p;
  wallsat.T = Tw;
  wallsat.phi = 1.0;
  // Condensation and corresponding heat rates
  wc = if air.X > 1e-6 and air.X > wallsat.X then Gaw / air.cp * (air.X - wallsat.X) else 0.0;
  Qawsens = Gaw * (air.T - Tw);
  Qawlat = wc * (air.hv - wallsat.hl);
  // Connector equations
  air.T = heatPort.T;
  xaout1 = air.X;
  xaout2 = air.X;
  haout1 = air.h;
  haout2 = air.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, fillColor = {100, 100, 100}), Rectangle(extent = {{-80, 70}, {80, -70}}, lineColor = {0, 100, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere), Text(extent = {{-80, 100}, {80, -40}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, textString = "AirVolumeWithWall
Condensing")}));
end AirVolumeWithWall_Condensing;

