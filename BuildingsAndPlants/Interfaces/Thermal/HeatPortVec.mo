within BuildingsAndPlants.Interfaces.Thermal;
connector HeatPortVec "Vector of heat port"
  parameter Integer n(min = 1) = 2 "No. of elements";
  Temperature T[n] "temperature";
  flow HeatFlowRate Q_flow[n] "heat rate";
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {255, 0, 0}, fillColor = {255, 180, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Text(extent = {{-62, 72}, {58, -48}}, lineColor = {0, 0, 0}, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "n")}),
      Documentation(info="<html>
<p>Vector of n heat port</p>
</html>"));
end HeatPortVec;
