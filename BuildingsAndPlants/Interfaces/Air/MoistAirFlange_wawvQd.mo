within BuildingsAndPlants.Interfaces.Air;
connector MoistAirFlange_wawvQd "Interface for moist air (wa,wv)"
  MoistAirFlange_wawvQd_waPart dryair;
  MoistAirFlange_wawvQd_wvPart vapour;
  Interfaces.Thermal.HeatPort diffuse annotation ();
  annotation(
  defaultComponentName = "air_flange", Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 48}, {40, -32}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name"), Ellipse(extent = {{-40, 12}, {40, -68}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 100, 150}, fillColor = {240, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Ellipse(extent = {{-40, 0}, {40, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 50, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Ellipse(extent = {{-40, 80}, {40, 0}}, lineColor = {0, 0, 0}, fillColor = {0, 240, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-20, 20}, {20, -20}}, lineColor = {255, 0, 0}, fillColor = {255, 180, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere)}),
    Documentation(info="<html>
<p>This is an hierichal connectors, composed of:</p>
<p>- dry air connector;</p>
<p>- vapour connector;</p>
<p>- an heat port.</p>
</html>"));
end MoistAirFlange_wawvQd;
