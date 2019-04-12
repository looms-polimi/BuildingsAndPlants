within BuildingsAndPlants.CaseStudies;

package LabForSeminars


  model Example_002
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {-20, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {60, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100)  annotation(
      Placement(visible = true, transformation(origin = {-140, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {-80, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource annotation(
      Placement(visible = true, transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{-64, 0}, {-30, 0}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{-10, 0}, {44, 0}}, color = {255, 0, 0}));
    connect(airSource.air_flange, air.air_flange2) annotation(
      Line(points = {{-161, -30}, {-140, -30}, {-140, -16}}, color = {0, 100, 150}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-122, 0}, {-100, 0}, {-100, 0}, {-96, 0}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_002;



  model Example_003
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {80, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {160, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
      Placement(visible = true, transformation(origin = {-40, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {20, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15)  annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600)  annotation(
      Placement(visible = true, transformation(origin = {-92, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(qa.y, fan.iq) annotation(
      Line(points = {{-80, -30}, {-58, -30}, {-58, -46}, {-58, -46}}, color = {0, 0, 127}));
    connect(fan.air_flange2, air.air_flange2) annotation(
      Line(points = {{-50, -50}, {-40, -50}, {-40, -16}, {-40, -16}}, color = {0, 100, 150}));
    connect(airSource.air_flange, fan.air_flange1) annotation(
      Line(points = {{-80, -50}, {-66, -50}}, color = {0, 100, 150}));
    connect(airSink.air_flange, air.air_flange1) annotation(
      Line(points = {{-60, 30}, {-40, 30}, {-40, 16}, {-40, 16}}, color = {0, 100, 150}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-22, 0}, {-10, 0}, {-10, 0}, {2, 0}, {2, 0}, {3, 0}, {3, 0}, {4, 0}}, color = {255, 0, 0}));
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{36, 1.42109e-14}, {70, 1.42109e-14}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{90, -4.44089e-16}, {144, -4.44089e-16}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_003;



  model Example_004
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {80, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {140, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
      Placement(visible = true, transformation(origin = {-40, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {20, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
      Placement(visible = true, transformation(origin = {-156, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 300 / 3600, CSmin = 0, K = 10, Ti = 100)  annotation(
      Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(sT.T, PI_T.PV) annotation(
      Line(points = {{-120, -70}, {-130, -70}, {-130, -30}, {-118, -30}, {-118, -30}}, color = {0, 0, 127}));
    connect(air.heatPort, sT.port) annotation(
      Line(points = {{-22, 0}, {-22, 0}, {-22, -70}, {-100, -70}, {-100, -70}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{90, -4.44089e-16}, {117, -4.44089e-16}, {117, 0}, {124, 0}}, color = {255, 0, 0}));
    connect(PI_T.CS, fan.iq) annotation(
      Line(points = {{-102, -24}, {-58, -24}, {-58, -46}, {-58, -46}}, color = {0, 0, 127}));
    connect(spT.y, PI_T.SP) annotation(
      Line(points = {{-145, -24}, {-119, -24}}, color = {0, 0, 127}));
    connect(fan.air_flange2, air.air_flange2) annotation(
      Line(points = {{-50, -50}, {-40, -50}, {-40, -16}, {-40, -16}}, color = {0, 100, 150}));
    connect(airSource.air_flange, fan.air_flange1) annotation(
      Line(points = {{-80, -50}, {-66, -50}}, color = {0, 100, 150}));
    connect(airSink.air_flange, air.air_flange1) annotation(
      Line(points = {{-60, 30}, {-40, 30}, {-40, 16}, {-40, 16}}, color = {0, 100, 150}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-22, 0}, {-10, 0}, {-10, 0}, {2, 0}, {2, 0}, {3, 0}, {3, 0}, {4, 0}}, color = {255, 0, 0}));
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{36, 1.42109e-14}, {70, 1.42109e-14}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_004;



  model Example_005
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
      Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
      Placement(visible = true, transformation(origin = {-148, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
      Placement(visible = true, transformation(origin = {-136, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 1, CSmin = 0, K = 10, Ti = 100) annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
      Placement(visible = true, transformation(origin = {-90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pQ annotation(
      Placement(visible = true, transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iQ(y = if ambient_settings.hod > 8 and ambient_settings.hod < 17 then 50 else 0)  annotation(
      Placement(visible = true, transformation(origin = {-74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.AggregateComponents.Heating.FanCoil fanCoil1 annotation(
      Placement(visible = true, transformation(origin = {-108, -8}, extent = {{-10, -10}, {20, 10}}, rotation = 0)));
  Components.BaseComponents.Water.Sources.WaterSource_WT_fixed wsrc(W0 = 1)  annotation(
      Placement(visible = true, transformation(origin = {-176, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.BaseComponents.Water.Sinks.WaterSink_P_fixed wsnk annotation(
      Placement(visible = true, transformation(origin = {-166, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fanCoil1.air_flange1, air.air_flange2) annotation(
      Line(points = {{-100, -16}, {-100, -16}, {-100, -26}, {-54, -26}, {-54, -52}, {-20, -52}, {-20, -36}, {-20, -36}}, color = {0, 100, 150}));
    connect(fanCoil1.icmd01, PI_T.CS) annotation(
      Line(points = {{-90, -8}, {-64, -8}, {-64, -44}, {-82, -44}, {-82, -44}}, color = {0, 0, 127}));
    connect(wsnk.water_flange, fanCoil1.water_flange2) annotation(
      Line(points = {{-158, -20}, {-136, -20}, {-136, -14}, {-116, -14}, {-116, -14}}));
    connect(wsrc.water_flange, fanCoil1.water_flange1) annotation(
      Line(points = {{-168, -4}, {-116, -4}, {-116, -2}, {-116, -2}}));
    connect(airSource.air_flange, fanCoil1.air_flange2) annotation(
      Line(points = {{-138, 14}, {-100, 14}, {-100, 0}, {-100, 0}}, color = {0, 100, 150}));
    connect(iQ.y, pQ.Q_flow) annotation(
      Line(points = {{-62, 38}, {-36, 38}, {-36, 38}, {-34, 38}}, color = {0, 0, 127}));
    connect(pQ.port, air.heatPort) annotation(
      Line(points = {{-14, 38}, {-2, 38}, {-2, -20}, {-2, -20}}, color = {191, 0, 0}));
    connect(air.heatPort, sT.port) annotation(
      Line(points = {{-2, -20}, {-1, -20}, {-1, -20}, {-2, -20}, {-2, -90}, {-80, -90}, {-80, -90}, {-80, -90}, {-80, -90}}, color = {255, 0, 0}));
    connect(sT.T, PI_T.PV) annotation(
      Line(points = {{-100, -90}, {-104, -90}, {-104, -90}, {-110, -90}, {-110, -50}, {-98, -50}, {-98, -50}, {-98, -50}, {-98, -50}}, color = {0, 0, 127}));
    connect(spT.y, PI_T.SP) annotation(
      Line(points = {{-125, -44}, {-99, -44}}, color = {0, 0, 127}));
    connect(airSink.air_flange, air.air_flange1) annotation(
      Line(points = {{-41, 10}, {-21, 10}, {-21, -4}, {-20, -4}, {-20, -4}, {-21, -4}}, color = {0, 100, 150}));
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{56, -20}, {90, -20}}, color = {255, 0, 0}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-2, -20}, {5, -20}, {5, -20}, {10, -20}, {10, -20}, {22, -20}, {22, -20}, {23, -20}, {23, -20}, {22.5, -20}, {22.5, -20}, {24, -20}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{110, -20}, {122.5, -20}, {122.5, -20}, {137, -20}, {137, -20}, {141.5, -20}, {141.5, -20}, {144, -20}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_005;



  model Example_006
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
      Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
      Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-38, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
      Placement(visible = true, transformation(origin = {-136, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 300 / 3600, CSmin = 0, K = 10, Ti = 100) annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
      Placement(visible = true, transformation(origin = {-90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pQ annotation(
      Placement(visible = true, transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression iQ(y = if ambient_settings.hod > 8 and ambient_settings.hod < 17 then 50 else 0) annotation(
      Placement(visible = true, transformation(origin = {-74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(iQ.y, pQ.Q_flow) annotation(
      Line(points = {{-62, 38}, {-36, 38}, {-36, 38}, {-34, 38}}, color = {0, 0, 127}));
    connect(pQ.port, air.heatPort) annotation(
      Line(points = {{-14, 38}, {-2, 38}, {-2, -20}, {-2, -20}}, color = {191, 0, 0}));
    connect(air.heatPort, sT.port) annotation(
      Line(points = {{-2, -20}, {-1, -20}, {-1, -20}, {-2, -20}, {-2, -90}, {-80, -90}, {-80, -90}, {-80, -90}, {-80, -90}}, color = {255, 0, 0}));
    connect(sT.T, PI_T.PV) annotation(
      Line(points = {{-100, -90}, {-104, -90}, {-104, -90}, {-110, -90}, {-110, -50}, {-98, -50}, {-98, -50}, {-98, -50}, {-98, -50}}, color = {0, 0, 127}));
    connect(spT.y, PI_T.SP) annotation(
      Line(points = {{-125, -44}, {-99, -44}}, color = {0, 0, 127}));
    connect(PI_T.CS, fan.iq) annotation(
      Line(points = {{-82, -44}, {-38, -44}, {-38, -66}, {-38, -66}}, color = {0, 0, 127}));
    connect(airSink.air_flange, air.air_flange1) annotation(
      Line(points = {{-41, 10}, {-21, 10}, {-21, -4}, {-20, -4}, {-20, -4}, {-21, -4}}, color = {0, 100, 150}));
    connect(airSource.air_flange, fan.air_flange1) annotation(
      Line(points = {{-61, -70}, {-47, -70}}, color = {0, 100, 150}));
    connect(fan.air_flange2, air.air_flange2) annotation(
      Line(points = {{-30, -70}, {-20, -70}, {-20, -36}, {-20, -36}}, color = {0, 100, 150}));
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{56, -20}, {90, -20}}, color = {255, 0, 0}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-2, -20}, {5, -20}, {5, -20}, {10, -20}, {10, -20}, {22, -20}, {22, -20}, {23, -20}, {23, -20}, {22.5, -20}, {22.5, -20}, {24, -20}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{110, -20}, {122.5, -20}, {122.5, -20}, {137, -20}, {137, -20}, {141.5, -20}, {141.5, -20}, {144, -20}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_006;





  model Example_007
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
      Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
      Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
      Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
      Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
      Placement(visible = true, transformation(origin = {-148, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
      Placement(visible = true, transformation(origin = {-136, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 300 / 3600, CSmin = 0, K = 10, Ti = 100) annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
      Placement(visible = true, transformation(origin = {-90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pQ annotation(
      Placement(visible = true, transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression iQ(y = if ambient_settings.hod > 8 and ambient_settings.hod < 17 then 50 else 0) annotation(
      Placement(visible = true, transformation(origin = {-74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.AggregateComponents.Heating.FanCoil fanCoil1 annotation(
      Placement(visible = true, transformation(origin = {-108, -8}, extent = {{-10, -10}, {20, 10}}, rotation = 0)));
    Components.BaseComponents.Water.Sources.WaterSource_WT_fixed wsrc(W0 = 1) annotation(
      Placement(visible = true, transformation(origin = {-176, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.BaseComponents.Water.Sinks.WaterSink_P_fixed wsnk annotation(
      Placement(visible = true, transformation(origin = {-166, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression fan_rpm(y = 1) annotation(
      Placement(visible = true, transformation(origin = {-82, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-38, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(PI_T.CS, fan.iq) annotation(
      Line(points = {{-82, -44}, {-38, -44}, {-38, -66}, {-38, -66}}, color = {0, 0, 127}));
    connect(fan.air_flange2, air.air_flange2) annotation(
      Line(points = {{-30, -70}, {-20, -70}, {-20, -36}, {-20, -36}}, color = {0, 100, 150}));
    connect(fanCoil1.air_flange1, fan.air_flange1) annotation(
      Line(points = {{-100, -16}, {-98, -16}, {-98, -28}, {-72, -28}, {-72, -70}, {-46, -70}, {-46, -70}}, color = {0, 100, 150}));
    connect(fan_rpm.y, fanCoil1.icmd01) annotation(
      Line(points = {{-70, 16}, {-64, 16}, {-64, -8}, {-90, -8}, {-90, -8}}, color = {0, 0, 127}));
    connect(wsnk.water_flange, fanCoil1.water_flange2) annotation(
      Line(points = {{-158, -20}, {-136, -20}, {-136, -14}, {-116, -14}, {-116, -14}}));
    connect(wsrc.water_flange, fanCoil1.water_flange1) annotation(
      Line(points = {{-168, -4}, {-116, -4}, {-116, -2}, {-116, -2}}));
    connect(airSource.air_flange, fanCoil1.air_flange2) annotation(
      Line(points = {{-138, 14}, {-100, 14}, {-100, 0}, {-100, 0}}, color = {0, 100, 150}));
    connect(iQ.y, pQ.Q_flow) annotation(
      Line(points = {{-62, 38}, {-36, 38}, {-36, 38}, {-34, 38}}, color = {0, 0, 127}));
    connect(pQ.port, air.heatPort) annotation(
      Line(points = {{-14, 38}, {-2, 38}, {-2, -20}, {-2, -20}}, color = {191, 0, 0}));
    connect(air.heatPort, sT.port) annotation(
      Line(points = {{-2, -20}, {-1, -20}, {-1, -20}, {-2, -20}, {-2, -90}, {-80, -90}, {-80, -90}, {-80, -90}, {-80, -90}}, color = {255, 0, 0}));
    connect(sT.T, PI_T.PV) annotation(
      Line(points = {{-100, -90}, {-104, -90}, {-104, -90}, {-110, -90}, {-110, -50}, {-98, -50}, {-98, -50}, {-98, -50}, {-98, -50}}, color = {0, 0, 127}));
    connect(spT.y, PI_T.SP) annotation(
      Line(points = {{-125, -44}, {-99, -44}}, color = {0, 0, 127}));
    connect(airSink.air_flange, air.air_flange1) annotation(
      Line(points = {{-41, 10}, {-21, 10}, {-21, -4}, {-20, -4}, {-20, -4}, {-21, -4}}, color = {0, 100, 150}));
    connect(a2w.wall, MLwall.side1) annotation(
      Line(points = {{56, -20}, {90, -20}}, color = {255, 0, 0}));
    connect(air.heatPort, a2w.air) annotation(
      Line(points = {{-2, -20}, {5, -20}, {5, -20}, {10, -20}, {10, -20}, {22, -20}, {22, -20}, {23, -20}, {23, -20}, {22.5, -20}, {22.5, -20}, {24, -20}}, color = {255, 0, 0}));
    connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
      Line(points = {{110, -20}, {122.5, -20}, {122.5, -20}, {137, -20}, {137, -20}, {141.5, -20}, {141.5, -20}, {144, -20}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
  end Example_007;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end LabForSeminars;