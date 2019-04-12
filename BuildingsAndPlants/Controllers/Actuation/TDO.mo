within BuildingsAndPlants.Controllers.Actuation;
model TDO
  Modelica.Blocks.Interfaces.RealInput cmd01 annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput TDO annotation(
  Placement(transformation(extent = {{46, -20}, {86, 20}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
  parameter Time Ttdo = 1 "TDO timebase";
  discrete Real tdo;
  discrete Real timeNextEv;
equation
  TDO = tdo;
initial algorithm
  timeNextEv := 0;
  tdo := 0;
algorithm
  when sample(0, Ttdo) then
    if cmd01 <= 0 then
      tdo := 0;
      timeNextEv := -1;
    elseif cmd01 >= 1 then
      tdo := 1;
      timeNextEv := -1;
    else
      tdo := 1;
      timeNextEv := time + cmd01 * Ttdo;
    end if;
  end when;
  when time >= timeNextEv and timeNextEv >= 0 then
    if cmd01 > 0 and cmd01 < 1 then
      tdo := 0;
    end if;
  end when;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-62, 56}, {66, -52}}, lineColor = {0, 0, 0}, fillColor = {170, 213, 255}, fillPattern = FillPattern.Solid, textString = "01
TDO")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end TDO;

