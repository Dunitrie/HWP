library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity UARTreceiver is port(
	clk_50:		in std_logic;
	serial: 	   in std_logic;
	reset: 	   in std_logic;
	data: 		out std_logic_vector(7 downto 0);
	dataReady:  out std_logic := '0'
);
end UARTreceiver;



architecture behavior of UARTreceiver is
	
	-- state machine
	type state_type is (idle, start, d, stop);
	signal state: state_type := idle;
	signal dataCount: std_logic_vector(2 downto 0) := "000";
	
	-- time count for each state, stay 50000000/9600 = 1302 clock cycles
	signal timeCount: std_logic_vector(13 downto 0) := (others => '0');
	
	constant timeCountMax: std_logic_vector(13 downto 0) := std_logic_vector(to_unsigned(5208, 14));
	constant timeCountMid: std_logic_vector(13 downto 0) := std_logic_vector(to_unsigned(2604, 14));
	
	-- flag to store if the stop condition was ok (high)
	signal stopOk: std_logic := '0';
	
begin

	-- state machine
	process(clk_50, reset)
	begin
		-- asynchronous reset
		if (reset = '1') then
			-- set all values to default
			state <= idle;
			stopOk <= '0';
			dataCount <= (others => '0');
			timeCount <= (others => '0');
			data <= (others => '0');
		-- synchronous state machine
		elsif rising_edge(clk_50) then
			-- start detection
			if state = idle then
				-- start bit is low
				if serial = '0' then
					state <= start;
				end if;
				timeCount <= (others => '0');
				
			elsif state = start then
				-- count till we are at the first bit and then go to receiving
				if timeCount = timeCountMax then
					state <= d;
					dataCount <= (others => '0');
					timeCount <= (others => '0');
				else 
					timeCount <= std_logic_vector(unsigned(timeCount)+1);
				end if;
				
			-- data receiving
			elsif state = d then
				-- increment bit to read
				if timeCount = timeCountMax then
					-- check if all 8 bits have been read
					if dataCount = "111" then
						state <= stop;
					else
						dataCount <= std_logic_vector(unsigned(dataCount) + 1);
					end if;
					
					timeCount <= (others => '0');
				
				else 					
				
					-- read data in the middle of the state
					if timeCount = timeCountMid then
						data(to_integer(unsigned(dataCount))) <= serial;
					end if;
				
					timeCount <= std_logic_vector(unsigned(timeCount)+1);
				end if;
			elsif state = stop then
			
				if timeCount = timeCountMax then
				
					-- reset correct stop condition
					timeCount <= (others => '0');
					stopOk <= '0';
					state <= idle;				
				else 					
				
					if timeCount = timeCountMid then
						-- check for correct stop condition
						stopOk <= serial;
					end if;
				
					timeCount <= std_logic_vector(unsigned(timeCount)+1);
				end if;
			end if;
		end if;	
	end process;

	
	
	dataReady <= '1' when stopOk = '1' and state = stop else '0';

end behavior;