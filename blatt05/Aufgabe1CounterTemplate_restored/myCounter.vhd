library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity myCounter is port(
	count 	: in std_logic; -- count signal: increase counter on rising edge
	rst 		: in std_logic; -- reset signal: set counter to 0 if rst = 0
	countOut : out std_logic_vector(5 downto 0)); -- counter output
end myCounter;

architecture behavioral of myCounter is
-- signals, etc.
	signal clk : std_logic := '0';
	signal sixBitCounter : std_logic_vector(5 downto 0) := "000000";

begin
  process (clk, rst)
  begin
	 if rst = '0' then -- Reset counter
		sixBitCounter <= "000000";  
	 elsif rising_edge(count) then
	  if sixBitCounter = "111111" then -- Overflow
		 sixBitCounter <= "000000";
	  else
		 sixBitCounter <= std_logic_vector(unsigned(sixBitCounter) + 1);
	  end if;
	 end if;
  end process;

  countOut <= sixBitCounter;



end behavioral;