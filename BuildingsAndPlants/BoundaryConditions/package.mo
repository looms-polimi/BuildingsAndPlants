within BuildingsAndPlants;
package BoundaryConditions "Package with boundary conditions"
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248},
          fillPattern =                                                                                                                                                                             FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25.0), Line(points = {{-60, 40}, {-60, -40}, {60, -40}, {60, 40}, {30, 40}, {30, -40}, {-30, -40}, {-30, 40}, {-60, 40}, {-60, 20}, {60, 20}, {60, 0}, {-60, 0}, {-60, -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 40}, {60, 40}, {60, -40}}), Line(points = {{0, 40}, {0, -40}}), Rectangle(fillColor = {255, 215, 136},
          fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-60, 20}, {-30, 40}}), Rectangle(fillColor = {255, 215, 136},
          fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-60, 0}, {-30, 20}}), Rectangle(fillColor = {255, 215, 136},
          fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-60, -20}, {-30, 0}}), Rectangle(fillColor = {255, 215, 136},
          fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-60, -40}, {-30, -20}}), Text(extent = {{-56, 32}, {-34, 24}}, lineColor = {0, 0, 0}, textString = "Time"), Text(extent = {{-26, 32}, {-4, 24}}, lineColor = {0, 0, 0}, textString = "T sky"), Text(extent = {{4, 32}, {26, 24}}, lineColor = {0, 0, 0}, textString = "T grund"), Text(extent = {{32, 32}, {54, 24}}, lineColor = {0, 0, 0}, textString = "...")}),
    Documentation(info="<html>
<p>This package contains boundary conditions components such as for ambient conditions.</p>
</html>"));
end BoundaryConditions;
