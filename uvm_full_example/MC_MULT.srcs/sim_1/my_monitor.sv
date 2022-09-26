`ifndef MY_MONITOR
`define MY_MONITOR


class my_monitor extends uvm_monitor;

    uvm_analysis_imp #(my_item, my_monitor) analysis_export;
    uvm_analysis_port #(my_item)            item_collected_port;

    `uvm_component_utils(my_monitor)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new ("analysis_export", this);
        item_collected_port = new ("item_collected_port", this);
    endfunction

    /* Write() of analysis_export */
    virtual function void write(my_item data);
        $display("@%4t: a_in = %d, b_in = %d, mult_out = %d",
            $time, data.a_in, data.b_in, data.mult_out);

        item_collected_port.write(data);
    endfunction

endclass

`endif
