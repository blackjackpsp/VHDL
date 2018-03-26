Entity ffd is
port(D, clk: IN bit; Q: OUT bit);
End ffd;

--Questo flip flop d commuta sul fronte di salita

Architecture ffd_arc of ffd is

Signal temp: bit;


Begin

temp<=D when clk'event and clk='1';

Q<=temp; 





End;
