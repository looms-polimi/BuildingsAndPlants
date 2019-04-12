within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;
model InternalWindow_Opening_SingleGlass
  extends BaseClasses.BaseInternalWindow_Opening;
  BaseComponents.Envelope.GlassLayer Glass(L = L, H = H, d = s, Tstart = Tstart, material = material) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-60, -30}, {-20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{60, -30}, {20, 30}})));
  parameter SI.Length L = 5 "glass surface length";
  parameter SI.Length H = 3 "glass surface height";
  parameter SI.Length s = 0.4 "glass thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  parameter Media.Materials.Glasses.BaseGlass material "Type of glass" annotation(choicesAllMatching = true);
  BaseComponents.Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix(dpnom = dpnom, wnom = wnom, GvOverGa = GvOverGa, Gdw0 = Gdw0, Gdwnom = Gdwnom) annotation(
  Placement(transformation(extent = {{-20, 40}, {20, 80}})));
  parameter SI.Pressure dpnom = 10000 "Nominal pressure drop";
  parameter SI.MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter SI.ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter SI.ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
equation
  connect(ConvSideA.wall, Glass.side1) annotation(
  Line(points = {{-24, 0}, {-6, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Glass.side2, ConvSideB.wall) annotation(
  Line(points = {{6, -4.44089e-16}, {14, -4.44089e-16}, {14, 2.22045e-16}, {24, 2.22045e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(opening01, mix.cmd01) annotation(
  Line(points = {{-80, 80}, {0, 80}, {0, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ConvSideB.air, Bdiffuse)
    annotation (
    Line(points={{56,0},{90,0},{90,0}}, color={255,0,0}));
  connect(ConvSideA.air, diffuse)
    annotation (Line(points={{-56,0},{-90,0},{-90,-2}}, color={255,0,0}));
  connect(mix.diffuse, diffuse) annotation (
  Line(points={{-18,60.4},{-32,60.4},
          {-32,60},{-70,60},{-70,-2},{-90,-2}}, color={255,0,0}));
  connect(mix.Bdiffuse, Bdiffuse) annotation (
  Line(points={{18,60.4},{70,60.4},
          {70,0},{90,0}}, color={255,0,0}));
  connect(mix.dryair, dryair) annotation (
  Line(points={{-19.2,65.6},{-28,65.6},
          {-96,65.6},{-96,22}}, color={0,100,150}));
  connect(mix.vapour, vapour) annotation (
  Line(points={{-18.8,54.4},{-64,54.4},
          {-64,-26},{-94,-26}}, color={0,100,150}));
  connect(mix.Bdryair, Bdryair) annotation (
  Line(points={{17.6,66},{26,66},{26,
          66},{90,66},{90,26}}, color={0,100,150}));
  connect(mix.Bvapour, Bvapour) annotation (
  Line(points={{18,54.4},{66,54.4},{
          66,-30},{90,-30}}, color={0,100,150}));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(graphics));
end InternalWindow_Opening_SingleGlass;

