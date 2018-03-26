

Entity Contatore is port

(clock, reset: IN bit; conteggio: OUT bit_vector(3 downto 0));
End Contatore;

Architecture cont_arc of Contatore is

Component ff is
port(D, clk: IN bit; Q: OUT bit);
End Component;


For all: ff use entity work.ffd(ffd_arc);

Signal x0: bit:='0';
Signal x1: bit:='0';
Signal x2: bit:='0';
Signal x3: bit:='0';
Signal x1primo: bit;
Signal x0primo: bit;
Signal x2primo: bit;
Signal x3primo: bit;

Begin

x0primo<=((NOT x1) AND(NOT x0)) OR (x1 AND (NOT x0));
x1primo<=((NOT x1) AND x0) OR (x1 AND (NOT x0));
x2primo<=(x2 AND (NOT x1)) OR ((NOT x2) AND (x1) AND (x0)) OR (x2 and x1 and (NOT x0));
x3primo<=(x3 and (NOT x1)) OR ((NOT x3)AND x2 and x1 and x0) OR (x3 and x1 and (NOT x0));

ffd0: ff port map(x0primo, clock, x0);

ffd1: ff port map(x1primo, clock, x1);

ffd2: ff port map(x2primo, clock, x2);

ffd3: ff port map(x3primo, clock, x3);


conteggio(0)<=x0;
conteggio(1)<=x1;
conteggio(2)<=x2;
conteggio(3)<=x3;


End;
