within BuildingsAndPlants.Components.AggregateComponents.Test;
model test_DCsupply
  Electrical.DCsupply_constantEfficiency Psupply(eta = 1 / 1.2) annotation(Placement(transformation(extent = {{-22, 4}, {-2, 24}})));
  BaseComponents.Electrical.DC.Load_Pin_I0 LoadDC annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {60, 12})));
  BaseComponents.Electrical.DC.Pmeter PM annotation(Placement(transformation(extent = {{14, 4}, {34, 24}})));
  BaseComponents.Electrical.Phasors.PQmeter PQM annotation(Placement(transformation(extent = {{-52, 4}, {-32, 24}})));
  BaseComponents.Electrical.Phasors.Vgen_Sine_Fixed Vac annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-70, 10})));
  BaseComponents.Electrical.Phasors.Ground gndAC annotation(Placement(transformation(extent = {{-80, -30}, {-60, -10}})));
  Modelica.Electrical.Analog.Basic.Ground gndDC annotation(Placement(transformation(extent = {{0, -28}, {20, -8}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(rising = 5, width = 5, falling = 5, period = 20, amplitude = 20) annotation(Placement(transformation(extent = {{-6, 54}, {14, 74}})));
equation
  connect(gndAC.p, Vac.n) annotation(Line(points = {{-70, -12}, {-70, -2}, {-70, 2}, {-70, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vac.p, PQM.p1) annotation(Line(points = {{-70, 18}, {-60, 18}, {-60, 20}, {-51, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vac.n, PQM.n1) annotation(Line(points = {{-70, 2}, {-60, 2}, {-60, 8}, {-51, 8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQM.p2, Psupply.ACp) annotation(Line(points = {{-33, 20}, {-21, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQM.n2, Psupply.ACn) annotation(Line(points = {{-33, 8}, {-21, 8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Psupply.DCp, PM.p1) annotation(Line(points = {{-3, 20}, {15, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Psupply.DCn, PM.n1) annotation(Line(points = {{-3, 8}, {15, 8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(gndDC.p, PM.n1) annotation(Line(points = {{10, -8}, {10, 8}, {15, 8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PM.p2, LoadDC.p) annotation(Line(points = {{33, 20}, {46, 20}, {46, 22}, {60, 22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PM.n2, LoadDC.n) annotation(Line(points = {{33, 8}, {33, 2}, {60, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(trapezoid.y, LoadDC.iPabs) annotation(Line(points = {{15, 64}, {82, 64}, {82, 12}, {67, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 100, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end test_DCsupply;

