within BuildingsAndPlants.Components.AggregateComponents.Envelope.Test;
model Test_windows_openings_ext
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15, Ta_Yex = 20) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume_only_wawvQdport V1(V = 20) annotation(Placement(transformation(extent = {{-80, 0}, {-40, 40}})));
  Openings.ExtenallWindow_Opening_DoubleGlass Window(material_glass = BuildingsAndPlants.Media.Materials.Glasses.Glass(), material_gas = BuildingsAndPlants.Media.Materials.EnvelopeGases.Air()) annotation(Placement(transformation(extent = {{-20, -40}, {20, 0}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, startTime = 100, width = 600, period = 3600, amplitude = 1) annotation(Placement(transformation(extent = {{-48, 56}, {-28, 76}})));
equation
  connect(opening.y, Window.opening01) annotation(Line(points = {{-27, 66}, {-2, 66}, {-2, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.heatPort, Window.absToWall) annotation(Line(points = {{-60, 38}, {-60, 48}, {-86, 48}, {-86, -50}, {-2, -50}, {-2, -37.8}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(V1.dryair, Window.dryair) annotation (Line(points={{-66.4,1.6},{-66.4,
          -14.8},{-19.2,-14.8}}, color={0,100,150}));
  connect(V1.vapour, Window.vapour) annotation (Line(points={{-53.6,2},{-54,2},
          {-54,-24},{-54,-24},{-36,-24},{-36,-24.8},{-19.2,-24.8}}, color={0,
          100,150}));
  connect(Window.diffuse, V1.diffuse) annotation (Line(points={{-18,-20},{-40,
          -20},{-59.6,-20},{-59.6,2}}, color={255,0,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           experiment(StopTime = 86400, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end Test_windows_openings_ext;

