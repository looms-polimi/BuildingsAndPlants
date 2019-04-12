within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps;
model HeatPump_ConstantCOPcool
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real constCOPcool = 1 "conatant cooling COP";
equation
  W = Wmax * cmd01;
  COPcool = constCOPcool;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-82, -20}, {80, -60}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                  FillPattern.Solid, textString = "COPcool")}));
end HeatPump_ConstantCOPcool;

