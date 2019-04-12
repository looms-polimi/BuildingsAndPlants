within BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer;

model Convection_VV_gammaIn "Vector to vector convection, externally provided heat transfer coefficient"
  parameter Integer n = 2 "Lumps, both sides";
  parameter Area S = 1 "Area, both sides";
  parameter Boolean counterFlow = false "Swap vectors for counterflow";
  Interfaces.Thermal.HeatPortVec vs1(n = n) "side vector" annotation(
  Placement(transformation(extent = {{-80, 40}, {80, 60}}), iconTransformation(extent = {{-80, 40}, {80, 80}})));
  Interfaces.Thermal.HeatPortVec vs2(n = n) "side vector" annotation(
  Placement(transformation(extent = {{-80, -80}, {80, -60}}), iconTransformation(extent = {{-80, -80}, {80, -40}})));
  Modelica.Blocks.Interfaces.RealInput gamma annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
equation
  for i in 1:n loop
    if counterFlow then
      vs1.Q_flow[i] + vs2.Q_flow[n + 1 - i] = 0;
      vs1.Q_flow[i] = gamma * S / n * (vs1.T[i] - vs2.T[n + 1 - i]);
    else
      vs1.Q_flow[i] + vs2.Q_flow[i] = 0;
      vs1.Q_flow[i] = gamma + S / n * (vs1.T[i] - vs2.T[i]);
    end if;
  end for;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 40}, {80, -40}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-74, 20}, {-60, 40}, {-46, 20}, {-56, 24}, {-56, -24}, {-46, -20}, {-60, -40}, {-74, -20}, {-64, -24}, {-64, 24}, {-74, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{-14, 20}, {0, 40}, {14, 20}, {4, 24}, {4, -24}, {14, -20}, {0, -40}, {-14, -20}, {-4, -24}, {-4, 24}, {-14, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175}), Polygon(points = {{46, 20}, {60, 40}, {74, 20}, {64, 24}, {64, -24}, {74, -20}, {60, -40}, {46, -20}, {56, -24}, {56, 24}, {46, 20}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.HorizontalCylinder, smooth = Smooth.None, fillColor = {175, 175, 175})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Convection_VV_gammaIn;
