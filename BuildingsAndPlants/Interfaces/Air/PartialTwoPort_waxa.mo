within BuildingsAndPlants.Interfaces.Air;
partial model PartialTwoPort_waxa "Partial two port waxa"
  AbsolutePressure pa1 "Pressure";
  AbsolutePressure pa2 "Pressure";
  MassFlowRate wa1 "Dry air mass flowrate";
  MassFlowRate wa2 "Dry air mass flowrate";
  SpecificEnthalpy haout1 "Specifc enthalpy";
  SpecificEnthalpy haout2 "Specifc enthalpy";
  MassFraction xaout1 "Absolute humidity [Kg vap/Kg dry air]";
  MassFraction xaout2 "Absolute humidity [Kg vap/Kg dry air]";
  MoistAirFlange_waxa air_flange1 annotation(
  Placement(transformation(extent = {{-90, -10}, {-70, 10}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  MoistAirFlange_waxa air_flange2 annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  pa1 = air_flange1.pa;
  wa1 = air_flange1.wa;
  haout1 = air_flange1.ha;
  xaout1 = air_flange1.xa;
  pa2 = air_flange2.pa;
  wa2 = air_flange2.wa;
  haout2 = air_flange2.ha;
  xaout2 = air_flange2.xa;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialTwoPort_waxa;
