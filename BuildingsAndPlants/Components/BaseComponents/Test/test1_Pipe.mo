within BuildingsAndPlants.Components.BaseComponents.Test;

model test1_Pipe
  Water.Sources.WaterSource_PT_fixed source_PT_fixed2(P0(displayUnit = "bar") = 100000, T0 = 273.15 + 25) annotation(Placement(transformation(extent = {{-60, 70}, {-40, 90}})));
  Water.Sinks.WaterSink_P_fixed sink_P_fixed2(Pin = 100000) annotation(Placement(transformation(extent = {{48, 70}, {28, 90}})));
  Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN(n = 5, Ltube = 10, Dz = 1) annotation(Placement(transformation(extent = {{-16, 70}, {4, 90}})));
  Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN1(n = 5, Ltube = 10) annotation(Placement(transformation(extent = {{-16, 32}, {4, 52}})));
  Water.Sources.WaterSource_WT source_WT annotation(Placement(transformation(extent = {{-60, 32}, {-40, 52}})));
  Water.Sinks.WaterSink_P sink_P annotation(Placement(transformation(extent = {{48, 32}, {28, 52}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10) annotation(Placement(transformation(extent = {{-92, 56}, {-80, 68}})));
  Modelica.Blocks.Sources.Ramp ramp1(height = 101325, duration = 10, startTime = 10) annotation(Placement(transformation(extent = {{84, 36}, {72, 48}})));
  Modelica.Blocks.Sources.Constant ramp2(k = 273.15 + 25) annotation(Placement(transformation(extent = {{-94, 16}, {-82, 28}})));
  Water.Pipes.WaterPipeExchanging_Nvols pipeExchangingN2(n = 5, Ltube = 10) annotation(Placement(transformation(extent = {{-18, -58}, {2, -38}})));
  Water.Sources.WaterSource_WT source_WT1 annotation(Placement(transformation(extent = {{-62, -58}, {-42, -38}})));
  Water.Sinks.WaterSink_P sink_P1 annotation(Placement(transformation(extent = {{46, -58}, {26, -38}})));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 10) annotation(Placement(transformation(extent = {{-94, -34}, {-82, -22}})));
  Modelica.Blocks.Sources.Ramp ramp4(height = 101325, duration = 10, startTime = 10) annotation(Placement(transformation(extent = {{82, -54}, {70, -42}})));
  Modelica.Blocks.Sources.Constant ramp5(k = 273.15 + 50) annotation(Placement(transformation(extent = {{-96, -74}, {-84, -62}})));
  Thermal.Capacities.MassT massT(Tstart = 273.15 + 5) annotation(Placement(transformation(extent = {{-16, -6}, {4, 18}})));
  Thermal.HeatTransfer.Convection_SV convVec2Sca1(n = 5, S = 1, gamma = 40) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-6, -22})));
equation
  connect(ramp.y, source_WT.Win) annotation(Line(points = {{-79.4, 62}, {-72, 62}, {-72, 45}, {-55.2, 45}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp1.y, sink_P.Pin) annotation(Line(points = {{71.4, 42}, {43.2, 42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp2.y, source_WT.Tin) annotation(Line(points = {{-81.4, 22}, {-72, 22}, {-72, 39}, {-55.2, 39}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp3.y, source_WT1.Win) annotation(Line(points = {{-81.4, -28}, {-74, -28}, {-74, -45}, {-57.2, -45}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp4.y, sink_P1.Pin) annotation(Line(points = {{69.4, -48}, {41.2, -48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp5.y, source_WT1.Tin) annotation(Line(points = {{-83.4, -68}, {-74, -68}, {-74, -51}, {-57.2, -51}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(massT.surf, convVec2Sca1.ss) annotation(Line(points = {{-6, -3.6}, {-6, -16}, {-6, -16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convVec2Sca1.vs, pipeExchangingN2.heatPort) annotation(Line(points = {{-6, -28}, {-6, -43}, {-7.9, -43}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(source_PT_fixed2.water_flange, pipeExchangingN.water_flange1) annotation(Line(points = {{-42, 80}, {-14, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN.water_flange2, sink_P_fixed2.water_flange) annotation(Line(points = {{2, 80}, {30, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(source_WT.water_flange, pipeExchangingN1.water_flange1) annotation(Line(points = {{-42, 42}, {-14, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN1.water_flange2, sink_P.water_flange) annotation(Line(points = {{2, 42}, {30, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(source_WT1.water_flange, pipeExchangingN2.water_flange1) annotation(Line(points = {{-44, -48}, {-16, -48}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pipeExchangingN2.water_flange2, sink_P1.water_flange) annotation(Line(points = {{0, -48}, {28, -48}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 1000), __Dymola_experimentSetupOutput);
end test1_Pipe;
