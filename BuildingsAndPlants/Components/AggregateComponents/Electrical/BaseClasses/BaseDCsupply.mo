within BuildingsAndPlants.Components.AggregateComponents.Electrical.BaseClasses;

partial model BaseDCsupply
  Interfaces.Electrical.PositivePhasorPin ACp annotation(
  Placement(transformation(extent = {{-100, 50}, {-80, 70}}), iconTransformation(extent = {{-100, 50}, {-80, 70}})));
  Interfaces.Electrical.NegativePhasorPin ACn annotation(
  Placement(transformation(extent = {{-100, -70}, {-80, -50}}), iconTransformation(extent = {{-100, -70}, {-80, -50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin DCp annotation(
  Placement(transformation(extent = {{80, 50}, {100, 70}}), iconTransformation(extent = {{80, 50}, {100, 70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin DCn annotation(
  Placement(transformation(extent = {{80, -70}, {100, -50}}), iconTransformation(extent = {{80, -70}, {100, -50}})));
  Modelica.Blocks.Interfaces.RealOutput Qloss annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 88}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 90})));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 60}, {-70, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-80, -60}, {-70, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, 60}, {82, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, -60}, {82, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Polygon(points = {{-70, 80}, {-70, -80}, {70, 80}, {-70, 80}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillPattern = FillPattern.Sphere, fillColor = {240, 240, 255}), Polygon(points = {{70, -80}, {-70, -80}, {70, 80}, {70, -80}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillPattern = FillPattern.Sphere, fillColor = {200, 200, 255}), Line(points = {{12, -36}, {52, -36}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{12, -56}, {52, -56}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-48, 22}, {-8, 22}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-48, 42}, {-44, 50}, {-40, 56}, {-36, 56}, {-32, 50}, {-24, 34}, {-20, 28}, {-16, 28}, {-12, 34}, {-8, 42}}, color = {0, 0, 0}, smooth = Smooth.None)}));
end BaseDCsupply;
