within BuildingsAndPlants.Appliances.Test;

model test4_FSC_2c
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 100) annotation(Placement(transformation(extent = {{-8, 60}, {8, 76}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 273.15 + 20) annotation(Placement(transformation(extent = {{-94, 58}, {-74, 78}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 100) annotation(Placement(transformation(extent = {{54, 80}, {70, 96}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 100) annotation(Placement(transformation(extent = {{-58, -22}, {-42, -6}})));
  Accessories.CompactRefrigerator_FSC_2C compactRefrigerator_FSC_2C annotation(Placement(transformation(extent = {{-32, -60}, {46, 32}})));
equation
  connect(fixedTemperature1.port, thermalConductor2.port_a) annotation(Line(points = {{-74, 68}, {-8, 68}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor2.port_b, compactRefrigerator_FSC_2C.portHeatRecCondenser) annotation(Line(points = {{8, 68}, {26.305, 68}, {26.305, 1.33333}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor1.port_a, thermalConductor2.port_a) annotation(Line(points = {{54, 88}, {-46, 88}, {-46, 68}, {-8, 68}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor1.port_b, compactRefrigerator_FSC_2C.portHeatRecCompressor) annotation(Line(points = {{70, 88}, {86, 88}, {86, -44.36}, {30.4, -44.36}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor3.port_a, thermalConductor2.port_a) annotation(Line(points = {{-58, -14}, {-68, -14}, {-68, 68}, {-8, 68}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor3.port_b, compactRefrigerator_FSC_2C.portAmbient) annotation(Line(points = {{-42, -14}, {-20.3, -14}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test4_FSC_2c;
