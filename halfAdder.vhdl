Entity halfAdder is 
port(A,B: IN bit; Somma, C: OUT bit);
End halfAdder;


Architecture ha_arc of halfAdder is

Begin

Somma<=A XOR B;
C<= A AND B;


End;
