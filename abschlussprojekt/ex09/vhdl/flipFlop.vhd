library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.math_real.ceil;
USE ieee.math_real.floor;

entity flipFlop is
	generic(
		bitWidth : integer := 1
	);
	port(
		reset    : in std_logic;
		set	   : in std_logic;
		data_in  : in std_logic_vector(bitwidth - 1 downto 0);
		data_out : out std_logic_vector(bitwidth - 1 downto 0) := (others => '0')
	);
end flipFlop;

architecture Behavioral of flipFlop is
	signal data_in_int: std_logic_vector(bitWidth - 1 downto 0) := (others => '0');
begin
	pr : process(set, reset)
	begin
		if reset = '1' then
			data_in_int <= (others => '0');
		elsif set = '1' then
			data_in_int <= data_in;
		else 
			data_in_int <= data_in_int;
		end if;
	end process;
	
data_out <= data_in_int;

end Behavioral;
