within BuildingsAndPlants.Components.AggregateComponents.Heating;
model IdealControlledFluidHeater
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater waterIN, water;
  parameter SI.Time Tcl = 5 "CL temp ctrl TC";
  parameter SI.Time Thc = 20 "intrinsic cooling TC";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial fluid temp";
  SI.Temperature Tfi "inlet fluid temp";
  SI.Temperature Tfo(start = Tstart) "outlet fluid temp";
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
  Placement(visible = true, transformation(extent = {{-102, 54}, {-62, 94}}, rotation = 0), iconTransformation(extent = {{-92, 58}, {-70, 80}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput To annotation(
  Placement(transformation(extent = {{-92, 20}, {-52, 60}}), iconTransformation(extent = {{-92, 24}, {-70, 46}})));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation(
  Placement(transformation(extent = {{60, 50}, {100, 90}}), iconTransformation(extent = {{70, 56}, {100, 86}})));
  Modelica.Blocks.Interfaces.RealOutput Ec annotation(
  Placement(transformation(extent = {{60, 10}, {100, 50}}), iconTransformation(extent = {{70, 20}, {100, 50}})));
  Modelica.Blocks.Interfaces.RealOutput oTi "inlet T meas" annotation(
  Placement(transformation(extent = {{60, 50}, {100, 90}}), iconTransformation(extent = {{-15, -15}, {15, 15}}, rotation = 270, origin = {-53, -115})));
  Modelica.Blocks.Interfaces.RealOutput oTo "outlet T meas" annotation(
  Placement(transformation(extent = {{60, 50}, {100, 90}}), iconTransformation(extent = {{-15, -15}, {15, 15}}, rotation = 270, origin = {55, -115})));
equation
// no pressure drop ("water" is water out)
  p1 = p2;
  waterIN.p = p1;
  water.p = p1;
// no mass storage
  w1 + w2 = 0;
// enthalpy boundary conditions
  hout1 = water.h;
  hout2 = water.h;
  waterIN.h = actualStream(water_flange1.h);
// definition of the input and output temperatures
  waterIN.T = Tfi;
  water.T = Tfo;
  if ON then
    Tfo + Tcl * der(Tfo) = To;
  else
    Tfo + Thc * der(Tfo) = Tfi;
  end if;
// Power consumption
  Pc = noEvent(max(w1 * (actualStream(water_flange2.h) - actualStream(water_flange1.h)), 0.0));
  Pc = der(Ec);
// Temp meas
  oTi = Tfi;
  oTo = Tfo;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 100}, {70, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, 92}, {62, -92}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {0, 0, 255}), Polygon(points = {{-18, -62}, {-8, -72}, {4, -70}, {14, -60}, {20, -50}, {26, -44}, {18, -38}, {22, -32}, {16, -26}, {14, -16}, {12, -8}, {8, 4}, {8, -8}, {6, -18}, {4, -18}, {2, -14}, {-2, -4}, {-6, 8}, {-8, 20}, {-8, 4}, {-10, 0}, {-12, -32}, {-16, -26}, {-22, -24}, {-24, -44}, {-22, -52}, {-18, -62}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-24, 48}, {20, 30}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, textString = "ideal")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end IdealControlledFluidHeater;
