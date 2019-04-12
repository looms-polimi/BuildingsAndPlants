within BuildingsAndPlants.Components.BaseComponents.Electrical.PV;

model Cell
  constant ElectricCharge q = 1.6021892e-19 "Elementary (electron) charge";
  constant Real k = 1.380648813e-23 "Boltzmann contant (J/K)";
  parameter Current irs = 1e-6 "Diode reverse seturation current";
  parameter Real dif = 5 "Diode ideality factor";
  parameter Resistance Rp = 1e3 "Parallel (shunt) resistance";
  parameter Resistance Rs = 0.1 "Series resistance";
  parameter Current il0 = 0.2 "Nominal light (photo) current";
  parameter HeatFlux Phi0 = 1000 "Nominal heat flux";
  parameter Temperature T0 = 293.15 "Nominal temperature";
  parameter Real Kphi = -0.01 "Light (photo) current temperature corfficient";
  parameter HeatCapacity C = 5 "Total heat capacity";
  parameter Temperature Tstart = 293.15 "Initial temperature";
  Voltage vj "Junction voltage";
  Current il "Light (photo) current";
  Current id "Diode current";
  Current ip "Parallel (shunt) current";
  Temperature T(start = Tstart);
  Voltage v;
  Current i;
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{68, 38}, {88, 58}}), iconTransformation(extent = {{60, 40}, {100, 80}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{54, -52}, {74, -32}}), iconTransformation(extent = {{60, -80}, {100, -40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a surf annotation(
  Placement(transformation(extent = {{-20, -76}, {0, -56}}), iconTransformation(extent = {{-40, -100}, {0, -60}})));
  Modelica.Blocks.Interfaces.RealInput Phi annotation(
  Placement(transformation(extent = {{-100, 40}, {-60, 80}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = -p.i;
  T = surf.T;
  il = il0 * Phi / Phi0 * (1 + Kphi * (T - T0));
  id = irs * (exp(q * vj / dif / k / T) - 1);
  vj = Rp * ip;
  v = vj - Rs * i;
  i = il - id - ip;
  C * der(T) = surf.Q_flow + vj * id + vj * ip + (vj - v) * i;
  annotation(
  Diagram(graphics), Icon(graphics = {Polygon(points = {{-100, 0}, {-40, 40}, {40, 40}, {-20, 0}, {-100, 0}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {170, 213, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-100, -20}, {-100, 0}, {-20, 0}, {-20, -20}, {-100, -20}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-20, -20}, {-20, 0}, {40, 40}, {40, 20}, {-20, -20}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid), Line(points = {{-74, 64}, {-28, 18}}, color = {0, 0, 0}, smooth = Smooth.None, thickness = 1), Line(points = {{-28, 18}, {-34, 38}}, color = {0, 0, 0}, smooth = Smooth.None, thickness = 1), Line(points = {{-28, 18}, {-48, 24}}, color = {0, 0, 0}, smooth = Smooth.None, thickness = 1), Polygon(points = {{-100, -40}, {-100, -20}, {-20, -20}, {-20, -40}, {-100, -40}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {135, 135, 135}, fillPattern = FillPattern.Solid), Line(points = {{-20, -40}, {-20, -60}}, color = {0, 0, 0}, smooth = Smooth.None, thickness = 1), Line(points = {{60, -60}, {20, -60}, {2, -24}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Polygon(points = {{-20, -40}, {-20, -20}, {40, 20}, {40, 0}, {-20, -40}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Line(points = {{60, 60}, {20, 60}, {2, 24}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}));
end Cell;
