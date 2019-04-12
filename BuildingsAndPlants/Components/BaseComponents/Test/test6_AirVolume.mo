within BuildingsAndPlants.Components.BaseComponents.Test;

model test6_AirVolume
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(X0 = 8e-3, w0 = 1.21606, T0 = 273.15 + 25) annotation(Placement(transformation(extent = {{-86, -14}, {-56, 14}})));
  Air.Sinks.AirSink_P_fixed sink_W_fixed annotation(Placement(transformation(extent = {{68, -14}, {42, 14}})));
  Air.Pdrops.AirPdrop_Lin pdrop annotation(Placement(transformation(extent = {{-48, -10}, {-28, 10}})));
  Air.Volumes.AirVolume airVolume(Tstart = 273.15 + 20, V = 10) annotation(Placement(transformation(extent = {{-18, -10}, {18, 10}})));
  Thermal.HeatTransfer.Convection_SS convSca2Sca(gamma = 10) annotation(Placement(transformation(extent = {{-10, 16}, {10, 36}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 303.15) annotation(Placement(transformation(extent = {{-48, 48}, {-34, 62}})));
equation
  connect(airSource_fixed_wTX.air_flange, pdrop.air_flange1) annotation(Line(points = {{-59, 0}, {-46, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pdrop.air_flange2, airVolume.air_flange1) annotation(Line(points = {{-30, 0}, {-14.4, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.air_flange2, sink_W_fixed.air_flange) annotation(Line(points = {{14.4, 0}, {30, 0}, {30, 1.77636e-015}, {44.6, 1.77636e-015}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(fixedTemperature.port, convSca2Sca.ss1) annotation(Line(points = {{-34, 55}, {-22, 55}, {-22, 54}, {8.88178e-16, 54}, {8.88178e-16, 32}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca.ss2, airVolume.heatPort) annotation(Line(points = {{0, 20}, {0, 9}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test6_AirVolume;
