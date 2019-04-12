within BuildingsAndPlants.Components.AggregateComponents.Electrical.BaseClasses;
partial model BaseInverter
  Interfaces.Electrical.PositivePhasorPin ACp annotation(
  Placement(transformation(extent = {{80, 50}, {100, 70}})));
  Interfaces.Electrical.NegativePhasorPin ACn annotation(
  Placement(transformation(extent = {{80, -70}, {100, -50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin DCp annotation(
  Placement(transformation(extent = {{-100, 50}, {-80, 70}}), iconTransformation(extent = {{-100, 50}, {-80, 70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin DCn annotation(
  Placement(transformation(extent = {{-100, -70}, {-80, -50}}), iconTransformation(extent = {{-100, -70}, {-80, -50}})));
  Modelica.Blocks.Interfaces.RealOutput Qloss annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 90}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 90})));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 60}, {-70, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-80, -60}, {-70, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, 60}, {82, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, -60}, {82, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Polygon(points = {{70, -80}, {-70, -80}, {70, 80}, {70, -80}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillPattern = FillPattern.Sphere, fillColor = {240, 240, 255}), Polygon(points = {{-70, 80}, {-70, -80}, {70, 80}, {-70, 80}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillPattern = FillPattern.Sphere, fillColor = {200, 200, 255}), Line(points = {{-50, 60}, {-10, 60}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-50, 40}, {-10, 40}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{10, -60}, {50, -60}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{10, -40}, {14, -32}, {18, -26}, {22, -26}, {26, -32}, {34, -48}, {38, -54}, {42, -54}, {46, -48}, {50, -40}}, color = {0, 0, 0}, smooth = Smooth.None)}));
end BaseInverter;

