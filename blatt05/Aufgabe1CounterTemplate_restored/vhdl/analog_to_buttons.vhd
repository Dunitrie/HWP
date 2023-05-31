-- analog_to_buttons
-- converts the reading of the adc into the corresponding button


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity analog_to_buttons is port(
	analogIn : in std_logic_vector(11 downto 0);
	-- Wir hatten in der Vorlage button1 und button3, obwohl im Blatt 4 und 5 stand. 
	-- Wir verwenden 4 für 1 und 5 für 3;
	button1pressed : out std_logic;
	button3pressed : out std_logic
);
end analog_to_buttons;


architecture behavior of analog_to_buttons is
begin
	process(analogIn)
	begin 
		button1pressed <= '0'; -- Initialize output signals
		button3pressed <= '0';

		if (unsigned(analogIn) <= 2800 and unsigned(analogIn) <= 2040) then button1pressed <= '1';
		elsif (unsigned(analogIn) <= 3600 and unsigned(analogIn) >= 2840) then button3pressed <= '1';
		end if;
	end process; 

end behavior;