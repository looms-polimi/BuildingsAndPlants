within BuildingsAndPlants.Media;
package Constants "Pakage with constants"
  extends Modelica.Icons.UtilitiesPackage;
  final constant SpecificHeatCapacity cp_a = 1005 "Specific heat capacity of dry air";
  final constant SpecificHeatCapacity cp_v = 1870 "Specific heat capacity of water vapour";
  final constant SpecificHeatCapacity cp_l = 4186 "Specific heat capacity of liquid water";
  final constant SpecificEnthalpy h_v_3pt = 2501 * 1e3 "Specific enthalpy of water vapour at triple point (0?C) [J/Kg]";
  final constant SpecificHeatCapacity Ra = 286.9 "Gas constant of dry air";
  final constant SpecificHeatCapacity Rv = 461.5 "Gas constant of water vapour in moist air";
  final constant Density d_l = 1000 "density of subcooled water";
  final constant MolarMass MMa = 24 "molar mass of dry air";
  final constant MolarMass MMw = 14 "molar mass of water";
  final constant Pressure patm = 101325 "Atmospheric pressure";
end Constants;
