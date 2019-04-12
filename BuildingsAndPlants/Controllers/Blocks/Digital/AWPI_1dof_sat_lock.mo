within BuildingsAndPlants.Controllers.Blocks.Digital;

model AWPI_1dof_sat_lock
  extends BaseClasses.D_SISO_sat_lock;
  parameter Real K = 1 "Gain";
  parameter SI.Time Ti = 1 "Integral time";
  parameter Real CSmax = 1 "Max CS";
  parameter Real CSmin = 0 "Min CS";
  parameter Real CSstart = 0 "Initial CS";
  discrete Real xfo, xfoo, cso;
initial algorithm
  cs := CSstart;
  cso := cs;
  xfoo := cso - K * (SP - PV);
algorithm
  when sample(0, Ts) then
    xfo := (Ti * xfoo + Ts * cso) / (Ti + Ts);
    cs := max(CSmin, min(CSmax, xfo + K * (SP - PV)));
    if cs > cso and Fp or cs < cso and Fm then
      cs := cso;
    end if;
    xfoo := xfo;
    cso := cs;
    HI := cs >= CSmax;
    LO := cs <= CSmin;
  end when;
  annotation(
  Line(points = {{128, 30}, {128, 30}}, color = {0, 0, 127}, smooth = Smooth.None), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-24, 42}, {38, -34}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "dPI")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end AWPI_1dof_sat_lock;
