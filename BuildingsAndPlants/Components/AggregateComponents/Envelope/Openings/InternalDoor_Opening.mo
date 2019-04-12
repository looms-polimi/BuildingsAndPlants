within BuildingsAndPlants.Components.AggregateComponents.Envelope.Openings;
model InternalDoor_Opening
  extends BaseClasses.BaseInternalDoor_Opening;
  Walls.InternalWall_NoOpenings_Homogeneous internalWall_NoOpenings_Homogeneous(L = L, H = H, s = s, vertical = vertical, ro = ro, cp = cp, lambda = lambda, n = n, Tstart = Tstart) annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}})));
  parameter SI.Length L = 1 "door width";
  parameter SI.Length H = 2 "door height";
  parameter SI.Length s = 0.04 "door thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 800 "door material density";
  parameter SI.SpecificHeatCapacity cp = 480 "door material cp";
  parameter SI.ThermalConductivity lambda = 0.8 "door material thermal cond";
  parameter Integer n = 4 "number of door layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  parameter SI.Pressure dpnom = 10000 "Nominal pressure drop";
  parameter SI.MassFlowRate wnom = 0.01 "Nominal total mass flowrate";
  parameter Real GvOverGa = 0.1 "Vapour/dry air conductance ratio";
  parameter SI.ThermalConductance Gdw0 = 200 "Diffusive thermal cond at w=0";
  parameter SI.ThermalConductance Gdwnom = 1 "Diffusive thermal cond at w=wnom";
  BaseComponents.Air.Pdrops.AirPdrop_Lin_NomPoint_mix_Gcmd01 mix(dpnom = dpnom, wnom = wnom, GvOverGa = GvOverGa, Gdw0 = Gdw0, Gdwnom = Gdwnom) annotation(
  Placement(transformation(extent = {{-20, 40}, {20, 80}})));
equation
  connect(opening01, mix.cmd01) annotation(
  Line(points = {{-80, 80}, {0, 80}, {0, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(internalWall_NoOpenings_Homogeneous.airSide1, diffuse) annotation (
    Line(points={{-18,0},{-90,0},{-90,-2}}, color={255,0,0}));
  connect(internalWall_NoOpenings_Homogeneous.airSide2, Bdiffuse) annotation (
  Line(points={{18,0},{90,0},{90,0}}, color={255,0,0}));
  connect(mix.Bdryair, Bdryair) annotation (
  Line(points={{17.6,66},{44,66},{44,
          68},{90,68},{90,26}}, color={0,100,150}));
  connect(mix.Bdiffuse, Bdiffuse) annotation (
  Line(points={{18,60.4},{36,60.4},
          {36,60},{58,60},{58,0},{90,0}}, color={255,0,0}));
  connect(mix.dryair, dryair) annotation (
  Line(points={{-19.2,65.6},{-94,65.6},
          {-94,24}}, color={0,100,150}));
  connect(mix.vapour, vapour) annotation (
  Line(points={{-18.8,54.4},{-40,54.4},
          {-40,-30},{-92,-30}}, color={0,100,150}));
  connect(mix.diffuse, diffuse) annotation (
  Line(points={{-18,60.4},{-36,60.4},
          {-36,60},{-90,60},{-90,-2}}, color={255,0,0}));
  connect(mix.Bvapour, Bvapour) annotation (
  
  Line(points={{18,54.4},{54,54.4},{
          54,-28},{90,-28}}, color={0,100,150}));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 100}, {-30, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, 60}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, 0}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {-36, -60}, rotation = 90), Rectangle(extent = {{30, 100}, {80, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, 60}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, 0}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {64, -60}, rotation = 90), Rectangle(extent = {{-30, -100}, {30, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 200, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag), Text(extent = {{-24, -60}, {-6, -102}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "1"), Text(extent = {{8, -58}, {28, -104}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "2"), Rectangle(extent = {{-30, 62}, {30, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {100, 100, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-12, 62}, {12, -56}}, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {150, 100, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {14, -34}, rotation = 90), Polygon(points = {{-14, 20}, {-3.18533e-15, 34}, {14, 20}, {4, 24}, {4, 4}, {14, 8}, {1.47089e-15, -6}, {-14, 8}, {-4, 4}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {14, 32}, rotation = 90)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end InternalDoor_Opening;

