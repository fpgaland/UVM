`ifndef MY_SEUENCER
`define MY_SEUENCER


class my_sequencer extends uvm_sequencer #(my_item);

    `uvm_component_utils(my_sequencer)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
endclass

`endif
