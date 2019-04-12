within BuildingsAndPlants.Appliances.Test;

model Test_Office_02
  Office.DesktopComputer desktopComputer(ReleaseQ = true) annotation(Placement(transformation(extent = {{-116, -78}, {-96, -58}})));
  Office.DesktopComputer desktopComputer1(ReleaseQ = true) annotation(Placement(transformation(extent = {{-140, -50}, {-120, -30}})));
  Components.AggregateComponents.Electrical.FixedACsupply_socket_withGround fixedACsupply_socket_withGround annotation(Placement(transformation(extent = {{-200, -100}, {-180, -80}})));
  inner BoundaryConditions.AmbientConditions ambient_settings(Ta_Yex = 20, acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15) annotation(Placement(transformation(extent = {{-200, 80}, {-180, 100}})));
  Components.BaseComponents.Air.Volumes.AirVolume_wawvQdPort V1(V = 5 * 4 * 3) annotation(Placement(transformation(extent = {{24, 30}, {64, -10}})));
  Components.AggregateComponents.Envelope.Openings.ExtenallWindow_Opening_SingleGlass Window(L = 3, H = 3, s = 0.05, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), orientation = 180, wnom = 0.0001, dpnom = 1000) annotation(Placement(transformation(extent = {{100, 20}, {140, 60}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, amplitude = 1, width = 120, period = 12 * 3600, startTime = 8 * 3600) annotation(Placement(transformation(extent = {{88, 72}, {108, 92}})));
  Modelica.Blocks.Sources.BooleanPulse PCuse(width = 40, period = 86400, startTime = 8 * 3600) annotation(Placement(transformation(extent = {{-198, -40}, {-178, -20}})));
  Components.AggregateComponents.Envelope.Walls.ExtenallWall_NoOpenings_Homogeneous extenallWall_NoOpenings_Homogeneous(L = 4, H = 1, orientation = 180, lambda = 0.4) annotation(Placement(transformation(extent = {{100, -40}, {140, 0}})));
  Components.AggregateComponents.Heating.FanCoil fanCoil(ncoil = 5, gammaTubeMetal = 100, gammaMetalExternal = 20, Lcoil = 5) annotation(Placement(transformation(extent = {{-54, 10}, {-6, 44}})));
  Components.AggregateComponents.Heating.IdealControlledFluidHeater idealControlledFluidHeater annotation(Placement(transformation(extent = {{-132, 32}, {-112, 52}})));
  Components.BaseComponents.Water.Pressurisers.IdealWaterPressuriser_pfixed idealWaterPressuriser annotation(Placement(transformation(extent = {{-98, 32}, {-78, 52}})));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(Placement(transformation(extent = {{-182, 50}, {-162, 70}})));
  Modelica.Blocks.Sources.RealExpression Twset(y = 273.15 + 55) annotation(Placement(transformation(extent = {{-184, 28}, {-164, 48}})));
  Modelica.Blocks.Sources.RealExpression Pspeed(y = 1) annotation(Placement(transformation(extent = {{-100, 20}, {-80, 40}})));
  Components.BaseComponents.Water.Pumps.WaterPump_Volumetric waterPump_Volumetric annotation(Placement(transformation(extent = {{-76, 6}, {-96, 26}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTa annotation(Placement(transformation(extent = {{80, -88}, {60, -68}})));
  Modelica.Blocks.Sources.RealExpression Taset(y = 273.15 + 20) annotation(Placement(transformation(extent = {{126, -70}, {106, -50}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_1dof(K = 1, Ti = 200) annotation(Placement(transformation(extent = {{38, -76}, {18, -56}})));
equation
  connect(opening.y, Window.opening01) annotation(Line(points = {{109, 82}, {118, 82}, {118, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PCuse.y, desktopComputer1.ON) annotation(Line(points = {{-177, -30}, {-160, -30}, {-160, -37.2}, {-139, -37.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(PCuse.y, desktopComputer.ON) annotation(Line(points = {{-177, -30}, {-160, -30}, {-160, -60}, {-115, -60}, {-115, -65.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(desktopComputer.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-118.9, -76}, {-190, -76}, {-190, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer1.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-142.9, -48}, {-190, -48}, {-190, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Window.absToWall, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{118, 22.2}, {118, 12}, {92, 12}, {92, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(V1.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{44, -8}, {44, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer1.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{-130, -31}, {-130, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{-106, -59}, {-106, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(fanCoil.air_flange2, V1.air_flange2) annotation(Line(points={{-25.2,
          41.96},{-25.2,58},{74,58},{74,10},{60,10}},                                                                               color = {0, 100, 150}, smooth = Smooth.None));
  connect(fanCoil.air_flange1, V1.air_flange1) annotation(Line(points={{-25.2,
          12.04},{-25.2,10},{28,10}},                                                                           color = {0, 100, 150}, smooth = Smooth.None));
  connect(ON.y, idealControlledFluidHeater.ON) annotation(Line(points = {{-161, 60}, {-146.5, 60}, {-146.5, 48.9}, {-130.1, 48.9}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(idealControlledFluidHeater.To, Twset.y) annotation(Line(points = {{-130.1, 45.5}, {-158, 45.5}, {-158, 38}, {-163, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pspeed.y, waterPump_Volumetric.cmd) annotation(Line(points = {{-79, 30}, {-68, 30}, {-68, 21.8}, {-80.8, 21.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sTa.port, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{80, -78}, {92, -78}, {92, -20}, {102, -20}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(aWPI_1dof.SP, Taset.y) annotation(Line(points = {{36, -60}, {105, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_1dof.PV, sTa.T) annotation(Line(points = {{36, -66}, {52, -66}, {52, -78}, {60, -78}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fanCoil.icmd01, aWPI_1dof.CS) annotation(Line(points = {{-10.8, 27}, {4, 27}, {4, -60}, {20, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(idealControlledFluidHeater.water_flange2, idealWaterPressuriser.water_flange1) annotation(Line(points = {{-114, 42}, {-96, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(idealWaterPressuriser.water_flange2, fanCoil.water_flange1) annotation(Line(points = {{-80, 42}, {-68, 42}, {-68, 37.2}, {-50.8, 37.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(fanCoil.water_flange2, waterPump_Volumetric.water_flange1) annotation(Line(points = {{-50.64, 16.8}, {-63.32, 16.8}, {-63.32, 16}, {-78, 16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterPump_Volumetric.water_flange2, idealControlledFluidHeater.water_flange1) annotation(Line(points = {{-94, 16}, {-140, 16}, {-140, 42}, {-130, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(V1.dryair, Window.dryair) annotation (Line(points={{38,28},{38,45.2},
          {100.8,45.2}}, color={0,100,150}));
  connect(Window.diffuse, V1.diffuse) annotation (Line(points={{102,40},{82,40},
          {44,40},{44,28.4}}, color={255,0,0}));
  connect(Window.vapour, V1.vapour) annotation (Line(points={{100.8,35.2},{49.2,
          35.2},{49.2,28}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),           experiment(StopTime = 86400), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})));
end Test_Office_02;
