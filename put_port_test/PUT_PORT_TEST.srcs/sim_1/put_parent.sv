`ifndef PUT_PARENT
`define PUT_PARENT


class put_parent extends uvm_component;
    put_producer producer;
    put_consumer consumer;

    `uvm_component_utils(put_parent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        producer = put_producer::type_id::create("producer", this);
        consumer = put_consumer::type_id::create("consumer", this);
        
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        producer.put_port.connect(consumer.put_export);
    endfunction

endclass

`endif
