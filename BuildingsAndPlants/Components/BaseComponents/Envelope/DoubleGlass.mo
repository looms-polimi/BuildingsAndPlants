within BuildingsAndPlants.Components.BaseComponents.Envelope;

model DoubleGlass
  parameter Length L = 5 "Length of the glass";
  parameter Length H = 3 "Height of the glass";
  parameter SI.Length d_glass = 0.2 "Width of the single glass";
  parameter SI.Length d_int = 0.2 "Distance between two glasses";
  parameter SI.CoefficientOfHeatTransfer gamma = 5 "Heat transfer coefficient between the glasses and internal gas";
  parameter BuildingsAndPlants.Media.Materials.Glasses.BaseGlass material_glass "Type of glass" annotation(choicesAllMatching = true);
  parameter BuildingsAndPlants.Media.Materials.EnvelopeGases.BaseEnvelopeGas material_gas "Type of internal gas between the glasses" annotation(choicesAllMatching = true);
  parameter SI.Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  Interfaces.Thermal.HeatPort side1 annotation(
  Placement(transformation(extent = {{-80, -40}, {-60, 40}}, rotation = 0), iconTransformation(extent = {{-60, -40}, {-40, 40}})));
  Interfaces.Thermal.HeatPort side2 annotation(
  Placement(transformation(extent = {{60, -40}, {80, 40}}, rotation = 0), iconTransformation(extent = {{40, -40}, {60, 40}})));
  BuildingsAndPlants.Components.BaseComponents.Envelope.GlassLayer glass2(Tstart = Tstart, material = material_glass, d = d_glass, L = L, H = H) annotation(
  Placement(transformation(extent = {{34, -10}, {54, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Envelope.GlassLayer glass1(Tstart = Tstart, material = material_glass, d = d_glass, L = L, H = H) annotation(
  Placement(transformation(extent = {{-54, -10}, {-34, 10}}, rotation = 0)));
  Thermal.HeatTransfer.Convection_SS conv2(S = L * H, gamma = gamma) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {22, 0})));
  BuildingsAndPlants.Components.BaseComponents.Envelope.GasLayer gas(L = L, H = H, d = d_int, material = material_gas, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Thermal.HeatTransfer.Convection_SS conv1(S = L * H, gamma = gamma) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-22, 0})));
equation
  connect(side1, glass1.side1) annotation(
  Line(points = {{-70, 0}, {-47, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(glass1.side2, conv1.ss1) annotation(
  Line(points = {{-41, 0}, {-28, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(conv1.ss2, gas.side1) annotation(
  Line(points = {{-16, 0}, {-3, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(gas.side2, conv2.ss1) annotation(
  Line(points = {{3, 0}, {16, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(conv2.ss2, glass2.side1) annotation(
  Line(points = {{28, 6.66134e-16}, {34, 6.66134e-16}, {34, 0}, {41, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(glass2.side2, side2) annotation(
  Line(points = {{47, 0}, {70, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Icon(graphics={  Rectangle(extent = {{-30, 100}, {30, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                    FillPattern.Solid), Rectangle(extent = {{-40, 100}, {-20, -100}}, lineColor = {0, 0, 0}, fillColor = {213, 245, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{20, 100}, {40, -100}}, lineColor = {0, 0, 0}, fillColor = {213, 245, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end DoubleGlass;
