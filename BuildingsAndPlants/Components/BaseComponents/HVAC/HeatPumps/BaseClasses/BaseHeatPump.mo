within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps.BaseClasses;

partial model BaseHeatPump
  Temperature Tc, Th;
  HeatFlowRate Qc, Qh, W;
  Real COPcool, COPheat;
  BuildingsAndPlants.Interfaces.Thermal.HeatPort hotPort "hot side thermal port" annotation(
  Placement(transformation(extent = {{-60, 60}, {-40, 80}}), iconTransformation(extent = {{-60, 80}, {60, 100}})));
  BuildingsAndPlants.Interfaces.Thermal.HeatPort coldPort "cold side thermal port" annotation(
  Placement(transformation(extent = {{20, 60}, {40, 80}}), iconTransformation(extent = {{-60, -100}, {60, -80}})));
  Modelica.Blocks.Interfaces.RealInput cmd01 "command, 0-1 range" annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
equation
  Tc = coldPort.T;
  Th = hotPort.T;
  Qc = coldPort.Q_flow;
  Qh = -hotPort.Q_flow;
  Qh = Qc + W;
  Qc = COPcool * W;
  Qh = COPheat * W;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{41, 6}, {41, -6}, {-9, -6}, {-1, -22}, {-40, 1}, {-1, 20}, {-9, 6}, {41, 6}}, lineColor = {255, 120, 0},
            lineThickness =                                                                                                                                                                                                        0.5,
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, smooth = Smooth.None, fillColor = {255, 255, 85}, origin = {0, -1}, rotation = -90), Ellipse(extent = {{-30, 100}, {30, 40}}, lineColor = {240, 0, 0}, fillColor = {240, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Ellipse(extent = {{-30, -40}, {30, -100}}, lineColor = {0, 0, 240}, fillColor = {0, 0, 240},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Polygon(points = {{7, -36}, {5, -38}, {-39, -8}, {-39, -14}, {-45, -2}, {-33, -4}, {-37, -6}, {7, -36}}, lineColor = {255, 120, 0},
            lineThickness =                                                                                                                                                                                                        0.5,
            fillPattern =                                                                                                                                                                                                        FillPattern.VerticalCylinder, smooth = Smooth.None, fillColor = {255, 255, 85}, origin = {-22, 7}, rotation = -90)}));
end BaseHeatPump;
