within BuildingsAndPlants.Appliances.Test;

model test8_ElectricBoiler
  Components.AggregateComponents.Heating.ElectricBoiler ElectricBoiler(Td = 273.15 + 70, Vboiler = 0.1, Pnom = 20000) annotation(Placement(transformation(extent = {{-36, 0}, {24, 46}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 5) annotation(Placement(transformation(extent = {{-36, 66}, {-16, 86}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 295.15) annotation(Placement(transformation(extent = {{-82, 66}, {-62, 86}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 220, freqHz = 50) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {76, 22})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{36, -16}, {56, 4}})));
  Components.BaseComponents.Water.Sinks.WaterSink_W sink_P_fixed annotation(Placement(transformation(extent = {{-78, -56}, {-58, -36}})));
  Components.BaseComponents.Water.Sources.WaterSource_PT_fixed source_PT_fixed(T0 = 273.15 + 25) annotation(Placement(transformation(extent = {{-98, 10}, {-78, 30}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep annotation(Placement(transformation(extent = {{-56, 42}, {-44, 54}})));
  Components.BaseComponents.Water.Pipes.BaseClasses.WaterPipeExchangingElement pipeExchangingElement annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-40, -20})));
  Modelica.Blocks.Sources.Pulse pulse(startTime = 3600, period = 3600, width = 0.5, amplitude = 0.01) annotation(Placement(transformation(extent = {{-96, -52}, {-84, -40}})));
equation
  connect(thermalConductor.port_b, ElectricBoiler.e) annotation(Line(points = {{-16, 76}, {-6, 76}, {-6, 40.25}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor.port_a, fixedTemperature.port) annotation(Line(points = {{-36, 76}, {-62, 76}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(ElectricBoiler.p, sineVoltage.p) annotation(Line(points = {{7.95, 32.0083}, {76, 32.0083}, {76, 32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(sineVoltage.n, ElectricBoiler.n) annotation(Line(points = {{76, 12}, {7.95, 12}, {7.95, 13.9917}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(sineVoltage.n, ground.p) annotation(Line(points = {{76, 12}, {46, 12}, {46, 4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(booleanStep.y, ElectricBoiler.ON) annotation(Line(points = {{-43.4, 48}, {-28, 48}, {-28, 41.975}, {-16.65, 41.975}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(sink_P_fixed.Win, pulse.y) annotation(Line(points = {{-73.2, -46}, {-83.4, -46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ElectricBoiler.water_flange1, source_PT_fixed.water_flange) annotation(Line(points = {{-18, 34.5}, {-48, 34.5}, {-48, 20}, {-80, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ElectricBoiler.water_flange2, pipeExchangingElement.water_flange1) annotation(Line(points = {{-17.85, 11.5}, {-17.85, -0.25}, {-40, -0.25}, {-40, -12}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingElement.water_flange2, sink_P_fixed.water_flange) annotation(Line(points = {{-40, -28}, {-40, -46}, {-60, -46}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test8_ElectricBoiler;
