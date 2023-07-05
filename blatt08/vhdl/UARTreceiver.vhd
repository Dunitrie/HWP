-- example for a state machine with timed state transitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UARTreceiver is port(
	clk_50: in std_logic; -- 50MHzclock
	serial_input: in std_logic;
	
	heading_int: out std_logic_vector(7 downto 0);
	dataReady: out std_logic
) ;
end UARTreceiver;

architecture behavior of UARTreceiver is
	-- internal counter , used to measure timing
	-- max count : 2^7-1
	signal icnt: std_logic_vector(7 downto 0);
	type state_type is (idle, start_bit, s0, s1, s2, s3, s4, s5, s6, s7, stop_bit);
	signal state : state_type := idle;

	signal bitrate_clk: std_logic := '0';
	
begin
	process(clk_50)
	begin
		if rising_edge(clk_50) then
			-- 
			if icnt = "1000001" then -- 5000000/38400/2 in binary => So we have a rising_edge in BitRate in bitrate_signal
				icnt<= (others => '0');
				bitrate_clk <= not bitrate_clk;
			else
				icnt <= std_logic_vector(unsigned(icnt) + 1);
			end if;
		end if;
	end process;
		
	-- process for the state transitions
	process(bitrate_clk)
	begin
	
		if falling_edge(serial_input) and state = idle then
			icnt <= (others => '0');
			bitrate_clk <= '1';
		   state <= start_bit;
		end if;
		
		-- falling_edge => Middle of the bitrate_clk-cycle
		elsif falling_edge(bitrate_clk) then
			if state = start_bit then
				-- do nothing
				state <= s0 ;
				
			elsif state = s0 then
				heading_int(7) <= serial_input;
				
				-- goto state s1
				state <= s1;
				
			elsif state = s1 then
				heading_int(6) <= serial_input;

				state <= s2;
				
			elsif state = s2 then
				heading_int(5) <= serial_input;

				state <= s3;
				
			elsif state = s3 then
				heading_int(4) <= serial_input;

				state <= s4;
				
			elsif state = s4 then
				heading_int(3) <= serial_input;

				state <= s5;
				
			elsif state = s5 then
				heading_int(2) <= serial_input;
				state <= s6;
			
			elsif state = s6 then
				heading_int(1) <= serial_input;

				state <= s7;
			
			elsif state = s7 then
				heading_int(0) <= serial_input;
				state <= stop_bit;	
				
			elsif state = stop_bit then

				-- goto state s0
				state <= idle;
				dataReady <= '1';

			end if;
		end if;
	end process;
end behavior;

