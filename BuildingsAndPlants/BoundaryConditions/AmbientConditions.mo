within BuildingsAndPlants.BoundaryConditions;
model AmbientConditions
  // Constants
  constant Integer SPM = 60 "seconds per minute";
  constant Integer MPH = 60 "minutes per hour";
  constant Integer SPH = SPM * MPH "seconds per minute";
  constant Integer HPD = 24 "hours per day";
  constant Integer DPY = 365 "days per year";
  constant Integer SPD = SPH * HPD "seconds per day";
  constant Integer SPY = SPD * DPY "seconds per year";
  constant Integer JUN21 = 172 "June 21 is day 172 of year";
  constant Integer DEC21 = 355 "December 21 is day 355 of year";
  // PARAMETERS --------------------------------------------------------------
  // *** General
  parameter Types.AmbCondVariabilty acv = Types.AmbCondVariabilty.ACV_constant "Variability of ambient conditions";
  parameter Integer doy_start(min = 1, max = DPY) = 1 "Day-of-year (1-365) of simulation start";
  parameter Integer hod_start(min = 0, max = HPD - 1) = 0 "hour-of-day (0-23) of simulation start";
  parameter Integer moh_start(min = 0, max = MPH - 1) = 0 "minute-of-hour (0-59) of simulation start";
  // *** Ambient air and wind properties
  parameter Pressure pa_avg = 101325 "Pressure (fixed)" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter MassFraction Xa_avg = 0.001 "Absolute humidity (fixed)" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter Temperature Ta_avg = 273.15 - 5 "Average temperature" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter TemperatureDifference Ta_Dex = 4 "Daily T excursion around day average" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter TemperatureDifference Ta_Yex = 4 "Yearly excursion of day T average around Ta_avg" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter Temperature Tref_DD = 273.15 + 20 "Ref T for degree day computation" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter Velocity wv = 0 "Wind velocity (fixed)" annotation(
  Dialog(tab = "Ambient air and wind"));
  parameter Angle wdir(min = 0, max = 360) = 0 "Wind direction (0?=N, 90?=E)" annotation(
  Dialog(tab = "Ambient air and wind"));
  // *** Sun, sky and ground properties
  parameter HeatFlux Phimax = 1000 "Max radiative flux" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Real azi0(min = 0, max = 360) = 90 "Constant or yearly avg azimuth (0?=N, 90?=E)" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Real azi_Yex = 20 "Yearly excursion of azimuth" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Real zen0(min = 0, max = 180) = 30 "Constant or avg daily max zenith (heigth on horizon)" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Real zen_Yex(min = 0, max = 180) = 10 "Yearly excursion of daily max zenith" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer esrh(min = 0, max = 23) = 5 "earliest sunrise hour (0-23) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer esrm(min = 0, max = 59) = 10 "earliest sunrise min (0-59) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer lsrh(min = 0, max = 23) = 8 "latest sunrise hour (0-23) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer lsrm(min = 0, max = 59) = 30 "latest sunrise min (0-59) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer essh(min = 0, max = 23) = 17 "earliest sunset hour (0-23) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer essm(min = 0, max = 59) = 30 "earliest sunset min (0-59) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer lssh(min = 0, max = 23) = 22 "latest sunset hour (0-23) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Integer lssm(min = 0, max = 59) = 15 "latest sunset min (0-59) for varying zen/azi" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Temperature Tsky = 273.15 + 10 "Sky temperature (fixed)" annotation(
  Dialog(tab = "Sun, sky, ground"));
  parameter Temperature Tgnd = 273.15 + 12 "Ground temperature (fixed)" annotation(
  Dialog(tab = "Sun, sky, ground"));
  // Time-related quantities
  Real hours "hours from sim start";
  Real days "days from sim start";
  Real hod "hour of day (0-24, real-valued, reset every day)";
  Time sod "second of day (0-86400, real-valued, reset every day)";
  Real doy "day of year (0-365, real-valued, reset every year)";
  Real soy "second of year (0-31536000, real-valued, reset every year)";
  Real yusw "yearly unit sine wave, max on JUN21 (thus approx min on DEC21)";
  // Ambient air properties
  Pressure pamb "Ambient air p";
  Temperature Tamb "Ambient air T";
  // Sun-related quantities
  Real azimuth(min = 0, max = 360) "Current ";
  Real zenith(min = 0, max = 180) "Current ";
  Real solarRad "Current ";
  Real DD "Degree day";
protected
  parameter Time soy_start = (doy_start - 1) * SPD + hod_start * SPH + moh_start * SPM;
  parameter Real trAvg = (esrh * MPH + esrm + lsrh * MPH + lsrm) / MPH / 2 "mean sunrise time in hours";
  parameter Real tsAvg = (essh * MPH + essm + lssh * MPH + lssm) / MPH / 2 "mean sunset time in hours";
  parameter Real Dtr = (lsrh * MPH + lsrm - esrh * MPH - esrm) / MPH / 2 "sunrise excursion in hours";
  parameter Real Dts = (lssh * MPH + lssm - essh * MPH - essm) / MPH / 2 "sunset excursion in hours";
  Real zenithMax, tr, ts, az, bz, cz, ar, br, cr;
equation
  // Degree day
  der(DD) = if Tref_DD > Tamb then (Tref_DD - Tamb) / SPD else 0;
  // Time-related quantities
  hours = time / SPH;
  days = hours / HPD;
  soy = time + soy_start - SPY * floor((time + soy_start) / SPY);
  sod = soy - SPD * floor(soy / SPD);
  hod = sod / SPH;
  doy = (soy - SPY * floor(soy / SPY)) / SPD;
  yusw = sin((soy - JUN21 * SPD) / SPY * 2 * pi + pi / 2);
  // sunrise and sunset time (in hours)
  tr = trAvg - Dtr * yusw;
  //sin(pi*(1/(3600*24*182)*time));
  ts = tsAvg + Dts * yusw;
  //sin(pi*(1/(3600*24*182)*time));
  // Ambient air properties
  pamb = pa_avg;
  zenithMax = zen0 + zen_Yex * yusw;
  // parabola coeffs for zenith angle
  az = -4 * zenithMax / (ts - tr) ^ 2;
  bz = 4 * zenithMax * (ts + tr) / (ts - tr) ^ 2;
  cz = -4 * zenithMax * ts * tr / (ts - tr) ^ 2;
  // parabola coeffs for solar radiation
  ar = -4 * Phimax / (ts - tr) ^ 2;
  br = 4 * Phimax * (ts + tr) / (ts - tr) ^ 2;
  cr = -4 * Phimax * ts * tr / (ts - tr) ^ 2;
  if acv == Types.AmbCondVariabilty.ACV_constant then
    Tamb = Ta_avg;
    zenith = zen0;
    azimuth = azi0;
    solarRad = Phimax;
  else
    Tamb = Ta_avg + Ta_Yex * yusw + Ta_Dex * sin(pi * (1 / (24 * 3600)) * time - 2 * 3.14 / 3);
    zenith = smooth(0, max(0, az * hod ^ 2 + bz * hod + cz));
    azimuth = azi0 + azi_Yex * yusw;
    solarRad = smooth(0, max(0, ar * hod ^ 2 + br * hod + cr));
  end if;
  annotation(
  defaultComponentName = "ambient_settings", defaultComponentPrefixes = "inner", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {180, 180, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, fillColor = {180, 255, 255}), Rectangle(extent = {{-100, -58}, {100, -100}}, lineColor = {0, 100, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {0, 100, 0}), Ellipse(extent = {{36, 88}, {86, 38}}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Ellipse(extent = {{-92, 48}, {-34, 30}}, lineColor = {180, 180, 180},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-68, 60}, {-26, 40}}, lineColor = {180, 180, 180},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-44, 54}, {0, 40}}, lineColor = {180, 180, 180},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-50, 44}, {0, 28}}, lineColor = {180, 180, 180},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-28, 50}, {28, 36}}, lineColor = {180, 180, 180},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {180, 180, 180}), Polygon(points = {{-100, -58}, {32, -58}, {16, -42}, {4, -34}, {-16, -30}, {-24, -34}, {-32, -26}, {-44, -18}, {-52, -16}, {-62, -20}, {-66, -24}, {-72, -20}, {-84, -16}, {-90, -14}, {-96, -16}, {-100, -20}, {-100, -34}, {-100, -58}}, lineColor = {105, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere, smooth = Smooth.None, fillColor = {105, 0, 0}), Polygon(points = {{100, -58}, {-10, -58}, {42, -64}, {72, -68}, {88, -70}, {100, -70}, {100, -58}}, lineColor = {80, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere, smooth = Smooth.None, fillColor = {80, 255, 255}), Text(extent = {{-98, 98}, {-58, 68}}, lineColor = {255, 0, 0}, textString = "AC")}), Diagram(graphics), experiment(StopTime = 1.58112e+07), experimentSetupOutput);
end AmbientConditions;
