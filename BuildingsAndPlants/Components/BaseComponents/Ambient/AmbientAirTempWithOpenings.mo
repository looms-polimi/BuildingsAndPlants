within BuildingsAndPlants.Components.BaseComponents.Ambient;
model AmbientAirTempWithOpenings "Ambient air temperature with openings"
  // match default comp name in AmbientSettings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  Media.Substances.MoistAir air;
  Interfaces.Thermal.HeatPort port annotation(
  Placement(transformation(extent = {{-80, 40}, {-60, 80}}, rotation = 0), iconTransformation(extent = {{-100, 20}, {-60, 80}})));
  //Interfaces.Air.MoistAirFlange_wawvQd air_flange annotation(Placement(transformation(extent = {{-100, -40}, {-80, -20}}), iconTransformation(extent = {{-100, -40}, {-60, 0}})));
public
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_waPart
                                              dryair
    annotation (
    Placement(transformation(extent={{-102,10},{-82,30}})));
  BuildingsAndPlants.Interfaces.Air.MoistAirFlange_wawvQd_wvPart
                                              vapour
    annotation (
    Placement(transformation(extent={{-100,-48},{-80,-28}}),
        iconTransformation(extent={{-100,-64},{-80,-44}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort
                              diffuse
    annotation (
    Placement(transformation(extent={{-100,-20},{-80,0}}),
        iconTransformation(extent={{-100,-36},{-80,-16}})));
equation
  port.T = ambient_settings.Tamb;
  air.p = ambient_settings.pa_avg;
  air.T = ambient_settings.Tamb;
  air.X = ambient_settings.Xa_avg;
//   air_flange.dryair.pa = air.p;
//   air_flange.dryair.ha = air.cp * air.T;
//   air_flange.vapour.pv = air.pv;
//   air_flange.vapour.hv = air.hv;
//   air_flange.diffuse.T = air.T;
  dryair.pa = air.p;
  dryair.ha = air.cp * air.T;
  vapour.pv = air.pv;
  vapour.hv = air.hv;
  diffuse.T = air.T;
  annotation(
  Line(points = {{-70, 60}, {-69, 60}, {-69, 60}, {-70, 60}}, color = {255, 0, 0}, smooth = Smooth.None), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, -60}, {80, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward), Rectangle(extent = {{-60, 80}, {80, -60}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-16, 16}, {70, -60}}, lineColor = {0, 0, 0}, textString = "Amb"), Text(extent = {{38, 78}, {78, 48}}, lineColor = {255, 0, 0}, textString = "AS"), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-18, 20}, rotation = 90)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>This model is used in order to set ambient air temperature....</p>
<p>It refers to an outer model that is <a href=\"BuildingsAndPlants.BoundaryConditions.AmbientConditions\">AmbientConditions</a>.</p>
</html>"));
end AmbientAirTempWithOpenings;
