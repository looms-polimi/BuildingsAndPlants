within BuildingsAndPlants.Components.BaseComponents.Test;
model testModule1
  Electrical.PV.Module module1_1(Vt_d = 0.7) annotation(Placement(transformation(extent = {{0, 4}, {20, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0.02) annotation(Placement(transformation(extent = {{48, 8}, {68, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 800) annotation(Placement(transformation(extent = {{-50, 8}, {-30, 28}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tamb annotation(Placement(transformation(extent = {{-40, 60}, {-20, 80}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 2) annotation(Placement(transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{38, -36}, {58, -16}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = -10, offset = 300, startTime = 20000) annotation(Placement(transformation(extent = {{-90, 60}, {-70, 80}}, rotation = 0)));
equation
  connect(thermalConductor.port_b, module1_1.heatPort) annotation(Line(points = {{10, 40}, {10, 30}, {10, 22}}, color = {191, 0, 0}));
  connect(Tamb.port, thermalConductor.port_a) annotation(Line(points = {{-20, 70}, {10, 70}, {10, 60}}, color = {191, 0, 0}));
  connect(step.y, Tamb.T) annotation(Line(points = {{-69, 70}, {-42, 70}}, color = {0, 0, 127}));
  connect(const.y, module1_1.Phi) annotation(Line(points = {{-29, 18}, {2, 18}}, color = {0, 0, 127}));
  connect(module1_1.p, resistor.p) annotation(Line(points = {{18, 18}, {48, 18}}, color = {0, 0, 255}));
  connect(resistor.n, ground.p) annotation(Line(points = {{68, 18}, {76, 18}, {76, -16}, {48, -16}}, color = {0, 0, 255}));
  connect(module1_1.n, ground.p) annotation(Line(points = {{18, 10}, {26, 10}, {26, -16}, {48, -16}}, color = {0, 0, 255}));
  annotation(Diagram(graphics), experiment(StopTime = 30000), experimentSetupOutput(equdistant = false));
end testModule1;

