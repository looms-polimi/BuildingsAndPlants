within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps;

model HeatPump_LinearCOPcool
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real maxCOPcool = 2 "maximum cooling COP (DT=0)";
  parameter Real DT0 = 20;
equation
  W = Wmax * cmd01;
  COPcool = maxCOPcool * (1 - (Th - Tc) / DT0);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-78, -20}, {84, -60}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                  FillPattern.Solid, textString = "Linear(c)")}));
end HeatPump_LinearCOPcool;
