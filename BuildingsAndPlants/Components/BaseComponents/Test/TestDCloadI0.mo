within BuildingsAndPlants.Components.BaseComponents.Test;
model TestDCloadI0
  Electrical.DC.Load_Pin_I0 Load1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, 10})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-48, -38}, {-28, -18}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0.01) annotation(Placement(transformation(extent = {{-52, 24}, {-32, 44}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-76, 12})));
  Electrical.DC.Load_Pin_I0 Load2 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 10})));
  Modelica.Blocks.Sources.RealExpression Pin1(y = 5 * sin(10 * time)) annotation(Placement(transformation(extent = {{-54, 0}, {-34, 20}})));
  Modelica.Blocks.Sources.RealExpression Pin2(y = 2 * sin(15 * time)) annotation(Placement(transformation(extent = {{-4, -50}, {16, -30}})));
equation
  connect(constantVoltage.p, resistor.p) annotation(Line(points = {{-76, 22}, {-76, 34}, {-52, 34}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage.n, ground.p) annotation(Line(points = {{-76, 2}, {-76, -18}, {-38, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor.n, Load1.p) annotation(Line(points = {{-32, 34}, {-10, 34}, {-10, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Load1.n, ground.p) annotation(Line(points = {{-10, 1.33227e-15}, {-10, -18}, {-38, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Pin1.y, Load1.iPabs) annotation(Line(points = {{-33, 10}, {-17, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pin2.y, Load2.iPabs) annotation(Line(points = {{17, -40}, {30, -40}, {30, 10}, {43, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Load2.p, Load1.p) annotation(Line(points = {{50, 20}, {50, 34}, {-10, 34}, {-10, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Load2.n, ground.p) annotation(Line(points = {{50, 1.33227e-15}, {50, -18}, {-38, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment, __Dymola_experimentSetupOutput);
end TestDCloadI0;

