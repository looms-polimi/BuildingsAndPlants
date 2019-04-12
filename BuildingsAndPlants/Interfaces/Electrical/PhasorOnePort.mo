within BuildingsAndPlants.Interfaces.Electrical;
partial model PhasorOnePort "Component with two electrical pins p and n and current i from p to n"

  PositivePhasorPin p annotation(
  Placement(transformation(extent = {{80, 40}, {120, 80}}), iconTransformation(extent = {{80, 40}, {120, 80}})));
  NegativePhasorPin n annotation(
  Placement(transformation(extent = {{120, -80}, {80, -40}}), iconTransformation(extent = {{120, -80}, {80, -40}})));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PhasorOnePort;
