within BuildingsAndPlants.Controllers.AggregateBlocks.Analogue;

model TwinPI_RangeSP
  Modelica.Blocks.Interfaces.RealInput SPhi annotation(
  Placement(transformation(extent = {{-100, 60}, {-80, 80}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
  Placement(transformation(extent = {{-100, 20}, {-80, 40}}), iconTransformation(extent = {{-100, -80}, {-60, -40}})));
  Modelica.Blocks.Interfaces.RealOutput CSpos annotation(
  Placement(transformation(extent = {{80, 60}, {100, 80}}), iconTransformation(extent = {{60, 42}, {100, 82}})));
  Modelica.Blocks.Interfaces.RealOutput CSneg annotation(
  Placement(transformation(extent = {{80, 20}, {100, 40}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Blocks.Analogue.AWPI_1dof PIhi(CSmin = 0, CSstart = max(0, (CSstart + CSnegmax) / (CSposmax + CSnegmax)), K = Khi, Ti = Tihi, CSmax = 1) annotation(
  Placement(transformation(extent = {{-60, 54}, {-40, 74}})));
  parameter Real DeadZoneNorm = 0.1 "Normalised DZ (0-1)";
  Modelica.Blocks.Math.Gain gpos(k = CSposmax) annotation(
  Placement(transformation(extent = {{20, 60}, {40, 80}})));
  Modelica.Blocks.Math.Gain gneg(k = -CSnegmax) annotation(
  Placement(transformation(extent = {{20, 20}, {40, 40}})));
  Modelica.Blocks.Interfaces.RealInput SPlo annotation(
  Placement(transformation(extent = {{-100, 40}, {-80, 60}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Blocks.Analogue.AWPI_1dof PIlo(Ti = Tilo, CSmax = 0, CSmin = -1, CSstart = min(0, (CSstart + CSnegmax) / (CSposmax + CSnegmax)), K = Klo) annotation(
  Placement(transformation(extent = {{-60, 14}, {-40, 34}})));
  parameter Real Khi = 1 "Gain, hi";
  parameter Time Tihi = 1 "Integral time, hi";
  parameter Real Klo = 1 "Gain, lo";
  parameter Time Tilo = 1 "Integral time, lo";
  parameter Real CSposmax = 1 "Max CS for pos action";
  parameter Real CSnegmax = 0 "Min CS for neg action";
  parameter Real CSstart = 0 "Initial CS";
equation
  connect(gpos.y, CSpos) annotation(
  Line(points = {{41, 70}, {90, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gneg.y, CSneg) annotation(
  Line(points = {{41, 30}, {90, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PV, PIhi.PV) annotation(
  Line(points = {{-90, 30}, {-74, 30}, {-74, 64}, {-58, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PV, PIlo.PV) annotation(
  Line(points = {{-90, 30}, {-74, 30}, {-74, 24}, {-58, 24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PIhi.CS, gpos.u) annotation(
  Line(points = {{-42, 70}, {18, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PIlo.CS, gneg.u) annotation(
  Line(points = {{-42, 30}, {18, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SPhi, PIlo.SP) annotation(
  Line(points = {{-90, 70}, {-70, 70}, {-70, 30}, {-58, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SPlo, PIhi.SP) annotation(
  Line(points = {{-90, 50}, {-64, 50}, {-64, 70}, {-58, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {200, 230, 255}), Text(extent = {{-64, 68}, {60, -72}}, lineColor = {0, 0, 0}, textString = "PI
SR")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end TwinPI_RangeSP;
