`ifndef MY_TEST_BASE
`define MY_TEST_BASE


class my_test_base extends uvm_test;

    my_env  env0;

    string result;

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

    /* Extract phase */
    function void extract_phase(uvm_phase phase);
        if (env0.scoreboard0.n_error > 0)
            result = "FAIL";
        else
            result = "PASS";
    endfunction

    /* Report phase */
    function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(),
            $sformatf("[%s] Trial = %d, Error = %d",
            result, env0.scoreboard0.n_trial, env0.scoreboard0.n_error), UVM_NONE)
    endfunction

endclass

`endif
