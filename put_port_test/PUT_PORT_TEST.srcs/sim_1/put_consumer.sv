`ifndef PUT_CONSUMER
`define PUT_CONSUMER


class put_consumer extends uvm_component;
    uvm_blocking_put_imp #(simple_transaction, put_consumer) put_export;

    `uvm_component_utils(put_consumer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        put_export = new("put_export", this);
    endfunction

    task put(simple_transaction data);       // Define behavior of put()
        `uvm_info("CONSUMER",                // -> Just print received data
            $sformatf("Got: data_e = %d, data_o = %d", data.data_e, data.data_o),
            UVM_LOW)
    endtask

endclass

`endif
