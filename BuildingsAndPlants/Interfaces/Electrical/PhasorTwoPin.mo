within BuildingsAndPlants.Interfaces.Electrical;
partial model PhasorTwoPin "Phasor two pins"

  PositivePhasorPin p annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  NegativePhasorPin n annotation(
  Placement(transformation(extent = {{60, -20}, {100, 20}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Voltage Vre, Vim;
  Current Ire, Iim;
equation
  p.ire + n.ire = 0;
  p.iim + n.iim = 0;
  Vre = p.vre - n.vre;
  Vim = p.vim - n.vim;
  Ire = p.ire;
  Iim = p.iim;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PhasorTwoPin;
