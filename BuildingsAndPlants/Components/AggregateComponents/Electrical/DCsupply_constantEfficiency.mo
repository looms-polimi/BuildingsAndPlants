within BuildingsAndPlants.Components.AggregateComponents.Electrical;

model DCsupply_constantEfficiency
  extends BaseClasses.BaseDCsupply;
  Modelica.Electrical.Analog.Sources.ConstantVoltage Vgen(V = Vdc) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {20, -2})));
  parameter SI.Voltage Vdc = 10 "DC voltage";
  parameter Current Isc = 10 "SC current";
  Modelica.Electrical.Analog.Basic.Resistor Rout(R = Vdc / Isc) annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {42, 20})));
  BaseComponents.Electrical.DC.Pmeter PM annotation(
  Placement(transformation(extent = {{60, -12}, {80, 8}})));
  BaseComponents.Electrical.Phasors.Load_Pcosphi_nom_Pin ACload(cphinom = cphinom) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-40, 3.55271e-15})));
  parameter Real cphinom = 0.9 "nominal power factor";
  parameter Real eta = 0.85 "efficiency";
  Modelica.Blocks.Math.Gain iEff(k = 1 / eta) annotation(
  Placement(transformation(extent = {{20, 40}, {0, 60}})));
equation
  Qloss = iEff.y - iEff.u;
  connect(PM.n2, DCn) annotation(
  Line(points = {{79, -8}, {80, -8}, {80, -60}, {90, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PM.p2, DCp) annotation(
  Line(points = {{79, 4}, {80, 4}, {80, 60}, {90, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vgen.p, Rout.p) annotation(
  Line(points = {{20, 8}, {20, 20}, {32, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Rout.n, PM.p1) annotation(
  Line(points = {{52, 20}, {61, 20}, {61, 4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vgen.n, PM.n1) annotation(
  Line(points = {{20, -12}, {20, -20}, {61, -20}, {61, -8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACp, ACload.p) annotation(
  Line(points = {{-90, 60}, {-40, 60}, {-40, 18}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACn, ACload.n) annotation(
  Line(points = {{-90, -60}, {-40, -60}, {-40, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(iEff.y, ACload.P) annotation(
  Line(points = {{-1, 50}, {-10, 50}, {-10, 0}, {-32, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iEff.u, PM.P) annotation(
  Line(points = {{22, 50}, {66.1, 50}, {66.1, 8.1}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end DCsupply_constantEfficiency;
