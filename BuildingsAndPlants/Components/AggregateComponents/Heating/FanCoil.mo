within BuildingsAndPlants.Components.AggregateComponents.Heating;
model FanCoil
  parameter Integer ncoil = 1 "number of lumps";
  parameter SI.Length Lcoil = 30 "tube length";
  parameter SI.Length Dcoil = 0.05 "tube inner diameter";
  parameter SI.Length Dz = 0 "height diff (out-in)";
  parameter Real Cftube = 1e-6 "tube friction coefficient";
  parameter SI.CoefficientOfHeatTransfer gammaTubeMetal = 5 "heat transfer coefficient";
  parameter SI.Mass Mmetal = 10 "metal mass";
  parameter SI.SpecificHeatCapacity cpMetal = 500 "metal specific heat";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial metal, fluid temp and moist air";
  parameter SI.CoefficientOfHeatTransfer gammaMetalExternal = 5 "heat transfer coefficient";
  parameter SI.Area STube = pi * waterCoilWithWall.Dtube * waterCoilWithWall.Ltube "total surf tube";
  parameter SI.Volume V = 0.001 "Moist air volume";
  parameter SI.Pressure Pstart = 101325 "Initial moist air pressure";
  parameter SI.MassFraction Xstart = 0.001 "Initial absolute umidity [kg_H20/kg_DA]";
  parameter SI.ThermalConductance Gaw = 100 "air-wall thermal conductance";
  parameter Real qamax = 0.02 "max air volumetric flowrate (m3/s)";
  Heating.WaterCoilWithWall waterCoilWithWall(nLumps = ncoil, Ltube = Lcoil, Dtube = Dcoil, Dz = Dz, Cftube = Cftube, gammaTubeMetal = gammaTubeMetal, Mmetal = Mmetal, cpMetal = cpMetal, Tstart = Tstart, STube = STube, gammaMetalExternal = gammaMetalExternal) annotation(
  Placement(transformation(extent = {{-60, -20}, {-20, 20}})));
  BaseComponents.Air.Volumes.AirVolumeWithWall_Condensing airVolumeWithWall_Condensing(V = V, Pstart = Pstart, Tstart = Tstart, Xstart = Xstart, Cw = cpMetal * Mmetal, Gaw = Gaw) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {40, 0})));
  BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume airPrescribedFlowRate_Volume annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {40, -46})));
  Modelica.Blocks.Interfaces.RealInput icmd01 annotation(
  Placement(transformation(extent = {{-66, -66}, {-26, -26}}), iconTransformation(extent = {{190, -20}, {150, 20}})));
  Modelica.Blocks.Math.Gain qa(k = qamax) annotation(
  Placement(transformation(extent = {{-8, -56}, {12, -36}})));
  Interfaces.Air.MoistAirFlange_waxa air_flange1 annotation(
  Placement(transformation(extent = {{70, -90}, {90, -70}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {80, -88})));
  Interfaces.Air.MoistAirFlange_waxa air_flange2 annotation(
  Placement(transformation(extent = {{70, 70}, {90, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {80, 88})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
equation
  connect(waterCoilWithWall.heatPort, airVolumeWithWall_Condensing.heatPort) annotation(
  Line(points = {{-23, 6.66134e-16}, {4, 6.66134e-16}, {4, 3.10862e-15}, {22, 3.10862e-15}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolumeWithWall_Condensing.air_flange1, airPrescribedFlowRate_Volume.air_flange2) annotation(
  Line(points = {{40, -16}, {40, -30}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airPrescribedFlowRate_Volume.air_flange1, air_flange1) annotation(
  Line(points = {{40, -62}, {40, -80}, {80, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(air_flange2, airVolumeWithWall_Condensing.air_flange2) annotation(
  Line(points = {{80, 80}, {40, 80}, {40, 16}}, color = {0, 100, 150}, smooth = Smooth.None));
  connect(icmd01, qa.u) annotation(
  Line(points = {{-46, -46}, {-10, -46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(qa.y, airPrescribedFlowRate_Volume.iq) annotation(
  Line(points = {{13, -46}, {22, -46}, {22, -46.2}, {31.4, -46.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange1, water_flange1) annotation(
  Line(points = {{-56, 12}, {-80, 12}, {-80, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange2, water_flange2) annotation(
  Line(points = {{-55.8, -12}, {-80, -12}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {200, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {200, 100}}), graphics = {Rectangle(extent = {{150, 80}, {-74, -80}}, lineColor = {175, 175, 175}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{138, 72}, {-64, -72}}, lineColor = {170, 213, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{90, 78}, {70, -80}}, lineColor = {170, 255, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-80, 70}, {2, 70}, {116, 48}, {116, 20}, {-8, 0}, {-8, 0}, {116, -20}, {116, -48}, {2, -70}, {-80, -70}, {-80, -50}, {0, -50}, {96, -36}, {96, -36}, {-42, -16}, {-42, 16}, {96, 34}, {96, 34}, {0, 50}, {-80, 50}, {-80, 70}}, lineColor = {0, 128, 255}, smooth = Smooth.None, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid)}));
end FanCoil;

