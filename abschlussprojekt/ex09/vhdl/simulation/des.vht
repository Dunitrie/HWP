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
-- Generated on "06/29/2018 17:09:21"
                                                            
-- Vhdl Test Bench template for design  :  des
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY des_vhd_tst IS
END des_vhd_tst;
ARCHITECTURE des_arch OF des_vhd_tst IS
-- constants                                                 
-- signals                        
constant dataWidth : natural := 12;    
constant keyWidth : natural := 22;                           
SIGNAL clk_50 : STD_LOGIC := '0';
SIGNAL data_in : STD_LOGIC_VECTOR(dataWidth - 1 DOWNTO 0);
SIGNAL data_out : STD_LOGIC_VECTOR(dataWidth - 1 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL key_in : STD_LOGIC_VECTOR(keyWidth - 1 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL ready : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL counter : integer := 0; 
COMPONENT des
	generic (
		dataWidth : natural := 12;
		keyWidth : natural := 9
	);
	PORT (
	clk_50 : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(dataWidth - 1 DOWNTO 0);
	data_out : OUT STD_LOGIC_VECTOR(dataWidth - 1 DOWNTO 0);
	enable : IN STD_LOGIC;
	key_in : IN STD_LOGIC_VECTOR(keyWidth - 1 DOWNTO 0);
	mode : IN STD_LOGIC;
	ready : OUT STD_LOGIC;
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : des
	generic map (
		dataWidth => dataWidth,
		keyWidth => keyWidth
	)
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	data_in => data_in,
	data_out => data_out,
	enable => enable,
	key_in => key_in,
	mode => mode,
	ready => ready,
	rst => rst
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                    
	enable <= '0';                                    
	rst <= '1';
	mode <= '0'; -- encrypt
	--data_in <= "010010000101011101010000010111110011000100111000";
	data_in <= "010010000101";
	key_in <= "1110001111110001110000";
	wait for 20 ns;
	rst <= '0';
	enable <= '1';
	wait for 40 ns;
	enable <= '0';
	
	wait until ready = '1';
	wait for 10 ns;
	mode <= '1'; -- decrypt
	data_in <= data_out;
	enable <= '1';
	
                   
WAIT;                                                       
END PROCESS init;                                           

 clk_50 <= not clk_50 after 10 ns;
 
 pr : process(clk_50)
 begin
	if rising_edge(clk_50) then
		counter <= counter + 1;
	end if;
 end process;
END des_arch;
