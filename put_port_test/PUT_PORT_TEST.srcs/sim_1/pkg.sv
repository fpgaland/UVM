`ifndef PKG
`define PKG

package pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    /* Include transactions */
    `include "simple_transaction.sv"

    /* Include classes */
    `include "put_producer.sv"
    `include "put_consumer.sv"
    `include "put_parent.sv"

endpackage

`endif
