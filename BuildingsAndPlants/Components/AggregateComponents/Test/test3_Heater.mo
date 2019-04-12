within BuildingsAndPlants.Components.AggregateComponents.Test;
model test3_Heater
  Heating.RoomHeater roomHeater(nLumps = 5, Ltube = 10, Dtube = 0.01, Mmetal = 10, gammaTubeMetal = 40) annotation(Placement(transformation(extent = {{-2, 0}, {40, 38}})));
  BaseComponents.Water.Sources.WaterSource_PT_fixed source_PT_fixed(T0 = 273.15 + 50) annotation(Placement(transformation(extent = {{-88, 22}, {-68, 42}})));
  BaseComponents.Water.Sinks.WaterSink_P_fixed sink_P_fixed annotation(Placement(transformation(extent = {{-88, -4}, {-68, 16}})));
  BaseComponents.Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN(n = 1, Ltube = 10, Dtube = 0.01, Tstart = 323.15) annotation(Placement(transformation(extent = {{-48, 22}, {-28, 42}})));
  BaseComponents.Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN1(n = 1, Ltube = 10, Dtube = 0.01, Tstart = 323.15) annotation(Placement(transformation(extent = {{-48, -4}, {-28, 16}})));
  BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {62, 20})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 273.15 + 5) annotation(Placement(transformation(extent = {{58, 46}, {78, 66}})));
equation
  connect(roomHeater.heatPort, convSca2Sca.ss2) annotation(Line(points = {{37.9, 19.38}, {46.95, 19.38}, {46.95, 20}, {56, 20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca.ss1, fixedTemperature.port) annotation(Line(points = {{68, 20}, {74, 20}, {74, 22}, {86, 22}, {86, 56}, {78, 56}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(source_PT_fixed.water_flange, pipeExchangingN.water_flange1) annotation(Line(points = {{-70, 32}, {-58, 32}, {-58, 32}, {-46, 32}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange2, roomHeater.water_flange1) annotation(Line(points = {{-30, 32}, {-16, 32}, {-16, 30.4}, {2.2, 30.4}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(sink_P_fixed.water_flange, pipeExchangingN1.water_flange1) annotation(Line(points = {{-70, 6}, {-58, 6}, {-58, 6}, {-46, 6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN1.water_flange2, roomHeater.water_flange2) annotation(Line(points = {{-30, 6}, {-14, 6}, {-14, 7.6}, {2.41, 7.6}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test3_Heater;

