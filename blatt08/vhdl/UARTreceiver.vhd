−− example for a state machine with timed state transitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UARTreceiver is port(
	clk_50: in std_logic; −− 50MHzclock
	serial_input: in std_logic_vector(7 downto 0);
	
	heading_int: out std_logic_vector(7 downto 0);
	dataReady: out std_logic;
) ;
end UARTreceiver;

architecture behavior of UARTreceiver is

	-- internal counter , used to measure timing
	-- max count : 2^7-1
	signal icnt: std_logic_vector(7 downto 0 );
	type state_type is (init, start_bit, s0, s1, s2, s3, s4, s5, s6, s7, stop_bit);
	signal state: state_type:= init;
	signal bitrate_signal: std_logic = 0;
	
begin
	process(clk_50)
	begin
		if rising_edge(clk_50) then
			-- 
			if icnt = "1000001" then -- 5000000/38400/2 in binary => So we have a rising_edge in BitRate in bitrate_signal
				icnt<= (others => '0')
				bitrate_signal <= not bitrate_signal;
			else
				icnt <= std_logic_vector(unsigned(icnt) + 1);
	end 
	
	-- process for the state transitions
	process(bitrate_signal)
	begin
		if rising_edge(bitrate_signal) then
			if state = init then
			-- reset the internal count
			icnt <= (others => ’0’);
			-- goto state s0
			state <= start_bit;
			if state = start_bit then
			-- do nothing
			
			state <= s0 ;
			elsif state = s0 and unsigned (icnt) = 500000 then
			-- s0 −> s1 after 10 ms
			-- reset the internal count
			icnt <= (others => ’0’);
			-- goto state s1
			state <= s1;
			elsif state = s1 and unsigned (icnt) = 50000 then
			-- s1 −> s0 after 1 ms
			-- reset the internal count
			icnt <= (others => ’0’);
			-- goto state s0
			state <= s0 ;
			else
			-- increment the count
			icnt <= std_logic_vector( unsigned (icnt)+1);
			end if;
		end if ;
	end process;

	-- process to control the output
	process(state)
	begin
		if state = init then
			someOutput <= ’ 0 ’ ;
		elsif state = s0 then
			someOutput <= ’ 1 ’ ;
		else
			someOutput <= ’ 0 ’ ;
		end if ;
	end process;
end behavior;

