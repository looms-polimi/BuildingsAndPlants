within BuildingsAndPlants.Components.BaseComponents.Electrical.PV;

model Module
  parameter Resistance Ron_d = 1.E-5 "Diodes Ron";
  parameter Conductance Goff_d = 1.E-5 "Diodes Goff";
  parameter Voltage Vt_d = 0.7 "Diodes threshold V";
  parameter Resistance Rp = 200 "Module parallel R";
  parameter Resistance Rs = 0.02 "Module series R";
  parameter Current Isc = 8.33 "Short circuit current";
  parameter Real alpha = 0.02 "Current/temperature gain";
  parameter HeatFlux Irr0 = 1000 "Reference radiative flux";
  parameter Temperature T0 = 300 "Reference temperature";
  parameter Mass M = 19 "Module mass";
  parameter SpecificHeatCapacity cp = 300 "Module cp";
  
  Modelica.Electrical.Analog.Ideal.IdealDiode D1(Ron = Ron_d, Goff = Goff_d, Vknee = Vt_d, useHeatPort = true) annotation(
  Placement(transformation(origin = {-12, -18}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Analog.Ideal.IdealDiode D2(Ron = Ron_d, Goff = Goff_d, Vknee = Vt_d, useHeatPort = true) annotation(
  Placement(transformation(origin = {8, -4}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(
  Placement(transformation(origin = {-32, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{60, 20}, {100, 60}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{60, -60}, {100, -20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.HeatingResistor Rpar(R_ref = Rp) annotation(
  Placement(transformation(origin = {32, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.HeatingResistor Rser(R_ref = Rs) annotation(
  Placement(transformation(extent = {{40, 30}, {60, 50}}, rotation = 0)));
  Thermal.Capacities.MassT heatCap(Tstart = T0, M = M, cp = cp) annotation(
  Placement(transformation(origin = {66, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
  Placement(transformation(extent = {{-20, 60}, {20, 100}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Phi annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-90, 82}), iconTransformation(extent = {{-100, 20}, {-60, 60}})));
  Modelica.Blocks.Math.Gain S(k = Isc / Irr0) annotation(
  Placement(transformation(origin = {-90, -7}, extent = {{-5, -4}, {5, 4}}, rotation = 270)));
  Modelica.Blocks.Math.Gain S1(k = alpha) annotation(
  Placement(transformation(origin = {-66, -7}, extent = {{-5, -4}, {5, 4}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
  Placement(transformation(extent = {{-12, 48}, {-32, 68}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback f1 annotation(
  Placement(transformation(origin = {-56, 22}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant t0(k = T0) annotation(
  Placement(transformation(extent = {{-84, 18}, {-76, 26}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
  Placement(transformation(origin = {-84, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
equation
  connect(Rser.n, p) annotation(
  Line(points = {{60, 40}, {80, 40}}, color = {0, 0, 255}));
  connect(Rser.p, Rpar.n) annotation(
  Line(points = {{40, 40}, {32, 40}, {32, 22}}, color = {0, 0, 255}));
  connect(Rser.p, D2.p) annotation(
  Line(points = {{40, 40}, {8, 40}, {8, 6}}, color = {0, 0, 255}));
  connect(Rser.p, D1.p) annotation(
  Line(points = {{40, 40}, {-12, 40}, {-12, -8}}, color = {0, 0, 255}));
  connect(Rser.p, signalCurrent.n) annotation(
  Line(points = {{40, 40}, {-32, 40}, {-32, 14}}, color = {0, 0, 255}));
  connect(n, Rpar.p) annotation(
  Line(points = {{80, -40}, {32, -40}, {32, 2}}, color = {0, 0, 255}));
  connect(n, D2.n) annotation(
  Line(points = {{80, -40}, {8, -40}, {8, -14}}, color = {0, 0, 255}));
  connect(n, D1.n) annotation(
  Line(points = {{80, -40}, {-12, -40}, {-12, -28}}, color = {0, 0, 255}));
  connect(n, signalCurrent.p) annotation(
  Line(points = {{80, -40}, {-32, -40}, {-32, -6}}, color = {0, 0, 255}));
  connect(heatPort, Rser.heatPort) annotation(
  Line(points = {{1.11022e-15, 80}, {1.11022e-15, 26}, {50, 26}, {50, 30}}, color = {191, 0, 0}));
  connect(Phi, S.u) annotation(
  Line(points = {{-90, 82}, {-90, -1}}, color = {0, 0, 127}));
  connect(sT.port, heatPort) annotation(
  Line(points = {{-12, 58}, {1.11022e-15, 58}, {1.11022e-15, 80}}, color = {191, 0, 0}));
  connect(sT.T, f1.u1) annotation(
  Line(points = {{-32, 58}, {-56, 58}, {-56, 30}}, color = {0, 0, 127}));
  connect(t0.y, f1.u2) annotation(
  Line(points = {{-75.6, 22}, {-66, 22}, {-64, 22}}, color = {0, 0, 127}));
  connect(f1.y, S1.u) annotation(
  Line(points = {{-56, 13}, {-56, 4}, {-66, 4}, {-66, -1}}, color = {0, 0, 127}));
  connect(S.y, add.u2) annotation(
  Line(points = {{-90, -12.5}, {-90, -18}, {-90, -34}}, color = {0, 0, 127}));
  connect(add.y, signalCurrent.i) annotation(
  Line(points = {{-84, -57}, {-84, -68}, {-46, -68}, {-46, 4}, {-39, 4}}, color = {0, 0, 127}));
  connect(S1.y, add.u1) annotation(
  Line(points = {{-66, -12.5}, {-66, -18}, {-78, -18}, {-78, -34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Rser.heatPort, heatCap.surf) annotation(
  Line(points = {{50, 30}, {50, 12}, {58, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(Rpar.heatPort, heatCap.surf) annotation(
  Line(points = {{42, 12}, {58, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(D2.heatPort, heatCap.surf) annotation(
  Line(points = {{18, -4}, {50, -4}, {50, 12}, {58, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(D1.heatPort, heatCap.surf) annotation(
  Line(points = {{-2, -18}, {50, -18}, {50, 12}, {58, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid)}));
end Module;
