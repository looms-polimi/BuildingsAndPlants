within BuildingsAndPlants.Appliances.Accessories;

model CompactRefrigerator_FSC_1Cdamper "Compact refrigerator with variable speed compressor (PI), 1 circuit + damper"
  parameter SI.Temperature Tambnom = 273.15 + 20 "nominal ambient temperature";
  parameter SI.Temperature Tambmax = 273.15 + 30 "max rated ambient temperature";
  parameter SI.Temperature Tcondnom = 273.15 + 40 "nominal condenser temperature";
  parameter SI.Temperature Tcprnom = 273.15 + 35 "nominal condenser temperature";
  parameter SI.Temperature TspFR = 273.15 + 4 "fridge temperature SP";
  parameter SI.Temperature TspFZ = 273.15 - 18 "freezer temperature SP";
  parameter SI.HeatFlowRate QFRnom = 60 "nominal fridge cooling power";
  parameter SI.HeatFlowRate QFZnom = 40 "nominal freezer cooling power";
  parameter SI.HeatCapacity CFR = 10000 "fridge heat capacity";
  parameter SI.HeatCapacity CFZ = 8000 "freezer heat capacity";
  parameter SI.HeatCapacity CCond = 100 "condenser heat capacity";
  parameter SI.ThermalConductance Gdamper = 100 "open damper equiv conductance";
  parameter Real etaC = 0.8 "Compressor efficiency";
  parameter SI.Temperature hist2FR = 0.5 "fridge hist/2";
  parameter SI.Temperature hist2FZ = 0.5 "freezer hist/2";
  parameter SI.Time TCsensTFZ = 10 "TFZ sensor TC";
  parameter SI.Time TCsensTFR = 10 "TFR sensor TC";
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TFZ annotation(
  Placement(transformation(extent = {{-62, 46}, {-42, 66}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TFR annotation(
  Placement(transformation(extent = {{-60, -66}, {-40, -46}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossFR(G = GlossFR) annotation(
  Placement(transformation(extent = {{-120, -66}, {-100, -46}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossFZ(G = GlossFZ) annotation(
  Placement(transformation(extent = {{-120, 46}, {-100, 66}})));
  Components.BaseComponents.Thermal.HeatTransfer.PrescribedHeatFlowThrough QoFZ annotation(
  Placement(transformation(extent = {{52, 90}, {72, 70}})));
  Controllers.Blocks.Analogue.RLY_inv RFZ(CSlo = 0, CShist2 = hist2FZ, CShi = QmaxFZ + QmaxFR) annotation(
  Placement(transformation(extent = {{18, 60}, {58, 40}})));
  Controllers.Blocks.Analogue.RLY_inv RFR(CSlo = 0, CShist2 = hist2FR, CShi = Gdamper) annotation(
  Placement(transformation(extent = {{18, -60}, {58, -40}})));
  Modelica.Blocks.Sources.RealExpression spTFZ(y = TspFZ) annotation(
  Placement(transformation(extent = {{0, 34}, {20, 54}})));
  Modelica.Blocks.Sources.RealExpression spTFR(y = TspFR) annotation(
  Placement(transformation(extent = {{0, -34}, {20, -54}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossCond(G = GlossCond) "condenser to ambient conductance" annotation(
  Placement(transformation(extent = {{-100, 10}, {-120, 30}})));
  Interfaces.Thermal.HeatPort portAmbient annotation(
  Placement(transformation(extent = {{-200, -20}, {-160, 20}}), iconTransformation(extent = {{-160, -80}, {-120, 80}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossCpr(G = GlossCpr) "compressor to ambient conductance" annotation(
  Placement(transformation(extent = {{-100, -30}, {-120, -10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pc annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {120, -4})));
  Modelica.Blocks.Math.Gain CprEff(k = 1 / etaC - 1) annotation(
  Placement(transformation(extent = {{-8, 8}, {8, -8}}, rotation = 270, origin = {120, 28})));
  Interfaces.Thermal.HeatPort portHeatRecCompressor annotation(
  Placement(transformation(extent = {{160, -90}, {200, -70}}), iconTransformation(extent = {{100, -120}, {140, -78}})));
  Interfaces.Thermal.HeatPort portHeatRecCondenser annotation(
  Placement(transformation(extent = {{160, -60}, {200, -40}}), iconTransformation(extent = {{78, -20}, {120, 120}})));
  Modelica.Blocks.Continuous.FirstOrder fTFZ(T = TCsensTFZ, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = TspFZ) annotation(
  Placement(transformation(extent = {{-30, 46}, {-10, 66}})));
  Modelica.Blocks.Continuous.FirstOrder fTFR(initType = Modelica.Blocks.Types.Init.InitialOutput, T = TCsensTFR, y_start = TspFR) annotation(
  Placement(transformation(extent = {{-26, -66}, {-6, -46}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS_gammaIn convSca2ScaGin annotation(
  Placement(transformation(extent = {{-8, 24}, {8, -24}}, rotation = -90, origin = {58, -90})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = CFZ, T(start = TspFZ, fixed = true)) annotation(
  Placement(transformation(extent = {{-94, 102}, {-66, 130}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(T(start = TspFR, fixed = true), C = CFR) annotation(
  Placement(transformation(extent = {{-94, -102}, {-66, -130}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C = CCond, T(start = Tcondnom, fixed = true)) annotation(
  Placement(transformation(extent = {{70, -102}, {98, -130}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor3(C = CCond, T(start = Tcondnom, fixed = true)) annotation(
  Placement(transformation(extent = {{106, -102}, {134, -130}})));
protected
  parameter SI.ThermalConductance GlossFR = QFRnom / (Tambnom - TspFR);
  parameter SI.ThermalConductance GlossFZ = QFZnom / (Tambnom - TspFZ);
  parameter SI.ThermalConductance GlossCond = (QFRnom + QFZnom) / (Tcondnom - Tambnom);
  parameter SI.ThermalConductance GlossCpr = (QFRnom + QFZnom) / etaC / (Tcprnom - Tambnom);
  parameter SI.HeatFlowRate QmaxFR = GlossFR * (Tambmax - TspFR);
  parameter SI.HeatFlowRate QmaxFZ = GlossFZ * (Tambmax - TspFZ);
equation
  connect(RFZ.CS, QoFZ.pwr) annotation(
  Line(points = {{54, 44}, {62, 44}, {62, 74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(spTFZ.y, RFZ.SP) annotation(
  Line(points = {{21, 44}, {22, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(spTFR.y, RFR.SP) annotation(
  Line(points = {{21, -44}, {22, -44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lossFZ.port_a, portAmbient) annotation(
  Line(points = {{-120, 56}, {-140, 56}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossFR.port_a, portAmbient) annotation(
  Line(points = {{-120, -56}, {-140, -56}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossCond.port_b, portAmbient) annotation(
  Line(points = {{-120, 20}, {-140, 20}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossCpr.port_b, portAmbient) annotation(
  Line(points = {{-120, -20}, {-140, -20}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(CprEff.y, pc.Q_flow) annotation(
  Line(points = {{120, 19.2}, {120, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RFZ.CS, CprEff.u) annotation(
  Line(points = {{54, 44}, {120, 44}, {120, 37.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TFZ.T, fTFZ.u) annotation(
  Line(points = {{-42, 56}, {-32, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fTFZ.y, RFZ.PV) annotation(
  Line(points = {{-9, 56}, {8.5, 56}, {8.5, 50}, {22, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TFR.T, fTFR.u) annotation(
  Line(points = {{-40, -56}, {-28, -56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fTFR.y, RFR.PV) annotation(
  Line(points = {{-5, -56}, {10.5, -56}, {10.5, -50}, {22, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RFR.CS, convSca2ScaGin.gamma) annotation(
  Line(points = {{54, -44}, {58, -44}, {58, -83.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heatCapacitor.port, lossFZ.port_b) annotation(
  Line(points = {{-80, 102}, {-80, 56}, {-100, 56}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(TFZ.port, lossFZ.port_b) annotation(
  Line(points = {{-62, 56}, {-100, 56}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossCond.port_a, heatCapacitor2.port) annotation(
  Line(points = {{-100, 20}, {84, 20}, {84, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(pc.port, heatCapacitor3.port) annotation(
  Line(points = {{120, -14}, {120, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(portHeatRecCompressor, heatCapacitor3.port) annotation(
  Line(points = {{180, -80}, {120, -80}, {120, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(portHeatRecCondenser, heatCapacitor2.port) annotation(
  Line(points = {{180, -50}, {84, -50}, {84, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(lossCpr.port_a, heatCapacitor3.port) annotation(
  Line(points = {{-100, -20}, {120, -20}, {120, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossFR.port_b, TFR.port) annotation(
  Line(points = {{-100, -56}, {-60, -56}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(heatCapacitor1.port, TFR.port) annotation(
  Line(points = {{-80, -102}, {-80, -56}, {-60, -56}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(QoFZ.heatSrc, lossFZ.port_b) annotation(
  Line(points = {{54, 80}, {-14, 80}, {-14, 78}, {-80, 78}, {-80, 56}, {-100, 56}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(QoFZ.heatSnk, heatCapacitor2.port) annotation(
  Line(points = {{70, 79.9}, {78, 79.9}, {78, 80}, {84, 80}, {84, -102}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convSca2ScaGin.ss2, lossFZ.port_b) annotation(
  Line(points = {{72.4, -90}, {72.4, 2}, {-82, 2}, {-82, 56}, {-100, 56}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convSca2ScaGin.ss1, TFR.port) annotation(
  Line(points = {{43.6, -90}, {-80, -90}, {-80, -56}, {-60, -56}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -150}, {200, 150}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -150}, {200, 150}}), graphics = {Rectangle(extent = {{-120, 140}, {60, 0}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-120, 0}, {60, -120}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-114, 134}, {54, 6}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-114, -6}, {54, -114}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-116, -120}, {56, -140}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-110, 74}, {-106, 14}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-110, -10}, {-106, -70}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-114, 18}, {58, -136}}, lineColor = {0, 0, 0}, textString = "FSC
1circ+damper"), Rectangle(extent = {{60, 120}, {68, -20}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, 140}, {78, -40}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Ellipse(extent = {{60, -80}, {100, -120}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid)}));
end CompactRefrigerator_FSC_1Cdamper;
