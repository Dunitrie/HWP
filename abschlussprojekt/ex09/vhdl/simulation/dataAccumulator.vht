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
-- Generated on "07/02/2018 19:34:00"

-- Vhdl Test Bench template for design  :  dataAccumulator
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dataAccumulator_vhd_tst IS
END dataAccumulator_vhd_tst;
ARCHITECTURE dataAccumulator_arch OF dataAccumulator_vhd_tst IS
-- constants
-- signals
SIGNAL clk_50 : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_in_ready : STD_LOGIC;
SIGNAL data_out : STD_LOGIC_VECTOR(71 DOWNTO 0);
SIGNAL data_out_ready : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT dataAccumulator
	PORT (
	clk_50 : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_in_ready : IN STD_LOGIC;
	data_out : BUFFER STD_LOGIC_VECTOR(47 DOWNTO 0);
	data_out_ready : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : dataAccumulator
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	data_in => data_in,
	data_in_ready => data_in_ready,
	data_out => data_out,
	data_out_ready => data_out_ready,
	reset => reset
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
WAIT;
END PROCESS always;
END dataAccumulator_arch;
