`ifndef PUT_PRODUCER
`define PUT_PRODUCER


class put_producer extends uvm_component;
    uvm_blocking_put_port #(simple_transaction) put_port;

    `uvm_component_utils(put_producer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        put_port = new("put_port", this);
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
                $sformatf("Put: data_e = %d, data_o = %d", data.data_e, data.data_o),
                UVM_LOW)
            put_port.put(data);             // Initiate putting a transaction
        end
    endtask

endclass

`endif
