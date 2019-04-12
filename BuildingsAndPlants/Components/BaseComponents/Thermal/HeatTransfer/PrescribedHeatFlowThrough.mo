within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model PrescribedHeatFlowThrough
  Interfaces.Thermal.HeatPort heatSrc annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}})));
  Interfaces.Thermal.HeatPort heatSnk annotation(
  Placement(transformation(extent = {{60, -20}, {100, 22}})));
  Modelica.Blocks.Interfaces.RealInput pwr annotation(
  Placement(transformation(extent = {{-28, 44}, {12, 84}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
equation
  heatSrc.Q_flow + heatSnk.Q_flow = 0;
  heatSrc.Q_flow = pwr;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.VerticalCylinder), Polygon(points = {{-40, -6}, {-40, 6}, {0, 6}, {0, 14}, {40, 0}, {0, -14}, {0, -6}, {-40, -6}}, lineColor = {255, 0, 0}, smooth = Smooth.None, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid)}));
end PrescribedHeatFlowThrough;
