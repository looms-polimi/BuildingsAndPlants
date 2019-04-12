within BuildingsAndPlants.Components.BaseComponents.Air.Volumes;
model AirVolume_wawvQdPort
  extends Interfaces.Air.PartialTwoPort_waxa;
  BuildingsAndPlants.Media.Substances.MoistAir air;
  parameter Volume V = 0.001 "volume";
  parameter Pressure Pstart = 101325 "Initial moist air pressure";
  parameter Temperature Tstart = 273.15 + 20 "Initial moist air temperature";
  parameter MassFraction Xstart = 0.001 "Initial absolute umidity [kg_H20/kg_DA]";
  Mass Ma "Total dry air mass";
  Mass Mv "Total vapour mass";
  Energy Ea "Energy of the moist air";
  Pressure p(start = Pstart) "Pressure of the air";
  // wawvQd port variables (for mixing with other volumes)
  MassFlowRate wamix, wvmix;
  HeatFlowRate Qdiff;
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
  //Interfaces.Air.MoistAirFlange_wawvQd air_flange_wawvQd annotation(Placement(transformation(extent = {{-10, -100}, {10, -80}}), iconTransformation(extent = {{-10, -100}, {10, -80}})));
public
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart
                                              dryair
    annotation (
    Placement(transformation(extent={{-38,-98},{-18,-78}}),
        iconTransformation(extent={{-40,-100},{-20,-80}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              vapour
    annotation (
    Placement(transformation(extent={{18,-98},{38,-78}}),
        iconTransformation(extent={{16,-100},{36,-80}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort
                              diffuse
    annotation (
    Placement(transformation(extent={{-8,-100},{12,-80}}),
        iconTransformation(extent={{-10,-102},{10,-82}})));
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
  der(Ma) = wa1 + wa2 + wamix;
  der(Mv) = wa1 * actualStream(air_flange1.xa) + wa2 * actualStream(air_flange2.xa) + wvmix;
  der(Ea) = wa1 * actualStream(air_flange1.ha) + wa2 * actualStream(air_flange2.ha) + heatPort.Q_flow + wamix * actualStream(dryair.ha) + wvmix * actualStream(vapour.hv) + Qdiff;
  //der(Mv) = wa1 * actualStream(air_flange1.xa) + wa2 * actualStream(air_flange2.xa) + wvmix;
  //der(Ea) = wa1 * actualStream(air_flange1.ha) + wa2 * actualStream(air_flange2.ha) + heatPort.Q_flow + wamix * actualStream(air_flange_wawvQd.dryair.ha) + wvmix * actualStream(air_flange_wawvQd.vapour.hv) + Qdiff;
  // Connector equations
  air.T = heatPort.T;
  xaout1 = air.X;
  xaout2 = air.X;
  haout1 = air.h;
  haout2 = air.h;
  // wawvQd port
//   air_flange_wawvQd.dryair.pa = air.p;
//   air_flange_wawvQd.dryair.wa = wamix;
//   air_flange_wawvQd.dryair.ha = air.ha;
//   air_flange_wawvQd.vapour.pv = air.pv;
//   air_flange_wawvQd.vapour.wv = wvmix;
//   air_flange_wawvQd.vapour.hv = air.hv;
//   air_flange_wawvQd.diffuse.T = air.T;
//   air_flange_wawvQd.diffuse.Q_flow = Qdiff;
 dryair.pa = air.p;
  dryair.wa = wamix;
  dryair.ha = air.ha;
  vapour.pv = air.pv;
  vapour.wv = wvmix;
  vapour.hv = air.hv;
  diffuse.T = air.T;
  diffuse.Q_flow = Qdiff;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 100, 255}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Text(extent = {{-76, 72}, {76, -78}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "AirVolume
wawvQd")}));
end AirVolume_wawvQdPort;

