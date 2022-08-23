`ifndef ANALYSIS_SUBSCRIBER
`define ANALYSIS_SUBSCRIBER


class analysis_subscriber extends uvm_component;
    uvm_analysis_imp #(simple_transaction, analysis_subscriber) analysis_export;

    `uvm_component_utils(analysis_subscriber)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
    endfunction

    function void write(simple_transaction data);    // Define behavior of write() in function
        `uvm_info(get_name(),                        // -> Just print received data with name of the object
            $sformatf("Got: data_e = %d, data_o = %d", data.data_e, data.data_o),
            UVM_LOW)
    endfunction

endclass

`endif
