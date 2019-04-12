within BuildingsAndPlants.CaseStudies.TemperatureControl.Electric_equivalent.LQ_Rooms.Base_Classes;

model LQ_Base
  // System matrix
  parameter Real K[2, 5] = [4.4072, 4.7416, 2.9566, 0.7632, 2.0505; 0.7632, 2.9566, 4.7416, 4.4072, 2.0505];
  Real SP[2, 2];
  // Transfer function from y_setpoint to u_setpoint
  Real up[2, 1];
  // Setpoint of the control variables
  Real u[2, 1];
  // Control variables
  Real x[5, 1];
  // States
  Real yp[2, 1];
  // Setpoint of output
  Modelica.Blocks.Interfaces.RealOutput u1 annotation(Placement(transformation(extent = {{52, 10}, {72, 30}}), iconTransformation(extent = {{52, 10}, {72, 30}})));
  Modelica.Blocks.Interfaces.RealOutput u2 annotation(Placement(transformation(extent = {{52, -30}, {72, -10}}), iconTransformation(extent = {{52, -30}, {72, -10}})));
  Modelica.Blocks.Interfaces.RealInput Vd "Temperature room 2" annotation(Placement(transformation(extent = {{-120, 16}, {-80, 56}}), iconTransformation(extent = {{-70, 40}, {-50, 60}})));
  Modelica.Blocks.Interfaces.RealInput Va "Temperature room 1" annotation(Placement(transformation(extent = {{-120, 70}, {-80, 110}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-60, 70})));
  Modelica.Blocks.Interfaces.RealInput Ve "Temperature Inside Wall" annotation(Placement(transformation(extent = {{-120, -40}, {-80, 0}}), iconTransformation(extent = {{-70, -40}, {-50, -20}})));
  Modelica.Blocks.Interfaces.RealInput Vc "Temperature wall 2" annotation(Placement(transformation(extent = {{-120, -100}, {-80, -60}}), iconTransformation(extent = {{-70, -80}, {-50, -60}})));
  Modelica.Blocks.Interfaces.RealInput Vb "Temperature wall 1" annotation(Placement(transformation(extent = {{-120, -70}, {-80, -30}}), iconTransformation(extent = {{-70, -60}, {-50, -40}})));
  Modelica.Blocks.Interfaces.RealInput Vref1 "Desired temperature room 1 " annotation(Placement(transformation(extent = {{-120, 42}, {-80, 82}}), iconTransformation(extent = {{-70, 10}, {-50, 30}})));
  Modelica.Blocks.Interfaces.RealInput Vref2 "Desired temperature room 1 " annotation(Placement(transformation(extent = {{-120, -10}, {-80, 30}}), iconTransformation(extent = {{-70, -10}, {-50, 10}})));
protected
  parameter Real A[5, 5] = [-0.0007651, 0.0003772, 0, 8.621e-05, 0.0003017; 1.408e-06, -2.917e-06, 0, 0, 0; 0, 0, -2.917e-06, 1.408e-06, 0; 8.621e-05, 0, 0.0003772, -0.0007651, 0.0003017; 0.0001352, 0, 0, 0.0001352, -0.0002704];
  parameter Real B[5, 2] = [1.078e-05, 0; 0, 0; 0, 0; 0, 1.078e-05; 0, 0];
  parameter Real C[2, 5] = [1, 0, 0, 0, 0; 0, 0, 0, 1, 0];
  // LQ gain
equation
  SP = -Modelica.Math.Matrices.inv(C * Modelica.Math.Matrices.inv(A - B * K) * B);
  x[1, 1] = Va;
  x[2, 1] = Vb;
  x[3, 1] = Vc;
  x[4, 1] = Vd;
  x[5, 1] = Ve;
  u[1, 1] = u1;
  u[2, 1] = u2;
  yp[1, 1] = Vref1;
  yp[2, 1] = Vref2;
  // LQ optimal control law
  up = SP * yp;
  u = (-K * x) + up;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 80}, {60, -80}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-36, 16}, {40, -14}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 127}, fillPattern = FillPattern.Solid, textString = "LQ")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end LQ_Base;
