Entity shift4bit is port
(Load: IN bit; Ingresso: IN bit_vector(3 downto 0), clock: IN bit; Uscita: OUT bit_vector(3 downto 0));
End shift4bit;

Architecture sh4_arc of shift4bit is


Component flipflopd is port
(D, clk: IN bit; Q: OUT bit);
End Component

For all : flipflopd use entity work.ffd(ffd_arc);


Begin




End;
