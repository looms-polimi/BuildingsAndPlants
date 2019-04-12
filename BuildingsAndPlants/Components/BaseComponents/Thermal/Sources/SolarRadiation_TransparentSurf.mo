within BuildingsAndPlants.Components.BaseComponents.Thermal.Sources;
model SolarRadiation_TransparentSurf
  parameter Length L = 5 "Length of the glass" annotation(Evaluate = true);
  parameter Length H = 3 "Height of the glass" annotation(Evaluate = true);
  parameter Area S = L * H "Surface of the glass" annotation(Evaluate = true);
  parameter Real orientation(min = 0, max = 360) = 0
    "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real inclination(min = 0, max = 180) = 90
    "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.01 "Absorbed coefficient" annotation(Evaluate = true);
  parameter Real trasCoef = 0.9 "Trasmitted coefficient" annotation(Evaluate = true);
  // match default comp name in AmbientSettings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  HeatFlowRate Q_rad;
  Real alpha "Orietation coefficient";
  Real beta "Inclination coefficient";
  HeatFlux solarRad_eff;
  Real az;
  Real ze;
  Interfaces.Thermal.HeatPortRad Trasmitted annotation(
  Placement(transformation(extent = {{-80, 20}, {-60, 60}}, rotation = 0), iconTransformation(extent = {{-100, 20}, {-60, 60}})));
  Interfaces.Thermal.HeatPortRad Absorbed annotation(
  Placement(transformation(origin = {-14, -40}, extent = {{-20, -10}, {20, 10}}, rotation = 90), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -80})));
  Interfaces.Thermal.HeatPortRad Reflected annotation(
  Placement(transformation(origin = {16, -40}, extent = {{-20, -10}, {20, 10}}, rotation = 90), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {80, -80})));
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
  elseif not
            (inclination < 180 or inclination > 180) then
    solarRad_eff = sin(ze / 180 * Modelica.Constants.pi);
  else
    solarRad_eff = alpha * beta;
  end if;
  // solarRad_eff = ambient_settings.solarRad*(if inclination==180 then sin(ambient_settings.zenith/180*Modelica.Constants.pi) else alpha*beta);
  Q_rad = solarRad_eff * S * ambient_settings.solarRad;
  Absorbed.Q_flow = -absCoef * Q_rad;
  Trasmitted.Q_flow = -trasCoef * Q_rad;
  Absorbed.Q_flow + Trasmitted.Q_flow + Reflected.Q_flow + Q_rad = 0;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-20, 100}, {20, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {213, 245, 255},
            fillPattern =                                                                                                    FillPattern.Solid), Ellipse(extent = {{60, 20}, {100, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{98, 20}, {100, 18}, {110, 26}, {108, 28}, {98, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{80, -26}, {82, -26}, {82, -38}, {80, -38}, {80, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{80, 24}, {82, 24}, {82, 34}, {80, 34}, {80, 24}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{104, 4}, {104, 2}, {118, 2}, {118, 4}, {104, 4}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{98, -18}, {100, -16}, {110, -24}, {108, -26}, {98, -18}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{50, -26}, {52, -28}, {62, -20}, {60, -18}, {50, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{40, 2}, {40, 0}, {54, 0}, {54, 2}, {40, 2}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{48, 26}, {50, 28}, {60, 20}, {58, 18}, {48, 26}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{46, 50}, {-34, 50}, {-34, 58}, {-60, 40}, {-34, 22}, {-34, 30}, {46, 30}, {46, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Polygon(points = {{46, -32}, {14, -32}, {14, -26}, {-4, -40}, {14, -54}, {14, -48}, {46, -48}, {46, -32}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{-24, 100}, {-20, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{20, 100}, {24, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                    FillPattern.Solid), Text(extent = {{58, 96}, {98, 66}}, lineColor = {255, 0, 0}, textString = "AS"), Polygon(points = {{26, -72}, {38, -72}, {38, -66}, {56, -80}, {38, -94}, {38, -88}, {26, -88}, {26, -72}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 28},
            fillPattern =                                                                                                    FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SolarRadiation_TransparentSurf;

