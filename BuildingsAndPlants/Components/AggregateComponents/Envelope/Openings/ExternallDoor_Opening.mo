within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;

model ExternallDoor_Opening
  extends BaseClasses.BaseExternalDoor_Opening;
  Walls.InternalWall_NoOpenings_Homogeneous internalWall_NoOpenings_Homogeneous(L = L, H = H, s = s, vertical = vertical, ro = ro, cp = cp, lambda = lambda, n = n, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}})));
  parameter SI.Length L = 1 "door width";
  parameter SI.Length H = 2 "door height";
  parameter SI.Length s = 0.04 "door thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 800 "door material density";
  parameter SI.SpecificHeatCapacity cp = 480 "door material cp";
  parameter SI.ThermalConductivity lambda = 0.8 "door material thermal cond";
  parameter Integer n = 4 "number of door layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  parameter Boolean fixedCoeff = false "fixed heat transfer coefficient";
  parameter SI.CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  parameter Real inclination = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient";
  parameter SI.Pressure dpnom = 10000 "Nominal pressure drop";
  parameter SI.MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter SI.ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter SI.ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
  BaseComponents.Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix(dpnom = dpnom, wnom = wnom, GvOverGa = GvOverGa, Gdw0 = Gdw0, Gdwnom = Gdwnom) annotation(
  Placement(transformation(extent = {{-20, 40}, {20, 80}})));
  BaseComponents.Thermal.Sources.SolarRadiation_OpaqueSurf solarRadiation_OpaqueSurf(L = L, H = H, absCoef = absCoef, orientation = orientation, inclination = inclination) annotation(
  Placement(transformation(extent = {{46, 52}, {86, 92}})));
  BaseComponents.Ambient.Radiaton_SkyGround RadToSkyGround(L = L, H = H, inclination = inclination, es = es, eg = eg) annotation(
  Placement(transformation(extent = {{46, 6}, {86, 46}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke ConvToExt(L = L, H = H, fixedCoeff = fixedCoeff, h0 = h0, orientation = orientation) annotation(
  Placement(transformation(extent = {{46, -46}, {86, -6}})));
  BaseComponents.Ambient.AmbientAirTempWithOpenings ambientAirTempWithOpenings annotation(
  Placement(transformation(extent = {{52, -90}, {90, -50}})));
equation
  connect(opening01, mix.cmd01) annotation(
  Line(points = {{-80, 80}, {0, 80}, {0, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Absorbed, internalWall_NoOpenings_Homogeneous.airSide2) annotation(
  Line(points = {{50, 72.4}, {34, 72.4}, {34, 0}, {18, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(RadToSkyGround.wall, internalWall_NoOpenings_Homogeneous.airSide2) annotation(
  Line(points = {{46, 26}, {34, 26}, {34, 0}, {18, 0}, {18, 1.77636e-15}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(internalWall_NoOpenings_Homogeneous.airSide2, ConvToExt.wall) annotation(
  Line(points = {{18, 0}, {34, 0}, {34, -26}, {50, -26}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(mix.Bdiffuse, ambientAirTempWithOpenings.diffuse) annotation (
  Line(
        points={{18,60.4},{18,60},{28,60},{28,-75.2},{53.9,-75.2}}, color={255,
          0,0}));
  connect(mix.Bdryair, ambientAirTempWithOpenings.dryair) annotation (
  Line(
        points={{17.6,66},{24,66},{30,66},{30,-66},{53.52,-66}}, color={0,100,
          150}));
  connect(mix.Bvapour, ambientAirTempWithOpenings.vapour) annotation (
  Line(
        points={{18,54.4},{22,54.4},{22,54},{22,-80.8},{53.9,-80.8}}, color={0,
          100,150}));
  connect(internalWall_NoOpenings_Homogeneous.airSide1, diffuse) annotation (
    Line(points={{-18,0},{-90,0},{-90,0}}, color={255,0,0}));
  connect(mix.diffuse, diffuse) annotation (
  Line(points={{-18,60.4},{-36,60.4},
          {-36,60},{-90,60},{-90,0}}, color={255,0,0}));
  connect(mix.dryair, dryair) annotation (
  Line(points={{-19.2,65.6},{-96,65.6},
          {-96,26}}, color={0,100,150}));
  connect(mix.vapour, vapour) annotation (
  Line(points={{-18.8,54.4},{-60,54.4},
          {-60,-30},{-94,-30}}, color={0,100,150}));
annotation(
Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end ExternallDoor_Opening;
