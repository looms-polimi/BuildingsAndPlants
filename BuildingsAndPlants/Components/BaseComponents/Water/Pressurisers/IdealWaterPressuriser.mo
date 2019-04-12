within BuildingsAndPlants.Components.BaseComponents.Water.Pressurisers;

model IdealWaterPressuriser
  parameter Pressure p "Fixed pressure";
  BuildingsAndPlants.Interfaces.Water.WaterFlange flange(w(min=0)) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2.66454e-15, -2}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
equation
  flange.p = p;
  flange.h = 0 "Bogus value, will never be used";
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(origin = {4, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 32}, {2, 10}}), Ellipse(origin = {-2, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, extent = {{-34, 96}, {36, 26}}, endAngle = 360)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end IdealWaterPressuriser;
