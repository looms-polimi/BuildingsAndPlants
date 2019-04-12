within BuildingsAndPlants.Controllers.Blocks.Analogue;

model AWPI_1dof_trk
  extends BaseClasses.A_SISO_trk;
  parameter Real K = 1 "Gain";
  parameter Time Ti = 1 "Integral time";
  parameter Real CSmax = 1 "Max CS";
  parameter Real CSmin = 0 "Min CS";
  parameter Real CSstart = 0 "Initial CS";
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = CSmax, uMin = CSmin) annotation(
  Placement(transformation(extent = {{50, -48}, {70, -28}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FO(k = 1, T = Ti) annotation(
  Placement(transformation(extent = {{40, -88}, {20, -68}}, rotation = 0)));
  Modelica.Blocks.Math.Add pfb annotation(
  Placement(transformation(extent = {{-18, -48}, {2, -28}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = K) annotation(
  Placement(transformation(extent = {{-48, 60}, {-28, 80}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e annotation(
  Placement(transformation(extent = {{-74, 60}, {-54, 80}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch sw_trk annotation(
  Placement(transformation(extent = {{18, -20}, {38, 0}})));
initial equation
  FO.y = (if TS then TR else CSstart) - K * (SP - PV);
equation
  connect(limiter.y, FO.u) annotation(
  Line(points = {{71, -38}, {76, -38}, {76, -78}, {42, -78}}, color = {0, 0, 127}));
  connect(FO.y, pfb.u2) annotation(
  Line(points = {{19, -78}, {-24, -78}, {-24, -44}, {-20, -44}}, color = {0, 0, 127}));
  connect(PV, e.u2) annotation(
  Line(points = {{-90, 30}, {-64, 30}, {-64, 62}}, color = {0, 0, 127}));
  connect(SP, e.u1) annotation(
  Line(points = {{-90, 70}, {-72, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter.y, CS) annotation(
  Line(points = {{71, -38}, {76, -38}, {76, 70}, {90, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(e.y, gain.u) annotation(
  Line(points = {{-55, 70}, {-50, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, pfb.u1) annotation(
  Line(points = {{-27, 70}, {-24, 70}, {-24, -32}, {-20, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sw_trk.u1, TR) annotation(
  Line(points = {{16, -2}, {-48, -2}, {-48, -50}, {-90, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TS, sw_trk.u2) annotation(
  Line(points = {{-90, -10}, {16, -10}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(pfb.y, sw_trk.u3) annotation(
  Line(points = {{3, -38}, {8, -38}, {8, -18}, {16, -18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sw_trk.y, limiter.u) annotation(
  Line(points = {{39, -10}, {44, -10}, {44, -38}, {48, -38}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Line(points = {{128, 30}, {128, 30}}, color = {0, 0, 127}, smooth = Smooth.None), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-24, 26}, {38, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "aPI")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end AWPI_1dof_trk;
