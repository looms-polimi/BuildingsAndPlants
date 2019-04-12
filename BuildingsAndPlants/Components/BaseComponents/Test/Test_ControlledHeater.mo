within BuildingsAndPlants.Components.BaseComponents.Test;
model Test_ControlledHeater
  HVAC.AirHandling.ControlledHeater_SensQbal controlledHeater annotation(Placement(transformation(extent = {{2, 2}, {42, 42}})));
  Air.Sources.AirSource_wTX_fixed airSource_wTX_fixed annotation(Placement(transformation(extent = {{-68, 12}, {-48, 32}})));
  Air.Sinks.AirSink_P_fixed airSink_P_fixed annotation(Placement(transformation(extent = {{76, 12}, {56, 32}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = if time < 100 or time > 150 then 300 else 280) annotation(Placement(transformation(extent = {{-58, 42}, {-38, 62}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = time < 30 or time > 60) annotation(Placement(transformation(extent = {{-40, 64}, {-20, 84}})));
  Air.Volumes.AirVolume airVolume annotation(Placement(transformation(extent = {{-28, 32}, {-8, 12}})));
  Air.Pdrops.AirPdrop_Lin airPdrop_Lin annotation(Placement(transformation(extent = {{-52, -26}, {-32, -6}})));
  Thermal.HeatTransfer.Convection_SS convection_SS(gamma = 100) annotation(Placement(transformation(extent = {{-28, -46}, {-8, -26}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-50, -72}, {-30, -52}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 290 + 5 * sin(time / 5)) annotation(Placement(transformation(extent = {{-90, -72}, {-70, -52}})));
equation
  connect(controlledHeater.air_flange2, airSink_P_fixed.air_flange) annotation(Line(points = {{38, 22}, {58, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(booleanExpression.y, controlledHeater.ON) annotation(Line(points = {{-19, 74}, {-8, 74}, {-8, 37.6}, {6, 37.6}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(realExpression.y, controlledHeater.Tsp) annotation(Line(points = {{-37, 52}, {-24, 52}, {-24, 30}, {6, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(airVolume.air_flange2, controlledHeater.air_flange1) annotation(Line(points = {{-10, 22}, {6, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airSource_wTX_fixed.air_flange, airPdrop_Lin.air_flange1) annotation(Line(points = {{-50, 22}, {-50, 4}, {-50, -16}, {-50, -16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airPdrop_Lin.air_flange2, airVolume.air_flange1) annotation(Line(points = {{-34, -16}, {-30, -16}, {-30, 22}, {-26, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.heatPort, convection_SS.ss1) annotation(Line(points = {{-18, 13}, {-18, -30}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(prescribedTemperature.port, convection_SS.ss2) annotation(Line(points = {{-30, -62}, {-18, -62}, {-18, -42}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(realExpression1.y, prescribedTemperature.T) annotation(Line(points = {{-69, -62}, {-52, -62}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 200), __Dymola_experimentSetupOutput);
end Test_ControlledHeater;

