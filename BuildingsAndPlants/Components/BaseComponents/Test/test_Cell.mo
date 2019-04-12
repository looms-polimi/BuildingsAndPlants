within BuildingsAndPlants.Components.BaseComponents.Test;

model test_Cell
  Electrical.PV.Cell cell annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 2) annotation(Placement(transformation(extent = {{-60, -38}, {-40, -18}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 283.15) annotation(Placement(transformation(extent = {{-90, -80}, {-70, -60}})));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1 / 20, offset = 10, amplitude = 9) annotation(Placement(transformation(extent = {{-98, 70}, {-78, 90}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 100) annotation(Placement(transformation(extent = {{0, 6}, {20, 26}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-8, -52}, {12, -32}})));
equation
  connect(cell.surf, thermalConductor.port_b) annotation(Line(points = {{-32, 2}, {-32, -28}, {-40, -28}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor.port_a, fixedTemperature.port) annotation(Line(points = {{-60, -28}, {-62, -28}, {-62, -70}, {-70, -70}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(cell.p, resistor.p) annotation(Line(points = {{-22, 16}, {-5.55112e-16, 16}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor.n, cell.n) annotation(Line(points = {{20, 16}, {30, 16}, {30, 4}, {-22, 4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(cell.n, ground.p) annotation(Line(points = {{-22, 4}, {2, 4}, {2, -32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(sine.y, cell.Phi) annotation(Line(points = {{-77, 80}, {-72, 80}, {-72, 78}, {-58, 78}, {-58, 16}, {-38, 16}}, color = {0, 0, 127}, pattern = LinePattern.None, thickness = 1, smooth = Smooth.None));
  annotation(Diagram(graphics), experiment(StopTime = 100, Tolerance = 1e-05), experimentSetupOutput(equdistant = false));
end test_Cell;
