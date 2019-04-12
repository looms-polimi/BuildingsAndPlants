within BuildingsAndPlants.Components.BaseComponents.Air.Volumes;

model AirVolume_closed
  BuildingsAndPlants.Media.Substances.MoistAir air;
  parameter Volume V = 0.001 "volume";
  parameter Pressure Pstart = 101325 "Initial moist air pressure";
  parameter Temperature Tstart = 273.15 + 20 "Initial moist air temperature";
  parameter MassFraction Xstart = 0.001 "Initial absolute umidity [kg_H20/kg_DA]";
  Mass Ma "Total dry air mass";
  Mass Mv "Total vapour mass";
  Energy Ea "Energy of the moist air";
  Pressure p(start = Pstart) "Pressure of the air";
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
initial equation
  air.T = Tstart;
  air.X = Xstart;
  air.p = Pstart;
equation
  air.p = p;
  Ma + Mv = V * air.d;
  Mv = Ma * air.X;
  Ea = Ma * (air.h - air.p / air.d);
  der(Ea) = heatPort.Q_flow;
  der(Ma) = 0;
  der(Mv) = 0;
  air.T = heatPort.T;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 100, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere), Text(extent = {{-76, 76}, {76, -74}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, textString = "AirVolume
closed")}));
end AirVolume_closed;
