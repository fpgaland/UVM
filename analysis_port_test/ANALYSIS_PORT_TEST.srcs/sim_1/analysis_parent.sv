`ifndef ANALYSIS_PARENT
`define ANALYSIS_PARENT


class analysis_parent extends uvm_component;
    analysis_producer producer;
    analysis_subscriber subscriber1;
    analysis_subscriber subscriber2;

    `uvm_component_utils(analysis_parent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        producer = analysis_producer::type_id::create("producer", this);
        subscriber1 = analysis_subscriber::type_id::create("subscriber1", this);
        subscriber2 = analysis_subscriber::type_id::create("subscriber2", this);
        
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        producer.analysis_port.connect(subscriber1.analysis_export);
        producer.analysis_port.connect(subscriber2.analysis_export);
    endfunction

endclass

`endif
