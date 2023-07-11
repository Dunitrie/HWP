-- Copyright 2018: Benjamin Voelker
-- voelkerb@informatik.uni-freiburg.de
-- DataAccumulator: This module will buffer 9 bytes from a uart interface and combine it 
-- MSB first 
-- For LSB first, look at the comments
-- TODO: make MSB-, LSB-first a generic

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity dataAccumulator is port(
	clk_50:			in std_logic;
	reset:			in std_logic;
	data_in: 		in std_logic_vector(7 downto 0);
	data_in_ready:	in std_logic;
	data_out:		out std_logic_vector(71 downto 0);
	data_out_ready:out std_logic := '0'
);
end dataAccumulator;



architecture behavior of dataAccumulator is
	-- For first Byte = MSB
	signal dataCount: integer range 0 to 8 := 8;
	-- For first Byte = LSB
	--signal dataCount: integer range 0 to 5 := 0;
	signal data: std_logic_vector(71 downto 0) := (others => '0');
	signal uart_enable : std_logic := '0';
	
begin
	
	pr: process(clk_50, reset)
	begin
		-- asynchronous reset
	   if (reset = '1') then
			-- set everything to initial 
			data_out_ready <= '0';
			uart_enable <= '0';
			data_out <= (others => '0');
			data <= (others => '0');
			dataCount <= 8;
			--dataCount <= 0;
		-- synchronous state machine
		elsif rising_edge(clk_50) then
			-- data out is 1 for a single clk cycle
			data_out_ready <= '0';
			-- if a new data is available and no data was available before
			if data_in_ready = '1' and uart_enable = '0' then
				-- indicate that data is availble which is only reset if data_in_ready is '0'
				uart_enable <= '1';
				-- store 8 bit revered in the vector 
				data(((dataCount) + 1) * 8 - 1 downto ((dataCount)) * 8) <= data_in;
				-- -> first byte that comes in will be the MSB if counting down, otherwise it will be LSB
				--dataCount <= dataCount + 1;
				dataCount <= dataCount - 1;
				-- Stop condition for first Byte = MSB
				if dataCount = 0 then
				-- stop condition for first Byte = LSB
				--if dataCount = 5 then
					data_out <= data;
					-- Last Byte = MSB
					--data_out(47 downto 40) <= data_in;
					-- Last Byte = LSB
					data_out(7 downto 0) <= data_in;
					-- set ready signal
					data_out_ready <= '1';
					-- reset counter
					--dataCount <= 0;
					dataCount <= 8;
				end if;
			-- If uart ready is '1' for more than one clk cycle, this will prevent 
			-- to read in all bytes during first ready phase
			elsif data_in_ready = '0' and uart_enable = '1' then
				uart_enable <= '0';
			end if;
		end if;
	end process;
end behavior;