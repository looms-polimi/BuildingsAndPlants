within BuildingsAndPlants.Components.BaseComponents.Air.Renovation;

model AirRenovation
  //Model of air recycle inside a room; It is advisable to recycle 0.6 volume/hour
  parameter Volume V = 1 "Room volume";
  parameter Real k "recycle air parameter";
  parameter Real rho(unit="kg/m3") "desnity of the air";
  parameter MassFlowRate wr = V * k * rho "Air flow rate";
  parameter SpecificHeatCapacity cp_a = 1005 "cp air";
  parameter Real eta(unit="1") "efficiency of the air recovery";
  HeatFlowRate Q "Heat imposed by air florw rate";
  Interfaces.Thermal.HeatPort heatPort1 annotation(
  Placement(transformation(extent = {{-60, -20}, {-40, 20}})));
  Interfaces.Thermal.HeatPort heatPort2 annotation(
  Placement(transformation(extent = {{40, -20}, {60, 20}})));
equation
  Q = wr * cp_a * eta * (heatPort1.T - heatPort2.T);
  heatPort1.Q_flow = Q;
  heatPort1.Q_flow + heatPort2.Q_flow = 0;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-40, 20}, {40, -20}}, lineColor = {170, 255, 255}, fillPattern = FillPattern.Solid, fillColor = {170, 255, 255}), Rectangle(extent = {{-8, -40}, {8, -74}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-16, -40}, {0, -40}, {0, -20}, {-16, -40}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{16, -40}, {0, -40}, {0, -20}, {16, -40}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-4, -66}, {56, -92}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid, textString = "W
")}));
end AirRenovation;
