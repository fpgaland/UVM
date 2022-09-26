`ifndef MY_SEUENCE1
`define MY_SEUENCE1


class my_sequence1 extends my_sequence_base;

    `uvm_object_utils(my_sequence1)

    /* Constructor */
    function new(string name = "my_sequence1");
        super.new(name);
    endfunction

    /* Body */
    virtual task body();
        /* Reset */
        `uvm_do_with(req, {rst == 1;})

        /* Reset release and run */
        repeat(n_trial)
            `uvm_do_with(req, {rst == 0;})
    endtask;

endclass

`endif
