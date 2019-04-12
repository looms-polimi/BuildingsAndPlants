within BuildingsAndPlants.Components.BaseComponents.Ambient;
model GroundTemp "Ground temperature"
  // match default comp name in AmbientSettings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  Interfaces.Thermal.HeatPort port annotation(
  Placement(transformation(extent = {{-80, -40}, {-60, 0}}, rotation = 0), iconTransformation(extent = {{-100, -80}, {-60, 0}})));
equation
  port.T = ambient_settings.Tgnd;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 0}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                 FillPattern.Forward), Rectangle(extent = {{-60, 80}, {80, 0}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{2, -42}, {78, -80}}, lineColor = {0, 0, 0}, textString = "Gnd"), Text(extent = {{38, 78}, {78, 48}}, lineColor = {255, 0, 0}, textString = "AS"), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-16, -20}, rotation = 90)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>This model is used to set the ground temperature in the model. It refers to an outer model that is <a href=\"BuildingsAndPlants.BoundaryConditions.AmbientConditions\">AmbientConditions</a>.</p>
</html>"));
end GroundTemp;
