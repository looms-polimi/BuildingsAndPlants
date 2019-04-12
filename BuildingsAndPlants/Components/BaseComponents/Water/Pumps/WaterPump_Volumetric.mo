within BuildingsAndPlants.Components.BaseComponents.Water.Pumps;
model WaterPump_Volumetric
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter VolumeFlowRate qmax = 0.0005 "volume flowrate at cmd=1";
  parameter VolumeFlowRate qstart = 0;
  parameter Time T = 0.5 "pump TC";
  VolumeFlowRate q(start = qstart);
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
  Placement(transformation(extent = {{-68, 46}, {-26, 88}}), iconTransformation(extent = {{-68, 42}, {-36, 74}})));
equation
  // no mass storage inside the pump
  w1 + w2 = 0;
  // pump dynamics
  q + T * der(q) = cmd * qmax;
  // variable mass flow rate
  w1 = water.d * q;
  water.p = 0.5 * (p1 + p2);
  // mean fluid pressure
  // energy conservation
  hout1 = inStream(water_flange2.h);
  hout2 = inStream(water_flange1.h);
  // enthalpy boundary condition
  hout2 = water.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Ellipse(extent = {{-70, 68}, {70, -72}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-52, 18}, {-52, -18}, {-20, -18}, {-20, -54}, {62, 0}, {-20, 56}, {-20, 18}, {-52, 18}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
end WaterPump_Volumetric;

