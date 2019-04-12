within BuildingsAndPlants.Components.AggregateComponents.Envelope.Test;
model Test_doors_openings_int
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15, Ta_Yex = 20) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume_only_wawvQdport V1(V = 20) annotation(Placement(transformation(extent = {{-80, 0}, {-40, 40}})));
  Openings.InternalDoor_Opening Door annotation(Placement(transformation(extent = {{-20, -40}, {20, 0}})));
  BaseComponents.Ambient.AmbientAirTempWithOpenings Amb annotation(Placement(transformation(extent = {{44, -36}, {84, 4}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, startTime = 100, width = 600, period = 3600, amplitude = 1) annotation(Placement(transformation(extent = {{-48, 56}, {-28, 76}})));
equation
  connect(opening.y, Door.opening01) annotation(Line(points = {{-27, 66}, {0, 66}, {0, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.vapour, Door.vapour) annotation (Line(points={{-53.6,2},{-53.6,
          -25.6},{-18.4,-25.6}}, color={0,100,150}));
  connect(Door.diffuse, V1.diffuse) annotation (Line(points={{-18,-20.4},{-59.6,
          -20.4},{-59.6,2}}, color={255,0,0}));
  connect(V1.dryair, Door.dryair) annotation (Line(points={{-66.4,1.6},{-66.4,
          -14.8},{-18.8,-14.8}}, color={0,100,150}));
  connect(Door.Bdryair, Amb.dryair) annotation (Line(points={{18,-14.8},{32,
          -14.8},{32,-12},{45.6,-12}}, color={0,100,150}));
  connect(Door.Bdiffuse, Amb.diffuse) annotation (Line(points={{18,-20},{32,-20},
          {32,-21.2},{46,-21.2}}, color={255,0,0}));
  connect(Door.Bvapour, Amb.vapour) annotation (Line(points={{18,-25.6},{32,
          -25.6},{32,-26.8},{46,-26.8}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           experiment(StopTime = 86400, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end Test_doors_openings_int;

