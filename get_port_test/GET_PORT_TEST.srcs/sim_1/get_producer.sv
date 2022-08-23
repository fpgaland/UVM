`ifndef GET_PRODUCER
`define GET_PRODUCER


class get_producer extends uvm_component;
    uvm_blocking_get_imp #(simple_transaction, get_producer) get_export;

    `uvm_component_utils(get_producer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        get_export = new("get_export", this);
    endfunction

    task get(output simple_transaction data);       // Define behavior of get()
        data = simple_transaction::type_id::create("data");
        assert (data.randomize());
        `uvm_info("PRODUCER", 
            $sformatf("Made: data_e = %d, data_o = %d", data.data_e, data.data_o),
            UVM_LOW)
    endtask

endclass

`endif
