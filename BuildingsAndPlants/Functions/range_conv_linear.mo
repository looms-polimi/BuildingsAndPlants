within BuildingsAndPlants.Functions;
function range_conv_linear
  input Real u;
  input Real umin;
  input Real umax;
  input Real ymin;
  input Real ymax;
  output Real y;
algorithm
  // solve([a*umin+b=ymin,a*umax+b=ymax],[a,b]);
  // a=(ymin-ymax)/(umin-umax);
  // b=(umin*ymax-umax*ymin)/(umin-umax);
  y := max(ymin, min(ymax, (ymin - ymax) / (umin - umax) * u + (umin * ymax - umax * ymin) / (umin - umax)));
end range_conv_linear;
