within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps;
model HeatPump_ConstantCOPheat
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real constCOPheat = 4 "conatant heating COP";
equation
  W = Wmax * cmd01;
  COPheat = constCOPheat;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-80, 60}, {82, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                FillPattern.Solid, textString = "COPheat")}));
end HeatPump_ConstantCOPheat;

