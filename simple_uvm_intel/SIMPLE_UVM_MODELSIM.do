vlib work
vmap work work

set UVM_SRC C:/intelFPGA_lite/20.1/modelsim_ase/verilog_src/uvm-1.2/src
vlog -sv $UVM_SRC/uvm.sv +incdir+$UVM_SRC $UVM_SRC/dpi/uvm_dpi.cc -ccflags -DQUESTA

vmap uvm $UVM_SRC

vlog -reportprogress 300 -work work ./src/top.sv -L uvm +incdir+$UVM_SRC

vsim work.top

run
