within BuildingsAndPlants.Utilities;
model HPvector_VectOfHPs "HeatPortVector from vector of HeatPort"
  parameter Integer n = 2 "No. of elements";
  Interfaces.Thermal.HeatPortVec vecHP(n = n) annotation(
  Placement(transformation(extent = {{-62, 20}, {60, 40}}), iconTransformation(extent = {{-60, 20}, {60, 40}})));
  Interfaces.Thermal.HeatPort vecOfHPs[n] annotation(
  Placement(transformation(extent = {{-60, -40}, {60, -20}}), iconTransformation(extent = {{-60, -40}, {60, -20}})));
equation
  for i in 1:n loop
    vecOfHPs[i].T = vecHP.T[i];
    vecOfHPs[i].Q_flow + vecHP.Q_flow[i] = 0;
  end for;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 20}, {100, -20}}, lineColor = {255, 170, 170}, fillColor = {255, 170, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}),
    Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">This model creates a heat port vector from n heat port.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">It is used in <a href=\"BuildingsAndPlants.Components.BaseComponents.Water.Pipes.WaterPipeExchanging_Nvols\">WaterPipeExchanging_Nvols</a>.</span></p>
</html>"));
end HPvector_VectOfHPs;
