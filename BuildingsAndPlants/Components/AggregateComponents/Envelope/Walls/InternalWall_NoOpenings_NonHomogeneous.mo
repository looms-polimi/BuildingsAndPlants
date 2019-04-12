within BuildingsAndPlants.Components.AggregateComponents.Envelope.Walls;
model InternalWall_NoOpenings_NonHomogeneous
  extends BaseClasses.BaseInternalWall_NoOpenings;
  BaseComponents.Envelope.SolidMultilayer_NonHomogeneous MultiLayerWall(A = L * H, s = s, ro = ro, cp = cp, lambda = lambda, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-70, -30}, {-30, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{70, -30}, {30, 30}})));
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter Length s[:] = {0.05, 0.4, 0.05} "layer thicknesses";
  parameter Density ro[:] = {1600, 2400, 1600} "layer densities";
  parameter SpecificHeatCapacity cp[:] = {400, 880, 400} "layer cps";
  parameter ThermalConductivity lambda[:] = {0.2, 1.91, 0.2} "layer thermal conds";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  //parameter Integer n=size(s,1) "number of layers";
equation
  connect(ConvSideA.wall, MultiLayerWall.side1) annotation(
  Line(points = {{-34, 0}, {-20, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, ConvSideB.wall) annotation(
  Line(points = {{16, 0}, {34, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airSide1, ConvSideA.air) annotation(
  Line(points = {{-90, 0}, {-66, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvSideB.air, airSide2) annotation(
  Line(points = {{66, 2.22045e-16}, {70, 2.22045e-16}, {70, 0}, {90, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Text(extent = {{-48, -38}, {50, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.CrossDiag, textString = "NON
HOM")}));
end InternalWall_NoOpenings_NonHomogeneous;

