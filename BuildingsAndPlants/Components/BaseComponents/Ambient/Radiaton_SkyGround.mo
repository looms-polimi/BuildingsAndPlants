within BuildingsAndPlants.Components.BaseComponents.Ambient;
model Radiaton_SkyGround "Radiation sky-ground"
  import Modelica.Constants.*;
  // Clarke, 1985
  parameter Length L = 5 "Surface length";
  parameter Length H = 3 "Surface height";
  parameter Real inclination(min = 0, max = 180) = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  // match default comp name in Ambientambient_settings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  HeatFlowRate Q_sky;
  HeatFlowRate Q_ground;
  Interfaces.Thermal.HeatPortRad wall annotation(
  Placement(transformation(extent = {{-40, -60}, {-20, 60}}, rotation = 0), iconTransformation(extent = {{-140, -40}, {-60, 40}})));
  Interfaces.Thermal.HeatPort SkyTemp annotation(
  Placement(transformation(extent = {{60, 60}, {80, 80}}), iconTransformation(extent = {{60, 60}, {100, 100}})));
  Interfaces.Thermal.HeatPort GndTemp annotation(
  Placement(transformation(extent = {{60, 60}, {80, 80}}), iconTransformation(extent = {{60, -100}, {100, -60}})));
protected
  parameter Real Fws = (1 - cos(inclination / 180 * pi)) / 2;
  parameter Real Fwg = (1 + cos(inclination / 180 * pi)) / 2;
equation
  wall.Q_flow + Q_sky + Q_ground = 0;
  Q_sky = sigma * Fws * L * H * es * (ambient_settings.Tsky ^ 4 - wall.T ^ 4);
  Q_ground = sigma * Fwg * L * H * es * eg * (ambient_settings.Tgnd ^ 4 - wall.T ^ 4);
  SkyTemp.T = ambient_settings.Tsky;
  GndTemp.T = ambient_settings.Tgnd;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 100}, {60, -60}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-12, 34}, {52, -4}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "Sky"), Text(extent = {{18, 98}, {58, 68}}, lineColor = {255, 0, 0}, textString = "AS"), Rectangle(extent = {{-60, -60}, {60, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward), Text(extent = {{-14, -64}, {56, -96}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "Gnd"), Polygon(points = {{-36, -54}, {-16, -56}, {-18, -38}, {-20, -46}, {-46, -20}, {-36, -18}, {-56, -16}, {-54, -36}, {-52, -26}, {-26, -52}, {-36, -54}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-36, 52}, {-16, 54}, {-18, 36}, {-20, 44}, {-46, 18}, {-36, 16}, {-56, 14}, {-54, 34}, {-52, 24}, {-26, 50}, {-36, 52}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           DymolaStoredErrors,
    Documentation(info="<html>
<p>This model is used in order to take into account of the sky-ground radiation....</p>
<p>It refers to an outer model that is <a href=\"BuildingsAndPlants.BoundaryConditions.AmbientConditions\">AmbientConditions</a>.</p>
</html>"));
end Radiaton_SkyGround;
