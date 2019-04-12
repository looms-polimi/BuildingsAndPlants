within BuildingsAndPlants.Components.AggregateComponents.Electrical;
model Inverter_IdealPcontrol_ConstantEfficiency
  extends Components.AggregateComponents.Electrical.BaseClasses.BaseInverter;
  parameter SI.Voltage Vac = 100 "AC voltage";
  parameter Real eta = 0.95 "Efficiency";
  parameter SI.Resistance Rout = 1 "Output R";
  parameter Reactance Xout = 0.1 "Output X";
  Modelica.Blocks.Interfaces.RealInput Pac annotation(
  Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {-90, -82}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -80})));
  BaseComponents.Electrical.DC.Load_Pin_I0 Load1 annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 0})));
  BaseComponents.Electrical.Phasors.Vgen_Sine_VP vgen_Sine_VP annotation(
  Placement(transformation(extent = {{-20, 20}, {20, -20}}, rotation = -90, origin = {62, -26})));
  BaseComponents.Electrical.Phasors.R_plus_jX Zout(R = Rout, X = Xout) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {60, 26})));
  Modelica.Blocks.Sources.RealExpression posP(y = max(Pac, 0)) annotation(
  Placement(transformation(extent = {{-74, -92}, {-46, -72}})));
  Modelica.Blocks.Sources.RealExpression Vmag(y = Vac) annotation(
  Placement(transformation(extent = {{20, -64}, {34, -44}})));
  Modelica.Blocks.Math.Gain iEff(k = 1 / eta) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-30, -30})));
  Modelica.Blocks.Math.Gain chs(k = -1) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-6, -82})));
equation
  Qloss = iEff.y - iEff.u;
  connect(DCn, Load1.n) annotation(
  Line(points = {{-90, -60}, {-2.66454e-15, -60}, {-2.66454e-15, -20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(DCp, Load1.p) annotation(
  Line(points = {{-90, 60}, {4.88498e-15, 60}, {4.88498e-15, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vmag.y, vgen_Sine_VP.V) annotation(
  Line(points = {{34.7, -54}, {38, -54}, {38, -34}, {46, -34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Zout.n, ACp) annotation(
  Line(points = {{60, 42}, {60, 60}, {90, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Zout.p, vgen_Sine_VP.p) annotation(
  Line(points = {{60, 10}, {60, -10}, {62, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(vgen_Sine_VP.n, ACn) annotation(
  Line(points = {{62, -42}, {62, -60}, {90, -60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(iEff.y, Load1.iPabs) annotation(
  Line(points = {{-30, -19}, {-30, 0}, {-14, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(posP.y, iEff.u) annotation(
  Line(points = {{-44.6, -82}, {-30, -82}, {-30, -42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(posP.y, chs.u) annotation(
  Line(points = {{-44.6, -82}, {-18, -82}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(chs.y, vgen_Sine_VP.P) annotation(
  Line(points = {{5, -82}, {16, -82}, {16, -18}, {46, -18}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-8, 22}, {88, -34}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 0, 255}, textString = "Pcontrol
ideal")}));
end Inverter_IdealPcontrol_ConstantEfficiency;

