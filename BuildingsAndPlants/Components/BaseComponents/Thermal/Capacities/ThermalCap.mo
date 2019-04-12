within BuildingsAndPlants.Components.BaseComponents.Thermal.Capacities;

model ThermalCap "Mass of a generic element"
  parameter HeatCapacity C = 500;
  parameter Temperature Tstart = 273.15 + 25;
  Temperature T(start = Tstart);
  Interfaces.Thermal.HeatPort surf annotation(
  Placement(transformation(extent = {{-60, -60}, {60, -40}}), iconTransformation(extent = {{-40, -100}, {40, -60}})));
equation
  C * der(T) = surf.Q_flow;
  surf.T = T;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -60}, {100, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Forward), Text(extent = {{-62, 66}, {76, -26}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, textString = "C")}));
end ThermalCap;
