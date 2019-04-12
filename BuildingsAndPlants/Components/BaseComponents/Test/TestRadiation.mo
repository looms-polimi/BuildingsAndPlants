within BuildingsAndPlants.Components.BaseComponents.Test;
model TestRadiation
  inner BoundaryConditions.AmbientConditions ambient_settings(Tgnd(displayUnit = "K"), Tsky(displayUnit = "degC") = 283.15) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Thermal.Sources.SolarRadiation_OpaqueSurf solarRadiation_OpaqueSurf annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-30, 70})));
  Envelope.SolidMultilayer_Homogeneous Wall annotation(Placement(transformation(extent = {{-24, 20}, {-4, 40}})));
  Thermal.Sources.SolarRadiation_TransparentSurf Glass annotation(Placement(transformation(extent = {{0, -10}, {-20, 10}})));
  Ambient.AmbientAirTemp ambientAirTemp annotation(Placement(transformation(extent = {{-72, 18}, {-92, 38}})));
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(X0 = 8e-3, T0 = 273.15 + 20, w0 = 1) annotation(Placement(transformation(extent = {{-74, -64}, {-44, -36}})));
  Air.Sinks.AirSink_P_fixed sink_W_fixed annotation(Placement(transformation(extent = {{80, -64}, {54, -36}})));
  Air.Pdrops.AirPdrop_Lin pdrop annotation(Placement(transformation(extent = {{-36, -60}, {-16, -40}})));
  Air.Volumes.AirVolume airVolume1(Tstart = 273.15 + 20, V = 10) annotation(Placement(transformation(extent = {{-6, -60}, {30, -40}})));
  Thermal.HeatTransfer.Convection_Wall2air_BRIS convection_Wall2air_Internal_BRIS annotation(Placement(transformation(extent = {{-58, 20}, {-38, 40}})));
  Thermal.HeatTransfer.Convection_Wall2air_BI74 convection_Wall2air_Internal_BRIS1 annotation(Placement(transformation(extent = {{28, 20}, {8, 40}})));
  Thermal.Sinks.PrescribedHeatLossesSink prescribedHeatLossesSink annotation(Placement(transformation(extent = {{-18, -36}, {2, -16}})));
equation
  connect(solarRadiation_OpaqueSurf.Absorbed, Wall.side1) annotation(Line(points = {{-30.2, 62}, {-30, 62}, {-30, 30}, {-19, 30}}, color = {200, 0, 0}, smooth = Smooth.None));
  connect(airSource_fixed_wTX.air_flange, pdrop.air_flange1) annotation(Line(points = {{-47, -50}, {-34, -50}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pdrop.air_flange2, airVolume1.air_flange1) annotation(Line(points = {{-18, -50}, {-2.4, -50}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume1.air_flange2, sink_W_fixed.air_flange) annotation(Line(points = {{26.4, -50}, {56.6, -50}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Glass.Trasmitted, airVolume1.heatPort) annotation(Line(points = {{-2, 4}, {12, 4}, {12, -41}}, color = {200, 0, 0}, smooth = Smooth.None));
  connect(convection_Wall2air_Internal_BRIS.wall, Wall.side1) annotation(Line(points = {{-40, 30}, {-19, 30}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ambientAirTemp.port, convection_Wall2air_Internal_BRIS.air) annotation(Line(points = {{-74, 30}, {-56, 30}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Glass.Absorbed, Wall.side1) annotation(Line(points = {{-10, -8}, {-10, -16}, {-30, -16}, {-30, 30}, {-19, 30}}, color = {200, 0, 0}, smooth = Smooth.None));
  connect(Wall.side2, convection_Wall2air_Internal_BRIS1.wall) annotation(Line(points = {{-9, 30}, {10, 30}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convection_Wall2air_Internal_BRIS1.air, airVolume1.heatPort) annotation(Line(points = {{26, 30}, {38, 30}, {38, 4}, {12, 4}, {12, -41}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Glass.Reflected, prescribedHeatLossesSink.port) annotation(Line(points = {{-18, -8}, {-26, -8}, {-26, -26}, {-16, -26}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 8.64e+06), __Dymola_experimentSetupOutput);
end TestRadiation;

