library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity soundGenerator is port(
	-- count 	: in std_logic; -- count signal: increase counter on rising edge
	-- rst 		: in std_logic; -- reset signal: set counter to 0 if rst = 0
	clk_50	: in std_logic;
	sound 	: out std_logic); -- sound output
end soundGenerator;

architecture behavioral of soundGenerator is
-- signals, etc.
	signal Counter : std_logic_vector(17 downto 0) := "000000000000000000";
   signal sound_flag : std_logic := '0';

begin
  process (clk_50)
  begin
	 if rising_edge(clk_50) then
	 -- We have a 50 MHz clock. To generate 400 Hz, we have to switch at 50,000,000/400 = 25,000 
	  if Counter = "111101000010010000" then
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