within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model Vgen_Sine_Fixed
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Voltage V = 100;
  parameter Angle phi = 0;
equation
  Vre = V * cos(phi);
  Vim = V * sin(phi);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 210}, fillColor = {250, 255, 255}, fillPattern = FillPattern.Sphere)}));
end Vgen_Sine_Fixed;

