library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ultrasound_controller is port(
	clk_50: in std_logic;
	
	-- enable signal
	enable : in std_logic;
	
	-- trigger, connected to ultrasound sensor
	trigger: inout std_logic;

	-- finished signal - high if system is idle
	finished : out std_logic;
		
	-- distance in cm (maximum = 255)
	distance : out std_logic_vector(7 downto 0)
);
end ultrasound_controller;



architecture behavior of ultrasound_controller is
	signal clk_counter: std_logic_vector(11 downto 0);
	signal distance_in: std_logic_vector(7 downto 0);
	
begin

process(clk_50, enable, trigger)
	begin
	finished <= '1';

	-- TODO
	-- Repeat the following:
	-- 	trigger to output 
	-- 	wait for 10mus
	-- 	trigger to input
	-- 	if rising_flank(trigger):
	--		measure till falling_flank(trigger)
	--			Somehow divide by 58
	-- 	put to LCD
	if rising_edge(enable) then
		finished <= '0';
		trigger <= '1';
		wait for 10 us;
		trigger <= '0';
		trigger <= 'Z';

		wait until rising_edge(trigger);
		--wait until falling_edge(trigger);
		-- measure time:
		-- with a 50MHz clock, we count the ns by counting to 50 with our rising-edge counter
		-- then to divide by 58, we simply let our clk count to binary(50*58)=101101010100
		clk_counter <= (others => '0');
		while (trigger=1) loop
			wait until rising_edge(clk_50);
			clk_counter <= std_logic_vector(unsigned(clk_counter) + 1);
			if clk_counter = "101101010100" then
				distance_in <= std_logic_vector(unsigned(distance_in) + 1);
				distance <= distance_in;
				clk_counter <= (others => '0');
			end if;	
		end loop;
	end if;

	end process;
end behavior;
