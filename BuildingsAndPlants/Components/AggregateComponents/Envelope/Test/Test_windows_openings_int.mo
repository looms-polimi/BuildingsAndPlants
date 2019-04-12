within BuildingsAndPlants.Components.AggregateComponents.Envelope.Test;
model Test_windows_openings_int
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15, Ta_Yex = 20) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume_only_wawvQdport V1(V = 20) annotation(Placement(transformation(extent = {{-80, 0}, {-40, 40}})));
  Openings.InternalWindow_Opening_SingleGlass Window(material = BuildingsAndPlants.Media.Materials.Glasses.Glass()) annotation(Placement(transformation(extent = {{-20, -40}, {20, 0}})));
  BaseComponents.Ambient.AmbientAirTempWithOpenings Amb annotation(Placement(transformation(extent = {{44, -36}, {84, 4}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, startTime = 100, width = 600, period = 3600, amplitude = 1) annotation(Placement(transformation(extent = {{-48, 56}, {-28, 76}})));
equation
  connect(opening.y, Window.opening01) annotation(Line(points = {{-27, 66}, {0, 66}, {0, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Window.Bdryair, Amb.dryair) annotation (Line(points={{18,-14.8},{32,
          -14.8},{32,-12},{45.6,-12}}, color={0,100,150}));
  connect(Amb.diffuse, Window.Bdiffuse) annotation (Line(points={{46,-21.2},{32,
          -21.2},{32,-20},{18,-20}}, color={255,0,0}));
  connect(Window.Bvapour, Amb.vapour) annotation (Line(points={{18,-26},{32,-26},
          {32,-26.8},{46,-26.8}}, color={0,100,150}));
  connect(Window.dryair, V1.dryair) annotation (Line(points={{-19.2,-15.2},{
          -66.4,-15.2},{-66.4,1.6}}, color={0,100,150}));
  connect(V1.diffuse, Window.diffuse) annotation (Line(points={{-59.6,2},{-60,2},
          {-60,-20},{-60,-20.4},{-18,-20.4}}, color={255,0,0}));
  connect(Window.vapour, V1.vapour) annotation (Line(points={{-18.8,-25.2},{
          -53.6,-25.2},{-53.6,2}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           experiment(StopTime = 86400, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end Test_windows_openings_int;

