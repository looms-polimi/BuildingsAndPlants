within BuildingsAndPlants.Components.BaseComponents.Test;

model test5_Tank
  Water.Pumps.WaterPump_Volumetric volumetricPump(qmax = 0.0001) annotation(Placement(transformation(extent = {{-46, 14}, {-26, 34}})));
  Water.Sinks.WaterSink_P_fixed sink_P_fixed(Pin = 101325) annotation(Placement(transformation(extent = {{100, -2}, {80, 18}})));
  Thermal.HeatTransfer.Convection_SS convSca2Sca(S = 1, gamma = 45) annotation(Placement(transformation(extent = {{48, 56}, {68, 76}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 273.15 + 20) annotation(Placement(transformation(extent = {{32, 84}, {44, 96}})));
  Water.Sources.WaterSource_PT_fixed source_PT_fixed1(T0 = 273.15 + 20) annotation(Placement(transformation(extent = {{-84, 14}, {-64, 34}})));
  Water.Tanks.Tank_exchangingWall tank(S = 0.5, Sb = 0.01, Mm = 2, cm = 300, gwm = 10, Tstart = 273.15 + 20, V = 1) annotation(Placement(transformation(extent = {{-14, -6}, {18, 54}})));
  Water.Pumps.WaterPump_Volumetric volumetricPump1(qmax = 0.0001) annotation(Placement(transformation(extent = {{50, -4}, {70, 16}})));
  Modelica.Electrical.Analog.Basic.HeatingResistor heatingResistor(R_ref = 220 ^ 2 / 3000) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {48, -62})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-14, -102}, {6, -82}})));
  Modelica.Blocks.Sources.CombiTimeTable table1(table = [0, 1; 60, 1; 60, 0]) annotation(Placement(transformation(extent = {{-76, 34}, {-64, 46}})));
  Modelica.Blocks.Sources.CombiTimeTable table2(startTime = 2000, table = [0, 0; 100, 0; 100, 1; 150, 1; 150, 0]) annotation(Placement(transformation(extent = {{74, 34}, {58, 50}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch annotation(Placement(transformation(extent = {{-28, -46}, {-8, -26}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 220, freqHz = 50) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-52, -60})));
  Modelica.Blocks.Sources.Constant const(k = 273.15 + 40) annotation(Placement(transformation(extent = {{-98, -22}, {-88, -12}})));
  Modelica.Blocks.Math.Feedback f1 annotation(Placement(transformation(extent = {{-76, -10}, {-62, -24}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow = -1, uHigh = 1) annotation(Placement(transformation(extent = {{-48, -22}, {-38, -12}})));
equation
  connect(table1.y[1], volumetricPump.cmd) annotation(Line(points = {{-63.4, 40}, {-54, 40}, {-54, 29.8}, {-41.2, 29.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(table2.y[1], volumetricPump1.cmd) annotation(Line(points = {{57.2, 42}, {42, 42}, {42, 11.8}, {54.8, 11.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heatingResistor.heatPort, tank.fluid) annotation(Line(points = {{38, -62}, {1.84, -62}, {1.84, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(heatingResistor.p, idealClosingSwitch.n) annotation(Line(points = {{48, -52}, {48, -36}, {-8, -36}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealClosingSwitch.p, sineVoltage.p) annotation(Line(points = {{-28, -36}, {-52, -36}, {-52, -50}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground.p, sineVoltage.n) annotation(Line(points = {{-4, -82}, {-52, -82}, {-52, -70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(heatingResistor.n, ground.p) annotation(Line(points = {{48, -72}, {48, -82}, {-4, -82}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(const.y, f1.u1) annotation(Line(points = {{-87.5, -17}, {-74.6, -17}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(f1.y, hysteresis.u) annotation(Line(points = {{-62.7, -17}, {-49, -17}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(hysteresis.y, idealClosingSwitch.control) annotation(Line(points = {{-37.5, -17}, {-18, -17}, {-18, -29}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(tank.oT, f1.u2) annotation(Line(points = {{16.4, 9}, {-22, 9}, {-22, 54}, {-90, 54}, {-90, 0}, {-69, 0}, {-69, -11.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tank.wall, convSca2Sca.ss2) annotation(Line(points = {{-12.4, 9}, {28, 9}, {28, 48}, {58, 48}, {58, 60}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(fixedTemperature.port, convSca2Sca.ss1) annotation(Line(points = {{44, 90}, {58, 90}, {58, 72}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(source_PT_fixed1.water_flange, volumetricPump.water_flange1) annotation(Line(points = {{-66, 24}, {-56, 24}, {-56, 24}, {-44, 24}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump.water_flange2, tank.water_flange1) annotation(Line(points = {{-28, 24}, {-20, 24}, {-20, 24}, {-10.8, 24}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(tank.water_flange2, volumetricPump1.water_flange1) annotation(Line(points = {{14.8, 24}, {32, 24}, {32, 6}, {52, 6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump1.water_flange2, sink_P_fixed.water_flange) annotation(Line(points = {{68, 6}, {76, 6}, {76, 8}, {82, 8}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test5_Tank;
