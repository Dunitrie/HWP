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

-- DATE "05/31/2023 12:37:10"

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

ENTITY 	myCounter IS
    PORT (
	count : IN std_logic;
	rst : IN std_logic;
	countOut : OUT std_logic_vector(5 DOWNTO 0)
	);
END myCounter;

-- Design Ports Information
-- countOut[0]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countOut[1]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countOut[2]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countOut[3]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countOut[4]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countOut[5]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF myCounter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_count : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_countOut : std_logic_vector(5 DOWNTO 0);
SIGNAL \count~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \countOut[0]~output_o\ : std_logic;
SIGNAL \countOut[1]~output_o\ : std_logic;
SIGNAL \countOut[2]~output_o\ : std_logic;
SIGNAL \countOut[3]~output_o\ : std_logic;
SIGNAL \countOut[4]~output_o\ : std_logic;
SIGNAL \countOut[5]~output_o\ : std_logic;
SIGNAL \count~input_o\ : std_logic;
SIGNAL \count~inputclkctrl_outclk\ : std_logic;
SIGNAL \sixBitCounter[0]~6_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \sixBitCounter[0]~7\ : std_logic;
SIGNAL \sixBitCounter[1]~8_combout\ : std_logic;
SIGNAL \sixBitCounter[1]~9\ : std_logic;
SIGNAL \sixBitCounter[2]~10_combout\ : std_logic;
SIGNAL \sixBitCounter[2]~11\ : std_logic;
SIGNAL \sixBitCounter[3]~12_combout\ : std_logic;
SIGNAL \sixBitCounter[3]~13\ : std_logic;
SIGNAL \sixBitCounter[4]~14_combout\ : std_logic;
SIGNAL \sixBitCounter[4]~15\ : std_logic;
SIGNAL \sixBitCounter[5]~16_combout\ : std_logic;
SIGNAL sixBitCounter : std_logic_vector(5 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_count <= count;
ww_rst <= rst;
countOut <= ww_countOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\count~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \count~input_o\);

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X51_Y34_N9
\countOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(0),
	devoe => ww_devoe,
	o => \countOut[0]~output_o\);

-- Location: IOOBUF_X53_Y25_N2
\countOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(1),
	devoe => ww_devoe,
	o => \countOut[1]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\countOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(2),
	devoe => ww_devoe,
	o => \countOut[2]~output_o\);

-- Location: IOOBUF_X51_Y34_N2
\countOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(3),
	devoe => ww_devoe,
	o => \countOut[3]~output_o\);

-- Location: IOOBUF_X53_Y30_N2
\countOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(4),
	devoe => ww_devoe,
	o => \countOut[4]~output_o\);

-- Location: IOOBUF_X53_Y26_N23
\countOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sixBitCounter(5),
	devoe => ww_devoe,
	o => \countOut[5]~output_o\);

-- Location: IOIBUF_X53_Y17_N1
\count~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_count,
	o => \count~input_o\);

-- Location: CLKCTRL_G9
\count~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \count~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \count~inputclkctrl_outclk\);

-- Location: LCCOMB_X52_Y30_N8
\sixBitCounter[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[0]~6_combout\ = sixBitCounter(0) $ (VCC)
-- \sixBitCounter[0]~7\ = CARRY(sixBitCounter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sixBitCounter(0),
	datad => VCC,
	combout => \sixBitCounter[0]~6_combout\,
	cout => \sixBitCounter[0]~7\);

-- Location: IOIBUF_X53_Y17_N8
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G7
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X52_Y30_N9
\sixBitCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[0]~6_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(0));

-- Location: LCCOMB_X52_Y30_N10
\sixBitCounter[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[1]~8_combout\ = (sixBitCounter(1) & (!\sixBitCounter[0]~7\)) # (!sixBitCounter(1) & ((\sixBitCounter[0]~7\) # (GND)))
-- \sixBitCounter[1]~9\ = CARRY((!\sixBitCounter[0]~7\) # (!sixBitCounter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => sixBitCounter(1),
	datad => VCC,
	cin => \sixBitCounter[0]~7\,
	combout => \sixBitCounter[1]~8_combout\,
	cout => \sixBitCounter[1]~9\);

-- Location: FF_X52_Y30_N11
\sixBitCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[1]~8_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(1));

-- Location: LCCOMB_X52_Y30_N12
\sixBitCounter[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[2]~10_combout\ = (sixBitCounter(2) & (\sixBitCounter[1]~9\ $ (GND))) # (!sixBitCounter(2) & (!\sixBitCounter[1]~9\ & VCC))
-- \sixBitCounter[2]~11\ = CARRY((sixBitCounter(2) & !\sixBitCounter[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => sixBitCounter(2),
	datad => VCC,
	cin => \sixBitCounter[1]~9\,
	combout => \sixBitCounter[2]~10_combout\,
	cout => \sixBitCounter[2]~11\);

-- Location: FF_X52_Y30_N13
\sixBitCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[2]~10_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(2));

-- Location: LCCOMB_X52_Y30_N14
\sixBitCounter[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[3]~12_combout\ = (sixBitCounter(3) & (!\sixBitCounter[2]~11\)) # (!sixBitCounter(3) & ((\sixBitCounter[2]~11\) # (GND)))
-- \sixBitCounter[3]~13\ = CARRY((!\sixBitCounter[2]~11\) # (!sixBitCounter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => sixBitCounter(3),
	datad => VCC,
	cin => \sixBitCounter[2]~11\,
	combout => \sixBitCounter[3]~12_combout\,
	cout => \sixBitCounter[3]~13\);

-- Location: FF_X52_Y30_N15
\sixBitCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[3]~12_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(3));

-- Location: LCCOMB_X52_Y30_N16
\sixBitCounter[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[4]~14_combout\ = (sixBitCounter(4) & (\sixBitCounter[3]~13\ $ (GND))) # (!sixBitCounter(4) & (!\sixBitCounter[3]~13\ & VCC))
-- \sixBitCounter[4]~15\ = CARRY((sixBitCounter(4) & !\sixBitCounter[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => sixBitCounter(4),
	datad => VCC,
	cin => \sixBitCounter[3]~13\,
	combout => \sixBitCounter[4]~14_combout\,
	cout => \sixBitCounter[4]~15\);

-- Location: FF_X52_Y30_N17
\sixBitCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[4]~14_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(4));

-- Location: LCCOMB_X52_Y30_N18
\sixBitCounter[5]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixBitCounter[5]~16_combout\ = \sixBitCounter[4]~15\ $ (sixBitCounter(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => sixBitCounter(5),
	cin => \sixBitCounter[4]~15\,
	combout => \sixBitCounter[5]~16_combout\);

-- Location: FF_X52_Y30_N19
\sixBitCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \count~inputclkctrl_outclk\,
	d => \sixBitCounter[5]~16_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sixBitCounter(5));

ww_countOut(0) <= \countOut[0]~output_o\;

ww_countOut(1) <= \countOut[1]~output_o\;

ww_countOut(2) <= \countOut[2]~output_o\;

ww_countOut(3) <= \countOut[3]~output_o\;

ww_countOut(4) <= \countOut[4]~output_o\;

ww_countOut(5) <= \countOut[5]~output_o\;
END structure;


