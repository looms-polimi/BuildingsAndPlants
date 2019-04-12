within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;

model ExtenallWindow_Opening_DoubleGlass
  extends BaseClasses.BaseExternalWindow_Opening;
  BaseComponents.Envelope.DoubleGlass Glass(Tstart = Tstart, L = L, H = H, d_glass = d_glass, d_int = d_int, gamma = gamma_g, material_glass = material_glass, material_gas = material_gas) annotation(
  Placement(transformation(extent = {{-30, -30}, {10, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvInt(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-70, -30}, {-30, 30}})));
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter SI.Length s = 0.4 "wall thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 2400 "wall density";
  parameter SI.SpecificHeatCapacity cp = 880 "wall cp";
  parameter SI.ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  BaseComponents.Ambient.Radiaton_SkyGround RadToSkyGround(L = L, H = H, inclination = inclination, es = es, eg = eg) annotation(
  Placement(transformation(extent = {{40, 12}, {80, 52}})));
  BaseComponents.Thermal.Sources.SolarRadiation_TransparentSurf solarRadiation_OpaqueSurf(L = L, H = H, absCoef = absCoef, orientation = orientation, inclination = inclination) annotation(
  Placement(transformation(extent = {{40, 58}, {80, 98}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke ConvToExt(L = L, H = H, fixedCoeff = fixedCoeff, h0 = h0, orientation = orientation) annotation(
  Placement(transformation(extent = {{40, -40}, {80, 0}})));
  parameter Boolean fixedCoeff = false "fixed heat transfer coefficient";
  parameter SI.CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  parameter Real inclination = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient";
  parameter SI.Length d_glass = 0.02 "Width of the single glass";
  parameter SI.Length d_int = 0.05 "Distance between two glasses";
  parameter Media.Materials.Glasses.BaseGlass material_glass "Type of glass" annotation(choicesAllMatching = true);
  parameter Media.Materials.EnvelopeGases.BaseEnvelopeGas material_gas "Type of internal gas between the glasses" annotation(choicesAllMatching = true);
  parameter SI.CoefficientOfHeatTransfer gamma_g = 5 "Heat transfer coefficient between the glasses and internal gas";
  parameter SI.Pressure dpnom = 10000 "Nominal pressure drop";
  parameter SI.MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter SI.ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter SI.ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
  BaseComponents.Ambient.AmbientAirTempWithOpenings ambientAirTempWithOpenings annotation(
  Placement(transformation(extent = {{46, -84}, {84, -44}})));
  BaseComponents.Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix(dpnom = dpnom, wnom = wnom, GvOverGa = GvOverGa, Gdw0 = Gdw0, Gdwnom = Gdwnom) annotation(
  Placement(transformation(extent = {{-48, 40}, {-8, 80}})));
equation
  connect(ConvInt.wall, Glass.side1) annotation(
  Line(points = {{-34, 0}, {-20, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Trasmitted, Glass.side2) annotation(
  Line(points = {{44, 86}, {20, 86}, {20, 0}, {2.66454e-15, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvToExt.wall, Glass.side2) annotation(
  Line(points = {{44, -20}, {20, -20}, {20, 0}, {2.66454e-15, 0}, {2.66454e-15, -8.88178e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Absorbed, absToWall) annotation(
  Line(points = {{60, 62}, {32, 62}, {32, -88}, {10, -88}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(RadToSkyGround.wall, Glass.side2) annotation(
  Line(points = {{40, 32}, {20, 32}, {20, 0}, {2.66454e-15, 0}, {2.66454e-15, -8.88178e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(opening01, mix.cmd01) annotation(
  Line(points = {{-80, 80}, {-28, 80}, {-28, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Reflected, RadToSkyGround.SkyTemp) annotation(
  Line(points = {{76, 62}, {90, 62}, {90, 48}, {76, 48}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(mix.Bdryair, ambientAirTempWithOpenings.dryair) annotation (
  Line(
        points={{-10.4,66},{16,66},{16,-60},{47.52,-60}}, color={0,100,150}));
  connect(mix.Bdiffuse, ambientAirTempWithOpenings.diffuse) annotation (
  Line(
        points={{-10,60.4},{0,60.4},{0,60},{14,60},{14,-69.2},{47.9,-69.2}},
        color={255,0,0}));
  connect(ambientAirTempWithOpenings.vapour, mix.Bvapour) annotation (
  Line(
        points={{47.9,-74.8},{8,-74.8},{8,54.4},{-10,54.4}}, color={0,100,150}));
  connect(ConvInt.air, diffuse) annotation (
    Line(points={{-66,0},{-78,0},{-90,0}}, color={255,0,0}));
  connect(mix.dryair, dryair) annotation (
  Line(points={{-47.2,65.6},{-96,65.6},
          {-96,26}}, color={0,100,150}));
  connect(mix.vapour, vapour) annotation (
  Line(points={{-46.8,54.4},{-74,54.4},
          {-74,-24},{-96,-24}}, color={0,100,150}));
  connect(mix.diffuse, diffuse) annotation (
  Line(points={{-46,60.4},{-58,60.4},
          {-58,60},{-90,60},{-90,0}}, color={255,0,0}));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-30, -58}, {12, -96}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "HOM"), Rectangle(extent = {{-14, 60}, {-6, -38}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {240, 240, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-8, 38}, {12, 40}, {10, 22}, {8, 30}, {-18, 4}, {-8, 2}, {-28, 0}, {-26, 20}, {-24, 10}, {2, 36}, {-8, 38}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end ExtenallWindow_Opening_DoubleGlass;
