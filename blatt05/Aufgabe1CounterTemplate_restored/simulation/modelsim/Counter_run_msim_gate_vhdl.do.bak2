transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Counter_6_1200mv_85c_slow.vho}

vcom -93 -work work {C:/Users/demo/Documents/Studium/ESE/SS23/Hardware_Praktikum/HWP/blatt05/Aufgabe1CounterTemplate_restored/simulation/modelsim/myCounter.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=Counter_6_1200mv_85c_vhd_slow.sdo -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  myCounter_vhd_tst

add wave *
view structure
view signals
run -all
