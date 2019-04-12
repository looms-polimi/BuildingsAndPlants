within BuildingsAndPlants.Components.AggregateComponents.Envelope.Walls;
model InternalWall_NoOpenings_Homogeneous
  extends BaseClasses.BaseInternalWall_NoOpenings;
  BaseComponents.Envelope.SolidMultilayer_Homogeneous MultiLayerWall(A = L * H, s = s, ro = ro, cp = cp, lambda = lambda, n = n, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-60, -30}, {-20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{60, -30}, {20, 30}})));
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter SI.Length s = 0.4 "wall thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 2400 "wall density";
  parameter SI.SpecificHeatCapacity cp = 880 "wall cp";
  parameter SI.ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
equation
  connect(ConvSideA.wall, MultiLayerWall.side1) annotation(
  Line(points = {{-24, 0}, {-10, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(MultiLayerWall.side2, ConvSideB.wall) annotation(
  Line(points = {{10, 0}, {24, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airSide1, ConvSideA.air) annotation(
  Line(points = {{-90, 0}, {-56, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvSideB.air, airSide2) annotation(
  Line(points = {{56, 2.22045e-16}, {70, 2.22045e-16}, {70, 0}, {90, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-20, -58}, {22, -96}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.CrossDiag, textString = "HOM")}));
end InternalWall_NoOpenings_Homogeneous;

