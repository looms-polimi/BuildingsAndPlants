within BuildingsAndPlants.Components.BaseComponents.Water.Pipes;

model WaterPipeExchanging_Nvols
  extends Interfaces.Water.PartialTwoPort_water;
  parameter Integer n = 2 "number of lumps";
  parameter Length Ltube = 30 "tube length";
  parameter Length Dtube = 0.05 "tube inner diameter";
  parameter Length Dz = 0 "height diff (out-in)";
  parameter Real Cftube = 1e-6 "tube friction coefficient";
  parameter Temperature Tstart = 273.15 + 25 "initial fluid temp";
  BuildingsAndPlants.Components.BaseComponents.Water.Pipes.BaseClasses.WaterPipeExchangingElement pipe[n](each L = Ltube / n, each D = Dtube, each Dz = Dz / n, each Cf = Cftube, each Tstart = Tstart) "lumps";
  BuildingsAndPlants.Utilities.HPvector_VectOfHPs hps(n = n);
  Temperature T[n];
  Interfaces.Thermal.HeatPortVec heatPort(n = n) annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-60, 40}, {62, 60}})));
equation
  connect(water_flange1, pipe[1].water_flange1);
  connect(pipe[n].water_flange2, water_flange2);
  connect(pipe[1].heatPort, hps.vecOfHPs[1]);
  T[1] = pipe[1].Ti;
  for i in 2:n loop
    connect(pipe[i - 1].water_flange2, pipe[i].water_flange1);
    connect(pipe[i].heatPort, hps.vecOfHPs[i]);
    T[i] = pipe[i].Ti;
  end for;
  connect(hps.vecHP, heatPort);
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 40}, {62, -40}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}), Polygon(points = {{-28, 6}, {-28, -6}, {12, -6}, {12, -12}, {32, 0}, {12, 12}, {12, 6}, {-28, 6}}, lineColor = {200, 200, 255}, fillColor = {200, 200, 255}, fillPattern = FillPattern.Solid)}));
end WaterPipeExchanging_Nvols;
