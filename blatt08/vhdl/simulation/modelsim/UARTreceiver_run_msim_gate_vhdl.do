transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {UARTreceiver.vho}

vcom -93 -work work {C:/Users/demo/Documents/Studium/ESE/SS23/Hardware_Praktikum/HWP/blatt08/vhdl/simulation/modelsim/UARTreceiver.vht}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  UARTreceiver_vhd_tst

add wave *
view structure
view signals
run 400 us
