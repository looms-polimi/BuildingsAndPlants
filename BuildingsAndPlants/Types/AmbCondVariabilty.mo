within BuildingsAndPlants.Types;
type AmbCondVariabilty = enumeration(
    ACV_constant "All conditions constant and set to avg values",
    ACV_variable "Conditions vary according to provided ranges") "Enumeration for variability of ambient conditions" annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248},
          fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25.0), Text(extent = {{-62, 56}, {58, -52}}, lineColor = {0, 0, 255}, textString = "ACV")}),
    Documentation(info="<html>
<p>Enumeration to define variability of ambient conditions, in particular:</p>
<p>- constant, all conditions are constant and set to avarage values;</p>
<p>- variable, conditions varay according to provieded ranges.</p>
</html>"));
