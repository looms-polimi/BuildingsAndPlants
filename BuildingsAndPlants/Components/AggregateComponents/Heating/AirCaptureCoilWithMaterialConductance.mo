within BuildingsAndPlants.Components.AggregateComponents.Heating;

model AirCaptureCoilWithMaterialConductance
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
  parameter SI.ThermalConductance G = 10 "Constant thermal conductance of material";
  parameter SI.ThermalConductance Gaw = 100 "air-wall thermal conductance";
  Heating.WaterCoilWithWall waterCoilWithWall(nLumps = ncoil, Ltube = Lcoil, Dtube = Dcoil, Dz = Dz, Cftube = Cftube, gammaTubeMetal = gammaTubeMetal, Mmetal = Mmetal, cpMetal = cpMetal, Tstart = Tstart, STube = STube, gammaMetalExternal = gammaMetalExternal) annotation(
  Placement(transformation(extent = {{-68, -32}, {-16, 32}})));
  BaseComponents.Air.Volumes.AirVolumeWithWall_Condensing airVolumeWithWall_Condensing(V = V, Pstart = Pstart, Tstart = Tstart, Xstart = Xstart, Cw = cpMetal * Mmetal, Gaw = Gaw) annotation(
  Placement(transformation(extent = {{-28, -24}, {28, 24}}, rotation = 90, origin = {46, 0})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = G) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-20, 80}, {20, 100}})));
  Interfaces.Air.MoistAirFlange_waxa air_flange1 annotation(
  Placement(transformation(extent = {{70, -90}, {90, -70}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {80, -88})));
  Interfaces.Air.MoistAirFlange_waxa air_flange2 annotation(
  Placement(transformation(extent = {{70, 70}, {90, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {80, 88})));
  Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(transformation(extent = {{-90, 50}, {-70, 70}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(transformation(extent = {{-90, -70}, {-70, -50}}), iconTransformation(extent = {{-58, -80}, {-100, -40}})));
equation
  connect(airVolumeWithWall_Condensing.air_flange2, air_flange2) annotation(
  Line(points = {{46, 22.4}, {46, 80}, {80, 80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolumeWithWall_Condensing.air_flange1, air_flange1) annotation(
  Line(points = {{46, -22.4}, {46, -80}, {80, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.heatPort, thermalConductor.port_a) annotation(
  Line(points = {{-19.9, 0}, {-10, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(thermalConductor.port_b, airVolumeWithWall_Condensing.heatPort) annotation(
  Line(points = {{10, 0}, {24.4, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(heatPort, airVolumeWithWall_Condensing.heatPort) annotation(
  Line(points = {{0, 90}, {0, 40}, {20, 40}, {20, 0}, {24.4, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange1, water_flange1) annotation(
  Line(points = {{-62.8, 19.2}, {-80, 19.2}, {-80, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(waterCoilWithWall.water_flange2, water_flange2) annotation(
  Line(points = {{-62.54, -19.2}, {-80, -19.2}, {-80, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {200, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {200, 100}}), graphics = {Rectangle(extent = {{164, 80}, {-60, -80}}, lineColor = {175, 175, 175}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{160, 76}, {-56, -76}}, lineColor = {170, 213, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-32, 10}, {-12, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{-32, -20}, {-12, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Polygon(points = {{-20, 40}, {-20, 20}, {62, 50}, {60, 70}, {-20, 40}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Ellipse(extent = {{-32, 40}, {-12, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{48, 70}, {68, 50}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-68, 70}, {58, 50}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-20, 10}, {-20, -10}, {62, 20}, {60, 40}, {-20, 10}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Polygon(points = {{-20, -20}, {-20, -40}, {62, -10}, {60, 10}, {-20, -20}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Polygon(points = {{-22, -50}, {-22, -70}, {60, -40}, {58, -20}, {-22, -50}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.Solid, smooth = Smooth.None, fillColor = {100, 100, 100}), Ellipse(extent = {{48, 40}, {68, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{48, 10}, {68, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{48, -20}, {68, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{48, -50}, {68, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-20, 40}, {60, 20}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-20, 10}, {60, -10}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-20, -20}, {60, -40}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder), Rectangle(extent = {{-78, -50}, {-24, -70}}, lineColor = {100, 100, 100}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {100, 100, 100}), Ellipse(extent = {{-32, -50}, {-12, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Rectangle(extent = {{-24, -50}, {56, -70}}, lineColor = {0, 0, 255}, fillColor = {100, 100, 255}, fillPattern = FillPattern.HorizontalCylinder)}));
end AirCaptureCoilWithMaterialConductance;
