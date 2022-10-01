`ifndef MY_SCOREBOARD
`define MY_SCOREBOARD


class my_scoreboard extends uvm_scoreboard;

    uvm_analysis_imp #(my_item, my_scoreboard)  item_collected_export;
    int n_trial;
    int n_error;

    `uvm_component_utils(my_scoreboard)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_export = new ("item_collected_export", this);
        n_trial = 0;
        n_error = 0;
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    /* Write() of item_collected_export */
    function void write(my_item data);

        int mult_exp = data.rst ? 0 : data.a_in * data.b_in;

        if (mult_exp != data.mult_out) begin
            `uvm_error(get_type_name(),
                $sformatf("@%4t: a_in = %d, b_in = %d, mult_out = %d, mult_exp = %d",
                    $time, data.a_in, data.b_in, data.mult_out, mult_exp));

            n_error++;
        end

       n_trial++;
       
    endfunction

endclass

`endif
