`ifndef MY_AGENT
`define MY_AGENT


class my_agent extends uvm_agent;

    my_driver driver;
    my_sequencer sequencer;
    my_collector collector;
    my_monitor monitor;

    `uvm_component_utils_begin(my_agent)
        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)    /* Defined in uvm_agent */
    `uvm_component_utils_end

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        collector = my_collector::type_id::create("collector", this);
        monitor = my_monitor::type_id::create("monitor", this);

        if (is_active == UVM_ACTIVE) begin
            driver = my_driver::type_id::create("driver", this);
            sequencer = my_sequencer::type_id::create("sequencer", this);
        end
    endfunction

    /* Connect phase */
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        collector.analysis_port.connect(monitor.analysis_export);

        if (is_active == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction
    
endclass

`endif
