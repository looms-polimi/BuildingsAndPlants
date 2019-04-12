within BuildingsAndPlants;

package ABC
  model TableTest
    Modelica.Blocks.Sources.CombiTimeTable table(tableOnFile = true, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/testFile.txt", tableName = "pippo", smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, columns = 2:3);
    parameter String fileName = "Resources/DOEData/" "File where the matrix is stored";
    annotation(
      experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1));
  end TableTest;

  model OneRoom_ExtData
    Real pippo = Room.air.phi * 100;
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.005) annotation(
      Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {30, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600) annotation(
      Placement(visible = true, transformation(origin = {-94, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {-10, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12) annotation(
      Placement(visible = true, transformation(origin = {54, 52}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15) annotation(
      Placement(visible = true, transformation(origin = {22, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), s = 0.005) annotation(
      Placement(visible = true, transformation(origin = {38, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {72, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {8, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
      Placement(visible = true, transformation(origin = {110, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
      Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {150, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {150, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Weather(columns = 2:4, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_weather.txt", tableName = "data", tableOnFile = true) annotation(
      Placement(visible = true, transformation(origin = {-186, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Text annotation(
      Placement(visible = true, transformation(origin = {92, 52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable InternalData(columns = 2:5, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_InternalData.txt", tableName = "data", tableOnFile = true) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression patm(y = 101325) annotation(
      Placement(visible = true, transformation(origin = {-136, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.ABC.AirSource_pTphi_prescribed airSrc annotation(
      Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LowpassButterworth LPF_RHext(f = 1 / 3600, initType = Modelica.Blocks.Types.Init.InitialOutput, n = 4, y_start = 50) annotation(
      Placement(visible = true, transformation(origin = {-130, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.HVAC.AirHandling.ControlledHandler_Tphi_AlgQbal AHU(TC = 60) annotation(
      Placement(visible = true, transformation(origin = {-38, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression sp_T(y = 273.15 + 24) annotation(
      Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression sp_phi(y = 0.6) annotation(
      Placement(visible = true, transformation(origin = {-66, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression ahuON(y = true) annotation(
      Placement(visible = true, transformation(origin = {-76, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fan.air_flange2, AHU.air_flange1) annotation(
      Line(points = {{-62, -60}, {-46, -60}}, color = {0, 100, 150}));
    connect(AHU.air_flange2, Room.air_flange1) annotation(
      Line(points = {{-30, -60}, {-18, -60}}, color = {0, 100, 150}));
    connect(AHU.Tsp, sp_T.y) annotation(
      Line(points = {{-46, -56}, {-58, -56}, {-58, -80}, {-79, -80}}, color = {0, 0, 127}));
    connect(sp_phi.y, AHU.phisp) annotation(
      Line(points = {{-54, -90}, {-50, -90}, {-50, -64}, {-46, -64}}, color = {0, 0, 127}));
    connect(ahuON.y, AHU.ON) annotation(
      Line(points = {{-64, -14}, {-54, -14}, {-54, -52}, {-46, -52}}, color = {255, 0, 255}));
    connect(LPF_RHext.y, airSrc.iphi) annotation(
      Line(points = {{-118, 24}, {-104, 24}, {-104, -4}, {-172, -4}, {-172, -68}, {-108, -68}}, color = {0, 0, 127}));
    connect(Weather.y[1], airSrc.iT) annotation(
      Line(points = {{-174, 70}, {-160, 70}, {-160, -60}, {-108, -60}}, color = {0, 0, 127}, thickness = 0.5));
    connect(patm.y, airSrc.iP) annotation(
      Line(points = {{-125, -32}, {-121, -32}, {-121, -52}, {-108, -52}}, color = {0, 0, 127}));
    connect(airSrc.air_flange, fan.air_flange1) annotation(
      Line(points = {{-91, -60}, {-78, -60}}, color = {0, 100, 150}));
    connect(Room.air_flange2, airSink.air_flange) annotation(
      Line(points = {{-2, -60}, {21, -60}}, color = {0, 100, 150}));
    connect(qa.y, fan.iq) annotation(
      Line(points = {{-83, -32}, {-69, -32}, {-69, -56}, {-70, -56}}, color = {0, 0, 127}));
    connect(Room.heatPort, room2wall.ss1) annotation(
      Line(points = {{-10, -51}, {-10, -14}}, color = {255, 0, 0}));
    connect(room2window.ss1, Room.heatPort) annotation(
      Line(points = {{2, -38}, {-10, -38}, {-10, -51}}, color = {255, 0, 0}));
    connect(room2window.ss2, window.airSide1) annotation(
      Line(points = {{14, -38}, {29, -38}}, color = {255, 0, 0}));
    connect(window.airSide2, window2ext.ss1) annotation(
      Line(points = {{47, -38}, {66, -38}}, color = {255, 0, 0}));
    connect(Text.port, window2ext.ss2) annotation(
      Line(points = {{82, 52}, {78, 52}, {78, -38}}, color = {191, 0, 0}));
    connect(rad2window.port, window.airSide2) annotation(
      Line(points = {{100, -18}, {56, -18}, {56, -38}, {47, -38}}, color = {191, 0, 0}));
    connect(room2wall.ss2, wall.side1) annotation(
      Line(points = {{-10, -2}, {-10, 52}, {12, 52}}, color = {255, 0, 0}));
    connect(Weather.y[1], Text.T) annotation(
      Line(points = {{-175, 70}, {120, 70}, {120, 52}, {104, 52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Text.port, wall2ext.ss2) annotation(
      Line(points = {{82, 52}, {60, 52}}, color = {191, 0, 0}));
    connect(Weather.y[3], radFracWall.u) annotation(
      Line(points = {{-174, 70}, {180, 70}, {180, 20}, {162, 20}, {162, 20}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Weather.y[2], LPF_RHext.u) annotation(
      Line(points = {{-174, 70}, {-160, 70}, {-160, 24}, {-142, 24}, {-142, 24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(rad2window.Q_flow, radFracWindow.y) annotation(
      Line(points = {{120, -18}, {139, -18}}, color = {0, 0, 127}));
    connect(radFracWall.u, radFracWindow.u) annotation(
      Line(points = {{162, 20}, {180, 20}, {180, -18}, {162, -18}, {162, -18}, {162, -18}, {162, -18}}, color = {0, 0, 127}));
    connect(rad2wall.Q_flow, radFracWall.y) annotation(
      Line(points = {{120, 20}, {130, 20}, {130, 20}, {140, 20}, {140, 20}, {139, 20}, {139, 20}, {138, 20}}, color = {0, 0, 127}));
    connect(rad2wall.port, wall.side2) annotation(
      Line(points = {{100, 20}, {84.5, 20}, {84.5, 20}, {69, 20}, {69, 20}, {38, 20}, {38, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}}, color = {191, 0, 0}));
    connect(wall.side2, wall2ext.ss1) annotation(
      Line(points = {{30, 52}, {48, 52}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5449));
  end OneRoom_ExtData;

  model AirSource_pTphi_prescribed
    Media.Substances.MoistAir air;
    Interfaces.Air.MoistAirFlange_waxa air_flange annotation(
      Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{70, -20}, {110, 20}})));
    Modelica.Blocks.Interfaces.RealInput iP annotation(
      Placement(visible = true, transformation(origin = {-84, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput iT annotation(
      Placement(visible = true, transformation(origin = {-80, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput iphi annotation(
      Placement(visible = true, transformation(origin = {-70, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
    air_flange.pa = iP;
    air.p = air_flange.pa;
    air.T = iT;
    air.phi = iphi / 100;
// FIXME RH 0-100 as from DEIB files, REVISE
// enthalpy boundary condition
    air.h = air_flange.ha;
    air.X = air_flange.xa;
    annotation(
      Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30, 30}, {70, -30}}), Polygon(fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}), Ellipse(fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-22, 20}, {18, -20}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
      experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5205));
  end AirSource_pTphi_prescribed;

  model OneRoom_ExtData_noAHU
    Real pippo = Room.air.phi * 100;
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.0085) annotation(
      Placement(visible = true, transformation(origin = {-12, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-72, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {28, -32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600) annotation(
      Placement(visible = true, transformation(origin = {-96, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {-12, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12) annotation(
      Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15) annotation(
      Placement(visible = true, transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), s = 0.005) annotation(
      Placement(visible = true, transformation(origin = {36, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {6, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
      Placement(visible = true, transformation(origin = {108, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
      Placement(visible = true, transformation(origin = {108, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {148, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {148, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Weather(columns = 2:4, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_weather.txt", tableName = "data", tableOnFile = true) annotation(
      Placement(visible = true, transformation(origin = {-188, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Text annotation(
      Placement(visible = true, transformation(origin = {90, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable InternalData(columns = 2:5, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_InternalData.txt", tableName = "data", tableOnFile = true) annotation(
      Placement(visible = true, transformation(origin = {128, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression patm(y = 101325) annotation(
      Placement(visible = true, transformation(origin = {-138, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.ABC.AirSource_pTphi_prescribed airSrc annotation(
      Placement(visible = true, transformation(origin = {-102, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LowpassButterworth LPF_RHext(f = 1 / 3600, initType = Modelica.Blocks.Types.Init.InitialOutput, n = 4, y_start = 50) annotation(
      Placement(visible = true, transformation(origin = {-130, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.ABC.AirSource_pTphi_prescribed airSource_pTphi_prescribed1 annotation(
      Placement(visible = true, transformation(origin = {-104, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume airPrescribedFlowRate_Volume1 annotation(
      Placement(visible = true, transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 60) annotation(
      Placement(visible = true, transformation(origin = {-234, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 250 / 3600)  annotation(
      Placement(visible = true, transformation(origin = {-156, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = 273.15 + 22) annotation(
      Placement(visible = true, transformation(origin = {-232, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BuildingsAndPlants.ABC.sensor_Tphi sTphi annotation(
      Placement(visible = true, transformation(origin = {26, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(sTphi.T, PI_T.PV) annotation(
      Line(points = {{36, -64}, {48, -64}, {48, -92}, {-176, -92}, {-176, -72}, {-164, -72}, {-164, -72}}, color = {0, 0, 127}));
    connect(Room.air_flange2, sTphi.airSense) annotation(
      Line(points = {{-4, -32}, {6, -32}, {6, -68}, {16, -68}, {16, -68}}, color = {0, 100, 150}));
    connect(airPrescribedFlowRate_Volume1.air_flange2, Room.air_flange1) annotation(
      Line(points = {{-52, -64}, {-46, -64}, {-46, -64}, {-40, -64}, {-40, -32}, {-20, -32}, {-20, -32}}, color = {0, 100, 150}));
    connect(airSource_pTphi_prescribed1.air_flange, airPrescribedFlowRate_Volume1.air_flange1) annotation(
      Line(points = {{-95, -64}, {-69, -64}, {-69, -64}, {-69, -64}}, color = {0, 100, 150}));
    connect(patm.y, airSource_pTphi_prescribed1.iP) annotation(
      Line(points = {{-127, -4}, {-125, -4}, {-125, -56}, {-113, -56}, {-113, -55}, {-113, -55}, {-113, -56}}, color = {0, 0, 127}));
    connect(Weather.y[2], LPF_RHext.u) annotation(
      Line(points = {{-177, 98}, {-161, 98}, {-161, 72}, {-143, 72}}, color = {0, 0, 127}, thickness = 0.5));
    connect(LPF_RHext.y, airSrc.iphi) annotation(
      Line(points = {{-119, 72}, {-112, 72}, {-112, 72}, {-105, 72}, {-105, 24}, {-173, 24}, {-173, -40}, {-111, -40}}, color = {0, 0, 127}));
    connect(airSrc.air_flange, fan.air_flange1) annotation(
      Line(points = {{-93, -32}, {-80, -32}}, color = {0, 100, 150}));
    connect(patm.y, airSrc.iP) annotation(
      Line(points = {{-127, -4}, {-126, -4}, {-126, -4}, {-125, -4}, {-125, -4}, {-123, -4}, {-123, -24}, {-116.5, -24}, {-116.5, -24}, {-110, -24}}, color = {0, 0, 127}));
    connect(Weather.y[1], airSrc.iT) annotation(
      Line(points = {{-177, 98}, {-170, 98}, {-170, 98}, {-161, 98}, {-161, -32}, {-111, -32}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Text.port, wall2ext.ss2) annotation(
      Line(points = {{80, 80}, {58, 80}}, color = {191, 0, 0}));
    connect(Weather.y[1], Text.T) annotation(
      Line(points = {{-177, 98}, {118, 98}, {118, 80}, {110, 80}, {110, 80}, {102, 80}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Text.port, window2ext.ss2) annotation(
      Line(points = {{80, 80}, {76, 80}, {76, -10}}, color = {191, 0, 0}));
    connect(Weather.y[3], radFracWall.u) annotation(
      Line(points = {{-177, 98}, {179, 98}, {179, 48}, {161, 48}, {161, 49}, {159, 49}, {159, 48}}, color = {0, 0, 127}, thickness = 0.5));
    connect(radFracWall.u, radFracWindow.u) annotation(
      Line(points = {{160, 48}, {169, 48}, {169, 48}, {178, 48}, {178, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}}, color = {0, 0, 127}));
    connect(rad2window.Q_flow, radFracWindow.y) annotation(
      Line(points = {{118, 10}, {137, 10}}, color = {0, 0, 127}));
    connect(rad2wall.Q_flow, radFracWall.y) annotation(
      Line(points = {{118, 48}, {123, 48}, {123, 48}, {128, 48}, {128, 48}, {138, 48}, {138, 48}, {137, 48}, {137, 48}, {136.5, 48}, {136.5, 48}, {136, 48}}, color = {0, 0, 127}));
    connect(rad2wall.port, wall.side2) annotation(
      Line(points = {{98, 48}, {94.125, 48}, {94.125, 48}, {90.25, 48}, {90.25, 48}, {82.5, 48}, {82.5, 48}, {67, 48}, {67, 48}, {36, 48}, {36, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}}, color = {191, 0, 0}));
    connect(rad2window.port, window.airSide2) annotation(
      Line(points = {{98, 10}, {76, 10}, {76, 10}, {54, 10}, {54, -10}, {49.5, -10}, {49.5, -10}, {47.25, -10}, {47.25, -10}, {45, -10}}, color = {191, 0, 0}));
    connect(room2window.ss2, window.airSide1) annotation(
      Line(points = {{12, -10}, {27, -10}}, color = {255, 0, 0}));
    connect(room2window.ss1, Room.heatPort) annotation(
      Line(points = {{0, -10}, {-12, -10}, {-12, -23}}, color = {255, 0, 0}));
    connect(window.airSide2, window2ext.ss1) annotation(
      Line(points = {{45, -10}, {64, -10}}, color = {255, 0, 0}));
    connect(wall.side2, wall2ext.ss1) annotation(
      Line(points = {{28, 80}, {46, 80}}, color = {255, 0, 0}));
    connect(room2wall.ss2, wall.side1) annotation(
      Line(points = {{-12, 26}, {-12, 80}, {-1, 80}, {-1, 80}, {10, 80}}, color = {255, 0, 0}));
    connect(Room.heatPort, room2wall.ss1) annotation(
      Line(points = {{-12, -23}, {-12, 14}}, color = {255, 0, 0}));
    connect(qa.y, fan.iq) annotation(
      Line(points = {{-85, -4}, {-78, -4}, {-78, -4}, {-71, -4}, {-71, -28}, {-71.5, -28}, {-71.5, -28}, {-72, -28}}, color = {0, 0, 127}));
    connect(Room.air_flange2, airSink.air_flange) annotation(
      Line(points = {{-4, -32}, {19, -32}}, color = {0, 100, 150}));
    connect(fan.air_flange2, Room.air_flange1) annotation(
      Line(points = {{-64, -32}, {-20, -32}, {-20, -32}, {-20, -32}, {-20, -32}, {-20, -32}}, color = {0, 100, 150}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5327));
  end OneRoom_ExtData_noAHU;









  model OneRoom_ExtData_forDeliverable
    Real pippo = Room.air.phi * 100;
    BuildingsAndPlants.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.005) annotation(
      Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
      Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
      Placement(visible = true, transformation(origin = {30, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600) annotation(
      Placement(visible = true, transformation(origin = {-94, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {-10, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12) annotation(
      Placement(visible = true, transformation(origin = {54, 52}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15) annotation(
      Placement(visible = true, transformation(origin = {22, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = BuildingsAndPlants.Media.Materials.Glasses.Glass(), s = 0.005) annotation(
      Placement(visible = true, transformation(origin = {38, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {72, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
      Placement(visible = true, transformation(origin = {8, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
      Placement(visible = true, transformation(origin = {110, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
      Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {150, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9)) annotation(
      Placement(visible = true, transformation(origin = {150, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Weather(columns = 2:4, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_weather.txt", tableName = "data", tableOnFile = true, verboseRead = false) annotation(
      Placement(visible = true, transformation(origin = {-184, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Text annotation(
      Placement(visible = true, transformation(origin = {92, 52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable InternalData(columns = 2:5, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/TestDEIB_123_July2015_7days_InternalData.txt", tableName = "data", tableOnFile = true) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression patm(y = 101325) annotation(
      Placement(visible = true, transformation(origin = {-136, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.ABC.AirSource_pTphi_prescribed airSrc annotation(
      Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LowpassButterworth LPF_RHext(f = 1 / 3600, initType = Modelica.Blocks.Types.Init.InitialOutput, n = 4, y_start = 50) annotation(
      Placement(visible = true, transformation(origin = {-130, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingsAndPlants.Components.BaseComponents.HVAC.AirHandling.ControlledHandler_Tphi_AlgQbal AHU(TC = 60) annotation(
      Placement(visible = true, transformation(origin = {-38, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression sp_T(y = 273.15 + 24) annotation(
      Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression sp_phi(y = 0.6) annotation(
      Placement(visible = true, transformation(origin = {-66, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression ahuON(y = true) annotation(
      Placement(visible = true, transformation(origin = {-76, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Weather.y[2], LPF_RHext.u) annotation(
      Line(points = {{-173, 70}, {-160, 70}, {-160, 24}, {-142, 24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Weather.y[3], radFracWall.u) annotation(
      Line(points = {{-173, 70}, {180, 70}, {180, 20}, {162, 20}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Weather.y[1], Text.T) annotation(
      Line(points = {{-173, 70}, {120, 70}, {120, 52}, {104, 52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Weather.y[1], airSrc.iT) annotation(
      Line(points = {{-173, 70}, {-160, 70}, {-160, -60}, {-108, -60}}, color = {0, 0, 127}, thickness = 0.5));
    connect(fan.air_flange2, AHU.air_flange1) annotation(
      Line(points = {{-62, -60}, {-46, -60}}, color = {0, 100, 150}));
    connect(AHU.air_flange2, Room.air_flange1) annotation(
      Line(points = {{-30, -60}, {-18, -60}}, color = {0, 100, 150}));
    connect(AHU.Tsp, sp_T.y) annotation(
      Line(points = {{-46, -56}, {-58, -56}, {-58, -80}, {-79, -80}}, color = {0, 0, 127}));
    connect(sp_phi.y, AHU.phisp) annotation(
      Line(points = {{-54, -90}, {-50, -90}, {-50, -64}, {-46, -64}}, color = {0, 0, 127}));
    connect(ahuON.y, AHU.ON) annotation(
      Line(points = {{-64, -14}, {-54, -14}, {-54, -52}, {-46, -52}}, color = {255, 0, 255}));
    connect(LPF_RHext.y, airSrc.iphi) annotation(
      Line(points = {{-118, 24}, {-104, 24}, {-104, -4}, {-172, -4}, {-172, -68}, {-108, -68}}, color = {0, 0, 127}));
    connect(patm.y, airSrc.iP) annotation(
      Line(points = {{-125, -32}, {-121, -32}, {-121, -52}, {-108, -52}}, color = {0, 0, 127}));
    connect(airSrc.air_flange, fan.air_flange1) annotation(
      Line(points = {{-91, -60}, {-78, -60}}, color = {0, 100, 150}));
    connect(Room.air_flange2, airSink.air_flange) annotation(
      Line(points = {{-2, -60}, {21, -60}}, color = {0, 100, 150}));
    connect(qa.y, fan.iq) annotation(
      Line(points = {{-83, -32}, {-69, -32}, {-69, -56}, {-70, -56}}, color = {0, 0, 127}));
    connect(Room.heatPort, room2wall.ss1) annotation(
      Line(points = {{-10, -51}, {-10, -14}}, color = {255, 0, 0}));
    connect(room2window.ss1, Room.heatPort) annotation(
      Line(points = {{2, -38}, {-10, -38}, {-10, -51}}, color = {255, 0, 0}));
    connect(room2window.ss2, window.airSide1) annotation(
      Line(points = {{14, -38}, {29, -38}}, color = {255, 0, 0}));
    connect(window.airSide2, window2ext.ss1) annotation(
      Line(points = {{47, -38}, {66, -38}}, color = {255, 0, 0}));
    connect(Text.port, window2ext.ss2) annotation(
      Line(points = {{82, 52}, {78, 52}, {78, -38}}, color = {191, 0, 0}));
    connect(rad2window.port, window.airSide2) annotation(
      Line(points = {{100, -18}, {56, -18}, {56, -38}, {47, -38}}, color = {191, 0, 0}));
    connect(room2wall.ss2, wall.side1) annotation(
      Line(points = {{-10, -2}, {-10, 52}, {12, 52}}, color = {255, 0, 0}));
    connect(Text.port, wall2ext.ss2) annotation(
      Line(points = {{82, 52}, {60, 52}}, color = {191, 0, 0}));
    connect(rad2window.Q_flow, radFracWindow.y) annotation(
      Line(points = {{120, -18}, {139, -18}}, color = {0, 0, 127}));
    connect(radFracWall.u, radFracWindow.u) annotation(
      Line(points = {{162, 20}, {180, 20}, {180, -18}, {162, -18}, {162, -18}, {162, -18}, {162, -18}}, color = {0, 0, 127}));
    connect(rad2wall.Q_flow, radFracWall.y) annotation(
      Line(points = {{120, 20}, {130, 20}, {130, 20}, {140, 20}, {140, 20}, {139, 20}, {139, 20}, {138, 20}}, color = {0, 0, 127}));
    connect(rad2wall.port, wall.side2) annotation(
      Line(points = {{100, 20}, {84.5, 20}, {84.5, 20}, {69, 20}, {69, 20}, {38, 20}, {38, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}}, color = {191, 0, 0}));
    connect(wall.side2, wall2ext.ss1) annotation(
      Line(points = {{30, 52}, {48, 52}}, color = {255, 0, 0}));
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Text(origin = {-84, 93}, extent = {{-56, 7}, {56, -7}}, textString = "For deliverable")}),
      experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5449));
  end OneRoom_ExtData_forDeliverable;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(origin = {0, 1}, lineColor = {0, 85, 0}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Sphere, extent = {{-100, 99}, {100, -101}}), Text(origin = {-33, 25}, fillColor = {255, 255, 255}, extent = {{-65, 75}, {133, -127}}, textString = "ABC")}, coordinateSystem(initialScale = 0.1)));
end ABC;