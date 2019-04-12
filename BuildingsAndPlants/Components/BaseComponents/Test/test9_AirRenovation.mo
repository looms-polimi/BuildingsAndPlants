within BuildingsAndPlants.Components.BaseComponents.Test;

model test9_AirRenovation
  Air.Renovation.AirRenovation airRenovation annotation(Placement(transformation(extent = {{-22, -90}, {0, -50}})));
  Air.Volumes.AirVolume airVolume1(Tstart = 273.15 + 25, V = 5 * 5 * 3) annotation(Placement(transformation(extent = {{20, 10}, {58, -14}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 283.15) annotation(Placement(transformation(extent = {{-92, -32}, {-72, -12}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 15 * 5) annotation(Placement(transformation(extent = {{-58, -30}, {-42, -14}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 15 * 3.5) annotation(Placement(transformation(extent = {{-24, -30}, {-8, -14}})));
  Thermal.Capacities.MassT massT(M = 100, cp = 920) annotation(Placement(transformation(extent = {{-42, -6}, {-20, 12}})));
  Air.Sinks.AirSink_P_fixed airSink_P_fixed annotation(Placement(transformation(extent = {{88, -12}, {68, 8}})));
  Air.Volumes.AirVolume airVolume(Tstart = 273.15 + 25, V = 5 * 5 * 3) annotation(Placement(transformation(extent = {{22, 100}, {60, 76}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 283.15) annotation(Placement(transformation(extent = {{-90, 58}, {-70, 78}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 15 * 5) annotation(Placement(transformation(extent = {{-56, 60}, {-40, 76}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 15 * 3.5) annotation(Placement(transformation(extent = {{-22, 60}, {-6, 76}})));
  Thermal.Capacities.MassT massT1(M = 100, cp = 920) annotation(Placement(transformation(extent = {{-40, 84}, {-18, 102}})));
  Air.Sinks.AirSink_P_fixed airSink_P_fixed1 annotation(Placement(transformation(extent = {{90, 78}, {70, 98}})));
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(w0 = 0) annotation(Placement(transformation(extent = {{-6, 78}, {14, 98}})));
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX1(w0 = 0) annotation(Placement(transformation(extent = {{-6, -12}, {14, 8}})));
equation
  connect(fixedTemperature.port, thermalConductor.port_a) annotation(Line(points = {{-72, -22}, {-58, -22}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(thermalConductor.port_b, thermalConductor1.port_a) annotation(Line(points = {{-42, -22}, {-24, -22}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(massT.surf, thermalConductor1.port_a) annotation(Line(points = {{-31, -4.2}, {-31, -22}, {-24, -22}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airRenovation.heatPort2, airVolume1.heatPort) annotation(Line(points = {{-5.5, -70}, {39, -70}, {39, -12.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(thermalConductor1.port_b, airVolume1.heatPort) annotation(Line(points = {{-8, -22}, {39, -22}, {39, -12.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airVolume1.air_flange2, airSink_P_fixed.air_flange) annotation(Line(points = {{54.2, -2}, {70, -2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airRenovation.heatPort1, thermalConductor.port_a) annotation(Line(points = {{-16.5, -70}, {-64, -70}, {-64, -22}, {-58, -22}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(fixedTemperature1.port, thermalConductor2.port_a) annotation(Line(points = {{-70, 68}, {-56, 68}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(thermalConductor2.port_b, thermalConductor3.port_a) annotation(Line(points = {{-40, 68}, {-22, 68}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(massT1.surf, thermalConductor3.port_a) annotation(Line(points = {{-29, 85.8}, {-29, 68}, {-22, 68}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(thermalConductor3.port_b, airVolume.heatPort) annotation(Line(points = {{-6, 68}, {41, 68}, {41, 77.2}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airVolume.air_flange2, airSink_P_fixed1.air_flange) annotation(Line(points = {{56.2, 88}, {72, 88}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.air_flange1, airSource_fixed_wTX.air_flange) annotation(Line(points = {{25.8, 88}, {12, 88}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume1.air_flange1, airSource_fixed_wTX1.air_flange) annotation(Line(points = {{23.8, -2}, {12, -2}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test9_AirRenovation;
