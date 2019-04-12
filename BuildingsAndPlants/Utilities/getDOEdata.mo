within BuildingsAndPlants.Utilities;
model getDOEdata
  // t, MR, Mwo, mrpm, Tacsp, PIreq, Hstat, Tcdia, Tcdoa, Tamb, Wtot, Whtot, Pstat, Taco, Tho
  Modelica.Blocks.Sources.CombiTimeTable CT1Ds(tableOnFile = true, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "Dtab", fileName = fileName, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, columns = 2:15) annotation(
  Placement(transformation(extent = {{-20, 60}, {0, 80}})));
  Modelica.Blocks.Interfaces.RealOutput oMR "(totalMass-conditionedMass)/conditionedMass" annotation(
  Placement(transformation(extent = {{60, 292}, {80, 312}}), iconTransformation(extent = {{60, 360}, {100, 400}})));
  Modelica.Blocks.Interfaces.RealOutput oMwo "Total load mass" annotation(
  Placement(transformation(extent = {{60, 272}, {80, 292}}), iconTransformation(extent = {{60, 300}, {100, 340}})));
  Modelica.Blocks.Interfaces.RealOutput omrpm "Motor RPM" annotation(
  Placement(transformation(extent = {{60, 254}, {80, 274}}), iconTransformation(extent = {{60, 240}, {100, 280}})));
  Modelica.Blocks.Interfaces.RealOutput oTacsp(unit = "K", displayUnit = "degC") "Air channel temperature set point" annotation(
  Placement(transformation(extent = {{60, 236}, {80, 256}}), iconTransformation(extent = {{60, 180}, {100, 220}})));
  Modelica.Blocks.Interfaces.RealOutput oPIreq "Power request by temperature controller" annotation(
  Placement(transformation(extent = {{60, 220}, {80, 240}}), iconTransformation(extent = {{60, 120}, {100, 160}})));
  Modelica.Blocks.Interfaces.RealOutput oHstat "Heater status" annotation(
  Placement(transformation(extent = {{60, 202}, {80, 222}}), iconTransformation(extent = {{60, 60}, {100, 100}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdia(unit = "K", displayUnit = "degC") "Condenser cold inlet temperature" annotation(
  Placement(transformation(extent = {{60, 182}, {80, 202}}), iconTransformation(extent = {{60, 0}, {100, 40}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdoa(unit = "K", displayUnit = "degC") "Condenser cold outlet temperature" annotation(
  Placement(transformation(extent = {{60, 162}, {80, 182}}), iconTransformation(extent = {{60, -60}, {100, -20}})));
  Modelica.Blocks.Interfaces.RealOutput oTamb(unit = "K", displayUnit = "degC") "Ambient temperature" annotation(
  Placement(transformation(extent = {{60, 140}, {80, 160}}), iconTransformation(extent = {{60, -120}, {100, -80}})));
  Modelica.Blocks.Interfaces.RealOutput oWtot "Total power consumption including blowers [W]" annotation(
  Placement(transformation(extent = {{60, 122}, {80, 142}}), iconTransformation(extent = {{60, -180}, {100, -140}})));
  Modelica.Blocks.Interfaces.RealOutput oWhtot "Total energy consumed [Wh]" annotation(
  Placement(transformation(extent = {{60, 104}, {80, 124}}), iconTransformation(extent = {{60, -240}, {100, -200}})));
  Modelica.Blocks.Interfaces.RealOutput oPstat "Extraction pump status" annotation(
  Placement(transformation(extent = {{60, 88}, {80, 108}}), iconTransformation(extent = {{60, -300}, {100, -260}})));
  Modelica.Blocks.Interfaces.RealOutput oTaco(unit = "K", displayUnit = "degC") "Air channel outlet temperature" annotation(
  Placement(transformation(extent = {{60, 66}, {80, 86}}), iconTransformation(extent = {{60, -360}, {100, -320}})));
  Modelica.Blocks.Interfaces.RealOutput oTho(unit = "K", displayUnit = "degC") "Heater outlet temperature" annotation(
  Placement(transformation(extent = {{60, 38}, {80, 58}}), iconTransformation(extent = {{60, -420}, {100, -380}})));
  parameter String fileName = "Resources/DOEData/" "File where the matrix is stored" annotation(
  Dialog(__Dymola_loadSelector(filter = "Matlab files (*.mat);;CSV files (*.csv)", caption = "Open experiment data file")));
equation
  oMR = CT1Ds.y[1] / 100;
  oMwo = CT1Ds.y[2];
  omrpm = CT1Ds.y[3];
  oTacsp = CT1Ds.y[4] + 273.15;
  oPIreq = CT1Ds.y[5];
  oHstat = CT1Ds.y[6];
  oTcdia = CT1Ds.y[7] + 273.15;
  oTcdoa = CT1Ds.y[8] + 273.15;
  oTamb = CT1Ds.y[9] + 273.15;
  oWtot = CT1Ds.y[10];
  oWhtot = CT1Ds.y[11];
  oPstat = CT1Ds.y[12];
  oTaco = CT1Ds.y[13] + 273.15;
  oTho = CT1Ds.y[14] + 273.15;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -500}, {100, 500}}), graphics), experiment(StopTime = 10), defaultComponentName = "experimentalData", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -500}, {100, 500}}), graphics={  Rectangle(extent = {{-100, 502}, {100, -496}}, lineColor = {0, 0, 255}, fillColor = {213, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end getDOEdata;
