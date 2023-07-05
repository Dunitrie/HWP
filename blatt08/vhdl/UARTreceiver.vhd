-- example for a state machine with timed state transitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UARTreceiver is port(
	clk_50: in std_logic; -- 50MHzclock
	serial_input: in std_logic;
	
	heading_int: out std_logic_vector(7 downto 0);
	dataReady: out std_logic := '0';
	icnt: out std_logic_vector(11 downto 0)
) ;
end UARTreceiver;

architecture behavior of UARTreceiver is
	-- internal counter , used to measure timing
	-- max count : 2^7-1
	type state_type is (idle, start_bit, s0, s1, s2, s3, s4, s5, s6, s7, stop_bit);
	signal state : state_type := idle;
	signal state_flag : std_logic := '0';

	signal icnt1: std_logic_vector(11 downto 0):= (others => '0');


begin
	process(serial_input)
	begin
		if falling_edge(serial_input) and state = idle then
			state_flag <= '1';
		--elsif state = start_bit then
		--	state_flag <= '0';
		end if;
	end process;
	
	process(clk_50, serial_input, state, icnt1)
	begin
		if rising_edge(clk_50) then
		-- process for the state transitions
			icnt1 <= std_logic_vector(unsigned(icnt1) + 1);			
			icnt <= icnt1;
			
			if icnt1 = "101000101100" then -- 50000000/38400*2 in binary => So we take one measurement every tact
				icnt <= (others => '0');
				icnt1 <= (others => '0');
				
				if state_flag = '1' and state = idle then
					state <= start_bit;

				elsif state = start_bit then
					--icnt <= (others => '0');
					-- Initiate icnt as half the val for the required bitrate, so it always checks at the middle of the interval
					
					icnt <= "010100010110";
					icnt1 <= "010100010110";
					-- do nothing
					state <= s0 ;
					
				elsif state = s0 then
					heading_int(0) <= serial_input;
					
					-- goto state s1
					state <= s1;
					
				elsif state = s1 then
					heading_int(1) <= serial_input;

					state <= s2;
					
				elsif state = s2 then
					heading_int(2) <= serial_input;

					state <= s3;
					
				elsif state = s3 then
					heading_int(3) <= serial_input;

					state <= s4;
					
				elsif state = s4 then
					heading_int(4) <= serial_input;

					state <= s5;
					
				elsif state = s5 then
					heading_int(5) <= serial_input;
					state <= s6;
				
				elsif state = s6 then
					heading_int(6) <= serial_input;

					state <= s7;
				
				elsif state = s7 then
					heading_int(7) <= serial_input;
					state <= stop_bit;	
					
				elsif state = stop_bit then

					-- goto state s0
					state <= idle;
					dataReady <= '1';
				end if;
			end if;
		end if;
	end process;
end behavior;

