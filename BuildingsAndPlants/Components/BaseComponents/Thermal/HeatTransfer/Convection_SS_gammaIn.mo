within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Convection_SS_gammaIn "Scalar to scalar convection, externally provided heat transfer coefficient"
  parameter Area S = 1 "Area, both sides";
  Modelica.Blocks.Interfaces.RealInput gamma annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Interfaces.Thermal.HeatPort ss1 "Scalar side 1" annotation(
  Placement(transformation(extent = {{-80, 40}, {80, 60}}), iconTransformation(extent = {{-80, 40}, {80, 80}})));
  Interfaces.Thermal.HeatPort ss2 "Scalar side 2" annotation(
  Placement(transformation(extent = {{-80, -80}, {80, -60}}), iconTransformation(extent = {{-80, -80}, {80, -40}})));
equation
  ss1.Q_flow + ss2.Q_flow = 0;
  ss1.Q_flow = gamma * S * (ss1.T - ss2.T);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 40}, {80, -40}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-74, 20}, {-60, 40}, {-46, 20}, {-56, 24}, {-56, -24}, {-46, -20}, {-60, -40}, {-74, -20}, {-64, -24}, {-64, 24}, {-74, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{46, 20}, {60, 40}, {74, 20}, {64, 24}, {64, -24}, {74, -20}, {60, -40}, {46, -20}, {56, -24}, {56, 24}, {46, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Convection_SS_gammaIn;
