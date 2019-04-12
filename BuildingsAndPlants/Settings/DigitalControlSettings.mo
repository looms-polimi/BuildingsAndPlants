within BuildingsAndPlants.Settings;
model DigitalControlSettings " Digital control settings"
  parameter Time Ts = 0.1;
  annotation(
  defaultComponentName = "digital_control_settings", defaultComponentPrefixes = "inner", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {180, 180, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere, fillColor = {255, 255, 255}), Rectangle(extent = {{-70, 70}, {-32, 8}}, lineColor = {0, 0, 0}), Rectangle(extent = {{32, 30}, {70, -32}}, lineColor = {0, 0, 0}), Rectangle(extent = {{-28, -10}, {10, -72}}, lineColor = {0, 0, 0}), Line(points = {{-32, 20}, {-26, 20}, {32, 20}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{10, -20}, {18, -20}, {32, -20}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-32, 54}, {-26, 54}, {0, 54}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{-60, -40}, {-54, -40}, {-28, -40}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{10, -56}, {16, -56}, {42, -56}}, color = {0, 0, 0}, smooth = Smooth.None)}),
    Documentation(info="<html>
<p>Define settings as far as the digital control.</p>
</html>"));
end DigitalControlSettings;
