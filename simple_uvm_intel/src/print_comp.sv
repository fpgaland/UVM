`ifndef PRINT_COMP
`define PRINT_COMP


class print_comp extends uvm_component;

    int i = 2;
    string s = "dog";

    `uvm_component_utils_begin(print_comp)
        `uvm_field_int(i, UVM_DEFAULT)
        `uvm_field_string(s, UVM_DEFAULT)
    `uvm_component_utils_end

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info("PRINT_COMP", $sformatf("i = %d, s = %s", i, s), UVM_LOW)
    endfunction

endclass

`endif
