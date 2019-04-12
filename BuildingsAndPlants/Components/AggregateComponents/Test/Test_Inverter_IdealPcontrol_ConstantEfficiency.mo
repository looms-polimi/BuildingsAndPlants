within BuildingsAndPlants.Components.AggregateComponents.Test;
model Test_Inverter_IdealPcontrol_ConstantEfficiency
  Modelica.Electrical.Analog.Basic.Ground DCgnd annotation(Placement(transformation(extent = {{-120, -44}, {-100, -24}})));
  Modelica.Electrical.Analog.Basic.Resistor DCR(R = 0.1) annotation(Placement(transformation(extent = {{-100, 62}, {-80, 82}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage VDC(V = 400) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-110, -4})));
  BaseComponents.Electrical.Phasors.Ground ACgnd annotation(Placement(transformation(extent = {{-32, 12}, {-12, 32}})));
  BaseComponents.Electrical.Phasors.Vgen_Sine_Fixed Network annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {122, 62})));
  BaseComponents.Electrical.Phasors.Load_VPcosphi_nom Line(Vnom = 1, Pnom = 1) annotation(Placement(transformation(extent = {{34, 52}, {74, 92}})));
  Electrical.Inverter_IdealPcontrol_ConstantEfficiency inverter_IdealPcontrol_ConstantEfficiency(Xout = 0, Rout = 0.02) annotation(Placement(transformation(extent = {{-60, 40}, {-20, 80}})));
  Modelica.Blocks.Sources.RealExpression P(y = max(80 * sin(time), 0)) annotation(Placement(transformation(extent = {{-102, -72}, {-74, -52}})));
  BaseComponents.Electrical.Phasors.PQmeter PQmeter annotation(Placement(transformation(extent = {{-14, 40}, {26, 80}})));
equation
  connect(DCgnd.p, VDC.n) annotation(Line(points = {{-110, -24}, {-110, -14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(VDC.p, DCR.p) annotation(Line(points = {{-110, 6}, {-110, 72}, {-100, 72}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(DCR.n, inverter_IdealPcontrol_ConstantEfficiency.DCp) annotation(Line(points = {{-80, 72}, {-58, 72}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(inverter_IdealPcontrol_ConstantEfficiency.DCn, VDC.n) annotation(Line(points = {{-58, 48}, {-72, 48}, {-72, -20}, {-110, -20}, {-110, -14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(P.y, inverter_IdealPcontrol_ConstantEfficiency.Pac) annotation(Line(points = {{-72.6, -62}, {-40, -62}, {-40, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(inverter_IdealPcontrol_ConstantEfficiency.ACp, PQmeter.p1) annotation(Line(points = {{-22, 72}, {-12, 72}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(inverter_IdealPcontrol_ConstantEfficiency.ACn, PQmeter.n1) annotation(Line(points = {{-22, 48}, {-12, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACgnd.p, inverter_IdealPcontrol_ConstantEfficiency.ACn) annotation(Line(points = {{-22, 30}, {-22, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQmeter.p2, Line.p) annotation(Line(points = {{24, 72}, {36, 72}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Line.n, Network.p) annotation(Line(points = {{72, 72}, {122, 72}, {122, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Network.n, PQmeter.n2) annotation(Line(points = {{122, 54}, {122, 48}, {24, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -120}, {140, 120}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -120}, {140, 120}})), experiment(StopTime = 20), __Dymola_experimentSetupOutput);
end Test_Inverter_IdealPcontrol_ConstantEfficiency;

