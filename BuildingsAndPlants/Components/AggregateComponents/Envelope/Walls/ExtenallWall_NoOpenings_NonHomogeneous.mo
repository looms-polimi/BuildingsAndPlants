within BuildingsAndPlants.Components.AggregateComponents.Envelope.Walls;

model ExtenallWall_NoOpenings_NonHomogeneous
  extends BaseClasses.BaseExternalWall_NoOpenings;
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter Length s[:] = {0.05, 0.4, 0.05} "layer thicknesses";
  parameter Density ro[:] = {1600, 2400, 1600} "layer densities";
  parameter SpecificHeatCapacity cp[:] = {400, 880, 400} "layer cps";
  parameter ThermalConductivity lambda[:] = {0.2, 1.91, 0.2} "layer thermal conds";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  parameter Boolean fixedCoeff = false "fixed heat transfer coefficient";
  parameter SI.CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  parameter Real inclination = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient";
  BaseComponents.Envelope.SolidMultilayer_NonHomogeneous MultiLayerWall(A = L * H, s = s, ro = ro, cp = cp, lambda = lambda, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-24, -30}, {16, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvInt(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-74, -30}, {-34, 30}})));
  BaseComponents.Ambient.Radiaton_SkyGround RadToSkyGround(L = L, H = H, inclination = inclination, es = es, eg = eg) annotation(
  Placement(transformation(extent = {{40, -20}, {80, 20}})));
  BaseComponents.Thermal.Sources.SolarRadiation_OpaqueSurf solarRadiation_OpaqueSurf(L = L, H = H, absCoef = absCoef, orientation = orientation, inclination = inclination) annotation(
  Placement(transformation(extent = {{40, 40}, {80, 80}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke ConvToExt(L = L, H = H, fixedCoeff = fixedCoeff, h0 = h0, orientation = orientation) annotation(
  Placement(transformation(extent = {{40, -80}, {80, -40}})));
equation
  connect(ConvInt.wall, MultiLayerWall.side1) annotation(
  Line(points = {{-38, 0}, {-24, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airInt, ConvInt.air) annotation(
  Line(points = {{-90, 0}, {-70, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, RadToSkyGround.wall) annotation(
  Line(points = {{12, 0}, {40, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, solarRadiation_OpaqueSurf.Absorbed) annotation(
  Line(points = {{12, 0}, {24, 0}, {24, 60.4}, {44, 60.4}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, ConvToExt.wall) annotation(
  Line(points = {{12, 0}, {24, 0}, {24, -60}, {44, -60}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-56, -42}, {38, -106}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.CrossDiag, textString = "NON
HOM")}));
end ExtenallWall_NoOpenings_NonHomogeneous;
