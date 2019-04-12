within BuildingsAndPlants.Components.BaseComponents.Test;

model Test_LoadPcosphi_Pin
  Electrical.Phasors.Load_Pcosphi_nom_Pin load_Pcosphi_nom_Pin annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {58, 20})));
  Electrical.Phasors.Ground ground annotation(Placement(transformation(extent = {{-80, -40}, {-60, -20}})));
  Electrical.Phasors.PQmeter pQmeter annotation(Placement(transformation(extent = {{-20, 0}, {20, 40}})));
  Electrical.Phasors.Vgen_Sine_Fixed vgen_Sine_Fixed annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-70, 10})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 100, rising = 5, width = 5, falling = 5, period = 20) annotation(Placement(transformation(extent = {{-28, 54}, {-8, 74}})));
equation
  connect(pQmeter.p2, load_Pcosphi_nom_Pin.p) annotation(Line(points = {{18, 32}, {38, 32}, {38, 38}, {58, 38}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pQmeter.n2, load_Pcosphi_nom_Pin.n) annotation(Line(points = {{18, 8}, {40, 8}, {40, 2}, {58, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pQmeter.n1, ground.p) annotation(Line(points = {{-18, 8}, {-18, -22}, {-70, -22}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground.p, vgen_Sine_Fixed.n) annotation(Line(points = {{-70, -22}, {-70, -6}, {-70, 2}, {-70, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(vgen_Sine_Fixed.p, pQmeter.p1) annotation(Line(points = {{-70, 18}, {-70, 32}, {-18, 32}, {-18, 32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(trapezoid.y, load_Pcosphi_nom_Pin.P) annotation(Line(points = {{-7, 64}, {88, 64}, {88, 20}, {66, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Test_LoadPcosphi_Pin;
