library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity soundGenerator is port(
	-- count 	: in std_logic; -- count signal: increase counter on rising edge
	-- rst 		: in std_logic; -- reset signal: set counter to 0 if rst = 0
	clk_50	: in std_logic;
	analogIn : in std_logic_vector(11 downto 0);
	sound 	: out std_logic); -- sound output
	
end soundGenerator;

architecture behavioral of soundGenerator is
-- signals, etc.
	signal Counter : std_logic_vector(17 downto 0) := "000000000000000000";
   signal sound_flag : std_logic := '0';

begin

	variable currentFrequency : std_logic_vector(17 downto 0) = "000000000000000000"
	variable frequency1_timer : std_logic_vector(17 downto 0) = "000011110100001001"
	variable frequency2_timer : std_logic_vector(17 downto 0) = "000111101000010010"
	variable frequency3_timer : std_logic_vector(17 downto 0) = "001111010000100100"
	variable frequency4_timer : std_logic_vector(17 downto 0) = "011110100001001000"
	variable frequency5_timer : std_logic_vector(17 downto 0) = "111101000010010000" 
	
	process (clk_50)
 
	
	-- We ignore it, if our signal is above 3000
	if (unsigned(analogIn) <= 200 and unsigned(analogIn) <= 0) then currentFrequency <= frequency1_timer;
	elsif (unsigned(analogIn) <= 1000 and unsigned(analogIn) >= 920) then currentFrequency <= frequency2_timer;
	elsif (unsigned(analogIn) <= 2000 and unsigned(analogIn) >= 1240) then currentFrequency <= frequency3_timer;
	elsif (unsigned(analogIn) <= 2800 and unsigned(analogIn) >= 2040) then currentFrequency <= frequency4_timer;
	elsif (unsigned(analogIn) <= 3600 and unsigned(analogIn) >= 2840) then currentFrequency <= frequency5_timer;	
	end if;
		
		
	  
	 if rising_edge(clk_50) then
	 -- We have a 50 MHz clock. To generate 400 Hz, we have to switch at 50,000,000/400 = 25,000
	 -- So we have to switch twice in that period 
	  if Counter = currentFrequency then
		 Counter <= (others => '0');
		 if sound_flag = '0' then -- Check, if sound was an output before
			sound <= '1';
			sound_flag <= '1';
		 else 
			sound <= '0';
			sound_flag <= '0';
		 end if;
	  else
		 Counter <= std_logic_vector(unsigned(Counter) + 1);
	  end if;
	 end if;
  end process;
end behavioral;