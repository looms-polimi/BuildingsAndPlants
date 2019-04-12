within BuildingsAndPlants.Interfaces.Thermal;
connector HeatPortRad
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {255, 0, 0}, fillColor = {255, 180, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {255, 255, 255}), Line(points = {{40, 60}}, color = {255, 255, 0}, smooth = Smooth.None), Polygon(points = {{-60, 0}, {-60, -60}, {0, -60}, {-22, -40}, {70, 50}, {50, 70}, {-40, -20}, {-60, 0}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end HeatPortRad;
