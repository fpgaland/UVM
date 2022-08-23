`ifndef GET_CONSUMER
`define GET_CONSUMER


class get_consumer extends uvm_component;
    uvm_blocking_get_port #(simple_transaction) get_port;

    `uvm_component_utils(get_consumer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        get_port = new("get_port", this);
    endfunction

    task run_phase(uvm_phase phase);
        simple_transaction data;

        for (int i = 0; i < 5; i++) begin
            `uvm_info("CONSUMER",
                $sformatf("Getting data... i = %d", i),
                UVM_LOW)
            get_port.get(data);             // Initiate getting a transaction
            `uvm_info("CONSUMER", 
                $sformatf("Got: data_e = %d, data_o = %d", data.data_e, data.data_o),
                UVM_LOW)
        end
    endtask

endclass

`endif
