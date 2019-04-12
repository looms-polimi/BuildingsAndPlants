within BuildingsAndPlants.Components.AggregateComponents.Envelope.Test;

model Test_doors_openings_ext
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = BuildingsAndPlants.Types.AmbCondVariabilty.ACV_variable, Ta_avg = 288.15, Ta_Yex = 20) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume_only_wawvQdport V1(V = 20) annotation(Placement(transformation(extent = {{-80, 0}, {-40, 40}})));
  Openings.ExternallDoor_Opening Door annotation(Placement(transformation(extent = {{-20, -40}, {20, 0}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, startTime = 100, width = 600, period = 3600, amplitude = 1) annotation(Placement(transformation(extent = {{-48, 56}, {-28, 76}})));
equation
  connect(opening.y, Door.opening01) annotation(Line(points = {{-27, 66}, {-2, 66}, {-2, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.diffuse, Door.diffuse) annotation (Line(points={{-59.6,2},{-60,2},
          {-60,-12},{-60,-20},{-18,-20}}, color={255,0,0}));
  connect(Door.dryair, V1.dryair) annotation (Line(points={{-19.2,-14.8},{-66.4,
          -14.8},{-66.4,1.6}}, color={0,100,150}));
  connect(V1.vapour, Door.vapour) annotation (Line(points={{-53.6,2},{-53.6,-26},
          {-18.8,-26}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           experiment(StopTime = 86400, __Dymola_NumberOfIntervals = 5000), __Dymola_experimentSetupOutput);
end Test_doors_openings_ext;
