within BuildingsAndPlants.Components.AggregateComponents.Test;
model Test_Inverter_Phi0andPcontrol_Nswitch
  Electrical.Inverter_Pcontrol_ConstantEfficiency INV1(eta = 0.9) annotation(Placement(transformation(extent = {{-38, 8}, {2, 48}})));
  Modelica.Electrical.Analog.Basic.Ground DCgnd annotation(Placement(transformation(extent = {{-100, -88}, {-80, -68}})));
  Modelica.Electrical.Analog.Basic.Resistor DCR1(R = 1) annotation(Placement(transformation(extent = {{-84, 30}, {-64, 50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage VDC(V = 400) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, -48})));
  BaseComponents.Electrical.Phasors.Load_VPcosphi_nom ACload1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {20, 28})));
  BaseComponents.Electrical.Phasors.Ground ACgnd annotation(Placement(transformation(extent = {{10, -90}, {30, -70}})));
  Modelica.Blocks.Sources.RealExpression iP(y = 100) annotation(Placement(transformation(extent = {{-124, -16}, {-104, 4}})));
  BaseComponents.Electrical.Phasors.Vgen_Sine_Fixed Network1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {110, 30})));
  BaseComponents.Electrical.Phasors.TransmissionLine transmissionLine(l = 10) annotation(Placement(transformation(extent = {{40, 24}, {60, 44}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period = 0.1) annotation(Placement(transformation(extent = {{36, 58}, {56, 78}})));
  BaseComponents.Electrical.Phasors.Switch switch annotation(Placement(transformation(extent = {{76, 30}, {96, 50}})));
equation
  connect(DCgnd.p, VDC.n) annotation(Line(points = {{-90, -68}, {-90, -58}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(VDC.p, DCR1.p) annotation(Line(points = {{-90, -38}, {-90, 40}, {-84, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(DCR1.n, INV1.DCp) annotation(Line(points = {{-64, 40}, {-36, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(INV1.ACn, ACload1.n) annotation(Line(points = {{8.88178e-16, 16}, {20, 16}, {20, 19}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(iP.y, INV1.Pac) annotation(Line(points = {{-103, -6}, {-18, -6}, {-18, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(INV1.ACp, ACload1.p) annotation(Line(points = {{8.88178e-16, 40}, {20, 40}, {20, 37}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACload1.p, transmissionLine.p1) annotation(Line(points = {{20, 37}, {20, 40}, {41, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACload1.n, ACgnd.p) annotation(Line(points = {{20, 19}, {20, -72}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ACload1.n, transmissionLine.n1) annotation(Line(points = {{20, 19}, {20, 16}, {41, 16}, {41, 28}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(transmissionLine.n2, Network1.n) annotation(Line(points = {{59, 28}, {60, 28}, {60, 16}, {110, 16}, {110, 22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(INV1.DCn, VDC.n) annotation(Line(points = {{-36, 16}, {-64, 16}, {-64, -58}, {-90, -58}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(transmissionLine.p2, switch.p) annotation(Line(points = {{59, 40}, {78, 40}, {78, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(switch.n, Network1.p) annotation(Line(points = {{94, 40}, {110, 40}, {110, 38}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(booleanPulse.y, switch.close) annotation(Line(points = {{57, 68}, {86, 68}, {86, 48}}, color = {255, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})), experiment(StopTime = 10), __Dymola_experimentSetupOutput);
end Test_Inverter_Phi0andPcontrol_Nswitch;

