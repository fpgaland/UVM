`timescale 1ns / 1ps

//`include "uvm_pkg.sv"
`include "uvm_macros.svh"
`include "pkg.sv"

module top();
import uvm_pkg::*;
import pkg::*;

print_comp p1, p2;

initial begin
    `uvm_info("INFO", "Simple UVM", UVM_LOW)

    uvm_config_db#(int)::set(null, "p2", "i", 8);
    uvm_config_db#(string)::set(null, "p2", "s", "cat");

    p1 = print_comp::type_id::create("p1", null);
    p2 = print_comp::type_id::create("p2", null);
    
    run_test();
end
endmodule
