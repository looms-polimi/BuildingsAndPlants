within BuildingsAndPlants.Controllers.Test;
model Test_AWPI_analogue
  Blocks.Analogue.AWPI_1dof PI(CSmin = 0, CSstart = 0.2, Ti = 2, K = 3, CSmax = 2) annotation(Placement(transformation(extent = {{-50, 22}, {-30, 42}})));
  Modelica.Blocks.Continuous.FirstOrder P(k = 1, T = 3, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{22, 34}, {42, 54}})));
  Modelica.Blocks.Math.Add add_ld annotation(Placement(transformation(extent = {{-12, 34}, {8, 54}})));
  Modelica.Blocks.Sources.Step SP(startTime = 1) annotation(Placement(transformation(extent = {{-90, 28}, {-70, 48}})));
  Modelica.Blocks.Sources.Step LD(height = 0.5, startTime = 10) annotation(Placement(transformation(extent = {{-90, 64}, {-70, 84}})));
  Blocks.Analogue.AWPI_1dof_trk PItrk(CSmin = 0, CSstart = 0.2, Ti = 2, K = 3, CSmax = 2) annotation(Placement(transformation(extent = {{-50, -24}, {-30, -4}})));
  Modelica.Blocks.Continuous.FirstOrder Ptrk(k = 1, T = 3, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{24, -18}, {44, 2}})));
  Modelica.Blocks.Sources.BooleanExpression TS(y = time > 3 and time < 5) annotation(Placement(transformation(extent = {{-90, -30}, {-70, -10}})));
  Modelica.Blocks.Sources.RealExpression TR(y = 0.25) annotation(Placement(transformation(extent = {{-90, -54}, {-70, -34}})));
equation
  connect(PI.CS, add_ld.u2) annotation(Line(points = {{-32, 38}, {-14, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add_ld.y, P.u) annotation(Line(points = {{9, 44}, {20, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(P.y, PI.PV) annotation(Line(points = {{43, 44}, {50, 44}, {50, 12}, {-58, 12}, {-58, 32}, {-48, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP.y, PI.SP) annotation(Line(points = {{-69, 38}, {-48, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(LD.y, add_ld.u1) annotation(Line(points = {{-69, 74}, {-40, 74}, {-40, 50}, {-14, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PItrk.SP, PI.SP) annotation(Line(points = {{-48, -8}, {-64, -8}, {-64, 38}, {-48, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PItrk.CS, Ptrk.u) annotation(Line(points = {{-32, -8}, {22, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Ptrk.y, PItrk.PV) annotation(Line(points = {{45, -8}, {50, -8}, {50, -40}, {-60, -40}, {-60, -14}, {-48, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TS.y, PItrk.TS) annotation(Line(points = {{-69, -20}, {-48, -20}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(TR.y, PItrk.TR) annotation(Line(points = {{-69, -44}, {-66, -44}, {-66, -26}, {-48, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 20), __Dymola_experimentSetupOutput);
end Test_AWPI_analogue;

