within BuildingsAndPlants.Controllers.Blocks.Analogue;

model RLY_dir "RLY, direct action"
  extends BaseClasses.A_SISO_base;
  parameter Real CShi = 1 "HI CS";
  parameter Real CSlo = 0 "LO CS";
  parameter Real CShist2 = 0.1 "switch when |SP-PV|>CShist2";
  parameter Boolean startHI = false "start with CS=CShi";
  discrete Real cs;
equation
  CS = cs;
algorithm
  // CS lo and SP under PV -> go hi
  when cs < CShi and PV <= SP - CShist2 then
    cs := CShi;
  end when;
  // CS hi and SP over PV -> go lo
  when cs > CSlo and PV >= SP + CShist2 then
    cs := CSlo;
  end when;
initial algorithm
  cs := if startHI then CShi else CSlo;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "RLY DIR
analogue")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end RLY_dir;
