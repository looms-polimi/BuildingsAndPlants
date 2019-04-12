within BuildingsAndPlants.Interfaces.Electrical;
connector PosNegPins "Positive-negative electircal pins"

  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
  Placement(transformation(extent = {{-20, 40}, {20, 80}}), iconTransformation(extent = {{-10, 20}, {10, 40}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
  Placement(transformation(extent = {{-20, -80}, {20, -40}}), iconTransformation(extent = {{-10, -20}, {10, 0}})));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics={  Rectangle(extent = {{-50, 100}, {50, -100}}, lineColor = {0, 0, 0}, fillColor = {240, 240, 240},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-30, 80}, {30, 20}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Rectangle(extent = {{-30, -20}, {30, -80}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end PosNegPins;
