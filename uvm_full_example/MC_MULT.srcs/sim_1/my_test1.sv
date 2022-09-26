`ifndef MY_TEST1
`define MY_TEST1


class my_test1 extends my_test_base;

    `uvm_component_utils(my_test1)

    /* Constructor */
    function new(string name = "my_test1", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        uvm_config_db #(uvm_object_wrapper)::set(
            this,
            "env0.agent0.sequencer.run_phase",
            "default_sequence",
            my_sequence1::type_id::get()
        );

        super.build_phase(phase);
    endfunction

endclass

`endif
