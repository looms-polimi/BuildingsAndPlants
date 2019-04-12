within BuildingsAndPlants.Utilities;
model get_fixed_rpm_data
  // Dtab  = [t,Tho,Taco,Tcdia,Tcdoa,Tamb,MRFC,...
  //          DscaleFC,Tacsp,PIpwr,rpm,W,Wh];
  Modelica.Blocks.Sources.CombiTimeTable CT1Ds(tableOnFile = true, tableName = "Dtab", fileName = fileName, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, columns = 2:13) annotation(
  Placement(transformation(extent = {{-20, 62}, {0, 82}})));
  Modelica.Blocks.Interfaces.RealOutput oTho(unit = "K", displayUnit = "degC") "Heater outlet T" annotation(
  Placement(transformation(extent = {{60, 272}, {80, 292}}), iconTransformation(extent = {{60, 260}, {100, 300}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdia(unit = "K", displayUnit = "degC") "Condenser inlet T, amb side" annotation(
  Placement(transformation(extent = {{60, 236}, {80, 256}}), iconTransformation(extent = {{60, 140}, {100, 180}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdoa(unit = "K", displayUnit = "degC") "Condenser outlet T, amb side" annotation(
  Placement(transformation(extent = {{60, 220}, {80, 240}}), iconTransformation(extent = {{60, 80}, {100, 120}})));
  Modelica.Blocks.Interfaces.RealOutput oTamb(unit = "K", displayUnit = "degC") "Ambient T" annotation(
  Placement(transformation(extent = {{60, 202}, {80, 222}}), iconTransformation(extent = {{60, 20}, {100, 60}})));
  Modelica.Blocks.Interfaces.RealOutput oMRFC "Measured MR (filt+comp)" annotation(
  Placement(transformation(extent = {{60, 182}, {80, 202}}), iconTransformation(extent = {{60, -40}, {100, 0}})));
  Modelica.Blocks.Interfaces.RealOutput oDscaleFC(unit = "kg", displayUnit = "kg") "Scale output (filt+comp)" annotation(
  Placement(transformation(extent = {{60, 140}, {80, 160}}), iconTransformation(extent = {{60, -100}, {100, -60}})));
  Modelica.Blocks.Interfaces.RealOutput oTacsp(unit = "K", displayUnit = "degC") "SP for air channel T" annotation(
  Placement(transformation(extent = {{60, 122}, {80, 142}}), iconTransformation(extent = {{60, -160}, {100, -120}})));
  Modelica.Blocks.Interfaces.RealOutput oPIpwr(unit = "W", displayUnit = "W") "PI power request" annotation(
  Placement(transformation(extent = {{60, 104}, {80, 124}}), iconTransformation(extent = {{60, -220}, {100, -180}})));
  Modelica.Blocks.Interfaces.RealOutput orpm " motor rpm" annotation(
  Placement(transformation(extent = {{60, 88}, {80, 108}}), iconTransformation(extent = {{60, -280}, {100, -240}})));
  Modelica.Blocks.Interfaces.RealOutput oW(unit = "W", displayUnit = "W") "Total power measured at plug" annotation(
  Placement(transformation(extent = {{60, 66}, {80, 86}}), iconTransformation(extent = {{60, -340}, {100, -300}})));
  Modelica.Blocks.Interfaces.RealOutput oWh "Total consumption at plug [Wh]" annotation(
  Placement(transformation(extent = {{60, 38}, {80, 58}}), iconTransformation(extent = {{60, -400}, {100, -360}})));
  parameter String fileName = "Resources/fixed_rpm_data/" "File where the matrix is stored" annotation(
  Dialog(__Dymola_loadSelector(filter = "Matlab files (*.mat);;CSV files (*.csv)", caption = "Open experiment data file")));
  Modelica.Blocks.Interfaces.RealOutput oTaco(unit = "K", displayUnit = "degC") "Air channel T" annotation(
  Placement(transformation(extent = {{60, 254}, {80, 274}}), iconTransformation(extent = {{60, 198}, {100, 238}})));
equation
  oTho = CT1Ds.y[1];
  oTaco = CT1Ds.y[2];
  oTcdia = CT1Ds.y[3];
  oTcdoa = CT1Ds.y[4];
  oTamb = CT1Ds.y[5];
  oMRFC = CT1Ds.y[6];
  oDscaleFC = CT1Ds.y[7];
  oTacsp = CT1Ds.y[8];
  oPIpwr = CT1Ds.y[9];
  orpm = CT1Ds.y[10];
  oW = CT1Ds.y[11];
  oWh = CT1Ds.y[12];
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-200, -500}, {100, 500}}), graphics), experiment(StopTime = 10), defaultComponentName = "experimentalData", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-200, -500}, {100, 500}}), graphics={  Rectangle(extent = {{-200, 444}, {100, -500}}, lineColor = {0, 0, 255}, fillColor = {213, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-206, 302}, {-12, -282}}, lineColor = {0, 0, 0}, textStyle = {TextStyle.Bold},
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Right, textString = "Tho
Taco
Tcdia
Tcdoa
Tamb
MRFC
DscaleFC
Tacsp
PIpwr
RPMsp
W
Wh"), Rectangle(extent = {{-200, 444}, {98, 500}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 0},
            fillPattern =                                                                                            FillPattern.Solid), Text(extent = {{-196, 490}, {96, 442}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textStyle = {TextStyle.Bold}, textString = "fixrpmdata")}));
end get_fixed_rpm_data;
