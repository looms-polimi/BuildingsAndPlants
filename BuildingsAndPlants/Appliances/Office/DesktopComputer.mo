within BuildingsAndPlants.Appliances.Office;

model DesktopComputer
  extends BaseClasses.BaseAppliance_AC;
  Components.AggregateComponents.Electrical.DCsupply_constantEfficiency Psupply(Vdc = Vdc, Isc = 20 * Pnom / Vdc, cphinom = cphinom, eta = eta) annotation(
  Placement(transformation(extent = {{-32, 0}, {-12, 20}})));
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(transformation(extent = {{-100, 30}, {-80, 50}}), iconTransformation(extent = {{-100, 18}, {-80, 38}})));
  Components.BaseComponents.Electrical.DC.Load_Pfixed_I0 Load(Pnom = Pnom) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {16, 8})));
  parameter SI.Power Pnom = 20 "Nominal absorbed power (avg)";
  parameter SI.Voltage Vdc = 10 "DC voltage";
  parameter Real cphinom = 0.9 "nominal power factor";
  parameter Real eta = 0.85 "DC supply efficiency";
  parameter Boolean ReleaseQ = false "release heat to port";
  parameter HeatCapacity C = 100 "equivalent heat capacity";
  parameter ThermalConductance G = 2 "equivalent thermal conductance";
  parameter Temperature Tstart = 273.15 + 20 "initial T";
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Qloss annotation(
  Placement(transformation(extent = {{24, 36}, {44, 56}})));
  Modelica.Electrical.Analog.Basic.Ground gndDC annotation(
  Placement(transformation(extent = {{-8, -46}, {12, -26}})));
  Modelica.Blocks.Sources.RealExpression oQloss(y = if ReleaseQ then Pabs else 0) annotation(
  Placement(transformation(extent = {{-8, 36}, {12, 56}})));
  Components.BaseComponents.Thermal.Capacities.ThermalCap Hcap(Tstart = Tstart) annotation(
  Placement(transformation(extent = {{60, 40}, {80, 20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Tcond(G = G) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {70, 64})));
equation
  connect(PQM.n2, Psupply.ACn) annotation(
  Line(points = {{-51, 68}, {-50, 68}, {-50, 4}, {-31, 4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Psupply.DCp, Load.p) annotation(
  Line(points = {{-13, 16}, {2, 16}, {2, 18}, {16, 18}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Psupply.DCn, Load.n) annotation(
  Line(points = {{-13, 4}, {2, 4}, {2, -2}, {16, -2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(PQM.p2, Psupply.ACp) annotation(
  Line(points = {{-51, 80}, {-46, 80}, {-46, 78}, {-42, 78}, {-42, 16}, {-31, 16}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(gndDC.p, Load.n) annotation(
  Line(points = {{2, -26}, {2, -2}, {16, -2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(oQloss.y, Qloss.Q_flow) annotation(
  Line(points = {{13, 46}, {24, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Qloss.port, Hcap.surf) annotation(
  Line(points = {{44, 46}, {70, 46}, {70, 38}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(Tcond.port_a, Hcap.surf) annotation(
  Line(points = {{70, 54}, {70, 38}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(Tcond.port_b, heatPort) annotation(
  Line(points = {{70, 74}, {70, 90}, {90, 90}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 80}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {80, 80, 80}, fillPattern = FillPattern.Solid, radius = 2), Rectangle(extent = {{-54, 74}, {56, -12}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-78, -26}, {80, -56}}, lineColor = {0, 0, 0}, fillColor = {120, 120, 120}, fillPattern = FillPattern.Solid), Polygon(points = {{-78, -58}, {-98, -88}, {100, -88}, {80, -58}, {-78, -58}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {150, 150, 150}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end DesktopComputer;
