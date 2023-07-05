-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "07/05/2023 15:20:17"
                                                            
-- Vhdl Test Bench template for design  :  UARTreceiver
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY UARTreceiver_vhd_tst IS
END UARTreceiver_vhd_tst;
ARCHITECTURE UARTreceiver_arch OF UARTreceiver_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC := '0';
SIGNAL dataReady : STD_LOGIC;
SIGNAL heading_int : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL icnt : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL serial_input : STD_LOGIC;
COMPONENT UARTreceiver
	PORT (
	clk_50 : IN STD_LOGIC;
	dataReady : OUT STD_LOGIC;
	heading_int : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	icnt : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	serial_input : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : UARTreceiver
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	dataReady => dataReady,
	heading_int => heading_int,
	icnt => icnt,
	serial_input => serial_input
	);
init : PROCESS                                               
-- variable declarations                                  
BEGIN

WAIT;
END PROCESS init;
always: PROCESS

BEGIN                                                        
        -- code executes for every event on sensitivity list  
	serial_input <= '1';
	wait for 100 us;
	serial_input <= '0';
	wait for 26 us;
	
	serial_input <= '1';
	wait for 26 us;
	serial_input <= '0';
	wait for 26 us;
	serial_input <= '0';
	wait for 26 us;
	serial_input <= '1';
	wait for 26 us;
	serial_input <= '0';
	wait for 26 us;
	serial_input <= '1';
	wait for 26 us;
	serial_input <= '1';
	wait for 26 us;
	serial_input <= '0';
	wait for 26 us;
	
	
	serial_input <= '1';
	
WAIT;                
END PROCESS always;    

clk_process: process
begin
		clk_50 <= not clk_50;
		wait for 5 ns;	
end process clk_process;
                                       
END UARTreceiver_arch;


                             


