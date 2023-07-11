-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "06/29/2018 13:19:04"
                                                            
-- Vhdl Test Bench template for design  :  expander
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY expander_vhd_tst IS
END expander_vhd_tst;
ARCHITECTURE expander_arch OF expander_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL in_vector : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL out_vector : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT expander
	PORT (
	in_vector : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	out_vector : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : expander
	PORT MAP (
-- list connections between master ports and signals
	in_vector => in_vector,
	out_vector => out_vector
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                      

	in_vector <= "110101";
	wait for 10 ns;

                   
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END expander_arch;
