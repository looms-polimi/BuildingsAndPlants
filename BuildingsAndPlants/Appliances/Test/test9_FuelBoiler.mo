within BuildingsAndPlants.Appliances.Test;

model test9_FuelBoiler
  Components.AggregateComponents.Heating.FuelBoiler FuelBoiler(Td = 273.15 + 70) annotation(Placement(transformation(extent = {{-34, 12}, {18, 58}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 10) annotation(Placement(transformation(extent = {{-36, 66}, {-16, 86}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 295.15) annotation(Placement(transformation(extent = {{-82, 66}, {-62, 86}})));
  Components.BaseComponents.Water.Sources.WaterSource_PT_fixed source_PT_fixed(T0 = 273.15 + 15) annotation(Placement(transformation(extent = {{-106, 20}, {-86, 40}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 3) annotation(Placement(transformation(extent = {{34, 56}, {54, 76}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 3) annotation(Placement(transformation(extent = {{52, 76}, {72, 96}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 2000) annotation(Placement(transformation(extent = {{-56, 42}, {-44, 54}})));
  Components.AggregateComponents.Heating.RoomHeater roomHeater annotation(Placement(transformation(extent = {{40, 28}, {60, 48}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 3) annotation(Placement(transformation(extent = {{66, 38}, {76, 48}})));
equation
  connect(thermalConductor.port_b, FuelBoiler.e) annotation(Line(points = {{-16, 76}, {-8, 76}, {-8, 54.9333}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor.port_a, fixedTemperature.port) annotation(Line(points = {{-36, 76}, {-62, 76}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor1.port_a, fixedTemperature.port) annotation(Line(points = {{34, 66}, {10, 66}, {10, 92}, {-50, 92}, {-50, 76}, {-62, 76}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor2.port_a, fixedTemperature.port) annotation(Line(points = {{52, 86}, {20, 86}, {20, 96}, {-56, 96}, {-56, 76}, {-62, 76}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(booleanStep.y, FuelBoiler.ON) annotation(Line(points = {{-43.4, 48}, {-28, 48}, {-28, 54.1667}, {-16.32, 54.1667}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(thermalConductor3.port_b, fixedTemperature.port) annotation(Line(points = {{76, 43}, {78, 43}, {78, 52}, {-2, 52}, {-2, 88}, {-42, 88}, {-42, 76}, {-62, 76}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(roomHeater.heatPort, thermalConductor3.port_a) annotation(Line(points = {{59, 38.2}, {62, 38.2}, {62, 43}, {66, 43}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(FuelBoiler.water_flange2, roomHeater.water_flange1) annotation(Line(points = {{2.4, 35}, {20, 35}, {20, 44}, {42, 44}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(FuelBoiler.water_flange3, roomHeater.water_flange2) annotation(Line(points = {{-8.13, 19.6667}, {-8.13, 16}, {42.1, 16}, {42.1, 32}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(FuelBoiler.water_flange1, source_PT_fixed.water_flange) annotation(Line(points = {{-18.4, 35}, {-53.2, 35}, {-53.2, 30}, {-88, 30}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test9_FuelBoiler;
