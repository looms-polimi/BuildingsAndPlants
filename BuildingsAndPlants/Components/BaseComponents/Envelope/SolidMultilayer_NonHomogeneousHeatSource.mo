within BuildingsAndPlants.Components.BaseComponents.Envelope;

model SolidMultilayer_NonHomogeneousHeatSource
  extends SolidMultilayer_NonHomogeneous;
  parameter Integer idxHeatSource = 1 "Index of layer receiving heat from internalHeatPort";
  BuildingsAndPlants.Interfaces.Thermal.HeatPort internalHeatPort annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 110}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
equation
  connect(internalHeatPort, layer[idxHeatSource].surf);
end SolidMultilayer_NonHomogeneousHeatSource;
