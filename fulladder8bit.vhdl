Entity fulladder8bit is
port(Ingresso1: IN bit_vector(7 downto 0); Ingresso2: IN bit_vector(7 downto 0); cin: IN bit; somma: OUT bit_vector(7 downto 0); cout: OUT bit);
End fulladder8bit;


Architecture fa8_arc of fulladder8bit is

Component full is port
(I1,I2,CIN: IN bit; O, COUT: OUT bit);
End Component;

For all: full use entity work.fulladder(full_arc);


Signal sommatoria: bit_vector(7 downto 0);

Begin

fa1: full port map(Ingresso1(0), Ingresso2(0), cin, somma(0), sommatoria(0));
fa2: full port map(Ingresso1(1), Ingresso2(1), sommatoria(0), somma(1), sommatoria(1));
fa3: full port map(Ingresso1(2), Ingresso2(2), sommatoria(1), somma(2), sommatoria(2));
fa4: full port map(Ingresso1(3), Ingresso2(3), sommatoria(2), somma(3), sommatoria(3));
fa5: full port map(Ingresso1(4), Ingresso2(4), sommatoria(3), somma(4), sommatoria(4));
fa6: full port map(Ingresso1(5), Ingresso2(5), sommatoria(4), somma(5), sommatoria(5));
fa7: full port map(Ingresso1(6), Ingresso2(6), sommatoria(5), somma(6), sommatoria(6));
fa8: full port map(Ingresso1(7), Ingresso2(7), sommatoria(6), somma(7), cout);







End;
