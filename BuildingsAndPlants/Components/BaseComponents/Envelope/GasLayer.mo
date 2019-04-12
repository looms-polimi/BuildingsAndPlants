within BuildingsAndPlants.Components.BaseComponents.Envelope;
model GasLayer
  parameter Length L = 5 "Length of the envelope";
  parameter Length H = 3 "Height of the envelope";
  parameter Length d = 0.2 "Width of the envelope";
  parameter Media.Materials.EnvelopeGases.BaseEnvelopeGas material "Type of gas" annotation(choicesAllMatching = true);
  parameter Boolean static = false "Flag that enable static analysis";
  parameter Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  Interfaces.Thermal.HeatPort side1 annotation(
  Placement(transformation(extent = {{-80, -40}, {-60, 40}}, rotation = 0), iconTransformation(extent = {{-40, -40}, {-20, 40}})));
  Interfaces.Thermal.HeatPort side2 annotation(
  Placement(transformation(extent = {{60, -40}, {80, 40}}, rotation = 0), iconTransformation(extent = {{20, -40}, {40, 40}})));
  Thermal.Capacities.MassT massT(M = M, cp = cp, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-10, 42}, {10, 62}})));
  Thermal.HeatTransfer.Conduction_SS cs1(A = L * H, d = d / 2, lambda = lambda) annotation(
  Placement(transformation(extent = {{-38, -10}, {-18, 10}})));
  Thermal.HeatTransfer.Conduction_SS cs2(A = L * H, d = d / 2, lambda = lambda) annotation(
  Placement(transformation(extent = {{20, -10}, {40, 10}})));
protected
  parameter ThermalConductivity lambda = material.lambda "Thermal conductivity";
  parameter SpecificHeatCapacity cp = material.cp "Specific heat capacity";
  parameter Density ro = material.ro "Density";
  parameter Mass M = ro * L * H * d "Mass";
equation
  connect(side1, cs1.ss1) annotation(
  Line(points = {{-70, 0}, {-34, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(cs2.ss2, side2) annotation(
  Line(points = {{36, 8.88178e-16}, {49, 8.88178e-16}, {49, 0}, {70, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(cs1.ss2, cs2.ss1) annotation(
  Line(points = {{-22, 0}, {24, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(cs1.ss2, massT.surf) annotation(
  Line(points = {{-22, 8.88178e-16}, {-12, 8.88178e-16}, {-12, 0}, {0, 0}, {0, 44}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-20, 100}, {20, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end GasLayer;

