within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;
model InternalWindow_Closed_DoubleGlass
  extends BaseClasses.BaseInternalWindow_Closed;
  BaseComponents.Envelope.DoubleGlass DoubleGlass(L = L, H = H, Tstart = Tstart, d_glass = d_glass, d_int = d_int, material_glass = material_glass, material_gas = material_gas, gamma = gamma_g) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-60, -30}, {-20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{60, -30}, {20, 30}})));
  parameter SI.Length L = 5 "glass surface length";
  parameter SI.Length H = 3 "glass surface height";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  parameter SI.Length d_glass = 0.02 "Width of the single glass";
  parameter SI.Length d_int = 0.05 "Distance between two glasses";
  parameter Media.Materials.Glasses.BaseGlass material_glass "Type of glass" annotation(choicesAllMatching = true);
  parameter Media.Materials.EnvelopeGases.BaseEnvelopeGas material_gas "Type of internal gas between the glasses" annotation(choicesAllMatching = true);
  parameter SI.CoefficientOfHeatTransfer gamma_g = 5 "Heat transfer coefficient between the glasses and internal gas";
equation
  connect(ConvSideA.wall, DoubleGlass.side1) annotation(
  Line(points = {{-24, 0}, {-10, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(DoubleGlass.side2, ConvSideB.wall) annotation(
  Line(points = {{10, -4.44089e-16}, {14, -4.44089e-16}, {14, 2.22045e-16}, {24, 2.22045e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airSide1, ConvSideA.air) annotation(
  Line(points = {{-90, 0}, {-56, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvSideB.air, airSide2) annotation(
  Line(points = {{56, 0}, {90, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics={  Rectangle(extent = {{-4, 80}, {4, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {240, 240, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end InternalWindow_Closed_DoubleGlass;

