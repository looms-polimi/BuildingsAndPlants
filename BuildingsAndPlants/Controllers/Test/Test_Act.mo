within BuildingsAndPlants.Controllers.Test;

model Test_Act
  Actuation.Distributor_uniform D2(ns = 2) annotation(Placement(transformation(extent = {{-20, 68}, {0, 88}})));
  Actuation.Distributor_uniform D5(ns = 5) annotation(Placement(transformation(extent = {{-20, 44}, {0, 64}})));
  Modelica.Blocks.Sources.Trapezoid uin(amplitude = 1, rising = 1, width = 1, falling = 1, period = 4) annotation(Placement(transformation(extent = {{-90, 68}, {-70, 88}})));
  Actuation.DaisyChain_uniform DC2(ns = 2) annotation(Placement(transformation(extent = {{-20, 20}, {0, 40}})));
  Actuation.DaisyChain_uniform DC5(ns = 5) annotation(Placement(transformation(extent = {{-20, -4}, {0, 16}})));
  Modelica.Blocks.Sources.Trapezoid uin1(rising = 1, width = 1, falling = 1, period = 4, amplitude = 3, offset = -1.5) annotation(Placement(transformation(extent = {{-88, -32}, {-68, -12}})));
  Actuation.SplitRange_01 SR annotation(Placement(transformation(extent = {{-20, -32}, {0, -12}})));
  Actuation.RangeConv_Linear RC(CSimin = 0.4, CSimax = 0.6) annotation(Placement(transformation(extent = {{-20, -60}, {0, -40}})));
  Actuation.DaisyChain_InRanges_Out01 DC_IR(CSiRB = {0.1, 0.3, 0.4, 0.75, 0.9}) annotation(Placement(transformation(extent = {{-20, -84}, {0, -64}})));
equation
  connect(uin.y, D2.CSi01) annotation(Line(points = {{-69, 78}, {-39.5, 78}, {-39.5, 78.2}, {-18, 78.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(uin.y, D5.CSi01) annotation(Line(points = {{-69, 78}, {-40, 78}, {-40, 54.2}, {-18, 54.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(DC2.CSi01, D5.CSi01) annotation(Line(points = {{-18, 30.2}, {-40, 30.2}, {-40, 54.2}, {-18, 54.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(DC5.CSi01, D5.CSi01) annotation(Line(points = {{-18, 6.2}, {-40, 6.2}, {-40, 54.2}, {-18, 54.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(uin1.y, SR.CSi01) annotation(Line(points = {{-67, -22}, {-44, -22}, {-44, -21.8}, {-18, -21.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RC.CSi, D5.CSi01) annotation(Line(points = {{-18, -49.8}, {-40, -49.8}, {-40, 54.2}, {-18, 54.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(DC_IR.CSi, D5.CSi01) annotation(Line(points = {{-18, -73.8}, {-40, -73.8}, {-40, 54.2}, {-18, 54.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 8), __Dymola_experimentSetupOutput);
end Test_Act;
