within BuildingsAndPlants.Components.BaseComponents.Test;

model test4_CentrifugalPump
  Water.Valves.WaterValve_LinChar valveLinChar(cvmax = 1e-3) annotation(Placement(transformation(extent = {{28, 2}, {48, 22}})));
  Water.Sources.WaterSource_PT_fixed source_PT_fixed annotation(Placement(transformation(extent = {{-98, 2}, {-78, 22}})));
  Water.Sinks.WaterSink_P_fixed sink_P_fixed(Pin = 101325) annotation(Placement(transformation(extent = {{94, 2}, {74, 22}})));
  Modelica.Blocks.Sources.Step step1(offset = 0.2, height = 0.2, startTime = 0) annotation(Placement(transformation(extent = {{-10, 34}, {2, 46}})));
  Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN(n = 1, Ltube = 500, Dtube = 0.01) annotation(Placement(transformation(extent = {{-24, 2}, {-4, 22}})));
  Modelica.Blocks.Sources.Step step2(startTime = 0, height = 0.5, offset = 0.5) annotation(Placement(transformation(extent = {{-86, 38}, {-74, 50}})));
  Water.Pumps.WaterPump_Centrifugal centrifugalPump(DP1 = 5000, DP0 = 200000) annotation(Placement(transformation(extent = {{-62, 2}, {-42, 22}})));
equation
  connect(step1.y, valveLinChar.cmd) annotation(Line(points = {{2.6, 40}, {18, 40}, {18, 19}, {34, 19}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(step2.y, centrifugalPump.cmd) annotation(Line(points = {{-73.4, 44}, {-68, 44}, {-68, 17.8}, {-57.2, 17.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(source_PT_fixed.water_flange, centrifugalPump.water_flange1) annotation(Line(points = {{-80, 12}, {-72, 12}, {-72, 12}, {-60, 12}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(centrifugalPump.water_flange2, pipeExchangingN.water_flange1) annotation(Line(points = {{-44, 12}, {-22, 12}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange2, valveLinChar.water_flange1) annotation(Line(points = {{-6, 12}, {30, 12}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(valveLinChar.water_flange2, sink_P_fixed.water_flange) annotation(Line(points = {{46, 12}, {76, 12}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test4_CentrifugalPump;
