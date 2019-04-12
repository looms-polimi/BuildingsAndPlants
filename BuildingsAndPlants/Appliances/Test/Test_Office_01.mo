within BuildingsAndPlants.Appliances.Test;

model Test_Office_01
  Office.DesktopComputer desktopComputer(ReleaseQ = true) annotation(Placement(transformation(extent = {{-16, -78}, {4, -58}})));
  Office.DesktopComputer desktopComputer1(ReleaseQ = true) annotation(Placement(transformation(extent = {{-40, -50}, {-20, -30}})));
  Components.AggregateComponents.Electrical.FixedACsupply_socket_withGround fixedACsupply_socket_withGround annotation(Placement(transformation(extent = {{-100, -100}, {-80, -80}})));
  inner BoundaryConditions.AmbientConditions ambient_settings(Ta_Yex = 20, acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Components.BaseComponents.Air.Volumes.AirVolume_only_wawvQdport V1(V = 20) annotation(Placement(transformation(extent = {{-34, 20}, {6, 60}})));
  Components.AggregateComponents.Envelope.Openings.ExtenallWindow_Opening_DoubleGlass Window(material_glass = BuildingsAndPlants.Media.Materials.Glasses.Glass(), material_gas = BuildingsAndPlants.Media.Materials.EnvelopeGases.Air()) annotation(Placement(transformation(extent = {{22, 0}, {62, 40}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, startTime = 100, amplitude = 1, width = 120, period = 7200) annotation(Placement(transformation(extent = {{8, 72}, {28, 92}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width = 40, period = 86400, startTime = 8 * 3600) annotation(Placement(transformation(extent = {{-94, -42}, {-74, -22}})));
equation
  connect(opening.y, Window.opening01) annotation(Line(points = {{29, 82}, {40, 82}, {40, 36}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.heatPort, Window.absToWall) annotation(Line(points = {{-14, 58}, {-14, 64}, {-72, 64}, {-72, -12}, {40, -12}, {40, 2.2}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer1.heatPort, Window.absToWall) annotation(Line(points = {{-30, -31}, {-30, -12}, {40, -12}, {40, 2.2}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer.heatPort, Window.absToWall) annotation(Line(points = {{-6, -59}, {-6, -12}, {40, -12}, {40, 2.2}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(booleanPulse.y, desktopComputer1.ON) annotation(Line(points = {{-73, -32}, {-60, -32}, {-60, -37.2}, {-39, -37.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(booleanPulse.y, desktopComputer.ON) annotation(Line(points = {{-73, -32}, {-60, -32}, {-60, -60}, {-15, -60}, {-15, -65.2}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(desktopComputer.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-18.9, -76}, {-90, -76}, {-90, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(desktopComputer1.plug, fixedACsupply_socket_withGround.socket) annotation(Line(points = {{-42.9, -48}, {-90, -48}, {-90, -90}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(V1.dryair, Window.dryair) annotation (Line(points={{-20.4,21.6},{
          -20.4,10},{10,10},{10,25.2},{22.8,25.2}}, color={0,100,150}));
  connect(V1.diffuse, Window.diffuse) annotation (Line(points={{-13.6,22},{
          -13.6,14},{14,14},{14,20},{24,20}}, color={255,0,0}));
  connect(V1.vapour, Window.vapour) annotation (Line(points={{-7.6,22},{-8,22},
          {-8,10},{-8,2},{22.8,2},{22.8,15.2}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           experiment(StopTime = 86400), __Dymola_experimentSetupOutput);
end Test_Office_01;
