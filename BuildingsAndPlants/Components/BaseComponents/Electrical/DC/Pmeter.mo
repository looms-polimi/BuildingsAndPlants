within BuildingsAndPlants.Components.BaseComponents.Electrical.DC;

model Pmeter

  Modelica.Blocks.Interfaces.RealOutput P annotation (
  Placement(transformation(extent = {{16, -40}, {36, -20}}), iconTransformation(extent = {{-21, -21}, {21, 21}}, rotation = 90, origin = {-39, 101})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (
  Placement(transformation(extent = {{-90, 30}, {-70, 50}}), iconTransformation(extent = {{-100, 50}, {-80, 70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (
  Placement(transformation(extent = {{50, 30}, {70, 50}}), iconTransformation(extent = {{80, 50}, {100, 70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (
  Placement(transformation(extent = {{-90, -50}, {-70, -30}}), iconTransformation(extent = {{-100, -70}, {-80, -50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (
  Placement(transformation(extent = {{52, -50}, {72, -30}}), iconTransformation(extent = {{80, -70}, {100, -50}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor SP annotation (
  Placement(transformation(extent = {{-20, -20}, {20, 20}})));
equation
  connect(SP.pv, p1) annotation (
  Line(points = {{0, 20}, {0, 40}, {-80, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(SP.nv, n1) annotation (
  Line(points = {{0, -20}, {0, -40}, {-80, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(n2, n1) annotation (
  Line(points = {{62, -40}, {-80, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(SP.pc, p1) annotation (
  Line(points = {{-20, 0}, {-20, 40}, {-80, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(SP.nc, p2) annotation (
  Line(points = {{20, 0}, {20, 40}, {60, 40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(SP.power, P) annotation (
  Line(points = {{-16, -22}, {-16, -30}, {26, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation (
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-70, 80}, {70, -80}}, lineColor = {0, 0, 100},
            fillPattern =                                                                                                                                                                FillPattern.Sphere, fillColor = {255, 255, 255}), Line(points = {{-80, 60}, {-70, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-80, -60}, {-70, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, 60}, {80, 60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Line(points = {{70, -60}, {80, -60}}, color = {0, 0, 100}, thickness = 0.5, smooth = Smooth.None), Polygon(points = {{-40, 20}, {0, 20}, {0, 40}, {40, 0}, {0, -40}, {0, -18}, {-40, -18}, {-40, 20}}, lineColor = {0, 0, 100},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, smooth = Smooth.None, fillColor = {200, 200, 255}), Text(extent = {{-52, 72}, {-20, 34}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "P")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Pmeter;
