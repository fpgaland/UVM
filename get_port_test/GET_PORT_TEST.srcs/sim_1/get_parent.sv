`ifndef GET_PARENT
`define GET_PARENT


class get_parent extends uvm_component;
    get_consumer consumer;
    get_producer producer;

    `uvm_component_utils(get_parent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        consumer = get_consumer::type_id::create("consumer", this);
        producer = get_producer::type_id::create("producer", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        consumer.get_port.connect(producer.get_export);
    endfunction

endclass

`endif
