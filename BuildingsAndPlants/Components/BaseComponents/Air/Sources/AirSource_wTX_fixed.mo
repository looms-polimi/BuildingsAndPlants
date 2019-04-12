within BuildingsAndPlants.Components.BaseComponents.Air.Sources;
model AirSource_wTX_fixed
  Media.Substances.MoistAir air;
  parameter MassFlowRate w0 = 1 "Dry air mass flow rate";
  parameter Temperature T0 = 273.15 + 20 "prescribed temperature";
  parameter MassFraction X0 = 0.001 "prescribed absolute humidity [kg_H20/kg_DA]";
  Interfaces.Air.MoistAirFlange_waxa air_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{70, -20}, {110, 20}})));
equation
  air_flange.wa = -w0;
  air.p = air_flange.pa;
  air.T = T0;
  air.X = X0;
  // enthalpy boundary condition
  air.h = air_flange.ha;
  air.X = air_flange.xa;
  annotation(
  Icon(graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 40}, {-40, 20}}, lineColor = {0, 0, 0}, textString = "W")}));
end AirSource_wTX_fixed;

