within BuildingsAndPlants.Controllers.Test;

model Test_TwinPI_RangeSP
  AggregateBlocks.Analogue.TwinPI_RangeSP PI(CSstart = 0.2, CSposmax = 100, CSnegmax = 20, Khi = 3, Tihi = 2, Klo = 3, Tilo = 2) annotation(Placement(transformation(extent = {{-40, -8}, {-20, 12}})));
  Modelica.Blocks.Continuous.FirstOrder P(k = 1, T = 3, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{100, 0}, {120, 20}})));
  Modelica.Blocks.Math.Add add_ld annotation(Placement(transformation(extent = {{70, 0}, {90, 20}})));
  Modelica.Blocks.Sources.Pulse SP(startTime = 1, amplitude = 1, period = 10, offset = -0.5) annotation(Placement(transformation(extent = {{-132, 18}, {-112, 38}})));
  Modelica.Blocks.Sources.Step LD(height = 0.5, startTime = 10) annotation(Placement(transformation(extent = {{-130, 50}, {-110, 70}})));
  Modelica.Blocks.Continuous.FirstOrder Apos(k = 1, initType = Modelica.Blocks.Types.Init.InitialOutput, T = 0.05) annotation(Placement(transformation(extent = {{0, 10}, {20, 30}})));
  Modelica.Blocks.Math.Add sum_act annotation(Placement(transformation(extent = {{34, -6}, {54, 14}})));
  Modelica.Blocks.Continuous.FirstOrder Apos1(initType = Modelica.Blocks.Types.Init.InitialOutput, k = -1, T = 0.1) annotation(Placement(transformation(extent = {{0, -20}, {20, 0}})));
  Modelica.Blocks.Math.Add Deltap annotation(Placement(transformation(extent = {{-92, 12}, {-72, 32}})));
  Modelica.Blocks.Math.Add Deltam(k2 = -1) annotation(Placement(transformation(extent = {{-92, -18}, {-72, 2}})));
  Modelica.Blocks.Sources.RealExpression delta(y = 0.05) annotation(Placement(transformation(extent = {{-134, -24}, {-114, -4}})));
equation
  connect(add_ld.y, P.u) annotation(Line(points = {{91, 10}, {98, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(P.y, PI.PV) annotation(Line(points = {{121, 10}, {126, 10}, {126, -28}, {-50, -28}, {-50, -4}, {-38, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(LD.y, add_ld.u1) annotation(Line(points = {{-109, 60}, {58, 60}, {58, 16}, {68, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CSpos, Apos.u) annotation(Line(points = {{-22, 8.2}, {-12, 8.2}, {-12, 20}, {-2, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CSneg, Apos1.u) annotation(Line(points = {{-22, 2}, {-12, 2}, {-12, -10}, {-2, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Apos.y, sum_act.u1) annotation(Line(points = {{21, 20}, {26, 20}, {26, 10}, {32, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Apos1.y, sum_act.u2) annotation(Line(points = {{21, -10}, {26, -10}, {26, -2}, {32, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sum_act.y, add_ld.u2) annotation(Line(points = {{55, 4}, {68, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP.y, Deltap.u1) annotation(Line(points = {{-111, 28}, {-94, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP.y, Deltam.u1) annotation(Line(points = {{-111, 28}, {-106, 28}, {-106, -2}, {-94, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(delta.y, Deltam.u2) annotation(Line(points = {{-113, -14}, {-94, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(delta.y, Deltap.u2) annotation(Line(points = {{-113, -14}, {-102, -14}, {-102, 16}, {-94, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Deltap.y, PI.SPhi) annotation(Line(points = {{-71, 22}, {-54, 22}, {-54, 8}, {-38, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Deltam.y, PI.SPlo) annotation(Line(points = {{-71, -8}, {-54, -8}, {-54, 2}, {-38, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics), experiment(StopTime = 20), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})));
end Test_TwinPI_RangeSP;
