within BuildingsAndPlants.Components.BaseComponents.Water.Tanks;

model Tank_adiabaticWall "Tank with wall"
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter Volume V = 1 "max contained water volume";
  parameter Volume Vstart = 0.001 "initial water volume";
  parameter Area S = 1 "exchanging surface (inner and outer)";
  parameter Area Sb = 0.2 "base area for level/pressure BEFORE Sb=0.01";
  parameter Temperature Tstart = 273.15 + 25 "initial temp (fluid and metal)";
  parameter Pressure pin = 0 "mean pressure at the flanges(used in case of a boiler)";
  Temperature Tf "fluid temperature";
  Mass Mw(start = Vstart * 1000) "Mass of water";
  Pressure p "preassure of water at input, inside and output";
  Energy E;
  Interfaces.Thermal.HeatPort fluid annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 70}}), iconTransformation(extent = {{-12, -100}, {10, 20}})));
  Modelica.Blocks.Interfaces.RealOutput oM "Mass of water" annotation(
  Placement(transformation(extent = {{-90, 66}, {-70, 86}}), iconTransformation(extent = {{80, 40}, {100, 60}})));
  Modelica.Blocks.Interfaces.RealOutput oT "Temperature of water" annotation(
  Placement(transformation(extent = {{-90, 44}, {-70, 64}}), iconTransformation(extent = {{80, -60}, {100, -40}})));
initial equation
  Tf = Tstart;
equation
  // Total mass balance
  der(Mw) = w1 + w2;
  // No pressure drop
  p = Mw / Sb * Modelica.Constants.g_n + pin;
  p1 = p;
  p1 = p2;
  water.p = 0.5 * (p1 + p2);
  // Energy balances for the fluid
  der(E) = w1 * actualStream(water_flange1.h) + w2 * actualStream(water_flange2.h) + fluid.Q_flow;
  E = Mw * water.h;
  // Temperature
  water.T = Tf;
  fluid.T = Tf;
  //Output
  oM = Mw;
  oT = Tf;
  // Enthalpies boundary condition
  hout1 = water.h;
  hout2 = water.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, -100}, {80, 100}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, -90}, {70, 52}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, 52}, {70, 100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{32, -52}, {80, -46}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}));
end Tank_adiabaticWall;
