within BuildingsAndPlants.Components.BaseComponents.Air.Pdrops;

model AirPdrop_Lin_Gcmd01
  extends Interfaces.Air.PartialTwoPort_waxa;
  parameter Real kf = 5 "Friction coefficient";
  parameter SI.Length dz = 1 "Length of the press. drop";
  Modelica.Blocks.Interfaces.RealInput cmd01 annotation(
  Placement(transformation(extent = {{-62, 34}, {-22, 74}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 40})));
protected
  parameter Real G = 1 / kf / dz "Equivalent conductance";
equation
  // No mass storage
  wa1 + wa2 = 0;
  // Linear pressure drop
  (pa1 - pa2) * G * cmd01 = wa1;
  // other equations
  haout1 = inStream(air_flange2.ha);
  haout2 = inStream(air_flange1.ha);
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 20}, {60, -20}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid)}));
end AirPdrop_Lin_Gcmd01;
