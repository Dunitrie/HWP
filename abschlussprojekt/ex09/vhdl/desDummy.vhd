library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.math_real.ceil;
USE ieee.math_real.floor;

entity desDummy is
	port(
		clk_50   : in std_logic;
		reset    : in std_logic;
		data_out : out std_logic_vector(71 downto 0);
		start	   : out std_logic := '0'
	);
end desDummy;

architecture Behavioral of desDummy is

	signal counter: std_logic_vector(31 downto 0) := (others => '0');
	signal started : std_logic := '0';
	constant countMax: std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(50000000, 32));
begin
	cnt : process(clk_50)
	begin
		if reset = '1' then
			start <= '0';
			started <= '0';
			counter <= (others => '0');
		elsif rising_edge(clk_50) then
			start <= '0';
			if counter = countMax then
				counter <= (others => '0');
				start <= '1';
				started <= '1';
			elsif started = '0' then
				counter <= std_logic_vector(unsigned(counter) + 1);
			end if;
		end if;
	end process;
	-- Use as required
	data_out <= "010110100011000100111001111011001001011001010110001100100011101100011000"  -- cipher KEY123456
	-- data_out <= "010010110100010101011001001100010011001000110011001101000011010100110110"  -- plain KEY123456

end Behavioral;
