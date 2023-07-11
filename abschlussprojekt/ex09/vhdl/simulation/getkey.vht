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
-- Generated on "06/29/2018 13:15:49"
                                                            
-- Vhdl Test Bench template for design  :  get_key
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;                                

ENTITY get_key_vhd_tst IS
END get_key_vhd_tst;
ARCHITECTURE get_key_arch OF get_key_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC;
SIGNAL key_in : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL key_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL round : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT get_key
	PORT (
	clk_50 : IN STD_LOGIC;
	key_in : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	key_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	round : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : get_key
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	key_in => key_in,
	key_out => key_out,
	round => round
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                
   key_in <= "111000111";
	round <= std_logic_vector(to_unsigned(1, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(2, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(3, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(4, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(5, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(6, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(7, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(8, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(9, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(10, round'length));
	wait for 40 ns;
	round <= std_logic_vector(to_unsigned(11, round'length));
	wait for 40 ns;
	
	
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
BEGIN                                                    
	clk_50 <= '0';
	wait for 10 ns;
	clk_50 <= '1';
	wait for 10 ns;
END PROCESS always;                                          
END get_key_arch;
