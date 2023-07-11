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
-- Generated on "06/29/2018 15:31:03"
                                                            
-- Vhdl Test Bench template for design  :  des_round
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY des_round_vhd_tst IS
END des_round_vhd_tst;
ARCHITECTURE des_round_arch OF des_round_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC;
SIGNAL k_i : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL l_i : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL l_i_min_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL r_i : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL r_i_min_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
COMPONENT des_round
	PORT (
	clk_50 : IN STD_LOGIC;
	k_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	l_i : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	l_i_min_1 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	r_i : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	r_i_min_1 : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : des_round
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	k_i => k_i,
	l_i => l_i,
	l_i_min_1 => l_i_min_1,
	r_i => r_i,
	r_i_min_1 => r_i_min_1
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN       
	k_i <= "11100011"        
	l_i_min_1 <= "000000";
	r_i_min_1 <= "000000";
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN      
	clk_50 <= '0';
	wait for 10 ns;
	clk_50 <= '1';
	wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END des_round_arch;
