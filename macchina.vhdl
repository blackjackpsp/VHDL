Entity macchina is port
(clock: IN bit; X: IN bit_vector(7 downto 0); M: IN bit_vector(3 downto 0); C: IN bit; S: OUT bit_vector(7 downto 0));
End macchina;

Architecture macchina_arc of macchina is

Component counter is port
(clock, reset: IN bit; conteggio: OUT bit_vector(3 downto 0));
End Component;

For all: counter use entity work.contatore(cont_arc);

Component adder8 is port
(Ingresso1: IN bit_vector(7 downto 0); Ingresso2: IN bit_vector(7 downto 0); cin: IN bit; somma: OUT bit_vector(7 downto 0); cout: OUT bit);
End Component;

For all: adder8 use entity work.fulladder8bit(fa8_arc);
Signal accumulatore: bit_vector(7 downto 0);
Signal Mtemp: bit_vector(3 downto 0);

Signal accutemp: bit_vector(7 downto 0);
Signal carryin: bit:='0';
Signal carryout: bit;
Signal resetta: bit:='0';
Signal results: bit_vector(3 downto 0);
Signal vuoto: bit:='0';
Signal ripple: bit:='0';

Signal bla:bit;
Begin

accumulatore<="00000000" when C'event and C='1' 
				else accutemp when clock'event and clock='0'
				else accumulatore;
--resetto l'accumulatore sul fronte di salita di C
Mtemp<=M when C'event and C='1' else Mtemp;

full: adder8 port map(X, accumulatore, carryin, accutemp, carryout);

bla<=clock when C='1' else vuoto;

contatore: counter port map(bla, resetta, results);


--memorizzo il risultato della somma sul fronte successivo del clock

ripple<='1' when results=Mtemp and results /= "0000";
s<=accumulatore when ripple'event and ripple='1';

End;
