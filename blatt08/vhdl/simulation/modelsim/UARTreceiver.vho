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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "07/05/2023 17:24:10"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	UARTreceiver IS
    PORT (
	clk_50 : IN std_logic;
	serial_input : IN std_logic;
	heading_int : OUT std_logic_vector(7 DOWNTO 0);
	dataReady : OUT std_logic;
	icnt : OUT std_logic_vector(11 DOWNTO 0)
	);
END UARTreceiver;

-- Design Ports Information
-- heading_int[0]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[1]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[2]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[3]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[4]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[5]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[6]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- heading_int[7]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataReady	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[1]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[2]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[3]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[4]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[5]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[6]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[7]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[8]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[9]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[10]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icnt[11]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- serial_input	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UARTreceiver IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50 : std_logic;
SIGNAL ww_serial_input : std_logic;
SIGNAL ww_heading_int : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dataReady : std_logic;
SIGNAL ww_icnt : std_logic_vector(11 DOWNTO 0);
SIGNAL \clk_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \heading_int[0]~output_o\ : std_logic;
SIGNAL \heading_int[1]~output_o\ : std_logic;
SIGNAL \heading_int[2]~output_o\ : std_logic;
SIGNAL \heading_int[3]~output_o\ : std_logic;
SIGNAL \heading_int[4]~output_o\ : std_logic;
SIGNAL \heading_int[5]~output_o\ : std_logic;
SIGNAL \heading_int[6]~output_o\ : std_logic;
SIGNAL \heading_int[7]~output_o\ : std_logic;
SIGNAL \dataReady~output_o\ : std_logic;
SIGNAL \icnt[0]~output_o\ : std_logic;
SIGNAL \icnt[1]~output_o\ : std_logic;
SIGNAL \icnt[2]~output_o\ : std_logic;
SIGNAL \icnt[3]~output_o\ : std_logic;
SIGNAL \icnt[4]~output_o\ : std_logic;
SIGNAL \icnt[5]~output_o\ : std_logic;
SIGNAL \icnt[6]~output_o\ : std_logic;
SIGNAL \icnt[7]~output_o\ : std_logic;
SIGNAL \icnt[8]~output_o\ : std_logic;
SIGNAL \icnt[9]~output_o\ : std_logic;
SIGNAL \icnt[10]~output_o\ : std_logic;
SIGNAL \icnt[11]~output_o\ : std_logic;
SIGNAL \clk_50~input_o\ : std_logic;
SIGNAL \clk_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \serial_input~input_o\ : std_logic;
SIGNAL \state.s0~q\ : std_logic;
SIGNAL \state.s1~feeder_combout\ : std_logic;
SIGNAL \state~25_combout\ : std_logic;
SIGNAL \state~24_combout\ : std_logic;
SIGNAL \state_flag~0_combout\ : std_logic;
SIGNAL \state_flag~q\ : std_logic;
SIGNAL \state~23_combout\ : std_logic;
SIGNAL \state~26_combout\ : std_logic;
SIGNAL \state~27_combout\ : std_logic;
SIGNAL \state.s1~q\ : std_logic;
SIGNAL \state.s2~feeder_combout\ : std_logic;
SIGNAL \state.s2~q\ : std_logic;
SIGNAL \state.s3~feeder_combout\ : std_logic;
SIGNAL \state.s3~q\ : std_logic;
SIGNAL \state.s4~feeder_combout\ : std_logic;
SIGNAL \state.s4~q\ : std_logic;
SIGNAL \state.s5~q\ : std_logic;
SIGNAL \state.s6~feeder_combout\ : std_logic;
SIGNAL \state.s6~q\ : std_logic;
SIGNAL \state.s7~feeder_combout\ : std_logic;
SIGNAL \state.s7~q\ : std_logic;
SIGNAL \state.stop_bit~q\ : std_logic;
SIGNAL \state.idle~0_combout\ : std_logic;
SIGNAL \state.idle~q\ : std_logic;
SIGNAL \process_1~1_combout\ : std_logic;
SIGNAL \state.start_bit~q\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \icnt1~3_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \icnt1~7_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \icnt1~6_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \icnt1~4_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \icnt1~5_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \icnt1~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \icnt1~9_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \icnt1~8_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \icnt1~10_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \icnt1~11_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \heading_int[0]~0_combout\ : std_logic;
SIGNAL \heading_int[0]~reg0_q\ : std_logic;
SIGNAL \heading_int[1]~1_combout\ : std_logic;
SIGNAL \heading_int[1]~reg0_q\ : std_logic;
SIGNAL \heading_int[2]~2_combout\ : std_logic;
SIGNAL \heading_int[2]~reg0_q\ : std_logic;
SIGNAL \heading_int[3]~3_combout\ : std_logic;
SIGNAL \heading_int[3]~reg0_q\ : std_logic;
SIGNAL \heading_int[4]~4_combout\ : std_logic;
SIGNAL \heading_int[4]~reg0_q\ : std_logic;
SIGNAL \heading_int[5]~5_combout\ : std_logic;
SIGNAL \heading_int[5]~reg0_q\ : std_logic;
SIGNAL \heading_int[6]~6_combout\ : std_logic;
SIGNAL \heading_int[6]~reg0_q\ : std_logic;
SIGNAL \heading_int[7]~7_combout\ : std_logic;
SIGNAL \heading_int[7]~reg0_q\ : std_logic;
SIGNAL \dataReady~0_combout\ : std_logic;
SIGNAL \dataReady~reg0_q\ : std_logic;
SIGNAL \icnt[0]~reg0feeder_combout\ : std_logic;
SIGNAL \icnt[0]~reg0_q\ : std_logic;
SIGNAL \icnt~0_combout\ : std_logic;
SIGNAL \icnt[1]~reg0_q\ : std_logic;
SIGNAL \icnt~1_combout\ : std_logic;
SIGNAL \icnt[2]~reg0_q\ : std_logic;
SIGNAL \icnt~2_combout\ : std_logic;
SIGNAL \icnt[3]~reg0_q\ : std_logic;
SIGNAL \icnt~3_combout\ : std_logic;
SIGNAL \icnt[4]~reg0_q\ : std_logic;
SIGNAL \icnt~4_combout\ : std_logic;
SIGNAL \icnt[5]~reg0_q\ : std_logic;
SIGNAL \icnt[6]~reg0_q\ : std_logic;
SIGNAL \icnt[7]~reg0feeder_combout\ : std_logic;
SIGNAL \icnt[7]~reg0_q\ : std_logic;
SIGNAL \icnt~5_combout\ : std_logic;
SIGNAL \icnt[8]~reg0_q\ : std_logic;
SIGNAL \icnt~6_combout\ : std_logic;
SIGNAL \icnt[9]~reg0_q\ : std_logic;
SIGNAL \icnt~7_combout\ : std_logic;
SIGNAL \icnt[10]~reg0_q\ : std_logic;
SIGNAL \icnt~8_combout\ : std_logic;
SIGNAL \icnt[11]~reg0_q\ : std_logic;
SIGNAL icnt1 : std_logic_vector(11 DOWNTO 0);
SIGNAL \ALT_INV_serial_input~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50 <= clk_50;
ww_serial_input <= serial_input;
heading_int <= ww_heading_int;
dataReady <= ww_dataReady;
icnt <= ww_icnt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50~input_o\);
\ALT_INV_serial_input~input_o\ <= NOT \serial_input~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X53_Y9_N9
\heading_int[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[0]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[0]~output_o\);

-- Location: IOOBUF_X53_Y14_N2
\heading_int[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[1]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[1]~output_o\);

-- Location: IOOBUF_X53_Y11_N9
\heading_int[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[2]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[2]~output_o\);

-- Location: IOOBUF_X53_Y9_N23
\heading_int[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[3]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[3]~output_o\);

-- Location: IOOBUF_X53_Y11_N2
\heading_int[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[4]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[4]~output_o\);

-- Location: IOOBUF_X53_Y10_N16
\heading_int[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[5]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[5]~output_o\);

-- Location: IOOBUF_X53_Y14_N9
\heading_int[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[6]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[6]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\heading_int[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \heading_int[7]~reg0_q\,
	devoe => ww_devoe,
	o => \heading_int[7]~output_o\);

-- Location: IOOBUF_X53_Y13_N9
\dataReady~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataReady~reg0_q\,
	devoe => ww_devoe,
	o => \dataReady~output_o\);

-- Location: IOOBUF_X53_Y20_N16
\icnt[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[0]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[0]~output_o\);

-- Location: IOOBUF_X53_Y15_N9
\icnt[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[1]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[1]~output_o\);

-- Location: IOOBUF_X53_Y9_N16
\icnt[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[2]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[2]~output_o\);

-- Location: IOOBUF_X53_Y8_N23
\icnt[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[3]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[3]~output_o\);

-- Location: IOOBUF_X53_Y16_N9
\icnt[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[4]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[4]~output_o\);

-- Location: IOOBUF_X53_Y7_N9
\icnt[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[5]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[5]~output_o\);

-- Location: IOOBUF_X47_Y0_N23
\icnt[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[6]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[6]~output_o\);

-- Location: IOOBUF_X53_Y6_N16
\icnt[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[7]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[7]~output_o\);

-- Location: IOOBUF_X53_Y6_N23
\icnt[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[8]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[8]~output_o\);

-- Location: IOOBUF_X53_Y20_N23
\icnt[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[9]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[9]~output_o\);

-- Location: IOOBUF_X53_Y12_N2
\icnt[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[10]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[10]~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\icnt[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \icnt[11]~reg0_q\,
	devoe => ww_devoe,
	o => \icnt[11]~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\clk_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50,
	o => \clk_50~input_o\);

-- Location: CLKCTRL_G18
\clk_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X53_Y17_N1
\serial_input~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serial_input,
	o => \serial_input~input_o\);

-- Location: FF_X50_Y14_N11
\state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	asdata => \state.start_bit~q\,
	sload => VCC,
	ena => \Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s0~q\);

-- Location: LCCOMB_X49_Y14_N28
\state.s1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s1~feeder_combout\ = \state.s0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.s0~q\,
	combout => \state.s1~feeder_combout\);

-- Location: LCCOMB_X49_Y14_N16
\state~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~25_combout\ = (!\state.s5~q\ & (!\state.s7~q\ & !\state.s6~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s5~q\,
	datac => \state.s7~q\,
	datad => \state.s6~q\,
	combout => \state~25_combout\);

-- Location: LCCOMB_X49_Y14_N26
\state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~24_combout\ = (!\state.s2~q\ & (!\state.s1~q\ & (!\state.s4~q\ & !\state.s3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~q\,
	datab => \state.s1~q\,
	datac => \state.s4~q\,
	datad => \state.s3~q\,
	combout => \state~24_combout\);

-- Location: LCCOMB_X51_Y14_N18
\state_flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_flag~0_combout\ = (\state_flag~q\) # (!\state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_flag~q\,
	datad => \state.idle~q\,
	combout => \state_flag~0_combout\);

-- Location: FF_X51_Y14_N19
state_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_serial_input~input_o\,
	d => \state_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_flag~q\);

-- Location: LCCOMB_X50_Y14_N10
\state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~23_combout\ = (!\state.start_bit~q\ & (!\state.s0~q\ & ((\state.idle~q\) # (!\state_flag~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datab => \state.idle~q\,
	datac => \state.s0~q\,
	datad => \state_flag~q\,
	combout => \state~23_combout\);

-- Location: LCCOMB_X50_Y14_N20
\state~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~26_combout\ = (\state~25_combout\ & (\state~24_combout\ & \state~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~25_combout\,
	datac => \state~24_combout\,
	datad => \state~23_combout\,
	combout => \state~26_combout\);

-- Location: LCCOMB_X50_Y14_N16
\state~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~27_combout\ = (\Equal0~3_combout\ & ((\state.stop_bit~q\) # (!\state~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state~26_combout\,
	datac => \state.stop_bit~q\,
	datad => \Equal0~3_combout\,
	combout => \state~27_combout\);

-- Location: FF_X49_Y14_N29
\state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s1~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s1~q\);

-- Location: LCCOMB_X49_Y14_N6
\state.s2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s2~feeder_combout\ = \state.s1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.s1~q\,
	combout => \state.s2~feeder_combout\);

-- Location: FF_X49_Y14_N7
\state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s2~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s2~q\);

-- Location: LCCOMB_X49_Y14_N24
\state.s3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s3~feeder_combout\ = \state.s2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.s2~q\,
	combout => \state.s3~feeder_combout\);

-- Location: FF_X49_Y14_N25
\state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s3~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s3~q\);

-- Location: LCCOMB_X49_Y14_N22
\state.s4~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s4~feeder_combout\ = \state.s3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.s3~q\,
	combout => \state.s4~feeder_combout\);

-- Location: FF_X49_Y14_N23
\state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s4~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s4~q\);

-- Location: FF_X49_Y14_N13
\state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	asdata => \state.s4~q\,
	sload => VCC,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s5~q\);

-- Location: LCCOMB_X49_Y14_N18
\state.s6~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s6~feeder_combout\ = \state.s5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.s5~q\,
	combout => \state.s6~feeder_combout\);

-- Location: FF_X49_Y14_N19
\state.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s6~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s6~q\);

-- Location: LCCOMB_X49_Y14_N8
\state.s7~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s7~feeder_combout\ = \state.s6~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.s6~q\,
	combout => \state.s7~feeder_combout\);

-- Location: FF_X49_Y14_N9
\state.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.s7~feeder_combout\,
	ena => \state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s7~q\);

-- Location: FF_X50_Y14_N17
\state.stop_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	asdata => \state.s7~q\,
	sload => VCC,
	ena => \Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.stop_bit~q\);

-- Location: LCCOMB_X51_Y14_N24
\state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.idle~0_combout\ = (\Equal0~3_combout\ & (((!\state.stop_bit~q\ & \state.idle~q\)) # (!\state~26_combout\))) # (!\Equal0~3_combout\ & (((\state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.stop_bit~q\,
	datab => \state~26_combout\,
	datac => \state.idle~q\,
	datad => \Equal0~3_combout\,
	combout => \state.idle~0_combout\);

-- Location: FF_X51_Y14_N25
\state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \state.idle~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.idle~q\);

-- Location: LCCOMB_X50_Y14_N22
\process_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~1_combout\ = (!\state.idle~q\ & \state_flag~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.idle~q\,
	datad => \state_flag~q\,
	combout => \process_1~1_combout\);

-- Location: FF_X50_Y14_N23
\state.start_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \process_1~1_combout\,
	ena => \Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.start_bit~q\);

-- Location: LCCOMB_X47_Y14_N4
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (icnt1(2) & (\Add0~3\ $ (GND))) # (!icnt1(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((icnt1(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X47_Y14_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (icnt1(3) & (!\Add0~5\)) # (!icnt1(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!icnt1(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X48_Y14_N20
\icnt1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~3_combout\ = (\Add0~6_combout\ & (((!\Equal0~1_combout\) # (!\Equal0~2_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~2_combout\,
	datac => \Add0~6_combout\,
	datad => \Equal0~1_combout\,
	combout => \icnt1~3_combout\);

-- Location: FF_X48_Y14_N21
\icnt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(3));

-- Location: LCCOMB_X47_Y14_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (icnt1(4) & (\Add0~7\ $ (GND))) # (!icnt1(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((icnt1(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X47_Y14_N28
\icnt1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~7_combout\ = (\Equal0~3_combout\ & ((\state.start_bit~q\))) # (!\Equal0~3_combout\ & (\Add0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datac => \Add0~8_combout\,
	datad => \state.start_bit~q\,
	combout => \icnt1~7_combout\);

-- Location: FF_X47_Y14_N29
\icnt1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(4));

-- Location: LCCOMB_X47_Y14_N10
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (icnt1(5) & (!\Add0~9\)) # (!icnt1(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!icnt1(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X47_Y14_N26
\icnt1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~6_combout\ = (\Add0~10_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~0_combout\,
	datad => \Add0~10_combout\,
	combout => \icnt1~6_combout\);

-- Location: FF_X47_Y14_N27
\icnt1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(5));

-- Location: LCCOMB_X47_Y14_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (icnt1(6) & (\Add0~11\ $ (GND))) # (!icnt1(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((icnt1(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X47_Y14_N13
\icnt1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(6));

-- Location: LCCOMB_X47_Y14_N14
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (icnt1(7) & (!\Add0~13\)) # (!icnt1(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!icnt1(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: FF_X47_Y14_N15
\icnt1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(7));

-- Location: LCCOMB_X47_Y14_N24
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (icnt1(5) & (!icnt1(4) & (!icnt1(6) & !icnt1(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(5),
	datab => icnt1(4),
	datac => icnt1(6),
	datad => icnt1(7),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X47_Y14_N0
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = icnt1(0) $ (VCC)
-- \Add0~1\ = CARRY(icnt1(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => icnt1(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X47_Y14_N30
\icnt1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~4_combout\ = (\Add0~0_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~0_combout\,
	datad => \Add0~0_combout\,
	combout => \icnt1~4_combout\);

-- Location: FF_X47_Y14_N31
\icnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(0));

-- Location: LCCOMB_X47_Y14_N2
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (icnt1(1) & (!\Add0~1\)) # (!icnt1(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!icnt1(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X48_Y14_N14
\icnt1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~5_combout\ = (\Equal0~3_combout\ & (\state.start_bit~q\)) # (!\Equal0~3_combout\ & ((\Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datab => \Equal0~3_combout\,
	datac => \Add0~2_combout\,
	combout => \icnt1~5_combout\);

-- Location: FF_X48_Y14_N15
\icnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(1));

-- Location: LCCOMB_X48_Y14_N26
\icnt1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~2_combout\ = (\Equal0~3_combout\ & (\state.start_bit~q\)) # (!\Equal0~3_combout\ & ((\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datab => \Add0~4_combout\,
	datac => \Equal0~3_combout\,
	combout => \icnt1~2_combout\);

-- Location: FF_X48_Y14_N27
\icnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(2));

-- Location: LCCOMB_X48_Y14_N24
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (icnt1(2) & (icnt1(3) & (!icnt1(1) & !icnt1(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(2),
	datab => icnt1(3),
	datac => icnt1(1),
	datad => icnt1(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X47_Y14_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (icnt1(8) & (\Add0~15\ $ (GND))) # (!icnt1(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((icnt1(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X48_Y14_N30
\icnt1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~9_combout\ = (\Equal0~3_combout\ & (\state.start_bit~q\)) # (!\Equal0~3_combout\ & ((\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datab => \Equal0~3_combout\,
	datac => \Add0~16_combout\,
	combout => \icnt1~9_combout\);

-- Location: FF_X48_Y14_N31
\icnt1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(8));

-- Location: LCCOMB_X47_Y14_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (icnt1(9) & (!\Add0~17\)) # (!icnt1(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!icnt1(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X48_Y14_N18
\icnt1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~8_combout\ = (\Add0~18_combout\ & (((!\Equal0~2_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Add0~18_combout\,
	combout => \icnt1~8_combout\);

-- Location: FF_X48_Y14_N19
\icnt1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(9));

-- Location: LCCOMB_X47_Y14_N20
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (icnt1(10) & (\Add0~19\ $ (GND))) # (!icnt1(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((icnt1(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X48_Y14_N12
\icnt1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~10_combout\ = (\Equal0~3_combout\ & (\state.start_bit~q\)) # (!\Equal0~3_combout\ & ((\Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datac => \Equal0~3_combout\,
	datad => \Add0~20_combout\,
	combout => \icnt1~10_combout\);

-- Location: FF_X48_Y14_N13
\icnt1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(10));

-- Location: LCCOMB_X47_Y14_N22
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = icnt1(11) $ (\Add0~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => icnt1(11),
	cin => \Add0~21\,
	combout => \Add0~22_combout\);

-- Location: LCCOMB_X48_Y14_N8
\icnt1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt1~11_combout\ = (\Add0~22_combout\ & (((!\Equal0~2_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Add0~22_combout\,
	combout => \icnt1~11_combout\);

-- Location: FF_X48_Y14_N9
\icnt1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt1~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => icnt1(11));

-- Location: LCCOMB_X48_Y14_N2
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!icnt1(10) & (icnt1(11) & (!icnt1(8) & icnt1(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(10),
	datab => icnt1(11),
	datac => icnt1(8),
	datad => icnt1(9),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X50_Y14_N2
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\Equal0~2_combout\ & (\Equal0~1_combout\ & \Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~2_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X50_Y14_N18
\heading_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[0]~0_combout\ = (\Equal0~3_combout\ & ((\state.s0~q\ & (\serial_input~input_o\)) # (!\state.s0~q\ & ((\heading_int[0]~reg0_q\))))) # (!\Equal0~3_combout\ & (((\heading_int[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \Equal0~3_combout\,
	datac => \heading_int[0]~reg0_q\,
	datad => \state.s0~q\,
	combout => \heading_int[0]~0_combout\);

-- Location: FF_X50_Y14_N19
\heading_int[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[0]~reg0_q\);

-- Location: LCCOMB_X49_Y14_N20
\heading_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[1]~1_combout\ = (\state.s1~q\ & ((\Equal0~3_combout\ & (\serial_input~input_o\)) # (!\Equal0~3_combout\ & ((\heading_int[1]~reg0_q\))))) # (!\state.s1~q\ & (((\heading_int[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \state.s1~q\,
	datac => \heading_int[1]~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \heading_int[1]~1_combout\);

-- Location: FF_X49_Y14_N21
\heading_int[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[1]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N0
\heading_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[2]~2_combout\ = (\state.s2~q\ & ((\Equal0~3_combout\ & (\serial_input~input_o\)) # (!\Equal0~3_combout\ & ((\heading_int[2]~reg0_q\))))) # (!\state.s2~q\ & (((\heading_int[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \state.s2~q\,
	datac => \heading_int[2]~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \heading_int[2]~2_combout\);

-- Location: FF_X50_Y14_N1
\heading_int[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[2]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N14
\heading_int[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[3]~3_combout\ = (\state.s3~q\ & ((\Equal0~3_combout\ & (\serial_input~input_o\)) # (!\Equal0~3_combout\ & ((\heading_int[3]~reg0_q\))))) # (!\state.s3~q\ & (((\heading_int[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \state.s3~q\,
	datac => \heading_int[3]~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \heading_int[3]~3_combout\);

-- Location: FF_X50_Y14_N15
\heading_int[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[3]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N6
\heading_int[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[4]~4_combout\ = (\state.s4~q\ & ((\Equal0~3_combout\ & (\serial_input~input_o\)) # (!\Equal0~3_combout\ & ((\heading_int[4]~reg0_q\))))) # (!\state.s4~q\ & (((\heading_int[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \state.s4~q\,
	datac => \heading_int[4]~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \heading_int[4]~4_combout\);

-- Location: FF_X50_Y14_N7
\heading_int[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[4]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N28
\heading_int[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[5]~5_combout\ = (\Equal0~3_combout\ & ((\state.s5~q\ & (\serial_input~input_o\)) # (!\state.s5~q\ & ((\heading_int[5]~reg0_q\))))) # (!\Equal0~3_combout\ & (((\heading_int[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \Equal0~3_combout\,
	datac => \heading_int[5]~reg0_q\,
	datad => \state.s5~q\,
	combout => \heading_int[5]~5_combout\);

-- Location: FF_X50_Y14_N29
\heading_int[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[5]~reg0_q\);

-- Location: LCCOMB_X49_Y14_N10
\heading_int[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[6]~6_combout\ = (\state.s6~q\ & ((\Equal0~3_combout\ & (\serial_input~input_o\)) # (!\Equal0~3_combout\ & ((\heading_int[6]~reg0_q\))))) # (!\state.s6~q\ & (((\heading_int[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \state.s6~q\,
	datac => \heading_int[6]~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \heading_int[6]~6_combout\);

-- Location: FF_X49_Y14_N11
\heading_int[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[6]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N26
\heading_int[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \heading_int[7]~7_combout\ = (\Equal0~3_combout\ & ((\state.s7~q\ & (\serial_input~input_o\)) # (!\state.s7~q\ & ((\heading_int[7]~reg0_q\))))) # (!\Equal0~3_combout\ & (((\heading_int[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \serial_input~input_o\,
	datab => \Equal0~3_combout\,
	datac => \heading_int[7]~reg0_q\,
	datad => \state.s7~q\,
	combout => \heading_int[7]~7_combout\);

-- Location: FF_X50_Y14_N27
\heading_int[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \heading_int[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \heading_int[7]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N24
\dataReady~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataReady~0_combout\ = (\dataReady~reg0_q\) # ((\state.stop_bit~q\ & \Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.stop_bit~q\,
	datac => \dataReady~reg0_q\,
	datad => \Equal0~3_combout\,
	combout => \dataReady~0_combout\);

-- Location: FF_X50_Y14_N25
\dataReady~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \dataReady~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dataReady~reg0_q\);

-- Location: LCCOMB_X48_Y14_N0
\icnt[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt[0]~reg0feeder_combout\ = icnt1(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => icnt1(0),
	combout => \icnt[0]~reg0feeder_combout\);

-- Location: FF_X48_Y14_N1
\icnt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[0]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N12
\icnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~0_combout\ = (icnt1(1)) # ((\state.start_bit~q\ & \Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datac => icnt1(1),
	datad => \Equal0~3_combout\,
	combout => \icnt~0_combout\);

-- Location: FF_X50_Y14_N13
\icnt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[1]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N30
\icnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~1_combout\ = (\Equal0~3_combout\ & ((\state.start_bit~q\))) # (!\Equal0~3_combout\ & (icnt1(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => icnt1(2),
	datac => \state.start_bit~q\,
	datad => \Equal0~3_combout\,
	combout => \icnt~1_combout\);

-- Location: FF_X50_Y14_N31
\icnt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[2]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N6
\icnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~2_combout\ = (icnt1(3) & (((!\Equal0~1_combout\) # (!\Equal0~2_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => icnt1(3),
	datac => \Equal0~2_combout\,
	datad => \Equal0~1_combout\,
	combout => \icnt~2_combout\);

-- Location: FF_X48_Y14_N7
\icnt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[3]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N4
\icnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~3_combout\ = (icnt1(4)) # ((\state.start_bit~q\ & \Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datac => icnt1(4),
	datad => \Equal0~3_combout\,
	combout => \icnt~3_combout\);

-- Location: FF_X50_Y14_N5
\icnt[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[4]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N28
\icnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~4_combout\ = (icnt1(5) & (((!\Equal0~1_combout\) # (!\Equal0~2_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(5),
	datab => \Equal0~0_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~1_combout\,
	combout => \icnt~4_combout\);

-- Location: FF_X48_Y14_N29
\icnt[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[5]~reg0_q\);

-- Location: FF_X47_Y14_N25
\icnt[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	asdata => icnt1(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[6]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N10
\icnt[7]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt[7]~reg0feeder_combout\ = icnt1(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => icnt1(7),
	combout => \icnt[7]~reg0feeder_combout\);

-- Location: FF_X48_Y14_N11
\icnt[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt[7]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[7]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N4
\icnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~5_combout\ = (icnt1(8)) # ((\state.start_bit~q\ & \Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datac => \Equal0~3_combout\,
	datad => icnt1(8),
	combout => \icnt~5_combout\);

-- Location: FF_X48_Y14_N5
\icnt[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[8]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N22
\icnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~6_combout\ = (icnt1(9) & (((!\Equal0~1_combout\) # (!\Equal0~0_combout\)) # (!\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(9),
	datab => \Equal0~2_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~1_combout\,
	combout => \icnt~6_combout\);

-- Location: FF_X48_Y14_N23
\icnt[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[9]~reg0_q\);

-- Location: LCCOMB_X50_Y14_N8
\icnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~7_combout\ = (icnt1(10)) # ((\state.start_bit~q\ & \Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.start_bit~q\,
	datac => icnt1(10),
	datad => \Equal0~3_combout\,
	combout => \icnt~7_combout\);

-- Location: FF_X50_Y14_N9
\icnt[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[10]~reg0_q\);

-- Location: LCCOMB_X48_Y14_N16
\icnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \icnt~8_combout\ = (icnt1(11) & (((!\Equal0~1_combout\) # (!\Equal0~2_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => icnt1(11),
	datab => \Equal0~0_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~1_combout\,
	combout => \icnt~8_combout\);

-- Location: FF_X48_Y14_N17
\icnt[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputclkctrl_outclk\,
	d => \icnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \icnt[11]~reg0_q\);

ww_heading_int(0) <= \heading_int[0]~output_o\;

ww_heading_int(1) <= \heading_int[1]~output_o\;

ww_heading_int(2) <= \heading_int[2]~output_o\;

ww_heading_int(3) <= \heading_int[3]~output_o\;

ww_heading_int(4) <= \heading_int[4]~output_o\;

ww_heading_int(5) <= \heading_int[5]~output_o\;

ww_heading_int(6) <= \heading_int[6]~output_o\;

ww_heading_int(7) <= \heading_int[7]~output_o\;

ww_dataReady <= \dataReady~output_o\;

ww_icnt(0) <= \icnt[0]~output_o\;

ww_icnt(1) <= \icnt[1]~output_o\;

ww_icnt(2) <= \icnt[2]~output_o\;

ww_icnt(3) <= \icnt[3]~output_o\;

ww_icnt(4) <= \icnt[4]~output_o\;

ww_icnt(5) <= \icnt[5]~output_o\;

ww_icnt(6) <= \icnt[6]~output_o\;

ww_icnt(7) <= \icnt[7]~output_o\;

ww_icnt(8) <= \icnt[8]~output_o\;

ww_icnt(9) <= \icnt[9]~output_o\;

ww_icnt(10) <= \icnt[10]~output_o\;

ww_icnt(11) <= \icnt[11]~output_o\;
END structure;


