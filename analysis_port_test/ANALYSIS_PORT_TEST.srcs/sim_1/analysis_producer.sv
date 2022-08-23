`ifndef ANALYSIS_PRODUCER
`define ANALYSIS_PRODUCER


class analysis_producer extends uvm_component;
    uvm_analysis_port #(simple_transaction) analysis_port;

    `uvm_component_utils(analysis_producer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_port = new("analysis_port", this);
    endfunction

    task run_phase(uvm_phase phase);
        simple_transaction data;

        for (int i = 0; i < 5; i++) begin
            `uvm_info("PRODUCER",
                $sformatf("Producing data... i = %d", i),
                UVM_LOW)

            data = simple_transaction::type_id::create("data");
            assert (data.randomize());

            `uvm_info("PRODUCER", 
                $sformatf("Write: data_e = %d, data_o = %d", data.data_e, data.data_o),
                UVM_LOW)
            analysis_port.write(data);             // Initiate writing a transaction
        end
    endtask

endclass

`endif
