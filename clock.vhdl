Entity clock is
port(clk: OUT bit);
End clock;


Architecture cl of clock is

Begin

	Process 
			begin

				clk<='0';
		
				wait for 5 ms;
				
				clk<='1';
				
				wait for 5 ms;
				
			end process;	

End;

