-- Copyright 2019: Marc Pfeifer, Benjamin Voelker, University of Freiburg
-- {pfeiferm, voelkerb}@informatik.uni-freiburg.de
-- Displays a given amount of symbols on the LCD.

-- INCLUDES --
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ENTITY --
entity symbolsToLcd is 
    generic(
        -- Number of symbols to show.
        numberOfSymbols : integer := 9;
        -- Bit-width for one symbol.
        symbolWidth : integer := 8
    );
    port(
        -- Clock.
        clk: in std_logic;
        -- Symbols to display.
        symbols : in std_logic_vector((numberOfSymbols * symbolWidth) - 1 downto 0);
        -- Trigger write to display.
        show_symbols : in std_logic;
        -- Connection to LCD module.
        lcd_ready: in std_logic;
        lcd_data: out std_logic_vector(7 downto 0);
        lcd_posX: out std_logic_vector(4 downto 0);
        lcd_posY: out std_logic_vector(1 downto 0);
        lcd_write_n: out std_logic;
        lcd_clear_n: out std_logic
        
    );
end symbolsToLcd;

-- ARCHITECTURE --
architecture behavior of symbolsToLcd is

	-- Define states for internal state machine and the state machine signal.
	type state_type is (idle, printSymbols);
	signal state : state_type := idle;
	
	-- The current character and line that is written.
	signal lineCount : std_logic_vector (1 downto 0);
	signal charCount : std_logic_vector (4 downto 0);
	
	-- Clock counter used for internal timing.
	signal counter : unsigned(7 downto 0) := (others => '0'); 
    
    -- Internal storage for the symbol data.
    signal symbols_int : std_logic_vector(71 downto 0) := (others => '0');
	
begin
	
	-- Main process.
	process(clk)
	begin
		if rising_edge(clk) then
		
			-- Increase internal timing counter.
			counter <= counter + 1;
		
			-- Reset lcd write trigger after some time.
			if counter > 8 then
				 lcd_write_n <= '1';
			end if;
			
			-- We never clear anything.
			lcd_clear_n <= '1';

			-- Idle state: Wait for trigger.
			if state = idle then
                lcd_write_n <= '1';  -- Reset the lcd write trigger by default.
                if show_symbols = '1' then  -- If a trigger is received, reset all signals and switch to print state.
                    symbols_int <= symbols;
                    state <= printSymbols;
                    charCount <= (others => '0');
                    lineCount <= (others => '0');
                    counter <= (others => '0');
                end if;
					 
         -- Print state: Prints the given symbols on the lcd.       
         elsif state = printSymbols then
				 -- If all symbols had been printed swicth back to idle state. 
				 if unsigned(charCount) = numberOfSymbols then
					  state <= idle;
				 end if;
				 -- Check if the display driver is ready and if a short safety delay is over.
				 if lcd_ready = '1' and counter > 10 then
					  -- Asign the signals for the display driver
					  lcd_posX <= charCount;
					  lcd_posY <= lineCount;  -- We currently never leave frist line.
					  lcd_write_n <= '0';
					  -- Extract the current symbol from the input data (in reverse order) and put it on the drivers data line.
					  for i in 0 to numberOfSymbols - 1 loop
							if i = unsigned(charCount) then
								lcd_data <= symbols_int((symbolWidth * (numberOfSymbols - i) - 1) downto (symbolWidth  * (numberOfSymbols - i - 1)));
							end if;
					  end loop;
					  -- Increase the symbol count.
					  charCount <= std_logic_vector(unsigned(charCount) + 1);
					  -- Reset the timing counter.
					  counter <= (others => '0');
				 end if;
			end if;
			
		end if;
	end process;
	
end behavior;