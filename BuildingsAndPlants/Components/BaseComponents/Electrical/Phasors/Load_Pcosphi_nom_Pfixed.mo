within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;

model Load_Pcosphi_nom_Pfixed
  parameter Power Pnom = 10 "Nominal power";
  parameter Real cphinom = 0.9 "nominal power factor";
  Voltage Vre, Vim;
  Current Ire, Iim;
  Interfaces.Electrical.PositivePhasorPin p annotation(
  Placement(transformation(extent = {{-90, -10}, {-70, 10}}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
  Interfaces.Electrical.NegativePhasorPin n annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
equation
  p.ire + n.ire = 0;
  p.iim + n.iim = 0;
  Vre = p.vre - n.vre;
  Vim = p.vim - n.vim;
  Ire = p.ire;
  Iim = p.iim;
  Vre * Ire + Vim * Iim = Pnom;
  atan2(Iim, Ire) - atan2(Vim, Vre) = acos(cphinom);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 20}, {62, -20}}, lineColor = {0, 0, 100}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder), Line(points = {{-80, 0}, {-60, 0}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{60, 0}, {80, 0}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Text(extent = {{-44, 18}, {52, -16}}, lineColor = {0, 0, 0}, textString = "P, cos(phi)")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Load_Pcosphi_nom_Pfixed;
