Entity fulladder is port
(I1,I2,CIN: IN bit; O, COUT: OUT bit );
End Entity;


Architecture full_arc of fulladder is

Component ha is port
(A,B: IN bit; Somma, C: OUT bit);
End Component;


For all : ha use entity work.halfAdder(ha_arc);

Signal sommaingressi:bit ;
Signal riportosommaingressi: bit;
Signal riportosommas: bit;

Begin


ha1: ha port map(I1, I2, sommaingressi, riportosommaingressi);
ha2: ha port map(sommaingressi, CIN, O, riportosommas);
COUT<=(I1 AND I2) or (CIN and (I1 or I2));



End;
