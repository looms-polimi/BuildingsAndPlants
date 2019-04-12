within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model R_plus_jX
  extends BuildingsAndPlants.Interfaces.Electrical.PhasorTwoPin;
  parameter Resistance R = 1;
  parameter Reactance X = 1;
equation
  Vre = R * Ire - X * Iim;
  Vim = R * Iim + X * Ire;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 30}, {60, -32}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {250, 250, 255}), Text(extent = {{-46, 22}, {48, -22}}, lineColor = {255, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "R+jX")}));
end R_plus_jX;

