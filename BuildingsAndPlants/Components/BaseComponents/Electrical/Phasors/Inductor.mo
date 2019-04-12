within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;

model Inductor
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Inductance L = 0.01;
  parameter Frequency fo = 50;
equation
  Vre = -2 * pi * fo * L * Iim;
  Vim = 2 * pi * fo * L * Ire;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 32}, {60, -30}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {250, 250, 255}), Text(extent = {{-18, 24}, {26, -20}}, lineColor = {255, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "L")}));
end Inductor;
