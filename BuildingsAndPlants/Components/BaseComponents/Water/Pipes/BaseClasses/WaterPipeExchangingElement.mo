within BuildingsAndPlants.Components.BaseComponents.Water.Pipes.BaseClasses;

model WaterPipeExchangingElement
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter Length L = 10 "Pipe length";
  parameter Length D = 0.05 "Pipe Diameter";
  parameter Length Dz = 0 "height diff (out-in)";
  parameter Real Cf = 1e-6 "friction coefficient";
  parameter Temperature Tstart = 273.15 + 25 "initial fluid temperature";
  Energy Ew;
  Temperature Ti(start = Tstart, stateSelect = StateSelect.always) "fluid temperature";
  Velocity u "fluid speed";
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-60, 40}, {62, 60}})));
protected
  final parameter Area S = pi * (D / 2) ^ 2;
  final parameter Volume V = S * L;

equation
  // no mass storage inside the component
  w1 + w2 = 0;
  // pressure drop
  p1 - p2 = 64 * L * Cf / (water.d * pi ^ 2 * D ^ 5) * w1 * noEvent(abs(w1)) + water.d * g_n * Dz;
  water.p = 0.5 * (p1 + p2);
  // mean fluid pressure
  //energy conservation
  der(Ew) = w1 * actualStream(water_flange1.h) + w2 * actualStream(water_flange2.h) + heatPort.Q_flow;
  Ew = water.d * V * water.h;
  // Energy = mass * specific enthalpy
  //temperature
  water.T = Ti;
  heatPort.T = Ti;
  // heat port temperature
  // enthalpies boundary condition
  hout1 = water.h;
  hout2 = water.h;
  u = w1/S/water.d;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 40}, {62, -40}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}), Polygon(points = {{-30, 6}, {-30, -6}, {10, -6}, {10, -12}, {30, 0}, {10, 12}, {10, 6}, {-30, 6}}, lineColor = {200, 200, 255}, fillColor = {200, 200, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end WaterPipeExchangingElement;
