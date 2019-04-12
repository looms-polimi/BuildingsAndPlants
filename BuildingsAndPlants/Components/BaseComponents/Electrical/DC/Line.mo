within BuildingsAndPlants.Components.BaseComponents.Electrical.DC;

model Line
  parameter Length Lw = 10 "Wire length";
  Modelica.Electrical.Analog.Interfaces.PositivePin p_in "input positive pin" annotation(
  Placement(transformation(extent = {{-100, 20}, {-80, 40}}, rotation = 0), iconTransformation(extent = {{-100, 20}, {-80, 40}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n_in "input negative pin" annotation(
  Placement(transformation(extent = {{-100, -40}, {-80, -20}}, rotation = 0), iconTransformation(extent = {{-100, -40}, {-80, -20}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p_out "output positive pin" annotation(
  Placement(transformation(extent = {{80, 20}, {100, 40}}, rotation = 0), iconTransformation(extent = {{80, 20}, {100, 40}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n_out "output negative pin" annotation(
  Placement(transformation(extent = {{80, -40}, {100, -20}}, rotation = 0), iconTransformation(extent = {{80, -40}, {100, -20}})));
  Modelica.Electrical.Analog.Basic.Resistor rp(R = 0.02 * Lw) annotation(
  Placement(transformation(extent = {{-10, 10}, {10, 30}})));
  Modelica.Electrical.Analog.Basic.Resistor rn(R = 0.02 * Lw) annotation(
  Placement(transformation(extent = {{-10, -30}, {10, -10}})));
equation
  connect(p_in, rp.p) annotation(
  Line(points = {{-90, 30}, {-50, 30}, {-50, 20}, {-10, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(rp.n, p_out) annotation(
  Line(points = {{10, 20}, {50, 20}, {50, 30}, {90, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(n_in, rn.p) annotation(
  Line(points = {{-90, -30}, {-50, -30}, {-50, -20}, {-10, -20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(rn.n, n_out) annotation(
  Line(points = {{10, -20}, {50, -20}, {50, -30}, {90, -30}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-88, 30}, {-60, 20}, {-40, -20}, {-20, 20}, {0, -20}, {20, 20}, {40, -20}, {60, 20}, {90, 30}}, color = {0, 0, 0}, smooth = Smooth.Bezier, thickness = 0.5), Line(points = {{-90, 27}, {-60, 15}, {-40, -25}, {-20, 15}, {3.06162e-15, -25}, {20, 15}, {40, -25}, {60, 15}, {90, 25}}, color = {0, 0, 0}, smooth = Smooth.Bezier, origin = {0, -5}, rotation = 180, thickness = 0.5), Text(extent = {{-100, -80}, {100, -40}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-100, 40}, {100, 80}}, lineColor = {0, 0, 255}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "%Lw m")}));
end Line;
