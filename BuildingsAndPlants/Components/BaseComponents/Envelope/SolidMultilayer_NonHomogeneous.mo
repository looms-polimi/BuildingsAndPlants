within BuildingsAndPlants.Components.BaseComponents.Envelope;
model SolidMultilayer_NonHomogeneous
  Components.BaseComponents.Thermal.Capacities.MassT layer[size(s, 1)](each Tstart = Tstart, M = M, cp = cp);
  Components.BaseComponents.Thermal.HeatTransfer.Conduction_SS cond[size(s, 1) + 1](each A = A, d = Functions.set_layers_thicknesses(size(s, 1), s), lambda = Functions.set_layers_conductivities(size(s, 1), s, lambda));
  Interfaces.Thermal.HeatPort side1 annotation(
  Placement(transformation(extent = {{-60, -80}, {-40, 80}}), iconTransformation(extent = {{-120, -80}, {-80, 80}})));
  Interfaces.Thermal.HeatPort side2 annotation(
  Placement(transformation(extent = {{40, -80}, {60, 80}}), iconTransformation(extent = {{60, -80}, {100, 80}})));
  parameter Area A = 10 "wall surface";
  parameter Length s[:] = {0.05, 0.4, 0.05} "layer thicknesses";
  parameter Density ro[:] = {1600, 2400, 1600} "layer densities";
  parameter SpecificHeatCapacity cp[:] = {400, 880, 400} "layer cps";
  parameter ThermalConductivity lambda[:] = {0.2, 1.91, 0.2} "layer thermal conds";
  parameter Temperature Tstart = 273.15 + 25 "initial T, all layers";
  Temperature T[size(s, 1)];
  // parameter Integer n=size(s,1) "number of layers";
protected
  parameter Mass M[size(s, 1)] = array(ro[i] * s[i] * A / size(s, 1) for i in 1:size(s, 1));
equation
  for i in 1:size(s, 1) loop
    T[i] = layer[i].T;
  end for;
  connect(side1, cond[1].ss1);
  for i in 1:size(s, 1) loop
    connect(layer[i].surf, cond[i].ss2);
    connect(layer[i].surf, cond[i + 1].ss1);
  end for;
  connect(side2, cond[size(s, 1) + 1].ss2);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 100}, {-40, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 200, 175},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-40, 100}, {-28, -100}}, lineColor = {0, 0, 0}, fillColor = {80, 150, 80},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{8, 100}, {20, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{20, 100}, {60, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-70, 30}, {-38, -30}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "1"), Text(extent = {{26, 30}, {58, -30}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "2"), Rectangle(extent = {{-28, -100}, {8, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Forward)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SolidMultilayer_NonHomogeneous;

