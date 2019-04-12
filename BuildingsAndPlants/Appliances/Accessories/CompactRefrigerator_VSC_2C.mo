within BuildingsAndPlants.Appliances.Accessories;
model CompactRefrigerator_VSC_2C "Compact refrigerator with variable speed compressor (PI), 2 independent circuits"
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
  parameter Real etaC = 0.8 "Compressor efficiency";
  parameter Real KFR = 1 "fridge PI gain";
  parameter SI.Time TiFR = 50 "fridge PI integral time";
  parameter Real KFZ = 1 "freezer PI gain";
  parameter SI.Time TiFZ = 50 "freezer PI integral time";
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
  Placement(transformation(extent = {{56, 90}, {76, 70}})));
  Components.BaseComponents.Thermal.HeatTransfer.PrescribedHeatFlowThrough QoFR annotation(
  Placement(transformation(extent = {{56, -88}, {76, -68}})));
  Controllers.Blocks.Analogue.AWPI_1dof RFZ(Ti = TiFZ, CSmin = 0, CSmax = QmaxFZ, K = -KFZ) annotation(
  Placement(transformation(extent = {{22, 60}, {62, 40}})));
  Controllers.Blocks.Analogue.AWPI_1dof RFR(Ti = TiFR, CSmax = QmaxFR, CSmin = 0, K = -KFR) annotation(
  Placement(transformation(extent = {{22, -60}, {62, -40}})));
  Modelica.Blocks.Sources.RealExpression spTFZ(y = TspFZ) annotation(
  Placement(transformation(extent = {{0, 34}, {20, 54}})));
  Modelica.Blocks.Sources.RealExpression spTFR(y = TspFR) annotation(
  Placement(transformation(extent = {{0, -34}, {20, -54}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossCond(G = GlossCond) "condenser to ambient conductance" annotation(
  Placement(transformation(extent = {{-100, 10}, {-120, 30}})));
  Interfaces.Thermal.HeatPort portAmbient annotation(
  Placement(transformation(extent = {{-200, -20}, {-160, 20}}), iconTransformation(extent = {{-160, -80}, {-120, 80}})));
  Modelica.Blocks.Math.Add add annotation(
  Placement(transformation(extent = {{92, 34}, {112, 54}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor lossCpr(G = GlossCpr) "compressor to ambient conductance" annotation(
  Placement(transformation(extent = {{-100, -30}, {-120, -10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pc annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {120, -4})));
  Modelica.Blocks.Math.Gain CprEff(k = 1 / etaC - 1) annotation(
  Placement(transformation(extent = {{-8, 8}, {8, -8}}, rotation = 270, origin = {120, 22})));
  Interfaces.Thermal.HeatPort portHeatRecCompressor annotation(
  Placement(transformation(extent = {{160, -90}, {200, -70}}), iconTransformation(extent = {{100, -120}, {140, -78}})));
  Interfaces.Thermal.HeatPort portHeatRecCondenser annotation(
  Placement(transformation(extent = {{160, -60}, {200, -40}}), iconTransformation(extent = {{78, -20}, {120, 120}})));
  Modelica.Blocks.Continuous.FirstOrder fTFZ(T = TCsensTFZ, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = TspFZ) annotation(
  Placement(transformation(extent = {{-32, 46}, {-12, 66}})));
  Modelica.Blocks.Continuous.FirstOrder fTFR(initType = Modelica.Blocks.Types.Init.InitialOutput, T = TCsensTFR, y_start = TspFR) annotation(
  Placement(transformation(extent = {{-30, -66}, {-10, -46}})));
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
  Line(points = {{58, 44}, {66, 44}, {66, 74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RFR.CS, QoFR.pwr) annotation(
  Line(points = {{58, -44}, {66, -44}, {66, -72}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(spTFZ.y, RFZ.SP) annotation(
  Line(points = {{21, 44}, {26, 44}, {26, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(spTFR.y, RFR.SP) annotation(
  Line(points = {{21, -44}, {24.5, -44}, {24.5, -44}, {26, -44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lossFZ.port_a, portAmbient) annotation(
  Line(points = {{-120, 56}, {-140, 56}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossFR.port_a, portAmbient) annotation(
  Line(points = {{-120, -56}, {-140, -56}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(RFZ.CS, add.u1) annotation(
  Line(points = {{58, 44}, {74, 44}, {74, 50}, {90, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RFR.CS, add.u2) annotation(
  Line(points = {{58, -44}, {66, -44}, {66, 38}, {90, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lossCond.port_b, portAmbient) annotation(
  Line(points = {{-120, 20}, {-140, 20}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossCpr.port_b, portAmbient) annotation(
  Line(points = {{-120, -20}, {-140, -20}, {-140, 0}, {-180, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(add.y, CprEff.u) annotation(
  Line(points = {{113, 44}, {120, 44}, {120, 31.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(CprEff.y, pc.Q_flow) annotation(
  Line(points = {{120, 13.2}, {120, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fTFZ.y, RFZ.PV) annotation(
  Line(points = {{-11, 56}, {8.5, 56}, {8.5, 50}, {26, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fTFR.y, RFR.PV) annotation(
  Line(points = {{-9, -56}, {10.5, -56}, {10.5, -50}, {26, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TFR.T, fTFR.u) annotation(
  Line(points = {{-40, -56}, {-32, -56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(TFZ.T, fTFZ.u) annotation(
  Line(points = {{-42, 56}, {-34, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lossFZ.port_b, heatCapacitor.port) annotation(
  Line(points = {{-100, 56}, {-80, 56}, {-80, 102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(TFZ.port, heatCapacitor.port) annotation(
  Line(points = {{-62, 56}, {-80, 56}, {-80, 102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(QoFZ.heatSnk, heatCapacitor2.port) annotation(
  Line(points = {{74, 79.9}, {84, 79.9}, {84, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(QoFZ.heatSrc, heatCapacitor.port) annotation(
  Line(points = {{58, 80}, {-80, 80}, {-80, 102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(lossFR.port_b, heatCapacitor1.port) annotation(
  Line(points = {{-100, -56}, {-80, -56}, {-80, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(TFR.port, heatCapacitor1.port) annotation(
  Line(points = {{-60, -56}, {-80, -56}, {-80, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(QoFR.heatSrc, heatCapacitor1.port) annotation(
  Line(points = {{58, -78}, {-80, -78}, {-80, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(QoFR.heatSnk, heatCapacitor2.port) annotation(
  Line(points = {{74, -77.9}, {78, -77.9}, {78, -78}, {84, -78}, {84, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pc.port, heatCapacitor3.port) annotation(
  Line(points = {{120, -14}, {120, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(portHeatRecCompressor, heatCapacitor3.port) annotation(
  Line(points = {{180, -80}, {120, -80}, {120, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(portHeatRecCondenser, heatCapacitor2.port) annotation(
  Line(points = {{180, -50}, {84, -50}, {84, -102}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(lossCpr.port_a, heatCapacitor3.port) annotation(
  Line(points = {{-100, -20}, {120, -20}, {120, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(lossCond.port_a, heatCapacitor2.port) annotation(
  Line(points = {{-100, 20}, {84, 20}, {84, -102}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -150}, {200, 150}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -150}, {200, 150}}), graphics = {Rectangle(extent = {{-120, 140}, {60, 0}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-120, 0}, {60, -120}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-114, 134}, {54, 6}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-114, -6}, {54, -114}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-116, -120}, {56, -140}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-110, 74}, {-106, 14}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-110, -10}, {-106, -70}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-112, 4}, {58, -130}}, lineColor = {0, 0, 0}, textString = "VSC
2circ"), Rectangle(extent = {{60, 120}, {68, -20}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, 140}, {78, -40}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Ellipse(extent = {{60, -80}, {100, -120}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid)}));
end CompactRefrigerator_VSC_2C;

