library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity motor_controller is
	port(
	clk_50 : in std_logic;
	speed : in std_logic_vector (9 downto 0);
	direction : in std_logic;
	motor_signal1 : out std_logic;
	motor_signal2 : out std_logic
	);

end motor_controller;

architecture behavior of motor_controller is

	begin
	process(clk_50)
	begin
	if direction ='1' then
		motor_signal1 <= '1';
		motor_signal2 <= '0';
	else
		motor_signal1 <= '0';
		motor_signal2 <= '1';
	end if;
	
	end process;
end behavior;

