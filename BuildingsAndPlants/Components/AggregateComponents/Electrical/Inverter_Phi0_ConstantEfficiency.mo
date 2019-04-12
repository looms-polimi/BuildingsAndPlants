within BuildingsAndPlants.Components.AggregateComponents.Electrical;
model Inverter_Phi0_ConstantEfficiency
  extends Components.AggregateComponents.Electrical.BaseClasses.BaseInverter;
  parameter SI.Voltage Vac = 100 "AC voltage";
  parameter Real eta = 0.95 "Efficiency";
  BaseComponents.Electrical.Phasors.Vgen_Sine_Fixed GenAC(V = Vac) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, 0})));
  BaseComponents.Electrical.Phasors.PQmeter PQ annotation(
  Placement(transformation(extent = {{18, -22}, {60, 22}})));
equation
  DCp.i + DCn.i = 0;
  DCp.i * (DCp.v - DCn.v) = PQ.P / eta;
  Qloss = PQ.P * (1 / eta - 1);
  connect(GenAC.p, PQ.p1) annotation(
  Line(points = {{1.77636e-015, 8}, {1.77636e-015, 13.2}, {20.1, 13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(GenAC.n, PQ.n1) annotation(
  Line(points = {{-1.77636e-015, -8}, {-1.77636e-015, -13.2}, {20.1, -13.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQ.p2, ACp) annotation(
  Line(points = {{57.9, 13.2}, {68, 13.2}, {68, 60}, {90, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQ.n2, ACn) annotation(
  Line(points = {{57.9, -13.2}, {68, -13.2}, {68, -60}, {90, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Inverter_Phi0_ConstantEfficiency;

