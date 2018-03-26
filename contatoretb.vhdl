Entity contatoretb is port
(risultato: out bit_vector(3 downto 0));
End contatoretb;

Architecture cttb of contatoretb is
Component contatores is port
(clock, reset: IN bit; conteggio: OUT bit_vector(3 downto 0));
End Component;

For all : contatores use entity work.contatore(cont_arc);


Component clockone is port
(clk: OUT bit);
End Component;

For all : clockone use entity work.clock(cl);
Signal clocco: bit;
Signal reset: bit:='0';


Begin 

clock: clockone port map(clocco);
cc1: contatores port map(clocco, reset, risultato);


End;

