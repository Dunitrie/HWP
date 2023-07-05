transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/demo/Documents/Studium/ESE/SS23/Hardware_Praktikum/HWP/blatt08/vhdl/UARTreceiver.vhd}

vcom -93 -work work {C:/Users/demo/Documents/Studium/ESE/SS23/Hardware_Praktikum/HWP/blatt08/vhdl/simulation/modelsim/UARTreceiver.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  UARTreceiver_vhd_tst

add wave *
view structure
view signals
run 1 sec
