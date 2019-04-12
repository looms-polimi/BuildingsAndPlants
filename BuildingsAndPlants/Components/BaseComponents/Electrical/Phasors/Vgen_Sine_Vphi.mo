within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model Vgen_Sine_Vphi
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  Modelica.Blocks.Interfaces.RealInput V annotation(
  Placement(transformation(extent = {{-160, 50}, {-120, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {40, 80})));
  Modelica.Blocks.Interfaces.RealInput phi annotation(
  Placement(transformation(extent = {{-158, 6}, {-118, 46}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {-40, 80})));
equation
  Vre = V * cos(phi);
  Vim = V * sin(phi);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 210}, fillColor = {250, 255, 255}, fillPattern = FillPattern.Sphere)}));
end Vgen_Sine_Vphi;

