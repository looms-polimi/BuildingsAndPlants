within BuildingsAndPlants.Components.BaseComponents.Test;
model TestNaturalMix
  Air.Volumes.AirVolume_only_wawvQdport V1(V = 10) annotation(Placement(transformation(extent = {{-60, 0}, {-20, 40}})));
  Air.Volumes.AirVolume_only_wawvQdport V2(Xstart = 0.002, V = 30) annotation(Placement(transformation(extent = {{20, 0}, {60, 40}})));
  Air.Pdrops.AirPdrop_Lin_NomPoint_mix mix annotation(Placement(transformation(extent = {{-20, -40}, {20, 0}})));
equation
  connect(V1.dryair, mix.dryair) annotation (Line(points={{-46.4,1.6},{-46.4,
          -14.4},{-18.8,-14.4}}, color={0,100,150}));
  connect(V1.diffuse, mix.diffuse) annotation (Line(points={{-39.6,2},{-40,2},{
          -40,-12},{-40,-20},{-18,-20}}, color={255,0,0}));
  connect(V1.vapour, mix.vapour) annotation (Line(points={{-33.6,2},{-34,2},{
          -34,-25.6},{-18.8,-25.6}}, color={0,100,150}));
  connect(mix.Bdiffuse, V2.diffuse) annotation (Line(points={{18,-20},{30,-20},
          {40.4,-20},{40.4,2}}, color={255,0,0}));
  connect(V2.dryair, mix.Bdryair) annotation (Line(points={{33.6,1.6},{25.8,1.6},
          {25.8,-14.8},{17.6,-14.8}}, color={0,100,150}));
  connect(V2.vapour, mix.Bvapour) annotation (Line(points={{46.4,2},{46.4,-25.6},
          {18.4,-25.6}}, color={0,100,150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end TestNaturalMix;

