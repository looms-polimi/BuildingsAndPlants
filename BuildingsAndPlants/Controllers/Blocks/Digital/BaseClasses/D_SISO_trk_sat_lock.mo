within BuildingsAndPlants.Controllers.Blocks.Digital.BaseClasses;

partial model D_SISO_trk_sat_lock
  extends D_SISO_base;
  Modelica.Blocks.Interfaces.BooleanInput TS annotation(
  Placement(transformation(extent = {{-100, -20}, {-80, 0}}), iconTransformation(extent = {{-100, -80}, {-60, -40}})));
  Modelica.Blocks.Interfaces.RealInput TR annotation(
  Placement(transformation(extent = {{-100, -60}, {-80, -40}}), iconTransformation(extent = {{-100, -140}, {-60, -100}})));
  Modelica.Blocks.Interfaces.BooleanInput Fp annotation(
  Placement(transformation(extent = {{-100, -100}, {-80, -80}}), iconTransformation(extent = {{-100, -200}, {-60, -160}})));
  Modelica.Blocks.Interfaces.BooleanInput Fm annotation(
  Placement(transformation(extent = {{-100, -140}, {-80, -120}}), iconTransformation(extent = {{-100, -260}, {-60, -220}})));
  Modelica.Blocks.Interfaces.BooleanOutput HI annotation(
  Placement(transformation(extent = {{80, -100}, {100, -80}}), iconTransformation(extent = {{60, -200}, {100, -160}})));
  Modelica.Blocks.Interfaces.BooleanOutput LO annotation(
  Placement(transformation(extent = {{80, -140}, {100, -120}}), iconTransformation(extent = {{60, -260}, {100, -220}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -280}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -280}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {230, 230, 230})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -280}, {100, 100}}), graphics));
end D_SISO_trk_sat_lock;
