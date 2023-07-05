−− example for a state machine with timed state transitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity asd is port(
	clk_50: in std_logic; −− 50MHzclock
	someOutput : out std_logic
) ;
end asd ;

architecture behavior of asd is
	−− internal counter , used to measure timing
	−− max count : 524288−1
	signalicnt: std_logic_vector(18 downto 0 ) ;
	−− define a new type ( like enum in C)
	type state_type is(init, s0, s1);
	−− signal to hold the state
	signal state: state_type:= init;
	
begin
	−− process for the state transitions
	process(clk_50)
	begin
		if rising_edge(clk_50) then
			if state = init then
			−− r e s e t t h e i n t e r n a l count
			icnt <= (others => ’0’);
			−− goto s t a t e s0
			s t a t e <= s0 ;
			elsif state = s0 and unsigned (icnt) = 500000 then
			−− s0 −> s1 a f t e r 10 ms
			−− r e s e t t h e i n t e r n a l count
			icnt <= (others => ’0’);
			−− goto s t a t e s1
			state <= s1;
			elsif state = s1 and unsigned (icnt) = 50000 then
			−− s1 −> s0 a f t e r 1 ms
			−− r e s e t t h e i n t e r n a l count
			icnt <= (others => ’0’);
			−− goto s t a t e s0
			state <= s0 ;
			else
			−− increment t h e count
			icnt <= std_logic_vector( unsigned (icnt)+1);
			end i f ;
		end i f ;
	end process;

	−− process to control the output
	process(state)
		begin
			if state = init then
				someOutput <= ’ 0 ’ ;
			elsif state = s0 then
				someOutput <= ’ 1 ’ ;
			else
				someOutput <= ’ 0 ’ ;
			end i f ;
			end process;
end behavior;

