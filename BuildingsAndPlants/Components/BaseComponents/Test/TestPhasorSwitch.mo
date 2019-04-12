within BuildingsAndPlants.Components.BaseComponents.Test;
model TestPhasorSwitch
  Electrical.Phasors.Ground ground annotation(Placement(transformation(extent = {{-40, -42}, {-20, -22}})));
  Electrical.Phasors.Vgen_Sine_Fixed vgen_Sine_Fixed annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-30, 8})));
  Electrical.Phasors.Switch switch annotation(Placement(transformation(extent = {{-8, 18}, {12, 38}})));
  Electrical.Phasors.Load_VPcosphi_nom load_VPcosphi_nom annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {38, 0})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period = 0.1) annotation(Placement(transformation(extent = {{-48, 46}, {-28, 66}})));
equation
  connect(vgen_Sine_Fixed.p, switch.p) annotation(Line(points = {{-30, 16}, {-30, 28}, {-6, 28}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(switch.n, load_VPcosphi_nom.p) annotation(Line(points = {{10, 28}, {38, 28}, {38, 9}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(load_VPcosphi_nom.n, ground.p) annotation(Line(points = {{38, -9}, {38, -14}, {-30, -14}, {-30, -24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground.p, vgen_Sine_Fixed.n) annotation(Line(points = {{-30, -24}, {-30, 0}, {-30, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(booleanPulse.y, switch.close) annotation(Line(points = {{-27, 56}, {2, 56}, {2, 36}}, color = {255, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(__Dymola_NumberOfIntervals = 2000), __Dymola_experimentSetupOutput);
end TestPhasorSwitch;

