within BuildingsAndPlants.Components.AggregateComponents.Test;
model test2_AirCaptureCoil
  Heating.AirCaptureCoil airCaptureCoil(Lcoil = 0.5, Dcoil = 0.005, gammaTubeMetal = 100, cpMetal = 300, Tstart = 273.15 + 20, STube = 1, V = 0.002, Mmetal = 0.06, gammaMetalExternal = 100) annotation(Placement(transformation(extent = {{20, -26}, {-54, 30}})));
  BaseComponents.Water.Pumps.WaterPump_Volumetric volumetricPump(qmax(displayUnit = "l/min") = 3.3333333333333e-05) annotation(Placement(transformation(extent = {{58, 8}, {36, 30}})));
  BaseComponents.Water.Sinks.WaterSink_P_fixed sink_P_fixed annotation(Placement(transformation(extent = {{96, -24}, {76, -4}})));
  BaseComponents.Water.Sources.WaterSource_PT_fixed source_PT_fixed(T0 = 273.15 + 20) annotation(Placement(transformation(extent = {{98, 8}, {74, 30}})));
  BaseComponents.Air.Sources.AirSource_pTX_fixed airSource_fixed_pTX(                  X0 = 0.5, T0=
        273.15 + 85)                                                                             annotation(Placement(transformation(extent = {{-98, -70}, {-78, -50}})));
  BaseComponents.Air.Sinks.AirSink_P_fixed airSink_P_fixed annotation(Placement(transformation(extent = {{-100, 50}, {-80, 70}})));
  BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume airPrescribedFlowRate_Volume annotation(Placement(transformation(extent = {{-68, -70}, {-48, -50}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 0.1, rising = 20, width = 100, falling = 20, period = 200, nperiod = 1, startTime = 20) annotation(Placement(transformation(extent = {{-90, -30}, {-74, -14}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 0.5, rising = 50, width = 200, falling = 50, period = 300, nperiod = 1, startTime = 10) annotation(Placement(transformation(extent = {{22, 64}, {38, 80}})));
equation
  connect(airSink_P_fixed.air_flange, airCaptureCoil.air_flange2) annotation(Line(points={{-81,60},
          {-24.4,60},{-24.4,26.64}},                                                                                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(airSource_fixed_pTX.air_flange, airPrescribedFlowRate_Volume.air_flange1) annotation(Line(points={{-79,-60},
          {-66,-60}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(airPrescribedFlowRate_Volume.air_flange2, airCaptureCoil.air_flange1) annotation(Line(points={{-50,-60},
          {-24.4,-60},{-24.4,-22.64}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(trapezoid1.y, volumetricPump.cmd) annotation(Line(points = {{38.8, 72}, {66, 72}, {66, 25.38}, {52.72, 25.38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(airPrescribedFlowRate_Volume.iq, trapezoid.y) annotation(Line(points = {{-58.1, -55.7}, {-58.1, -22}, {-73.2, -22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(source_PT_fixed.water_flange, volumetricPump.water_flange1) annotation(Line(points = {{76.4, 19}, {67.2, 19}, {67.2, 19}, {55.8, 19}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump.water_flange2, airCaptureCoil.water_flange1) annotation(Line(points={{38.2,19},
          {27.1,19},{27.1,18.8},{15.0667,18.8}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(sink_P_fixed.water_flange, airCaptureCoil.water_flange2) annotation(Line(points = {{78, -14}, {44, -14}, {44, -14.8}, {14.82, -14.8}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test2_AirCaptureCoil;

