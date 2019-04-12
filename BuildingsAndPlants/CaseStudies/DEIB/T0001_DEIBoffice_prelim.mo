within BuildingsAndPlants.CaseStudies.DEIB;

model T0001_DEIBoffice_prelim
  Appliances.Office.DesktopComputer desktopComputer(ReleaseQ = true) annotation(Placement(transformation(extent = {{-116, -78}, {-96, -58}})));
  Appliances.Office.DesktopComputer desktopComputer1(ReleaseQ = true) annotation(Placement(transformation(extent = {{-140, -50}, {-120, -30}})));
  Components.AggregateComponents.Electrical.FixedACsupply_socket_withGround fixedACsupply_socket_withGround annotation(Placement(transformation(extent = {{-200, -100}, {-180, -80}})));
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable) annotation(Placement(transformation(extent = {{-200, 80}, {-180, 100}})));
  Components.BaseComponents.Air.Volumes.AirVolume_wawvQdPort V1(V = 5 * 4 * 3) annotation(Placement(transformation(extent = {{24, 30}, {64, -10}})));
  Components.AggregateComponents.Envelope.Openings.ExtenallWindow_Opening_SingleGlass Window(L = 3, H = 3, s = 0.05, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), wnom = 0.0001, inclination = 90, orientation = 180, dpnom = 1000) annotation(Placement(transformation(extent = {{100, 22}, {140, 62}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, width = 120, period = 12 * 3600, startTime = 8 * 3600, amplitude = 0) annotation(Placement(transformation(extent = {{88, 72}, {108, 92}})));
  Modelica.Blocks.Sources.BooleanPulse PCuse(width = 40, period = 86400, startTime = 8 * 3600) annotation(Placement(transformation(extent = {{-198, -40}, {-178, -20}})));
  Components.AggregateComponents.Envelope.Walls.ExtenallWall_NoOpenings_Homogeneous extenallWall_NoOpenings_Homogeneous(L = 4, H = 1, lambda = 0.4, inclination = 90, fixedCoeff = false, orientation = 180) annotation(Placement(transformation(extent = {{100, -40}, {140, 0}})));
  Components.AggregateComponents.Heating.FanCoil fanCoil(ncoil = 5, Lcoil = 5, gammaMetalExternal = 40, gammaTubeMetal = 200, qamax = 0.03) annotation(Placement(transformation(extent = {{-54, 10}, {-6, 44}})));
  Components.AggregateComponents.Heating.IdealControlledFluidHeater idealControlledFluidHeater annotation(Placement(transformation(extent = {{-132, 32}, {-112, 52}})));
  Components.BaseComponents.Water.Pressurisers.IdealWaterPressuriser_pfixed idealWaterPressuriser annotation(Placement(transformation(extent = {{-98, 32}, {-78, 52}})));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(Placement(transformation(extent = {{-182, 50}, {-162, 70}})));
  Modelica.Blocks.Sources.RealExpression Twset(y = 273.15 + 60) annotation(Placement(transformation(extent = {{-184, 28}, {-164, 48}})));
  Modelica.Blocks.Sources.RealExpression Pspeed(y = 1) annotation(Placement(transformation(extent = {{-100, 20}, {-80, 40}})));
  Components.BaseComponents.Water.Pumps.WaterPump_Volumetric waterPump_Volumetric(T = 0.05) annotation(Placement(transformation(extent = {{-76, 6}, {-96, 26}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTa annotation(Placement(transformation(extent = {{80, -88}, {60, -68}})));
  Modelica.Blocks.Sources.RealExpression Taset(y = 273.15 + 20) annotation(Placement(transformation(extent = {{126, -70}, {106, -50}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_1dof(Ti = 200, K = 0.1, CSmax = 1) annotation(Placement(transformation(extent = {{38, -76}, {18, -56}})));
equation
  connect(opening.y, Window.opening01) annotation(Line(points = {{109, 82}, {118, 82}, {118, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PCuse.y, desktopComputer1.ON) annotation(Line(points = {{-177, -30}, {-160, -30}, {-160, -37.2}, {-139, -37.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(PCuse.y, desktopComputer.ON) annotation(Line(points = {{-177, -30}, {-160, -30}, {-160, -60}, {-115, -60}, {-115, -65.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(desktopComputer.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-118.9, -76}, {-190, -76}, {-190, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer1.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-142.9, -48}, {-190, -48}, {-190, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Window.absToWall, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{118, 24.2}, {118, 12}, {92, 12}, {92, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
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
  connect(fanCoil.icmd01, aWPI_1dof.CS) annotation(Line(points = {{-10.8, 27}, {-2, 27}, {-2, -60}, {20, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(idealControlledFluidHeater.water_flange2, idealWaterPressuriser.water_flange1) annotation(Line(points = {{-114, 42}, {-96, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(idealWaterPressuriser.water_flange2, fanCoil.water_flange1) annotation(Line(points = {{-80, 42}, {-50.8, 42}, {-50.8, 37.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterPump_Volumetric.water_flange1, fanCoil.water_flange2) annotation(Line(points = {{-78, 16}, {-64, 16}, {-64, 16.8}, {-50.64, 16.8}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterPump_Volumetric.water_flange2, idealControlledFluidHeater.water_flange1) annotation(Line(points = {{-94, 16}, {-140, 16}, {-140, 42}, {-130, 42}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Window.dryair, V1.dryair) annotation (Line(points={{100.8,47.2},{38,
          47.2},{38,28}}, color={0,100,150}));
  connect(V1.diffuse, Window.diffuse)
    annotation (Line(points={{44,28.4},{44,42},{102,42}}, color={255,0,0}));
  connect(Window.vapour, V1.vapour) annotation (Line(points={{100.8,37.2},{49.2,
          37.2},{49.2,28}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),           experiment(StopTime = 864000), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})));
end T0001_DEIBoffice_prelim;
