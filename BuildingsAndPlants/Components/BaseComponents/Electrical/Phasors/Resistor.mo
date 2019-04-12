within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model Resistor
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Resistance R = 1;
equation
  Vre = R * Ire;
  Vim = R * Iim;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 30}, {60, -32}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {250, 250, 255}), Text(extent = {{-20, 22}, {24, -22}}, lineColor = {255, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}, textString = "R", textStyle = {TextStyle.Bold})}));
end Resistor;

