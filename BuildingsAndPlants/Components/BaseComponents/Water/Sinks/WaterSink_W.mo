within BuildingsAndPlants.Components.BaseComponents.Water.Sinks;

model WaterSink_W
  Media.Substances.SubcooledWater water;
  Modelica.Blocks.Interfaces.RealInput Win annotation(
  Placement(transformation(extent = {{-72, -20}, {-30, 22}}), iconTransformation(extent = {{-74, -22}, {-30, 22}})));
  Interfaces.Water.WaterFlange water_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{100, -20}, {60, 20}})));
equation
  water.p = water_flange.p;
  water_flange.w = Win;
  water_flange.h = inStream(water_flange.h);
  // enthalpy boundary condition
  water.h = water_flange.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 40}, {-40, 20}}, lineColor = {0, 0, 0}, textString = "W"), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{68, 6}, {68, -6}, {38, -6}, {38, -12}, {18, 0}, {38, 12}, {38, 6}, {68, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
end WaterSink_W;
