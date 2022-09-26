`ifndef PKG
`define PKG

package pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    /* Transaction */
    `include "my_item_base.sv"
    `include "my_item.sv"

    /* Typedef */
    typedef virtual my_if VIF_DRIVER;
    typedef virtual my_if VIF_COLLECTOR;

    /* Include classes */
    `include "my_driver_base.sv"
    `include "my_driver.sv"
    `include "my_sequencer.sv"
    `include "my_sequence_base.sv"
    `include "my_sequence1.sv"
    `include "my_collector_base.sv"
    `include "my_collector.sv"
    `include "my_monitor.sv"
    `include "my_monitor_coverage.sv"
    `include "my_agent.sv"
    `include "my_scoreboard.sv"
    `include "my_env.sv"
    `include "my_test_base.sv"
    `include "my_test1.sv"

endpackage

`endif
