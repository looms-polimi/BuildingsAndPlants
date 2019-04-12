within BuildingsAndPlants.Components.AggregateComponents.Electrical;

model FixedACsupply_socket_withGround
  Interfaces.Electrical.PosNegPhasorPins socket annotation(
  Placement(transformation(extent = {{-20, -20}, {60, 60}}), iconTransformation(extent = {{-80, -80}, {80, 80}})));
  BaseComponents.Electrical.Phasors.Vgen_Sine_Fixed Vgen(V = V, phi = 0) annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-50, 0})));
  BaseComponents.Electrical.Phasors.Ground gnd annotation(
  Placement(transformation(extent = {{-60, -40}, {-40, -20}})));
  parameter SI.Voltage V = 220 "Voltage";
equation
  connect(gnd.p, Vgen.n) annotation(
  Line(points = {{-50, -22}, {-50, -8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(socket.n, gnd.p) annotation(
  Line(points = {{20, 20}, {-10, 20}, {-10, -22}, {-50, -22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Vgen.p, socket.p) annotation(
  Line(points = {{-50, 8}, {-50, 20}, {20, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, 80}, {-80, 100}, {80, 100}, {100, 80}, {100, -80}, {80, -100}, {-80, -100}, {-100, -80}, {-100, 80}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {210, 210, 210}, fillPattern = FillPattern.Solid), Text(extent = {{-88, -60}, {-48, -96}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "GND")}));
end FixedACsupply_socket_withGround;
