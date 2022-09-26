`ifndef MY_SCOREBOARD
`define MY_SCOREBOARD


class my_scoreboard extends uvm_scoreboard;

    uvm_analysis_imp #(my_item, my_scoreboard)  analysis_export;
    int n_trial;
    int n_error;

    `uvm_component_utils(my_scoreboard)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new ("analysis_export", this);
        n_trial = 0;
        n_error = 0;
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    /* Write() of analysis_export */
    function void write(my_item data);

        int mult_exp = data.rst ? 0 : data.a_in * data.b_in;

        if (mult_exp != data.mult_out) begin
            `uvm_error("SCOREBOARD",
                $sformatf("@%4t: a_in = %d, b_in = %d, mult_out = %d, mult_exp = %d",
                    $time, data.a_in, data.b_in, data.mult_out, mult_exp));

            n_error++;
        end

       n_trial++;
       
    endfunction
    
    /* Extract phase */
    function void extract_phase(uvm_phase phase);
        super.extract_phase(phase);

        if (n_error > 0)
            `uvm_info("SCOREBOARD",
                $sformatf("[FAIL] Trial = %d, Error = %d", n_trial, n_error), UVM_LOW)
        else
            `uvm_info("SCOREBOARD",
                $sformatf("[PASS] Trial = %d, Error = %d", n_trial, n_error), UVM_LOW)
    endfunction

endclass

`endif
