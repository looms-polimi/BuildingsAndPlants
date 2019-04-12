within BuildingsAndPlants.Components.BaseComponents.Water.Sources;

model WaterSource_PT_fixed
  Media.Substances.SubcooledWater water;
  parameter Pressure P0 = 101325;
  parameter Temperature T0 = 273.15 + 25;
  Interfaces.Water.WaterFlange water_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  water.p = water_flange.p;
  water.p = P0;
  water.T = T0;
  // enthalpy boundary condition
  water.h = water_flange.h;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 40}, {-40, 20}}, lineColor = {0, 0, 0}, textString = "P")}));
end WaterSource_PT_fixed;
