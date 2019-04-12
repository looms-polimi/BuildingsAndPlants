within BuildingsAndPlants.Interfaces.Thermal;
connector HeatPort "Heat port"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {255, 0, 0}, fillColor = {255, 180, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere)}),
      Documentation(info="<html>
<p>MSL thermal port</p>
</html>"));
end HeatPort;
