transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {HalfAdder.vho}

vcom -93 -work work {C:/Users/Frank/Documents/HWPBlatt04/simulation/modelsim/CarryRipple2.vht}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  CarryRipple2_vhd_tst

add wave *
view structure
view signals
run -all
