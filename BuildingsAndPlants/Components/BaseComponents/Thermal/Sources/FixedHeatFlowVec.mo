within BuildingsAndPlants.Components.BaseComponents.Thermal.Sources;

model FixedHeatFlowVec
  parameter HeatFlowRate Q_flow[n];
  parameter Integer n "number of heatPort";
  Interfaces.Thermal.HeatPortVec heatPortN(n = n) annotation(
  Placement(transformation(extent = {{-60, -60}, {60, -40}})));
equation
  for i in 1:n loop
    heatPortN.Q_flow[i] = -Q_flow[i];
  end for;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 60}, {60, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-26, 20}, {34, -4}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, textString = "Q_flow")}));
end FixedHeatFlowVec;
