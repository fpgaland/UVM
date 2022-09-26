`ifndef MY_SEUENCE_BASE
`define MY_SEUENCE_BASE


class my_sequence_base extends uvm_sequence #(my_item);

    rand int    n_trial;
    uvm_phase   phase;

    `uvm_object_utils_begin(my_sequence_base)
        `uvm_field_int(n_trial, UVM_DEFAULT)
    `uvm_object_utils_end

    /* Constrain the number of trials */
    constraint C_N_TRIAL { n_trial inside { [`N_TRIAL_MIN : `N_TRIAL_MAX] }; }

    /* Constructor */
    function new(string name = "my_sequence_base");
        super.new(name);
    endfunction

    /* Pre body (called once before Body) */
    task pre_body();
        phase = get_starting_phase();
        if (phase != null)
            phase.raise_objection(this, "my_sequence_base");
    endtask;

    /* Post body (called once after Body) */
    task post_body();
        if (phase != null)
            phase.drop_objection(this, "my_sequence_base");
    endtask

endclass

`endif
