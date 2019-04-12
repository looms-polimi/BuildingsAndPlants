within BuildingsAndPlants.Components.AggregateComponents.Envelope.Walls;

model ExtenallWall_NoOpenings_Homogeneous
  extends BaseClasses.BaseExternalWall_NoOpenings;
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter SI.Length s = 0.4 "wall thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 2400 "wall density";
  parameter SI.SpecificHeatCapacity cp = 880 "wall cp";
  parameter SI.ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  parameter Boolean fixedCoeff = false "fixed heat transfer coefficient";
  parameter SI.CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  parameter Real inclination = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient";
  BaseComponents.Envelope.SolidMultilayer_Homogeneous MultiLayerWall(A = L * H, s = s, ro = ro, cp = cp, lambda = lambda, n = n, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-30, -30}, {10, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvInt(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-70, -30}, {-30, 30}})));
  BaseComponents.Ambient.Radiaton_SkyGround RadToSkyGround(L = L, H = H, inclination = inclination, es = es, eg = eg) annotation(
  Placement(transformation(extent = {{40, -20}, {80, 20}})));
  BaseComponents.Thermal.Sources.SolarRadiation_OpaqueSurf solarRadiation_OpaqueSurf(L = L, H = H, absCoef = absCoef, orientation = orientation, inclination = inclination) annotation(
  Placement(transformation(extent = {{40, 40}, {80, 80}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke ConvToExt(L = L, H = H, fixedCoeff = fixedCoeff, h0 = h0, orientation = orientation) annotation(
  Placement(transformation(extent = {{40, -80}, {80, -40}})));
equation
  connect(ConvInt.wall, MultiLayerWall.side1) annotation(
  Line(points = {{-34, 0}, {-20, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airInt, ConvInt.air) annotation(
  Line(points = {{-90, 0}, {-66, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, RadToSkyGround.wall) annotation(
  Line(points = {{2.22045e-015, 0}, {40, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, solarRadiation_OpaqueSurf.Absorbed) annotation(
  Line(points = {{2.22045e-15, 0}, {20, 0}, {20, 60.4}, {44, 60.4}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, ConvToExt.wall) annotation(
  Line(points = {{0, 0}, {20, 0}, {20, -60}, {44, -60}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-30, -58}, {12, -96}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.CrossDiag, textString = "HOM")}));
end ExtenallWall_NoOpenings_Homogeneous;
