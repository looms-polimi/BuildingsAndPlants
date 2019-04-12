within BuildingsAndPlants.Components.BaseComponents.Water.Sources;

model WaterSource_PT
  Media.Substances.SubcooledWater water;
  Modelica.Blocks.Interfaces.RealInput Pin annotation(
  Placement(transformation(extent = {{-72, 8}, {-30, 50}}), iconTransformation(extent = {{-74, 8}, {-30, 52}})));
  Modelica.Blocks.Interfaces.RealInput Tin annotation(
  Placement(transformation(extent = {{-72, -52}, {-30, -10}}), iconTransformation(extent = {{-74, -52}, {-30, -8}})));
  Interfaces.Water.WaterFlange water_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  water.p = water_flange.p;
  water.p = Pin;
  water.T = Tin;
  // enthalpy boundary condition
  water.h = water_flange.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 62}, {-40, 42}}, lineColor = {0, 0, 0}, textString = "P"), Text(extent = {{-60, -40}, {-40, -60}}, lineColor = {0, 0, 0}, textString = "T"), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
end WaterSource_PT;
