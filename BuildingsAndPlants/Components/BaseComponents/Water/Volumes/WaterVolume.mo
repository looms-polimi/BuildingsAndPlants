within BuildingsAndPlants.Components.BaseComponents.Water.Volumes;

model WaterVolume "Tank with wall"
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter Volume V = 1 "volume";
  parameter Temperature Tstart = 273.15 + 25 "initial temp";
  Temperature Tf "fluid temperature";
  SpecificEnthalpy h1 "Actual specific enthalpy at port 1";
  SpecificEnthalpy h2 "Actual specific enthalpy at port 2";
  
  Energy E;
  Interfaces.Thermal.HeatPort fluid annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 70}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
initial equation
  Tf = Tstart;
equation
  // Total mass balance
  0 = w1 + w2;
  // No pressure drop
  p1 = p2;
  water.p = p1;
  // Energy balances for the fluid
  der(E) = w1 * h1 + w2 * h2 + fluid.Q_flow;
  E = V * water.d * water.h;
  // Temperature
  water.T = Tf;
  fluid.T = Tf;
  // Enthalpies boundary condition
  h1 = actualStream(water_flange1.h);
  h2 = actualStream(water_flange2.h);
  
  hout1 = water.h;
  hout2 = water.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 100}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Text(extent = {{-50, 56}, {54, -42}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, textString = "WaterVolume")}));
end WaterVolume;
