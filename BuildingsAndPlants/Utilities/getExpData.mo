within BuildingsAndPlants.Utilities;
model getExpData
  // Dtab  = [t,Thi,Tho,Taco,Tcab,Tcdia,Tcdoa,Tamb,MRFC,RMCFC,...
  //          DscaleFC,Tacsp,PIpwr,RPMsp,W,Wh];
  Modelica.Blocks.Sources.CombiTimeTable CT1Ds(tableOnFile = true, tableName = "Dtab", fileName = fileName, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, columns = 2:16) annotation(
  Placement(transformation(extent = {{-20, 62}, {0, 82}})));
  Modelica.Blocks.Interfaces.RealOutput oThi(unit = "K", displayUnit = "degC") "Heater inlet T" annotation(
  Placement(transformation(extent = {{60, 292}, {80, 312}}), iconTransformation(extent = {{60, 378}, {100, 418}})));
  Modelica.Blocks.Interfaces.RealOutput oTho(unit = "K", displayUnit = "degC") "Heater outlet T" annotation(
  Placement(transformation(extent = {{60, 272}, {80, 292}}), iconTransformation(extent = {{60, 318}, {100, 358}})));
  Modelica.Blocks.Interfaces.RealOutput oTcab(unit = "K", displayUnit = "degC") "Cabinet T" annotation(
  Placement(transformation(extent = {{60, 254}, {80, 274}}), iconTransformation(extent = {{62, 198}, {102, 238}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdia(unit = "K", displayUnit = "degC") "Condenser inlet T, amb side" annotation(
  Placement(transformation(extent = {{60, 236}, {80, 256}}), iconTransformation(extent = {{60, 140}, {100, 180}})));
  Modelica.Blocks.Interfaces.RealOutput oTcdoa(unit = "K", displayUnit = "degC") "Condenser outlet T, amb side" annotation(
  Placement(transformation(extent = {{60, 220}, {80, 240}}), iconTransformation(extent = {{60, 80}, {100, 120}})));
  Modelica.Blocks.Interfaces.RealOutput oTamb(unit = "K", displayUnit = "degC") "Ambient T" annotation(
  Placement(transformation(extent = {{60, 202}, {80, 222}}), iconTransformation(extent = {{60, 20}, {100, 60}})));
  Modelica.Blocks.Interfaces.RealOutput oMRFC "Measured MR (filt+comp)" annotation(
  Placement(transformation(extent = {{60, 182}, {80, 202}}), iconTransformation(extent = {{60, -40}, {100, 0}})));
  Modelica.Blocks.Interfaces.RealOutput oRMCFC "Measured RMC (filt+comp)" annotation(
  Placement(transformation(extent = {{60, 162}, {80, 182}}), iconTransformation(extent = {{60, -100}, {100, -60}})));
  Modelica.Blocks.Interfaces.RealOutput oDscaleFC(unit = "kg", displayUnit = "kg") "Scale output (filt+comp)" annotation(
  Placement(transformation(extent = {{60, 140}, {80, 160}}), iconTransformation(extent = {{60, -160}, {100, -120}})));
  Modelica.Blocks.Interfaces.RealOutput oTacsp(unit = "K", displayUnit = "degC") "SP for air channel T" annotation(
  Placement(transformation(extent = {{60, 122}, {80, 142}}), iconTransformation(extent = {{60, -220}, {100, -180}})));
  Modelica.Blocks.Interfaces.RealOutput oPIpwr(unit = "W", displayUnit = "W") "PI power request" annotation(
  Placement(transformation(extent = {{60, 104}, {80, 124}}), iconTransformation(extent = {{60, -280}, {100, -240}})));
  Modelica.Blocks.Interfaces.RealOutput orpmsp "SP for motor rpm" annotation(
  Placement(transformation(extent = {{60, 88}, {80, 108}}), iconTransformation(extent = {{60, -340}, {100, -300}})));
  Modelica.Blocks.Interfaces.RealOutput oW(unit = "W", displayUnit = "WC") "Total power measured at plug" annotation(
  Placement(transformation(extent = {{60, 66}, {80, 86}}), iconTransformation(extent = {{60, -400}, {100, -360}})));
  Modelica.Blocks.Interfaces.RealOutput oWh "Total consumption at plug [Wh]" annotation(
  Placement(transformation(extent = {{60, 38}, {80, 58}}), iconTransformation(extent = {{60, -460}, {100, -420}})));
  parameter String fileName = "Resources/RNdata/" "File where the matrix is stored" annotation(
  Dialog(__Dymola_loadSelector(filter = "Matlab files (*.mat);;CSV files (*.csv)", caption = "Open experiment data file")));
  Modelica.Blocks.Interfaces.RealOutput oTaco(unit = "K", displayUnit = "degC") "Air channel T" annotation(
  Placement(transformation(extent = {{60, 254}, {80, 274}}), iconTransformation(extent = {{62, 260}, {102, 300}})));
equation
  oThi = CT1Ds.y[1];
  oTho = CT1Ds.y[2];
  oTaco = CT1Ds.y[3];
  oTcab = CT1Ds.y[4];
  oTcdia = CT1Ds.y[5];
  oTcdoa = CT1Ds.y[6];
  oTamb = CT1Ds.y[7];
  oMRFC = CT1Ds.y[8];
  oRMCFC = CT1Ds.y[9];
  oDscaleFC = CT1Ds.y[10];
  oTacsp = CT1Ds.y[11];
  oPIpwr = CT1Ds.y[12];
  orpmsp = CT1Ds.y[13];
  oW = CT1Ds.y[14];
  oWh = CT1Ds.y[15];
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-200, -500}, {100, 500}}), graphics), experiment(StopTime = 10), defaultComponentName = "experimentalData", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-200, -500}, {100, 500}}), graphics={  Rectangle(extent = {{-200, 498}, {98, -498}}, lineColor = {0, 0, 255}, fillColor = {213, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-44, 442}, {20, -490}}, lineColor = {0, 0, 0}, textStyle = {TextStyle.Bold},
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Right, textString = "Thi

Tho

Taco

Tcab

Tcdia

Tcdoa

Tamb

MRFC

RMCFC

DscaleFC

Tacsp

PIpwr

RPMsp

W

Wh"), Rectangle(extent = {{-200, 444}, {98, 500}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 0},
            fillPattern =                                                                                            FillPattern.Solid), Text(extent = {{-140, 492}, {46, 444}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textStyle = {TextStyle.Bold}, textString = "ExpData")}));
end getExpData;
