within BuildingsAndPlants.Controllers.Blocks.Analogue;

model AWPI_1dof
  extends BaseClasses.A_SISO_base;
  parameter Real K = 1 "Gain";
  parameter Time Ti = 1 "Integral time";
  parameter Real CSmax = 1 "Max CS";
  parameter Real CSmin = 0 "Min CS";
  parameter Real CSstart = 0 "Initial CS";
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = CSmax, uMin = CSmin) annotation(
  Placement(transformation(extent = {{40, 20}, {60, 40}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FO(k = 1, T = Ti) annotation(
  Placement(transformation(extent = {{40, -20}, {20, 0}}, rotation = 0)));
  Modelica.Blocks.Math.Add pfb annotation(
  Placement(transformation(extent = {{0, 20}, {20, 40}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = K) annotation(
  Placement(transformation(extent = {{-40, 60}, {-20, 80}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e annotation(
  Placement(transformation(extent = {{-74, 60}, {-54, 80}}, rotation = 0)));
initial equation
  FO.y = CSstart - K * (SP - PV);
equation
  connect(limiter.y, FO.u) annotation(
  Line(points = {{61, 30}, {70, 30}, {70, -10}, {42, -10}}, color = {0, 0, 127}));
  connect(FO.y, pfb.u2) annotation(
  Line(points = {{19, -10}, {-10, -10}, {-10, 24}, {-2, 24}}, color = {0, 0, 127}));
  connect(PV, e.u2) annotation(
  Line(points = {{-90, 30}, {-64, 30}, {-64, 62}}, color = {0, 0, 127}));
  connect(pfb.y, limiter.u) annotation(
  Line(points = {{21, 30}, {21, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(SP, e.u1) annotation(
  Line(points = {{-90, 70}, {-72, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter.y, CS) annotation(
  Line(points = {{61, 30}, {70, 30}, {70, 70}, {90, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(e.y, gain.u) annotation(
  Line(points = {{-55, 70}, {-42, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, pfb.u1) annotation(
  Line(points = {{-19, 70}, {-10, 70}, {-10, 36}, {-2, 36}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Line(points = {{128, 30}, {128, 30}}, color = {0, 0, 127}, smooth = Smooth.None), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-24, 42}, {38, -34}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "aPI")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end AWPI_1dof;
