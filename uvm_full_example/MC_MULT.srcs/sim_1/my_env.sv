`ifndef MY_ENV
`define MY_ENV


class my_env extends uvm_env;

    my_agent agent0;
    my_scoreboard scoreboard;

    `uvm_component_utils(my_env)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent0 = my_agent::type_id::create("agent0", this);
        scoreboard = my_scoreboard::type_id::create("scoreboard", this);
    endfunction

    /* Connect phase */
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent0.monitor.item_collected_port.connect(scoreboard.analysis_export);
    endfunction
    
endclass

`endif
