within BuildingsAndPlants.Components.BaseComponents.Envelope;
model SolidMultilayer_Homogeneous
  parameter Area A = 10 "wall surface";
  parameter Length s = 0.4 "wall thickness";
  parameter Density ro = 2400 "wall density";
  parameter SpecificHeatCapacity cp = 880 "wall cp";
  parameter ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter Temperature Tstart = 273.15 + 25 "initial T, all layers";
  Temperature T[n](each start = Tstart);
  ThermalConductance g = lambda * A / (s / n);
  HeatCapacity c = ro * A * s / n * cp;
  Interfaces.Thermal.HeatPort side1 annotation(
  Placement(transformation(extent = {{-60, -80}, {-40, 80}})));
  Interfaces.Thermal.HeatPort side2 annotation(
  Placement(transformation(extent = {{40, -80}, {60, 80}})));
equation
  0 = c * der(T[1]) - side1.Q_flow + g * (T[1] - T[2]);
  side1.T = T[1];
  for i in 2:n - 1 loop
    c * der(T[i]) = g * (T[i - 1] - T[i]) - g * (T[i] - T[i + 1]);
  end for;
  c * der(T[n]) = g * (T[n - 1] - T[n]) + side2.Q_flow;
  side2.T = T[n];
  annotation(
  Icon(graphics={  Rectangle(extent = {{-40, 100}, {-20, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                     FillPattern.Solid), Rectangle(extent = {{-20, 100}, {0, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{0, 100}, {20, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{20, 100}, {40, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SolidMultilayer_Homogeneous;

