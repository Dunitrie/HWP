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
-- Generated on "05/21/2023 18:22:54"
                                                            
-- Vhdl Test Bench template for design  :  CarryRipple2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CarryRipple2_vhd_tst IS
END CarryRipple2_vhd_tst;
ARCHITECTURE CarryRipple2_arch OF CarryRipple2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL carryIn : STD_LOGIC;
SIGNAL carryOut : STD_LOGIC;
SIGNAL sum : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT CarryRipple2
	PORT (
	A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	carryIn : IN STD_LOGIC;
	carryOut : OUT STD_LOGIC;
	sum : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : CarryRipple2
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	carryIn => carryIn,
	carryOut => carryOut,
	sum => sum
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once
	A <= "00";
	B <= "00";
	carryIn <= '0';
	wait for 200 ns;
	A <= "00";
	B <= "01";
	carryIn <= '0';
	wait for 200 ns;
	A <= "01";
	B <= "00";
	carryIn <= '0';
	wait for 200 ns;
	A <= "01";
	B <= "01";
	carryIn <= '0';
	wait for 200 ns;
	A <= "00";
	B <= "10";
	carryIn <= '0';
	wait for 200 ns;
	A <= "10";
	B <= "00";
	carryIn <= '0';
	wait for 200 ns;
	A <= "10";
	B <= "10";
	carryIn <= '0';
	wait for 200 ns;
	A <= "01";
	B <= "10";
	carryIn <= '0';
	wait for 200 ns;
	A <= "10";
	B <= "01";
	carryIn <= '0';
	wait for 0.04 ns;
	A <= "00";
	B <= "11";
	carryIn <= '0';
	wait for 200 ns;
	A <= "11";
	B <= "00";
	carryIn <= '0';
	wait for 200 ns;
	A <= "01";
	B <= "11";
	carryIn <= '0';
	wait for 200 ns;
	A <= "11";
	B <= "01";
	carryIn <= '0';
	wait for 200 ns;
	A <= "10";
	B <= "11";
	carryIn <= '0';
	wait for 200 ns;
	A <= "11";
	B <= "10";
	carryIn <= '0';
	wait for 0.04 ns;
	A <= "11";
	B <= "11";
	carryIn <= '0';
	wait for 200 ns;
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
END CarryRipple2_arch;
