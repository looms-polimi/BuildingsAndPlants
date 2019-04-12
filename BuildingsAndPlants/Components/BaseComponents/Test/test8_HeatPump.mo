within BuildingsAndPlants.Components.BaseComponents.Test;

model test8_HeatPump
  HVAC.HeatPumps.HeatPump_ConstantCOPheat heatPump_ConstantCOPheat(Wmax = 1000, constCOPheat = 3) annotation(Placement(transformation(extent = {{-40, 36}, {18, 70}})));
  Modelica.Blocks.Sources.Step trapezoid(height = -0.01, offset = 0.01, startTime = 3600) annotation(Placement(transformation(extent = {{-84, 52}, {-66, 70}})));
  Air.Volumes.AirVolume airVolume(V = 5 * 20) annotation(Placement(transformation(extent = {{-22, 98}, {-2, 78}})));
  Air.Sinks.AirSink_P_fixed airSink_P_fixed annotation(Placement(transformation(extent = {{46, 78}, {26, 98}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 283.15) annotation(Placement(transformation(extent = {{-80, 12}, {-60, 32}})));
  HVAC.HeatPumps.HeatPump_ConstantCOPcool heatPump_ConstantCOPheat1(Wmax = 1500, constCOPcool = 3) annotation(Placement(transformation(extent = {{-30, -30}, {28, -64}})));
  Modelica.Blocks.Sources.Step trapezoid1(height = -0.01, offset = 0.01, startTime = 3600) annotation(Placement(transformation(extent = {{-74, -48}, {-56, -30}})));
  Air.Volumes.AirVolume airVolume1(V = 5 * 20) annotation(Placement(transformation(extent = {{-12, -2}, {8, -22}})));
  Air.Sinks.AirSink_P_fixed airSink_P_fixed1 annotation(Placement(transformation(extent = {{56, -22}, {36, -2}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 308.15) annotation(Placement(transformation(extent = {{-70, -88}, {-50, -68}})));
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(w0 = 0) annotation(Placement(transformation(extent = {{-54, 78}, {-34, 98}})));
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX1(w0 = 0) annotation(Placement(transformation(extent = {{-54, -22}, {-34, -2}})));
equation
  connect(trapezoid.y, heatPump_ConstantCOPheat.cmd01) annotation(Line(points = {{-65.1, 61}, {-54, 61}, {-54, 53}, {-34.2, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(airSink_P_fixed.air_flange, airVolume.air_flange2) annotation(Line(points = {{28, 88}, {-4, 88}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.heatPort, heatPump_ConstantCOPheat.hotPort) annotation(Line(points = {{-12, 79}, {-11, 79}, {-11, 68.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(trapezoid1.y, heatPump_ConstantCOPheat1.cmd01) annotation(Line(points = {{-55.1, -39}, {-44, -39}, {-44, -47}, {-24.2, -47}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(airSink_P_fixed1.air_flange, airVolume1.air_flange2) annotation(Line(points = {{38, -12}, {6, -12}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume1.heatPort, heatPump_ConstantCOPheat1.coldPort) annotation(Line(points = {{-2, -21}, {0, -21}, {0, -31.7}, {-1, -31.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat1.hotPort, fixedTemperature1.port) annotation(Line(points = {{-1, -62.3}, {-1, -78}, {-50, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat.coldPort, fixedTemperature.port) annotation(Line(points = {{-11, 37.7}, {-11, 22}, {-60, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.air_flange1, airSource_fixed_wTX.air_flange) annotation(Line(points = {{-20, 88}, {-36, 88}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume1.air_flange1, airSource_fixed_wTX1.air_flange) annotation(Line(points = {{-10, -12}, {-36, -12}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test8_HeatPump;
