within BuildingsAndPlants.Interfaces.Air;
connector MoistAirFlange_wawvQd_waPart "Interface for moist air (wa,wv) - wa part"
  AbsolutePressure pa "Total pressure";
  flow MassFlowRate wa "Dry air mass flowrate";
  stream SpecificEnthalpy ha "Dry air enthalpy";
  annotation(
  defaultComponentName = "air_flange", Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 100, 150}, fillColor = {240, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Ellipse(extent = {{-40, 80}, {40, 0}}, lineColor = {0, 0, 0}, fillColor = {0, 240, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}),
    Documentation(info="<html>
<p>This connector is composed of:</p>
<p>- a potential variable &QUOT;pa&QUOT; which is the <u>total</u> pressure [Pa];</p>
<p>- a flow variable &QUOT;wa&QUOT; which is the <u>dry</u> air mass flowrate [kg/s];</p>
<p>- a stream variable &QUOT;ha&QUOT; which is the <u>dry</u> air enthalpy [J/kg].</p>
</html>"));
end MoistAirFlange_wawvQd_waPart;
