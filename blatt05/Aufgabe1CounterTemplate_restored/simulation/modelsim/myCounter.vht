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
-- Generated on "05/31/2023 11:57:04"
                                                            
-- Vhdl Test Bench template for design  :  myCounter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY myCounter_vhd_tst IS
END myCounter_vhd_tst;
ARCHITECTURE myCounter_arch OF myCounter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL count : STD_LOGIC;
SIGNAL countOut : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT myCounter
	PORT (
	count : IN STD_LOGIC;
	countOut : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : myCounter
	PORT MAP (
-- list connections between master ports and signals
	count => count,
	countOut => countOut,
	rst => rst
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
		count <= '0';
		rst <= '0';
		wait for 20 ns;
		rst <= '1';
		wait for 20 ns;
		-- count up to 63 and check for no count at the same time
		for i in 0 to 62 loop
		   count <= '1';
			wait for 20 ns;
			count <= '0';
			wait for 20 ns;
		end loop;
		-- test overflow
		count <= '1';
		wait for 20 ns;
		count <= '0';
		
		for i in 0 to 10 loop
		   count <= '1';
			wait for 20 ns;
			count <= '0';
			wait for 20 ns;
		end loop;
		-- test for reset from 111111 to 000000
		rst <= '0';
		wait for 40 ns;
		
WAIT;                                                        
END PROCESS always;                                          
END myCounter_arch;
