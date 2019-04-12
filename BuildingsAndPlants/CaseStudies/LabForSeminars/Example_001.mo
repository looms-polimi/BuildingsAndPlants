within BuildingsAndPlants.CaseStudies.LabForSeminars;

model Example_001
  BuildingsAndPlants.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15,Tstart = 298.15, n = 100, ro(displayUnit = "kg/m3")) annotation(
    Placement(visible = true, transformation(origin = {-20, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  BuildingsAndPlants.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
    Placement(visible = true, transformation(origin = {60, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner BuildingsAndPlants.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-178, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
    Line(points = {{-10, 0}, {44, 0}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
end Example_001;