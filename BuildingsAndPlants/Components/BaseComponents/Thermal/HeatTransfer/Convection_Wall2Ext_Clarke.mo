within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;


model Convection_Wall2Ext_Clarke
  // Clarke, 1985
  parameter Length L = 5 "wall surface length";
  parameter Length H = 3 "wall surface height";
  parameter Boolean fixedCoeff = false "switch the coefficient";
  parameter CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation(min = 0, max = 360) = 0
    "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  outer BoundaryConditions.AmbientConditions ambient_settings;
  Interfaces.Thermal.HeatPort wall annotation(
  Placement(transformation(extent = {{-40, -40}, {-20, 40}}, rotation = 0), iconTransformation(extent = {{-100, -80}, {-60, 80}})));
  HeatFlowRate Q_ext "Heat flow rate exchanged with the ambient";
  CoefficientOfHeatTransfer g;
  Boolean windward "T windward, F leeward";
  Real u;
equation
  windward = noEvent(abs(ambient_settings.wdir - orientation)) < 90;
  if windward and (ambient_settings.wv < 0 or ambient_settings.wv>0) then
    u = smooth(0, noEvent(if ambient_settings.wv < 2 then 0.5 else 0.25 * ambient_settings.wv));
  else
    u = 0.3 + 0.05 * ambient_settings.wv;
  end if;
  if u < 4.88 then
    g = 5.6780000000 * (1.09 + 0.23 * (u / 0.3048) ^ 1.00);
  else
    g = 0.5486590003 * (0.00 + 0.53 * (u / 0.3048) ^ 0.78);
  end if;
  wall.Q_flow + Q_ext = 0;
  if fixedCoeff then
    Q_ext = h0 * L * H * (ambient_settings.Tamb - wall.T);
  else
    Q_ext = g * L * H * (ambient_settings.Tamb - wall.T);
  end if;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-28, 100}, {100, -100}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {170, 213, 255},
            fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{-60, 100}, {-28, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                    FillPattern.Solid), Text(extent = {{38, -8}, {98, -54}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {0, 0, 0},
            fillPattern =                                                                                                    FillPattern.Solid, textString = "Amb"), Text(extent = {{60, 100}, {100, 70}}, lineColor = {255, 0, 0}, textString = "AS"), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                    FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {12, 60}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                    FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {12, 0}, rotation = 90), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50},
            fillPattern =                                                                                                    FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}, origin = {12, -60}, rotation = 90)}), Diagram(graphics));
end Convection_Wall2Ext_Clarke;
