within BuildingsAndPlants.Interfaces.Electrical;
connector PhasorPin "Phasor pin"
  Voltage vre, vim;
  flow Current ire, iim;
  annotation (
  Documentation(info="<html>
<p>This connector is composed of:</p>
<p>- two potential variable &QUOT;vre&QUOT; and &QUOT;vim&QUOT; which are respectively real and immaginary part of the voltage phasor [V];</p>
<p>- two flow variables &QUOT;ire&QUOT; and &QUOT;iim&QUOT; which are respectively real and immaginary part of the current phasor [A].</p>
</html>"));
end PhasorPin;
