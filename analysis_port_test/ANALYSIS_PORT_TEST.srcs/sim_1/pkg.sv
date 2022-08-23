`ifndef PKG
`define PKG

package pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    /* Include transactions */
    `include "simple_transaction.sv"

    /* Include classes */
    `include "analysis_producer.sv"
    `include "analysis_subscriber.sv"
    `include "analysis_parent.sv"

endpackage

`endif
