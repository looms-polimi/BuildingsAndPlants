within BuildingsAndPlants.Interfaces.Water;
connector WaterFlange "Interface for water"
  AbsolutePressure p "Pressure";
  flow MassFlowRate w "Mass flowrate";
  stream SpecificEnthalpy h "Outflowing specific enthalpy";
  annotation(
  defaultComponentName = "water_flange", Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-146, 104}, {154, 44}}, textString = "%name"), Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 50}, fillColor = {0, 100, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere)}),
    Documentation(info="<html>
<p>This connector is composed of:</p>
<p>- a potential variable &QUOT;p&QUOT; which is the pressure [Pa];</p>
<p>- a flow variable &QUOT;w&QUOT; which is the water mass flowrate [kg/s];</p>
<p>- two stream variables &QUOT;h&QUOT; which is specifc enthalpy [J/kg].</p>
</html>"));
end WaterFlange;
