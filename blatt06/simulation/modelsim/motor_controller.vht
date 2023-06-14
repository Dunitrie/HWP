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
-- Generated on "06/14/2023 17:07:08"
                                                            
-- Vhdl Test Bench template for design  :  motor_controller
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY motor_controller_vhd_tst IS
END motor_controller_vhd_tst;
ARCHITECTURE motor_controller_arch OF motor_controller_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50 : STD_LOGIC;
SIGNAL direction : STD_LOGIC;
SIGNAL motor_signal1 : STD_LOGIC;
SIGNAL motor_signal2 : STD_LOGIC;
SIGNAL speed : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT motor_controller
	PORT (
	clk_50 : IN STD_LOGIC;
	direction : IN STD_LOGIC;
	motor_signal1 : BUFFER STD_LOGIC;
	motor_signal2 : BUFFER STD_LOGIC;
	speed : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : motor_controller
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	direction => direction,
	motor_signal1 => motor_signal1,
	motor_signal2 => motor_signal2,
	speed => speed
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once   
			direction <= '1';
			wait for 40 ns;
			direction <= '0';
			wait for 40 ns;
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
END motor_controller_arch;
