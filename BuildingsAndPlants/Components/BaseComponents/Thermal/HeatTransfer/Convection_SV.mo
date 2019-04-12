within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Convection_SV "Scalar to vector convection, fixed heat transfer coefficient"
  parameter Integer n = 2 "Lumps, vector side";
  parameter Area S = 1 "Area, both sides";
  parameter CoefficientOfHeatTransfer gamma = 5 "Heat transfer coefficient";
  Interfaces.Thermal.HeatPort ss "Scalar side" annotation(
  Placement(transformation(extent = {{-80, 40}, {80, 60}}), iconTransformation(extent = {{-80, 40}, {80, 80}})));
  Interfaces.Thermal.HeatPortVec vs(n = n) "Vector side" annotation(
  Placement(transformation(extent = {{-80, -80}, {80, -60}}), iconTransformation(extent = {{-80, -80}, {80, -40}})));
equation
  ss.Q_flow + sum(vs.Q_flow) = 0;
  for i in 1:n loop
    vs.Q_flow[i] = gamma * S / n * (vs.T[i] - ss.T);
  end for;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 40}, {80, -40}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-74, 20}, {-60, 40}, {-46, 20}, {-56, 24}, {-56, -24}, {-46, -20}, {-60, -40}, {-74, -20}, {-64, -24}, {-64, 24}, {-74, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{46, 20}, {60, 40}, {74, 20}, {64, 24}, {64, -24}, {74, -20}, {60, -40}, {46, -20}, {56, -24}, {56, 24}, {46, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Convection_SV;
