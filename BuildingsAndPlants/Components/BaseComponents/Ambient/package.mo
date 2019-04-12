within BuildingsAndPlants.Components.BaseComponents;
package Ambient "Package with Ambient components"
  annotation(
  Icon(graphics={  Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248},
            fillPattern =                                                                                       FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25.0), Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {180, 180, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, fillColor = {180, 255, 255}), Rectangle(extent = {{-80, -40}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward), Ellipse(extent = {{-30, 66}, {30, 6}}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere)}),
      Documentation(info="<html>
<p>This package contains model for ambient elements. Each model refers to an outer model that is <a href=\"BuildingsAndPlants.BoundaryConditions.AmbientConditions\">AmbientConditions</a> ,which contains all the infomration needed.</p>
</html>"));
end Ambient;
