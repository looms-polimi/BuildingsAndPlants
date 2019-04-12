within BuildingsAndPlants.Controllers.AggregateBlocks.Analogue;

model PI_SplitRange
  Modelica.Blocks.Interfaces.RealInput SP annotation(
  Placement(transformation(extent = {{-100, 60}, {-80, 80}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
  Placement(transformation(extent = {{-100, 20}, {-80, 40}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput CSpos annotation(
  Placement(transformation(extent = {{80, 62}, {100, 82}}), iconTransformation(extent = {{60, 42}, {100, 82}})));
  Modelica.Blocks.Interfaces.RealOutput CSneg annotation(
  Placement(transformation(extent = {{78, 20}, {98, 40}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Blocks.Analogue.AWPI_1dof PI(K = K, Ti = Ti, CSmax = 1, CSstart = (CSstart + CSnegmax) / (CSposmax + CSnegmax), CSmin = -1) annotation(
  Placement(transformation(extent = {{-60, 54}, {-40, 74}})));
  Actuation.SplitRange_01 splitRange_01_1(DeadZone = DeadZoneNorm) annotation(
  Placement(transformation(extent = {{-16, 56}, {4, 76}})));
  parameter Real DeadZoneNorm = 0.1 "Normalised DZ (0-1)";
  Modelica.Blocks.Math.Gain gpos(k = CSposmax) annotation(
  Placement(transformation(extent = {{22, 62}, {42, 82}})));
  Modelica.Blocks.Math.Gain gneg(k = CSnegmax) annotation(
  Placement(transformation(extent = {{22, 20}, {42, 40}})));
  parameter Real K = 1 "Gain";
  parameter Time Ti = 1 "Integral time";
  parameter Real CSposmax = 1 "Max CS for pos action";
  parameter Real CSnegmax = 0 "Min CS for neg action";
  parameter Real CSstart = 0 "Initial CS";
equation
  connect(SP, PI.SP) annotation(
  Line(points = {{-90, 70}, {-58, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PV, PI.PV) annotation(
  Line(points = {{-90, 30}, {-72, 30}, {-72, 64}, {-58, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI.CS, splitRange_01_1.CSi01) annotation(
  Line(points = {{-42, 70}, {-26, 70}, {-26, 66.2}, {-14, 66.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(splitRange_01_1.CSo01_pos, gpos.u) annotation(
  Line(points = {{2, 72}, {20, 72}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gpos.y, CSpos) annotation(
  Line(points = {{43, 72}, {90, 72}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(splitRange_01_1.CSo01_neg, gneg.u) annotation(
  Line(points = {{2, 60.2}, {10, 60.2}, {10, 30}, {20, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gneg.y, CSneg) annotation(
  Line(points = {{43, 30}, {88, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {200, 230, 255}), Text(extent = {{-64, 68}, {60, -72}}, lineColor = {0, 0, 0}, textString = "PI
SR")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PI_SplitRange;
