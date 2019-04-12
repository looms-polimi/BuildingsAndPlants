within BuildingsAndPlants.Interfaces.Air;
connector MoistAirFlange_wawvQd_wvPart "Interface for moist air (wa,wv) - wv part"
  AbsolutePressure pv "Vapour pressure";
  flow MassFlowRate wv "Vapour mass flowrate";
  stream SpecificEnthalpy hv "Vapour enthalpy";
  annotation(
  defaultComponentName = "air_flange", Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor=
              {0,0,0},                                                                                                                                                                                                    fillColor=
              {0,0,255},
            fillPattern=FillPattern.Solid),                                                                                                                                                                                                        Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 100, 150}, fillColor = {240, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Ellipse(extent = {{-40, 0}, {40, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 50, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}),
    Documentation(info="<html>
<p>This connector is composed of:</p>
<p>- a potential variable &QUOT;pv&QUOT; which is the <u>vapour</u> pressure [Pa];</p>
<p>- a flow variable &QUOT;wv&QUOT; which is the <u>vapour</u> air mass flowrate [kg/s];</p>
<p>- two stream variables &QUOT;hv&QUOT; which is <u>vapour</u> specifc enthalpy [J/kg].</p>
</html>"));
end MoistAirFlange_wawvQd_wvPart;
