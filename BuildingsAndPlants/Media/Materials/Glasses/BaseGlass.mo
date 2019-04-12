within BuildingsAndPlants.Media.Materials.Glasses;
record BaseGlass
  extends Modelica.Icons.Record;
  parameter Modelica.SIunits.ThermalConductivity lambda "Thermal conductivity";
  parameter Modelica.SIunits.SpecificHeatCapacity cp "Specific heat capacity";
  parameter Modelica.SIunits.Density ro "Mass density";
  /*
      parameter Real R(unit="m2.K/W") 
        "Thermal resistance of a unit area of material";
     
      parameter Integer nStaRef(min=0) = 3 
        "Number of state variables in a reference material of 0.2 m concrete";
      parameter Integer nSta(min=1)=max(1, integer(ceil(nStaReal))) 
        "Actual number of state variables in material" 
        annotation(Evaluate=true, Dialog(tab="Advanced"));
      parameter Boolean steadyState= (c == 0 or d == 0) 
        "Flag, if true, then material is computed using steady-state heat conduction"
        annotation(Evaluate=true);
      parameter Real piRef=331.4 
        "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete" 
        annotation (Dialog(tab="Advanced"));
      parameter Real piMat=if steadyState then piRef else x*sqrt(c*d)/sqrt(k) 
        "Ratio x/sqrt(alpha)" 
        annotation(Evaluate=true, Dialog(tab="Advanced"));
      parameter Real nStaReal(min=0) = nStaRef*piMat/piRef 
        "Number of states as a real number" 
        annotation (Dialog(tab="Advanced"));
    */
end BaseGlass;
