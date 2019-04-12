within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Conduction_SS
  parameter Area A = 1 "total surf, both sides";
  parameter Length d = 0.2 "thickness";
  parameter ThermalConductivity lambda = 5 "heat transfer coefficient";
  Interfaces.Thermal.HeatPort ss1 annotation(
  Placement(transformation(extent = {{-80, -80}, {-60, 40}}, rotation = 0), iconTransformation(extent = {{-80, -80}, {-40, 80}})));
  Interfaces.Thermal.HeatPort ss2 annotation(
  Placement(transformation(extent = {{40, -80}, {60, 40}}, rotation = 0), iconTransformation(extent = {{40, -80}, {80, 80}})));
equation
  ss1.Q_flow + ss2.Q_flow = 0;
  ss1.Q_flow = lambda * A * (ss1.T - ss2.T) / d;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-40, -80}, {40, 80}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Forward)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Conduction_SS;
