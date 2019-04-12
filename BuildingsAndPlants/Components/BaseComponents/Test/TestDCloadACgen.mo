within BuildingsAndPlants.Components.BaseComponents.Test;
model TestDCloadACgen
  Electrical.DC.Load_Pin_I0 Load1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-18, 6})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-56, -42}, {-36, -22}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0.01) annotation(Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-84, 8})));
  Modelica.Blocks.Sources.RealExpression Pin1(y = 5 * sin(10 * time)) annotation(Placement(transformation(extent = {{-62, -4}, {-42, 16}})));
  Electrical.Phasors.Vgen_Sine_VP vgen_Sine_VP annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {22, 10})));
  Electrical.Phasors.Ground ground1 annotation(Placement(transformation(extent = {{26, -42}, {46, -22}})));
  Electrical.Phasors.Vgen_Sine_Fixed vgen_Sine_Fixed annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {76, 10})));
  Modelica.Blocks.Sources.RealExpression V(y = 100) annotation(Placement(transformation(extent = {{-14, -20}, {6, 0}})));
  Modelica.Blocks.Sources.RealExpression V1(y = 1) annotation(Placement(transformation(extent = {{-14, -54}, {6, -34}})));
  Electrical.Phasors.Load_VPcosphi_nom load_VPcosphi_nom(Vnom = 1, Pnom = 1) annotation(Placement(transformation(extent = {{38, 22}, {58, 42}})));
equation
  connect(constantVoltage.p, resistor.p) annotation(Line(points = {{-84, 18}, {-84, 30}, {-60, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage.n, ground.p) annotation(Line(points = {{-84, -2}, {-84, -22}, {-46, -22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor.n, Load1.p) annotation(Line(points = {{-40, 30}, {-18, 30}, {-18, 16}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Load1.n, ground.p) annotation(Line(points = {{-18, -4}, {-18, -22}, {-46, -22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Pin1.y, Load1.iPabs) annotation(Line(points = {{-41, 6}, {-25, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(vgen_Sine_VP.n, ground1.p) annotation(Line(points = {{22, 2}, {36, 2}, {36, -24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(V.y, vgen_Sine_VP.V) annotation(Line(points = {{7, -10}, {8, -10}, {8, 6}, {14, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(vgen_Sine_VP.p, load_VPcosphi_nom.p) annotation(Line(points = {{22, 18}, {22, 32}, {39, 32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(vgen_Sine_Fixed.n, ground1.p) annotation(Line(points = {{76, 2}, {36, 2}, {36, -24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Load1.Pabs, vgen_Sine_VP.P) annotation(Line(points = {{-11, 6}, {0, 6}, {0, 14}, {14, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(load_VPcosphi_nom.n, vgen_Sine_Fixed.p) annotation(Line(points = {{57, 32}, {76, 32}, {76, 18}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment, __Dymola_experimentSetupOutput);
end TestDCloadACgen;

