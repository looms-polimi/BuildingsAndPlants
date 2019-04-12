within BuildingsAndPlants.Controllers.AggregateBlocks.Analogue;
model PI_TDO
  extends Controllers.Blocks.Analogue.BaseClasses.A_SISO_base;
  Blocks.Analogue.AWPI_1dof PI(K = K, Ti = Ti, CSmax = 1, CSmin = 0, CSstart = (CSstart - CSmin) / (CSmax - CSmin)) annotation(
  Placement(transformation(extent = {{-54, 54}, {-34, 74}})));
  Actuation.TDO TDO(Ttdo = Ttdo) annotation(
  Placement(transformation(extent = {{2, 60}, {22, 80}})));
  parameter Real K = 1 "Gain";
  parameter Time Ti = 1 "Integral time";
  parameter Real CSmax = 1 "Max CS";
  parameter Real CSmin = 0 "Min CS";
  parameter Real CSstart = 0 "Initial CS";
  parameter Time Ttdo = 1 "TDO timebase";
  Actuation.RangeConv_Linear RCo(CSimin = 0, CSimax = 1, CSomin = CSmin, CSomax = CSmax) annotation(Placement(transformation(extent = {{40, 60}, {60, 80}})));
equation
  connect(PI.CS, TDO.cmd01) annotation(
  Line(points = {{-36, 70}, {4, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PV, PI.PV) annotation(
  Line(points = {{-90, 30}, {-74, 30}, {-74, 64}, {-52, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SP, PI.SP) annotation(
  Line(points = {{-90, 70}, {-52, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TDO.TDO, RCo.CSi) annotation(
  Line(points = {{20, 70}, {32, 70}, {32, 70.2}, {42, 70.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RCo.CSo, CS) annotation(
  Line(points = {{58, 70}, {90, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-64, 68}, {60, -72}}, lineColor = {0, 0, 0}, textString = "PI
TDO")}));
end PI_TDO;

