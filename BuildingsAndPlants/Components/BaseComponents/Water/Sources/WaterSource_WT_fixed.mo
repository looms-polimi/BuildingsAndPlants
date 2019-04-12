within BuildingsAndPlants.Components.BaseComponents.Water.Sources;

model WaterSource_WT_fixed
  Media.Substances.SubcooledWater water;
  parameter Temperature T0 = 273.15 + 25;
  parameter MassFlowRate W0;
  Interfaces.Water.WaterFlange water_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  water_flange.w = -W0;
  water.T = T0;
  water.p = water_flange.p;
  // enthalpy boundary condition
  water.h = water_flange.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 40}, {-40, 20}}, lineColor = {0, 0, 0}, textString = "W")}));
end WaterSource_WT_fixed;
