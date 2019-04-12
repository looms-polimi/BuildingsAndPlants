within BuildingsAndPlants;

package Trials


  model ExampleMoistAir2
    Media.Substances.MoistAir air;
    parameter Modelica.SIunits.Volume V=2;
    parameter Modelica.SIunits.MassFraction Xa=0.005;
    parameter Modelica.SIunits.ThermalConductance G=50;
    Modelica.SIunits.Mass M;
    Modelica.SIunits.Power Q;
    Modelica.SIunits.Energy E;
    Modelica.SIunits.Temperature Ta(start=273.15+20);
    Modelica.SIunits.Pressure pa(start=100000);
    Modelica.SIunits.Temperature Te;
  equation
  
    E = M*(air.h-pa/air.d);
    M = V*air.d;
    der(M) = 0;
    der(E) = Q - G*(Ta-Te);
    
    Ta = air.T;
    pa = air.p;
  
    air.X = Xa;
    Te = 273.15+20;
    Q = 100;
  
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.6));
  end ExampleMoistAir2;












  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Trials;
