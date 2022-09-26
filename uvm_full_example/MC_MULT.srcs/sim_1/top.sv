`timescale 1ns / 1ps

`include "uvm_macros.svh"
`include "my_definitions.svh"
`include "my_if.sv"
`include "pkg.sv"

module top();
import uvm_pkg::*;
import pkg::*;

bit     clk;
my_if   sif (clk);
//my_test1 test1;

/* Clock generation */
initial forever #10 clk = ~clk;

/* DUT */
MC_MULT #(
    .P_BW_A     ( `BW_A         ),    /* Bit width of A_IN. P_BW_A clocks needed for calculation */
    .P_BW_B     ( `BW_B         )     /* Bit width of B_IN */
) MC_MULT (
    .CLK        ( sif.clk       ),
    .RST        ( sif.rst       ),    /* Active high */
    .A_IN       ( sif.a_in      ),
    .B_IN       ( sif.b_in      ),
    .START      ( sif.start     ),    /* Caluculation start */
    .MULT_OUT   ( sif.mult_out  ),    /* Multiply result. This value is valid when VALID==1'b1 */
    .VALID      ( sif.valid     )     /* Result valid. 1 clock pulse */
);

/* Main */
initial begin
    /* my_monitor -> my_monitor_coverage */
    uvm_factory factory = uvm_factory::get();
    factory.set_type_override_by_type(my_monitor::get_type(), my_monitor_coverage::get_type());

    /* If create test instance -> UVM runs this test */
    //test1 = my_test1::type_id::create("test1", null);
    
    /* A test can be selected by adding arguments to xsim.simulate.xsim.more_options: */
    /* -testplusarg UVM_TESTNAME=my_test1 */   

    /* Set interface */
    uvm_config_db #(virtual my_if)::set(null, "*env0*", "vif", sif);

    /* Run */
    run_test();
end

endmodule
