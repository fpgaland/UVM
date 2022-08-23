`timescale 1ns / 1ps

//`include "uvm_pkg.sv"
`include "uvm_macros.svh"
`include "pkg.sv"

module top();
import uvm_pkg::*;
import pkg::*;

get_parent parent;

initial begin
    `uvm_info("INFO", "get port test", UVM_LOW)

    parent = get_parent::type_id::create("parent", null);

    run_test();
end
endmodule
