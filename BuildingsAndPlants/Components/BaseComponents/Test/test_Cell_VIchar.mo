within BuildingsAndPlants.Components.BaseComponents.Test;
model test_Cell_VIchar
  Electrical.PV.Cell cell annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293.15) annotation(Placement(transformation(extent = {{-90, -80}, {-70, -60}})));
  Modelica.Blocks.Sources.Constant Phi(k = 1000) annotation(Placement(transformation(extent = {{-94, 10}, {-74, 30}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-8, -52}, {12, -32}})));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation(Placement(transformation(extent = {{0, 6}, {20, 26}})));
  Modelica.Blocks.Sources.Ramp sine(height = 1e4, duration = 100, offset = 0) annotation(Placement(transformation(extent = {{-52, 40}, {-32, 60}})));
equation
  connect(cell.n, ground.p) annotation(Line(points = {{-22, 4}, {2, 4}, {2, -32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Phi.y, cell.Phi) annotation(Line(points = {{-73, 20}, {-66, 20}, {-66, 14}, {-52, 14}, {-52, 16}, {-38, 16}}, color = {0, 0, 127}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  connect(fixedTemperature.port, cell.surf) annotation(Line(points = {{-70, -70}, {-32, -70}, {-32, 2}}, color = {191, 0, 0}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  connect(cell.p, variableResistor.p) annotation(Line(points = {{-22, 16}, {-5.55112e-16, 16}}, color = {0, 0, 255}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  connect(variableResistor.n, ground.p) annotation(Line(points = {{20, 16}, {26, 16}, {26, -32}, {2, -32}}, color = {0, 0, 255}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  connect(sine.y, variableResistor.R) annotation(Line(points = {{-31, 50}, {10, 50}, {10, 27}}, color = {0, 0, 127}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  annotation(Diagram(graphics), experiment(StopTime = 100, Tolerance = 1e-05), experimentSetupOutput(equdistant = false));
end test_Cell_VIchar;

