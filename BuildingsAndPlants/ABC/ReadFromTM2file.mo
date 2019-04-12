within BuildingsAndPlants.ABC;

model ReadFromTM2file
  Modelica.Blocks.Sources.CombiTimeTable table(
    tableOnFile = true,
    fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/BuildingsAndPlants/Resources/testFile.txt",
    tableName = "pippo",
    smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    columns = 2:3);
  parameter String fileName = "Resources/DOEData/" "File where the matrix is stored";
  annotation(
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1));
end ReadFromTM2file;