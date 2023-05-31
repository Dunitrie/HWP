library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity myCounter is port(
	count 	: in std_logic; -- count signal: increase counter on rising edge
	rst 		: in std_logic; -- reset signal: set counter to 0 if rst = 0
	countOut : out std_logic_vector(2 downto 0)); -- counter output
end myCounter;

architecture behavioral of myCounter is
-- signals, etc.


begin

-- TODO
	type myVarArray is array (15 downto 0) of integer;
	type sixBitCounter is array (5 downto 0) of std_logic;

end behavioral;