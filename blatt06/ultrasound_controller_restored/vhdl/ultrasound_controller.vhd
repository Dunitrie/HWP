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
	constant maxCounter : std_logic_vector(4 downto 0) := "11001";
	constant maxCounter_ns : std_logic_vector(9 downto 0) := "1111101000";
	
	signal no_response_flag : std_logic := '0';

	signal counter: std_logic_vector(4 downto 0);
	
	signal distance_counter: std_logic_vector(5 downto 0) := "000000";
		
	signal ns_counter: std_logic_vector(9 downto 0) := "0000000000";
	signal us_counter: std_logic_vector(14 downto 0) := "000000000000000";
	signal ms_counter: std_logic_vector(2 downto 0) := "000";
	
begin


-- We implement multiple clocks for ns, us and ms
ns_clock_counter: process(clk_50)
begin
	if rising_edge(clk_50) then
		if counter = maxCounter then -- Counts up to 1k
			counter <= (others => '0');
			ns_counter <= std_logic_vector(unsigned(ns_counter) + 1);
		else
			counter <= std_logic_vector(unsigned(counter) + 1);
		end if;
	end if;

end process;



us_clock_counter: process(clk_50)
begin
	if rising_edge(clk_50) then
		if ns_counter = maxCounter_ns then
			ns_counter <= (others => '0');
			us_counter <= std_logic_vector(unsigned(us_counter) + 1);
		--else
		end if;
		
		-- Reset after certain time 
		if us_counter = "111111111111111" then
			us_counter <= (others => '0');
		end if;
	end if;
end process;

ms_clock_counter: process(clk_50)
begin
	if rising_edge(clk_50) then
		if us_counter = "000001111101000" then -- 1000 (decimal)
			us_counter <= (others => '0');
			ms_counter <= std_logic_vector(unsigned(ms_counter) + 1);
		end if;
		
		-- Reset after certain time (Our max time is 3 ms, so we simply reset after 7 ms)
		if ms_counter = "111" then
			ms_counter <= (others => '0');
		end if;
	end if;
end process;



process(enable, trigger)
	-- We implement these counters because we received errors, when our loops were too long
	variable inner_loop_counter : integer := 0;
	variable outer_loop_counter : integer := 0;
	

	begin
	finished <= '1'; -- This value is supposed to be 0 exactly, if we're not in the loop
	
	-- This works like follows:
	-- 	set trigger to output 
	-- 	wait for 10mus 
	-- 	set trigger to input
	-- 	if rising_flank(trigger):
	--		measure till falling_flank(trigger)
	--			Somehow divide by 58
	-- 	put to LCD

	if rising_edge(enable) then	-- Wait for enabling
		finished <= '0';
		
		
		trigger <= '1'; -- send signal
		
		us_counter <= (others => '0'); --reset counters
		ns_counter <= (others => '0');
		while not us_counter = "0000000001010" loop -- Wait 10 us
		end loop;		
		trigger <= '0';
		trigger <= 'Z'; -- Disable trigger for FPGA to only be sensible to the sensor
		
		
		us_counter <= (others => '0'); -- Reset all counters
		ns_counter <= (others => '0');
		ms_counter <= (others => '0');
		-- If we waited too long, we put up a no-response-flag and return 0 as distance
		while trigger='0' and no_response_flag = '0' and outer_loop_counter < 100 loop
			inner_loop_counter := 0;
			while trigger='0' and no_response_flag = '0' loop -- We split in inner and outer loop because 
																			  -- we can't have too big loops
				if ms_counter = "011" then -- if we waited for 3 miliseconds, we set the flag
					no_response_flag <= '1';
				end if;
				inner_loop_counter := inner_loop_counter + 1;
				
				if inner_loop_counter >= 9999 then
					exit;
				end if;
				
			end loop;
			outer_loop_counter := outer_loop_counter + 1;
		end loop;
		
		
		if no_response_flag = '0' then 
			-- Measure distance
			-- Since (if everything works) our loop from before breaks, if trigger = 1, this while looping 
			-- is equivalent to measuring the time, when trigger is set to 1
			ns_counter <= (others => '0');
			while trigger='1' loop
				if ns_counter = "0000111010" then -- Count to 58 (instead of dividing by 58)
					distance_counter <= std_logic_vector(unsigned(distance_counter) + 1);
					ns_counter <= (others => '0');
				end if;
			end loop;
			distance <= distance_counter;
		else 
			distance <= (others => '0'); -- If we didn't find anything we return distance 0
		end if;
		no_response_flag <= '0';
	end if;
	end process;
end behavior;
