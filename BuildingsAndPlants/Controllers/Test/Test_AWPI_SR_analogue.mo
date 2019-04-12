within BuildingsAndPlants.Controllers.Test;

model Test_AWPI_SR_analogue
  AggregateBlocks.Analogue.PI_SplitRange PI(Ti = 2, K = 3, CSstart = 0.2, CSposmax = 100, CSnegmax = 20) annotation(Placement(transformation(extent = {{-88, -8}, {-68, 12}})));
  Modelica.Blocks.Continuous.FirstOrder P(k = 1, T = 3, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{52, 0}, {72, 20}})));
  Modelica.Blocks.Math.Add add_ld annotation(Placement(transformation(extent = {{22, 0}, {42, 20}})));
  Modelica.Blocks.Sources.Pulse SP(startTime = 1, amplitude = 1, period = 10, offset = -0.5) annotation(Placement(transformation(extent = {{-126, -2}, {-106, 18}})));
  Modelica.Blocks.Sources.Step LD(height = 0.5, startTime = 10) annotation(Placement(transformation(extent = {{-126, 48}, {-106, 68}})));
  Modelica.Blocks.Continuous.FirstOrder Apos(k = 1, initType = Modelica.Blocks.Types.Init.InitialOutput, T = 0.05) annotation(Placement(transformation(extent = {{-48, 10}, {-28, 30}})));
  Modelica.Blocks.Math.Add sum_act annotation(Placement(transformation(extent = {{-14, -6}, {6, 14}})));
  Modelica.Blocks.Continuous.FirstOrder Apos1(initType = Modelica.Blocks.Types.Init.InitialOutput, k = -1, T = 0.1) annotation(Placement(transformation(extent = {{-48, -20}, {-28, 0}})));
equation
  connect(add_ld.y, P.u) annotation(Line(points = {{43, 10}, {50, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(P.y, PI.PV) annotation(Line(points = {{73, 10}, {102, 10}, {102, -32}, {-98, -32}, {-98, 2}, {-86, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP.y, PI.SP) annotation(Line(points = {{-105, 8}, {-86, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(LD.y, add_ld.u1) annotation(Line(points = {{-105, 58}, {10, 58}, {10, 16}, {20, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CSpos, Apos.u) annotation(Line(points = {{-70, 8.2}, {-60, 8.2}, {-60, 20}, {-50, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CSneg, Apos1.u) annotation(Line(points = {{-70, 2}, {-60, 2}, {-60, -10}, {-50, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Apos.y, sum_act.u1) annotation(Line(points = {{-27, 20}, {-22, 20}, {-22, 10}, {-16, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Apos1.y, sum_act.u2) annotation(Line(points = {{-27, -10}, {-22, -10}, {-22, -2}, {-16, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sum_act.y, add_ld.u2) annotation(Line(points = {{7, 4}, {20, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics), experiment(StopTime = 20), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})));
end Test_AWPI_SR_analogue;
