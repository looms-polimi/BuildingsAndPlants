within BuildingsAndPlants.Components.BaseComponents.Air.Pdrops;

model AirPdrop_Lin_NomPoint_mix
  parameter Pressure dpnom = 10000 "Nominal pressure drop";
  parameter MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
  Pressure pa1, pa2, pv1, pv2;
  // pa's are _total_ pressures
  MassFlowRate wa1, wa2, wv1, wv2;
  Temperature Ta1, Ta2;
  HeatFlowRate Qd;
  ThermalConductance Gd;
  //Interfaces.Air.MoistAirFlange_wawvQd side1 annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  //Interfaces.Air.MoistAirFlange_wawvQd side2 annotation(Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
protected
  parameter Real Ga = wnom / dpnom "Equivalent conductance";
  parameter Real Gv = GvOverGa * Ga "Equivalent conductance";
  parameter Real a = (Gdw0 - Gdwnom) / (Gdwnom * wnom ^ 2);
public
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart dryair annotation (
    Placement(transformation(extent={{-104,16},{-84,36}}),
        iconTransformation(extent={{-104,18},{-84,38}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart vapour annotation (
    Placement(transformation(extent={{-104,-40},{-84,-20}}),
        iconTransformation(extent={{-104,-38},{-84,-18}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort diffuse annotation (
    Placement(transformation(extent={{-100,-10},{-80,10}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart Bdryair annotation (
    Placement(transformation(extent={{78,14},{98,34}}),
        iconTransformation(extent={{78,16},{98,36}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart Bvapour annotation (
    Placement(transformation(extent={{82,-40},{102,-20}}),
        iconTransformation(extent={{82,-38},{102,-18}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort Bdiffuse annotation (
    Placement(transformation(extent={{80,-10},{100,10}})));
equation
  //pa1 = side1.dryair.pa - side1.vapour.pv;
  //pa2 = side2.dryair.pa - side2.vapour.pv;
  //pv1 = side1.vapour.pv;
  //pv2 = side2.vapour.pv;
  //wa1 = side1.dryair.wa;
  //wa2 = side2.dryair.wa;
  //wv1 = side1.vapour.wv;
  //wv2 = side2.vapour.wv;
  //Ta1 = side1.diffuse.T;
  //Ta2 = side2.diffuse.T;
  pa1 = dryair.pa - vapour.pv;
  pa2 = Bdryair.pa - Bvapour.pv;
  pv1 = vapour.pv;
  pv2 = Bvapour.pv;
  wa1 = dryair.wa;
  wa2 = Bdryair.wa;
  wv1 = vapour.wv;
  wv2 = Bvapour.wv;
  Ta1 = diffuse.T;
  Ta2 = Bdiffuse.T;
  wa1 + wa2 = 0;
  wv1 + wv2 = 0;
  wa1 = Ga * (pa1 - pa2);
  wv1 = Gv * (pv1 - pv2);
  //side1.diffuse.Q_flow + side2.diffuse.Q_flow = 0;
  diffuse.Q_flow + Bdiffuse.Q_flow = 0;
  //Qd = side1.diffuse.Q_flow;
  Qd = diffuse.Q_flow;
  Gd = Gdw0 / (1 + a * (wa1 + wv1) ^ 2);
  Qd = Gd * (Ta1 - Ta2);
  //side1.dryair.ha = inStream(side2.dryair.ha);
  //side2.dryair.ha = inStream(side1.dryair.ha);
  //side1.vapour.hv = inStream(side2.vapour.hv);
  //side2.vapour.hv = inStream(side1.vapour.hv);
  dryair.ha = inStream(Bdryair.ha);
  Bdryair.ha = inStream(dryair.ha);
  vapour.hv = inStream(Bvapour.hv);
  Bvapour.hv = inStream(vapour.hv);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 20}, {60, -20}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                                                                                                      FillPattern.Solid), Text(extent = {{-40, 12}, {44, -12}}, lineColor = {0, 0, 0}, textString = "MIX")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end AirPdrop_Lin_NomPoint_mix;
