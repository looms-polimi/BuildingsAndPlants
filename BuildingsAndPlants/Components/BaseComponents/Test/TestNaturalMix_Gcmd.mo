within BuildingsAndPlants.Components.BaseComponents.Test;
model TestNaturalMix_Gcmd
  Air.Volumes.AirVolume_only_wawvQdport V1(V = 10) annotation(Placement(transformation(extent = {{-60, 0}, {-20, 40}})));
  Air.Volumes.AirVolume_only_wawvQdport V2(Xstart = 0.002, V = 30) annotation(Placement(transformation(extent = {{20, 0}, {60, 40}})));
  Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix annotation(Placement(transformation(extent = {{-20, 0}, {20, -40}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, width = 180, falling = 20, period = 400, startTime = 100) annotation(Placement(transformation(extent = {{-80, -62}, {-60, -42}})));
equation
  connect(opening.y, mix.cmd01) annotation(Line(points = {{-59, -52}, {0, -52}, {0, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.diffuse, mix.diffuse) annotation (Line(points={{-39.6,2},{-39.6,
          -20.4},{-18,-20.4}}, color={255,0,0}));
  connect(V1.vapour, mix.vapour) annotation (Line(points={{-33.6,2},{-26,2},{
          -26,-14.4},{-18.8,-14.4}}, color={0,100,150}));
  connect(V1.dryair, mix.dryair) annotation (Line(points={{-46.4,1.6},{-46.4,
          -25.6},{-19.2,-25.6}}, color={0,100,150}));
  connect(mix.Bvapour, V2.vapour) annotation (Line(points={{18,-14.4},{24,-14.4},
          {24,-14},{46.4,-14},{46.4,2}}, color={0,100,150}));
  connect(V2.dryair, mix.Bdryair) annotation (Line(points={{33.6,1.6},{33.6,-26},
          {17.6,-26}}, color={0,100,150}));
  connect(mix.Bdiffuse, V2.diffuse) annotation (Line(points={{18,-20.4},{28,
          -20.4},{28,-20},{40.4,-20},{40.4,2}}, color={255,0,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end TestNaturalMix_Gcmd;

