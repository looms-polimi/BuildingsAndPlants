within BuildingsAndPlants.Components.AggregateComponents.Test;
model test1_WaterCoil
  BaseComponents.Water.Sources.WaterSource_PT_fixed source_PT_fixed(T0 = 273.15 + 50) annotation(Placement(transformation(extent = {{-88, 32}, {-68, 52}})));
  BaseComponents.Water.Sinks.WaterSink_P_fixed sink_P_fixed annotation(Placement(transformation(extent = {{-88, -68}, {-68, -48}})));
  Heating.WaterCoilWithWall waterCoilWithWall(Ltube = 0.5, Dtube = 0.005, gammaTubeMetal = 100, cpMetal = 300, Tstart = 273.15 + 20, Mmetal = 0.06, STube = 1, gammaMetalExternal = 100) annotation(Placement(transformation(extent = {{-20, 0}, {0, 20}})));
  BaseComponents.Water.Pumps.WaterPump_Volumetric volumetricPump(qmax = 0.001) annotation(Placement(transformation(extent = {{-50, 32}, {-30, 52}})));
  Modelica.Blocks.Sources.Step step annotation(Placement(transformation(extent = {{-98, 68}, {-86, 80}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.1) annotation(Placement(transformation(extent = {{-74, 68}, {-62, 80}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 10) annotation(Placement(transformation(extent = {{24, 2}, {40, 18}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 50) annotation(Placement(transformation(extent = {{24, -38}, {40, -22}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 273.15 + 20) annotation(Placement(transformation(extent = {{84, -20}, {64, 0}})));
  Heating.WaterCoilWithWall waterCoilWithWall2(Ltube = 0.5, Dtube = 0.005, gammaTubeMetal = 100, cpMetal = 300, Tstart = 273.15 + 20, Mmetal = 0.06, STube = 1, gammaMetalExternal = 100) annotation(Placement(transformation(extent = {{-20, -40}, {0, -20}})));
equation
  connect(firstOrder.y, volumetricPump.cmd) annotation(Line(points = {{-61.4, 74}, {-54, 74}, {-54, 47.8}, {-45.2, 47.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(step.y, firstOrder.u) annotation(Line(points = {{-85.4, 74}, {-75.2, 74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(thermalConductor.port_b, fixedTemperature.port) annotation(Line(points = {{40, 10}, {52, 10}, {52, -10}, {64, -10}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor1.port_b, fixedTemperature.port) annotation(Line(points = {{40, -30}, {52, -30}, {52, -10}, {64, -10}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall2.heatPort, thermalConductor1.port_a) annotation(Line(points = {{-1.5, -30}, {24, -30}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.heatPort, thermalConductor.port_a) annotation(Line(points = {{-1.5, 10}, {24, 10}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump.water_flange1, source_PT_fixed.water_flange) annotation(Line(points = {{-48, 42}, {-70, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange1, volumetricPump.water_flange2) annotation(Line(points = {{-18, 16}, {-26, 16}, {-26, 42}, {-32, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange2, waterCoilWithWall2.water_flange1) annotation(Line(points = {{-17.9, 4}, {-26, 4}, {-26, -24}, {-18, -24}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall2.water_flange2, sink_P_fixed.water_flange) annotation(Line(points = {{-17.9, -36}, {-26, -36}, {-26, -58}, {-70, -58}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test1_WaterCoil;

