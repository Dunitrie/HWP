transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {motor_controller.vho}

vcom -93 -work work {C:/Users/Frank/OneDrive - bwedu/Hardwarepraktikum/HWP/simulation/modelsim/motor_controller.vht}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  motor_controller_vhd_tst

add wave *
view structure
view signals
run -all
