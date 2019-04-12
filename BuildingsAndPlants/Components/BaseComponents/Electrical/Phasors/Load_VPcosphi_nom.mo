within BuildingsAndPlants.Components.BaseComponents.Electrical.Phasors;
model Load_VPcosphi_nom
  parameter Voltage Vnom = 100 "nominal V";
  parameter Frequency fnom = 50 "nominal f";
  parameter Power Pnom = 100 "nominal active P at Vnom,fnom";
  parameter Real cphinom = 0.9 "nominal power factor";
  Voltage Vre, Vim;
  Current Ire, Iim;
  Resistor res(R = R) annotation(
  Placement(transformation(extent = {{-36, -10}, {-16, 10}})));
  Inductor ind(L = L, fo = fnom) annotation(
  Placement(transformation(extent = {{20, -10}, {40, 10}})));
  Interfaces.Electrical.PositivePhasorPin p annotation(
  Placement(transformation(extent = {{-90, -10}, {-70, 10}}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
  Interfaces.Electrical.NegativePhasorPin n annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
protected
  parameter Resistance R = Vnom ^ 2 * cphinom ^ 2 / Pnom;
  parameter Inductance L = Vnom ^ 2 * cphinom / Pnom / (2 * pi * fnom) * sqrt(1 - cphinom ^ 2);
equation
  Vre = p.vre - n.vre;
  Vim = p.vim - n.vim;
  Ire = p.ire;
  Iim = p.iim;
  connect(res.n, ind.p) annotation(
  Line(points = {{-18, 0}, {22, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(p, res.p) annotation(
  Line(points = {{-80, 0}, {-34, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ind.n, n) annotation(
  Line(points = {{38, 0}, {80, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 20}, {62, -20}}, lineColor = {0, 0, 100}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder), Line(points = {{-80, 0}, {-60, 0}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{60, 0}, {80, 0}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Text(extent = {{-22, 12}, {26, -12}}, lineColor = {0, 0, 0}, textString = "RL")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Load_VPcosphi_nom;

