within BuildingsAndPlants.Controllers.Test;
model Test_AWPI_TDO_analogue
  AggregateBlocks.Analogue.PI_TDO PI(CSmin = 0, Ti = 2, K = 3, CSmax = 2, CSstart = 0.2, Ttdo = 0.25) annotation(Placement(transformation(extent = {{-52, 22}, {-32, 42}})));
  Modelica.Blocks.Continuous.FirstOrder P(k = 1, T = 3, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{54, 34}, {74, 54}})));
  Modelica.Blocks.Math.Add add_ld annotation(Placement(transformation(extent = {{20, 34}, {40, 54}})));
  Modelica.Blocks.Sources.Step SP(startTime = 1) annotation(Placement(transformation(extent = {{-90, 28}, {-70, 48}})));
  Modelica.Blocks.Sources.Step LD(height = 0.5, startTime = 10) annotation(Placement(transformation(extent = {{-90, 64}, {-70, 84}})));
equation
  connect(add_ld.y, P.u) annotation(Line(points = {{41, 44}, {52, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(P.y, PI.PV) annotation(Line(points = {{75, 44}, {84, 44}, {84, 6}, {-58, 6}, {-58, 32}, {-50, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP.y, PI.SP) annotation(Line(points = {{-69, 38}, {-50, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(LD.y, add_ld.u1) annotation(Line(points = {{-69, 74}, {-40, 74}, {-40, 50}, {18, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CS, add_ld.u2) annotation(Line(points = {{-34, 38}, {18, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 20), __Dymola_experimentSetupOutput);
end Test_AWPI_TDO_analogue;

