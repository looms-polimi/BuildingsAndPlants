within BuildingsAndPlants.Components.BaseComponents.Thermal.Sources;

model SolarRadiation_OpaqueSurf
  parameter Length L = 5 "Length of the body" annotation(
  Evaluate = true);
  parameter Length H = 3 "Height of the body" annotation(
  Evaluate = true);
  parameter Area S = L * H "Surface of the body" annotation(
  Evaluate = true);
  parameter Real orientation(min = 0, max = 360) = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real inclination(min = 0, max = 180) = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient" annotation(Evaluate = true);
  // match default comp name in Ambientambient_settings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  HeatFlowRate Q_rad;
  Real alpha "Orietation coefficient";
  Real beta "Inclination coefficient";
  HeatFlux solarRad_eff;
  Real az;
  Real ze;
  Interfaces.Thermal.HeatPortRad Absorbed annotation(
  Placement(transformation(origin = {-14, 0}, extent = {{20, -10}, {-20, 10}}, rotation = 90), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-80, 2})));
equation
  az = ambient_settings.azimuth;
  ze = ambient_settings.zenith;
  // FIXME check
  // ORIGINAL
  // alpha = max(0,Modelica.Math.cos((ambient_settings.azimuth-orientation)/180*Modelica.Constants.pi));
  // beta = max(0,Modelica.Math.cos((ambient_settings.zenith-(inclination-90))/180*Modelica.Constants.pi));
  alpha = max(0, Modelica.Math.cos((az - (orientation - 90)) / 180 * Modelica.Constants.pi));
  beta = max(0, Modelica.Math.cos((ze - inclination) / 180 * Modelica.Constants.pi));
  if ze <= eps then
    solarRad_eff = 0;
  elseif inclination == 180 then
    solarRad_eff = sin(ze / 180 * Modelica.Constants.pi);
  else
    solarRad_eff = alpha * beta;
  end if;
  // solarRad_eff = ambient_settings.solarRad*(if inclination==180 then sin(ambient_settings.zenith/180*Modelica.Constants.pi) else alpha*beta);
  Q_rad = solarRad_eff * S * ambient_settings.solarRad;
  Absorbed.Q_flow = -absCoef * Q_rad;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{70, 30}, {110, -10}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{108, 30}, {110, 28}, {120, 36}, {118, 38}, {108, 30}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{90, -16}, {92, -16}, {92, -28}, {90, -28}, {90, -16}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{90, 34}, {92, 34}, {92, 44}, {90, 44}, {90, 34}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{114, 14}, {114, 12}, {128, 12}, {128, 14}, {114, 14}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{108, -8}, {110, -6}, {120, -14}, {118, -16}, {108, -8}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{60, -16}, {62, -18}, {72, -10}, {70, -8}, {60, -16}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{50, 12}, {50, 10}, {64, 10}, {64, 12}, {50, 12}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Polygon(points = {{58, 36}, {60, 38}, {70, 30}, {68, 28}, {58, 36}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-60, -100}, {0, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Forward), Polygon(points = {{40, 8}, {-10, 8}, {-10, 14}, {-28, 0}, {-10, -14}, {-10, -8}, {40, -8}, {40, 8}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28}, fillPattern = FillPattern.Solid), Text(extent = {{58, 96}, {98, 66}}, lineColor = {255, 0, 0}, textString = "AS")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SolarRadiation_OpaqueSurf;
