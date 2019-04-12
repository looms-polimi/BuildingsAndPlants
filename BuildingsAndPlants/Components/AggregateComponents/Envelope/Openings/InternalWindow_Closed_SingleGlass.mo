within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;
model InternalWindow_Closed_SingleGlass
  extends BaseClasses.BaseInternalWindow_Closed;
  BaseComponents.Envelope.GlassLayer Glass(L = L, H = H, d = s, Tstart = Tstart, material = material) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-60, -30}, {-20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{60, -30}, {20, 30}})));
  parameter SI.Length L = 5 "glass surface length";
  parameter SI.Length H = 3 "glass surface height";
  parameter SI.Length s = 0.4 "glass thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  parameter Media.Materials.Glasses.BaseGlass material "Type of glass" annotation(choicesAllMatching = true);
equation
  connect(ConvSideA.wall, Glass.side1) annotation(
  Line(points = {{-24, 0}, {-6, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Glass.side2, ConvSideB.wall) annotation(
  Line(points = {{6, -4.44089e-16}, {14, -4.44089e-16}, {14, 2.22045e-16}, {24, 2.22045e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airSide1, ConvSideA.air) annotation(
  Line(points = {{-90, 0}, {-56, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvSideB.air, airSide2) annotation(
  Line(points = {{56, 0}, {90, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics));
end InternalWindow_Closed_SingleGlass;

