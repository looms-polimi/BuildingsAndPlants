within BuildingsAndPlants.Appliances.Accessories.BaseClasses;

model Refrigerator_powers
  // electrical parameters
  parameter SI.Power Pnom = 90 "Compressor power";
  parameter SI.Voltage Vnom = 220 "Nominal voltage";
  parameter SI.Resistance R = Vnom ^ 2 / Pnom "Compressor resistance";
  // cell parameters
  parameter SI.Volume Vi = 0.3 "Refrigerator internal capacity";
  parameter SI.HeatCapacity Ci = 1008 * Vi;
  SI.Temp_K Ti;
  SI.Energy Ei(start = Ci * 277.15);
  // evaporator parameters
  parameter SI.HeatCapacity Cev = 0.5;
  SI.Temp_K Tev;
  SI.Energy Eev(start = Cev * 253.15);
  // condenser parameters
  parameter SI.HeatCapacity Ccond = 0.5;
  SI.Temp_K Tcond;
  SI.Energy Econd(start = Ccond * 318.15);
  // thermal conductance
  parameter SI.ThermalConductance Guf = 5 "Thermal conductance for opening of the door";
  parameter SI.ThermalConductance Gr = 2;
  SI.Temp_K Tuf;
  SI.ThermalConductance G;
  parameter SI.ThermalConductance Gi_ev = 0.05;
  // heat flow rate
  SI.HeatFlowRate Qi_ev;
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 90, origin = {-60, -96}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-60, -100})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = R) annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {60, 22})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch annotation(
  Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {60, -8})));
  Modelica.Blocks.Interfaces.BooleanInput open annotation(
  Placement(transformation(extent = {{20, -20}, {-8, 8}}, rotation = 180, origin = {-88, -6})));
  Interfaces.Thermal.HeatPort ef annotation(
  Placement(transformation(extent = {{-40, 80}, {-20, 100}})));
  Interfaces.Thermal.HeatPort er annotation(
  Placement(transformation(extent = {{40, 80}, {60, 100}})));
  Modelica.Blocks.Interfaces.RealOutput T annotation(
  Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {40, -94}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {60, -98})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{76, 30}, {110, 64}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{110, -64}, {76, -30}})));
equation
  if ON then
    der(Eev) = 0;
    der(Econd) = 0;
    Tev = 253.15;
    Tcond = 318.15;
  else
    Eev = Cev * Tev;
    Econd = Ccond * Tcond;
    der(Eev) = Qi_ev;
    der(Econd) = er.Q_flow;
  end if;
  Ei = Ci * Ti;
  der(Ei) = ef.Q_flow - Qi_ev;
  Qi_ev = Gi_ev * (Ti - Tev);
  T = Ti;
  ef.Q_flow = Guf * (ef.T - Tuf);
  ef.Q_flow = G * (Tuf - Ti);
  er.Q_flow = Gr * (er.T - Tcond);
  G = if open then 1000 else 0.005;
  connect(resistor.n, idealClosingSwitch.p) annotation(
  Line(points = {{60, 12}, {60, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.control, ON) annotation(
  Line(points = {{53, -8}, {-60, -8}, {-60, -96}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(resistor.p, p) annotation(
  Line(points = {{60, 32}, {60, 47}, {93, 47}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.n, n) annotation(
  Line(points = {{60, -18}, {60, -47}, {93, -47}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-38, -18}, {36, -90}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-38, 74}, {48, -50}}, lineColor = {0, 0, 255}, textString = "P"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0})}));
end Refrigerator_powers;
