Entity macchinatb is port
(uscita: out bit_vector (7 downto 0));
End macchinatb;


Architecture machinetb of macchinatb is
Component macchina is port
(clock: IN bit; X: IN bit_vector(7 downto 0); M: IN bit_vector(3 downto 0); C: IN bit; S: OUT bit_vector(7 downto 0));
End Component;

For all: macchina use entity work.macchina(macchina_arc);

Component clo is port
(clk: OUT bit);
End Component;

For all: clo use entity work.clock(cl);


Signal abilitazione: bit;
Signal ics: bit_vector (7 downto 0);
Signal emme: bit_vector (3 downto 0):="0011";
Signal ci: bit;

Begin

ci<='0' after 5 ms,
	'1' after 8 ms;
	
ics<="00001010";
	
	
clk1: clo port map(abilitazione);
machine: macchina port map(abilitazione, ics, emme, ci, uscita);


End;
