within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps;
model HeatPump_LinearCOPheat
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real maxCOPheat = 2 "maximum heating COP (DT=0)";
  parameter Real DT0 = 20;
equation
  W = Wmax * cmd01;
  COPheat = maxCOPheat * (1 - (Th - Tc) / DT0);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-80, 60}, {82, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                FillPattern.Solid, textString = "Linear(h)")}));
end HeatPump_LinearCOPheat;

