`ifndef MY_TEST_BASE
`define MY_TEST_BASE


class my_test_base extends uvm_test;

    my_env  env0;

    `uvm_component_utils(my_test_base)

    /* Constructor */
    function new(string name = "my_test_base", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env0 = my_env::type_id::create("env0", this);
    endfunction

endclass

`endif
