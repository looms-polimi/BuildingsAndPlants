within BuildingsAndPlants.Components.BaseComponents.Ambient;
model AmbientAirTemp "Ambient air temperature"
  // match default comp name in AmbientSettings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  Interfaces.Thermal.HeatPort port annotation(
  Placement(transformation(extent = {{-80, 40}, {-60, 80}}, rotation = 0), iconTransformation(extent = {{-100, -40}, {-60, 80}})));
equation
  port.T = ambient_settings.Tamb;
  annotation(
  Line(points = {{-70, 60}, {-69, 60}, {-69, 60}, {-70, 60}}, color = {255, 0, 0}, smooth = Smooth.None), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, -60}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward), Rectangle(extent = {{-60, 80}, {80, -60}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-16, 16}, {70, -60}}, lineColor = {0, 0, 0}, textString = "Amb"), Text(extent = {{38, 78}, {78, 48}}, lineColor = {255, 0, 0}, textString = "AS"), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-18, 20}, rotation = 90)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>This model is used to set the ambient air temperature in the model. It refers to an outer model that is <a href=\"BuildingsAndPlants.BoundaryConditions.AmbientConditions\">AmbientConditions</a>.</p>
</html>"));
end AmbientAirTemp;
