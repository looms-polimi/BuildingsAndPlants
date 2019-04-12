within BuildingsAndPlants.Components.BaseComponents.HVAC.HeatPumps;
model HeatPump_CarnotCOPheat_eta
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real eta = 0.5 "efficiency wrt Carnot COP";
  parameter Real maxCOPheat = 2 "maximum heating COP";
  SI.Temperature DTmin;
equation
  eta * Th = maxCOPheat * DTmin;
  W = Wmax * cmd01;
  if Th - Tc > DTmin then
    COPheat = eta * Th / (Th - Tc);
  else
    COPheat = maxCOPheat;
  end if;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-80, 60}, {82, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                FillPattern.Solid, textString = "Carnot(h)")}));
end HeatPump_CarnotCOPheat_eta;

