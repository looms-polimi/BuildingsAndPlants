within BuildingsAndPlants.Components.AggregateComponents.Electrical;
model Inverter_Pcontrol_ConstantEfficiency
  extends Components.AggregateComponents.Electrical.BaseClasses.BaseInverter;
  parameter SI.Voltage Vac = 100 "AC voltage";
  parameter Real eta = 0.95 "Efficiency";
  BaseComponents.Electrical.Phasors.Vgen_Sine_Vphi GenAC annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {0, 0})));
  BaseComponents.Electrical.Phasors.PQmeter PQ annotation(
  Placement(transformation(extent = {{18, -22}, {60, 22}})));
  Modelica.Blocks.Interfaces.RealInput Pac annotation(
  Placement(transformation(extent = {{60, 44}, {36, 68}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -80})));
  Modelica.Blocks.Sources.RealExpression exprVac(y = Vac) annotation(
  Placement(transformation(extent = {{-46, -14}, {-26, 6}})));
  Controllers.Blocks.Analogue.AWPI_1dof PI_P(CSmax = pi / 4, CSmin = -pi / 4, K = K, Ti = Ti) annotation(
  Placement(transformation(extent = {{20, 38}, {0, 58}})));
  BaseComponents.Electrical.Phasors.Resistor Ro(R = Rout) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {68, 38})));
  parameter SI.Resistance Rout = 1 "Output R";
  parameter Real K = 0.00001 "C gain";
  parameter SI.Time Ti = 0.01 "C integral time";
equation
  DCp.i + DCn.i = 0;
  DCp.i * (DCp.v - DCn.v) = PQ.P / eta;
  Qloss = PQ.P * (1 / eta - 1);
  connect(GenAC.p, PQ.p1) annotation(
  Line(points = {{1.77636e-015, 8}, {1.77636e-015, 13.2}, {20.1, 13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(GenAC.n, PQ.n1) annotation(
  Line(points = {{-1.77636e-015, -8}, {-1.77636e-015, -13.2}, {20.1, -13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQ.n2, ACn) annotation(
  Line(points = {{57.9, -13.2}, {68, -13.2}, {68, -60}, {90, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(exprVac.y, GenAC.V) annotation(
  Line(points = {{-25, -4}, {-8, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.SP, Pac) annotation(
  Line(points = {{18, 54}, {34, 54}, {34, 56}, {48, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.PV, PQ.P) annotation(
  Line(points = {{18, 48}, {30.81, 48}, {30.81, 22.22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PI_P.CS, GenAC.phi) annotation(
  Line(points = {{2, 54}, {-18, 54}, {-18, 4}, {-8, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PQ.p2, Ro.p) annotation(
  Line(points = {{57.9, 13.2}, {68, 13.2}, {68, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Ro.n, ACp) annotation(
  Line(points = {{68, 46}, {68, 60}, {90, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{10, 6}, {62, -28}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}, textString = "Pcontrol")}));
end Inverter_Pcontrol_ConstantEfficiency;

