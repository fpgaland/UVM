`ifndef PKG
`define PKG

package pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    /* Include transactions */
    `include "simple_transaction.sv"

    /* Include classes */
    `include "get_consumer.sv"
    `include "get_producer.sv"
    `include "get_parent.sv"

endpackage

`endif
