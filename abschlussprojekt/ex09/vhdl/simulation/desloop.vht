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
-- Generated on "06/29/2018 15:39:29"
                                                            
-- Vhdl Test Bench template for design  :  des_loop
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY des_loop_vhd_tst IS
END des_loop_vhd_tst;
ARCHITECTURE des_loop_arch OF des_loop_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL blk_in : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL blk_out : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL clk_50 : STD_LOGIC := '0';
SIGNAL key_in : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL enable : std_logic := '0';
SIGNAL ready : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
COMPONENT des_loop
	PORT (
	blk_in : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	blk_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	clk_50 : IN STD_LOGIC;
	key_in : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	mode : IN STD_LOGIC;
	enable : in std_logic;
	ready : OUT STD_LOGIC;
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : des_loop
	PORT MAP (
-- list connections between master ports and signals
	blk_in => blk_in,
	blk_out => blk_out,
	clk_50 => clk_50,
	key_in => key_in,
	mode => mode,
	enable => enable,
	ready => ready,
	rst => rst
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN
	wait for 40 ns;
	BLK_IN <= "100010110101";
	key_in <= "111000111";
	mode <= '1';
	rst <= '1';
	wait for 40 ns;
	rst <= '0';
	enable <= '1';
	wait for 10 ns;
	enable <= '0';
	
	
WAIT;                                                       
END PROCESS init;     
clk_50 <= not clk_50 after 10 ns;                            
END des_loop_arch;
