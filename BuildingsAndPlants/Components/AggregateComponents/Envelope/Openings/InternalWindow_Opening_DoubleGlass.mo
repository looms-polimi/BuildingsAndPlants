within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;
model InternalWindow_Opening_DoubleGlass
  extends BaseClasses.BaseInternalWindow_Opening;
  BaseComponents.Envelope.DoubleGlass Glass(L = L, H = H, Tstart = Tstart, d_glass = d_glass, d_int = d_int, gamma = gamma_g, material_glass = material_glass, material_gas = material_gas) annotation(
  Placement(transformation(extent = {{-20, -30}, {20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideA(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-60, -30}, {-20, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvSideB(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{60, -30}, {20, 30}})));
  parameter SI.Length L = 5 "glass surface length";
  parameter SI.Length H = 3 "glass surface height";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Temperature Tstart = 273.15 + 25 "Initial temperature, all layers";
  parameter Media.Materials.Glasses.BaseGlass material "Type of glass" annotation(
  choicesAllMatching = true);
  BaseComponents.Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix(dpnom = dpnom, wnom = wnom, GvOverGa = GvOverGa, Gdw0 = Gdw0, Gdwnom = Gdwnom) annotation(
  Placement(transformation(extent = {{-20, 40}, {20, 80}})));
  parameter SI.Length d_glass = 0.02 "Width of the single glass";
  parameter SI.Length d_int = 0.05 "Distance between two glasses";
  parameter Media.Materials.Glasses.BaseGlass material_glass "Type of glass" annotation(
  choicesAllMatching = true);
  parameter Media.Materials.EnvelopeGases.BaseEnvelopeGas material_gas "Type of internal gas between the glasses" annotation(
  choicesAllMatching = true);
  parameter SI.CoefficientOfHeatTransfer gamma_g = 5 "Heat transfer coefficient between the glasses and internal gas";
  parameter SI.Pressure dpnom = 10000 "Nominal pressure drop";
  parameter SI.MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter SI.ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter SI.ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
equation
  connect(ConvSideA.wall, Glass.side1) annotation(
  Line(points = {{-24, 0}, {-18, 0}, {-18, -4.44089e-16}, {-10, -4.44089e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(Glass.side2, ConvSideB.wall) annotation(
  Line(points = {{10, -4.44089e-16}, {14, -4.44089e-16}, {14, 2.22045e-16}, {24, 2.22045e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(opening01, mix.cmd01) annotation(
  Line(points = {{-80, 80}, {0, 80}, {0, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(mix.Bdiffuse, Bdiffuse) annotation (
  Line(points={{18,60.4},{72,60.4},
          {72,0},{90,0}}, color={255,0,0}));
  connect(ConvSideB.air, Bdiffuse) annotation (
    Line(points={{56,0},{90,0},{90,0}}, color={255,0,0}));
  connect(mix.diffuse, diffuse) annotation (
  Line(points={{-18,60.4},{-26,60.4},
          {-26,60},{-70,60},{-70,-2},{-90,-2}}, color={255,0,0}));
  connect(ConvSideA.air, diffuse) annotation (
  Line(points={{-56,0},{-68,0},{-68,
          -2},{-90,-2}}, color={255,0,0}));
  connect(mix.dryair, dryair) annotation (
  Line(points={{-19.2,65.6},{-96,65.6},
          {-96,22}}, color={0,100,150}));
  connect(mix.vapour, vapour) annotation (
  Line(points={{-18.8,54.4},{-66,54.4},
          {-66,-26},{-94,-26}}, color={0,100,150}));
  connect(mix.Bvapour, Bvapour) annotation (
  Line(points={{18,54.4},{66,54.4},{
          66,-30},{90,-30}}, color={0,100,150}));
  connect(mix.Bdryair, Bdryair) annotation (
  Line(points={{17.6,66},{34,66},{90,
          66},{90,26}}, color={0,100,150}));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(graphics={  Rectangle(extent = {{-4, 60}, {4, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {240, 240, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end InternalWindow_Opening_DoubleGlass;

