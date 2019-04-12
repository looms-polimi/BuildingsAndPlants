within BuildingsAndPlants.Components.AggregateComponents.Test;
model test1_IdealControlledFluidHeater
  Components.AggregateComponents.Heating.IdealControlledFluidHeater idealControlledFluidHeater(Tcl = 240, Tstart = 273.15 + 20) annotation(Placement(transformation(extent = {{-68, 30}, {-36, 64}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation(Placement(transformation(extent = {{-96, 78}, {-86, 88}})));
  Modelica.Blocks.Sources.Constant const1(k = 101325) annotation(Placement(transformation(extent = {{-14, 84}, {-4, 94}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15 + 60) annotation(Placement(transformation(extent = {{-96, 48}, {-86, 58}})));
  Components.BaseComponents.Water.Pressurisers.IdealWaterPressuriser idealPressuriser annotation(Placement(transformation(extent = {{2, 40}, {16, 54}})));
  Components.BaseComponents.Water.Pumps.WaterPump_Volumetric volumetricPump(qmax = 0.0002) annotation(Placement(transformation(extent = {{-22, 40}, {-8, 54}})));
  Components.BaseComponents.Thermal.Capacities.MassT massT(cp = 1000, Tstart = 273.15 + 5) annotation(Placement(transformation(extent = {{54, 48}, {72, 66}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca(S = 1.5, gamma = 25) annotation(Placement(transformation(extent = {{-10, -8}, {10, 8}}, rotation = 90, origin = {52, 12})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca1(S = 10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {74, 12})));
  Components.AggregateComponents.Heating.RoomHeater roomHeater(nLumps = 5, Ltube = 2.5, Dtube = 0.1, Cftube = 0.001, gammaTubeMetal = 45, Mmetal = 50, Tstart = 273.15 + 20) annotation(Placement(transformation(extent = {{22, 2}, {42, 22}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 100) annotation(Placement(transformation(extent = {{-60, 84}, {-48, 96}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature source_T_fixed1(T = 273.15 + 5) annotation(Placement(transformation(extent = {{78, 54}, {90, 66}})));
equation
  connect(const1.y, idealPressuriser.p) annotation(Line(points = {{-3.5, 89}, {0, 89}, {0, 51.2}, {5.22, 51.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(booleanConstant.y, idealControlledFluidHeater.ON) annotation(Line(points = {{-85.5, 83}, {-76, 83}, {-76, 58.73}, {-64.96, 58.73}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(const2.y, idealControlledFluidHeater.To) annotation(Line(points = {{-85.5, 53}, {-74.75, 53}, {-74.75, 52.95}, {-64.96, 52.95}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp.y, volumetricPump.cmd) annotation(Line(points = {{-47.4, 90}, {-30, 90}, {-30, 51.06}, {-18.64, 51.06}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(convSca2Sca.ss2, convSca2Sca1.ss1) annotation(Line(points = {{56.8, 12}, {68, 12}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca.ss2, massT.surf) annotation(Line(points = {{56.8, 12}, {63, 12}, {63, 49.8}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(source_T_fixed1.port, convSca2Sca1.ss2) annotation(Line(points = {{90, 60}, {94, 60}, {94, 12}, {80, 12}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(roomHeater.heatPort, convSca2Sca.ss1) annotation(Line(points = {{41, 12.2}, {44.5, 12.2}, {44.5, 12}, {47.2, 12}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(idealControlledFluidHeater.water_flange2, volumetricPump.water_flange1) annotation(Line(points = {{-39.2, 47}, {-29.6, 47}, {-29.6, 47}, {-20.6, 47}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(volumetricPump.water_flange2, idealPressuriser.water_flange1) annotation(Line(points = {{-9.4, 47}, {-3.7, 47}, {-3.7, 47}, {3.4, 47}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(idealPressuriser.water_flange2, roomHeater.water_flange1) annotation(Line(points = {{14.6, 47}, {24, 47}, {24, 18}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(roomHeater.water_flange2, idealControlledFluidHeater.water_flange1) annotation(Line(points = {{24.1, 6}, {24, 6}, {24, 0}, {-80, 0}, {-80, 47}, {-64.8, 47}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end test1_IdealControlledFluidHeater;

