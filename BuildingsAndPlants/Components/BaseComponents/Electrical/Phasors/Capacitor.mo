within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;

model Capacitor
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Capacitance C = 0.01;
  parameter Frequency fo = 50;
equation
  Vre = Iim / (2 * pi * fo * C);
  Vim = -Ire / (2 * pi * fo * C);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-20, 22}, {24, -22}}, lineColor = {255, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "C"), Rectangle(extent = {{-66, 4}, {-30, -4}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {250, 250, 255}), Rectangle(extent = {{32, 4}, {68, -4}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {250, 250, 255}), Rectangle(extent = {{-40, 6}, {40, -6}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {150, 150, 255}, origin = {-26, 0}, rotation = 90), Rectangle(extent = {{-40, 6}, {40, -6}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {150, 150, 255}, origin = {26, 0}, rotation = 90)}));
end Capacitor;
