within BuildingsAndPlants.Components.AggregateComponents.Electrical;
model Inverter_PcontrolOrPhi0_ConstantEfficiency
  extends Components.AggregateComponents.Electrical.BaseClasses.BaseInverter;
  parameter SI.Voltage Vac = 100 "AC voltage";
  parameter Real eta = 0.95 "Efficiency";
  BaseComponents.Electrical.Phasors.Vgen_Sine_Vphi GenAC annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-30, 0})));
  BaseComponents.Electrical.Phasors.PQmeter PQ annotation(
  Placement(transformation(extent = {{-12, -22}, {30, 22}})));
  Modelica.Blocks.Interfaces.RealInput Pac annotation(
  Placement(transformation(extent = {{60, 60}, {40, 80}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -80})));
  Modelica.Blocks.Sources.RealExpression exprVac(y = Vac) annotation(
  Placement(transformation(extent = {{-94, -14}, {-74, 6}})));
  Controllers.Blocks.Analogue.AWPI_1dof_trk PI_P(CSmax = pi / 4, CSmin = -pi / 4, K = 0.00001, Ti = 0.01) annotation(
  Placement(transformation(extent = {{-10, 38}, {-30, 58}})));
  BaseComponents.Electrical.Phasors.Resistor Ro(R = Rout) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {68, 38})));
  parameter SI.Resistance Rout = 1 "Output R";
  Modelica.Blocks.Sources.RealExpression Zero(y = 0) annotation(
  Placement(transformation(extent = {{28, 26}, {8, 46}})));
  Modelica.Blocks.Interfaces.BooleanInput Phi0 annotation(
  Placement(transformation(extent = {{60, 40}, {40, 60}}), iconTransformation(extent = {{20, -20}, {-20, 20}}, rotation = 270, origin = {-48, -80})));
  Modelica.Blocks.Continuous.FirstOrder dyn(k = 1, T = T) annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-50, 54})));
  parameter SI.Time T = 0.01 "Time Constant";
equation
  DCp.i + DCn.i = 0;
  DCp.i * (DCp.v - DCn.v) = PQ.P / eta;
  Qloss = PQ.P * (1 / eta - 1);
  connect(GenAC.p, PQ.p1) annotation(
  Line(points = {{-30, 8}, {-30, 13.2}, {-9.9, 13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(GenAC.n, PQ.n1) annotation(
  Line(points = {{-30, -8}, {-30, -13.2}, {-9.9, -13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQ.n2, ACn) annotation(
  Line(points = {{27.9, -13.2}, {68, -13.2}, {68, -60}, {90, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(exprVac.y, GenAC.V) annotation(
  Line(points = {{-73, -4}, {-38, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.SP, Pac) annotation(
  Line(points = {{-12, 54}, {8, 54}, {8, 70}, {50, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.PV, PQ.P) annotation(
  Line(points = {{-12, 48}, {0.81, 48}, {0.81, 22.22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PQ.p2, Ro.p) annotation(
  Line(points = {{27.9, 13.2}, {68, 13.2}, {68, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Ro.n, ACp) annotation(
  Line(points = {{68, 46}, {68, 60}, {90, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PI_P.TR, Zero.y) annotation(
  Line(points = {{-12, 36}, {7, 36}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.TS, Phi0) annotation(
  Line(points = {{-12, 42}, {10, 42}, {10, 50}, {50, 50}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(PI_P.CS, dyn.u) annotation(
  Line(points = {{-28, 54}, {-38, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(dyn.y, GenAC.phi) annotation(
  Line(points = {{-61, 54}, {-64, 54}, {-64, 4}, {-38, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{10, 6}, {62, -28}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}, textString = "Pcontrol")}));
end Inverter_PcontrolOrPhi0_ConstantEfficiency;

